# XLDV 2026 – Dashboard ĐHNN (bản nâng cấp báo cáo & đối soát)

## 1. Mô hình vận hành
- **ĐHNN là đầu mối duy nhất cập nhật Dashboard.**
- CSGDĐHTV không nhập trực tiếp; gửi Excel cho ĐHNN kiểm tra/đối soát.
- **MSSV là khóa đối soát chính.**
- `DOI_SOAT` và `CAN_XU_LY` là dữ liệu **hệ thống tự tính**, không nhập thủ công.

## 2. Excel đầu vào chuẩn mới
Có file mẫu: `data/XLDV_2026_Mau_Excel_DHNN_PA1_PA2_PA3.xlsx`

Các sheet chính:
- `NHAP_DANH_SACH`: thông tin sinh viên, điểm THPT, đăng ký PA1/PA3.
- `KQ_PA1`: kết quả PA1 đã được xác minh.
- `KQ_PA3`: kết quả kiểm tra xếp lớp PA3.
- `DOI_SOAT`: hệ thống tự lập.
- `CAN_XU_LY`: hệ thống tự lập.

### Tương thích file cũ
Nếu file không có `KQ_PA3`, hệ thống vẫn đọc `KQ_PA1` theo cơ chế **legacy → PA3** để không làm hỏng dữ liệu cũ.
Nếu file có cả `KQ_PA1` và `KQ_PA3`, hệ thống hiểu `KQ_PA1` là PA1 và `KQ_PA3` là PA3.

## 3. Tự động hóa nghiệp vụ
Hệ thống tự tính:
- **PA2:** 6.5–10 → B1.1; 4.75–<6.5 → A2.2; <4.75 → A2.1.
- **PA3:** 83–100 → B1.1; 63–82 → A2.2; <63 → A2.1.
- Mức cao nhất được xác định từ các phương án có kết quả.
- Tự phát hiện hồ sơ có **PA3 đồng thời có PA1/PA2** để ĐHNN đối soát.
- Tự phát hiện các phương án cho kết quả khác mức.

## 4. Báo cáo Excel
Nút **“Xuất báo cáo tất cả CSGD”** tạo một file có:
1. `Tong hop` – số liệu toàn hệ thống.
2. `Tong hop theo CSGD` – **bảng tổng hợp từng trường**, gồm:
   - Số lượng SV;
   - Số SV đăng ký thi PA3;
   - Số SV có kết quả PA3;
   - PA3 A2.1 / A2.2 / B1.1;
   - Phân lớp cuối A2.1 / A2.2 / B1.1;
   - Số hồ sơ cần đối soát PA3 + PA1/PA2;
   - Tách PA3 + PA1, PA3 + PA2, PA3 + cả PA1 & PA2;
   - Số cần xử lý/cảnh báo.
3. `Tong hop doi soat` – số lượng theo nhóm đối soát.
4. `Doi soat PA3 PA1 PA2` – **danh sách chi tiết sinh viên cần đối soát**.
5. `Chi tiet tat ca` – toàn bộ dữ liệu tất cả CSGD.
6. **Mỗi CSGD một sheet `KQ_<CSGD>` riêng**, có phần tổng hợp nhanh và toàn bộ danh sách sinh viên của trường.

## 5. Dashboard
Dashboard đã bổ sung:
- Biểu đồ mức xếp lớp cuối.
- Biểu đồ phương án sử dụng.
- Biểu đồ kết quả PA3.
- Biểu đồ phân bố điểm PA3.
- So sánh theo CSGD.
- Bảng tổng hợp theo CSGD với các chỉ tiêu PA3 và đối soát.

## 6. Triển khai Cloudflare Pages + D1
`wrangler.toml` đã trỏ tới D1 `xldv` với database ID hiện tại.

Sau khi cập nhật repository GitHub, Cloudflare Pages sẽ tự build/deploy nếu project đang dùng Git integration.

> Lưu ý: bản FreeLongTerm dùng SheetJS phía trình duyệt để đọc Excel; D1/Pages Functions lưu dữ liệu. `DOI_SOAT` và `CAN_XU_LY` trong file xuất là kết quả tự sinh từ Dashboard.
