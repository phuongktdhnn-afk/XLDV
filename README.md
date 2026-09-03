# XLDV 2026 – Dashboard ĐHNN (Cloudflare Pages + D1)

Phiên bản cập nhật theo quy trình phối hợp: **ĐHNN là đầu mối duy nhất quản lý và cập nhật Dashboard**. Các CSĐT cung cấp/xác nhận dữ liệu qua biểu mẫu; không sửa trực tiếp Dashboard.

## Quyền
- ADMIN/ĐHNN: quản trị, nhập Excel, cập nhật dữ liệu, đối soát, xuất báo cáo.
- BGH: xem tổng hợp và tra log.
- CSGD: xem dữ liệu theo phạm vi trường; không có quyền cập nhật.

## Lưu ý dữ liệu
- MSSV là khóa đối soát chính.
- PA1 = chứng chỉ; PA2 = điểm THPT; PA3 = kiểm tra xếp lớp.
- Sheet `KQ_PA1` trong file cũ được xử lý như nguồn **PA3 legacy** để tương thích dữ liệu cũ; trường `pa3_source` ghi rõ nguồn.
- Import Excel dùng UPSERT theo MSSV, không xóa toàn bộ dữ liệu hiện có.

## Triển khai
1. Dùng Cloudflare Pages + Functions.
2. Binding D1: `XLDV_DB` → database `xldv`.
3. `wrangler.toml` phải chứa Database ID thật.
4. Migration `migrations/0001_init.sql` đã tạo các bảng users, students, audit_log, sessions.

## Dashboard cập nhật
- Bỏ nhãn “realtime” không đúng với bản Pages/D1 hiện tại.
- Thêm trạng thái “Chỉ ĐHNN cập nhật Dashboard”.
- Thêm tiến độ theo CSĐT.
- Thêm thông tin quy tắc báo cáo 05 ngày sau khi có kết quả kiểm tra.


## Bản giao diện nâng cấp
- Giao diện Dashboard được làm lại theo phong cách quản trị dữ liệu hiện đại, responsive.
- Khu vực KPI, bộ lọc, phân tích kết quả, tiến độ CSGD và bảng chi tiết được phân cấp rõ ràng.
- Biểu đồ: phân lớp cuối cùng, phương án sử dụng, kết quả PA3, phân bố điểm PA3 và so sánh quy mô theo CSGD.
- Xuất báo cáo Excel theo đúng bộ lọc hiện tại, gồm các sheet Tổng hợp, Theo CSGD và Chi tiết.
- Xuất CSV vẫn được giữ để xử lý dữ liệu nhanh.


## Tự động hóa giảm thao tác thủ công
- Sau khi ĐHNN nhập Excel, hệ thống tự tính PA2/PA3 theo ngưỡng cấu hình từ quy trình hiện tại.
- Tự xác định mức cao nhất trong các phương án có dữ liệu.
- Tự phát hiện các trường hợp cần xác minh: thiếu dữ liệu PA2/PA3, đăng ký PA1 nhưng chưa có kết quả/chứng chỉ PA1 được xác minh, thiếu thông tin cơ bản, hoặc kết quả các phương án khác mức.
- Có tab **Cần xử lý** và nút xuất `XLDV_2026_CAN_XU_LY.xlsx`.
- Có nút xuất `XLDV_2026_DOI_SOAT.xlsx` và báo cáo tổng hợp.
- Các trường CSĐT không trực tiếp sửa Dashboard; ĐHNN là đơn vị cập nhật.
- PA1 chứng chỉ chưa được tự động hóa đầy đủ vì workbook hiện tại chưa có sheet dữ liệu PA1 chuyên biệt; không tự suy diễn dữ liệu PA1 từ các trường khác.
