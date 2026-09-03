# XLDV 2026 – Dashboard ĐHNN

Dashboard nội bộ do **ĐHNN quản lý và cập nhật**. MSSV là khóa đối soát chính.

## Báo cáo

Nút **Xuất báo cáo** tạo file `Bao_cao_XLDV_2026_TAT_CA_CSGD.xlsx` với:
- `Tong hop`: số liệu toàn hệ thống.
- `Theo CSGD`: bảng tổng hợp từng trường, gồm **Số lượng SV, SV đăng ký PA3, SV có kết quả PA3, PA3-A2.1, PA3-A2.2, PA3-B1.1, PA3-chưa có kết quả**, cảnh báo và cần xử lý.
- `Chi tiet tat ca`: toàn bộ sinh viên.
- Mỗi CSGD một sheet kết quả riêng.

Báo cáo của ĐHNN lấy **toàn bộ dữ liệu**, không phụ thuộc bộ lọc trên màn hình.

## PA3 đăng ký

Sheet `NHAP_DANH_SACH` có thể thêm cột `Đăng ký PA3`. Giá trị nên dùng `Có`/`Không` (hệ thống cũng nhận 1/yes/x...).
Nếu chưa có cột này, hệ thống **không tự coi việc có điểm PA3 là đăng ký PA3**; số đăng ký chỉ tính từ trường đăng ký để tránh sai lệch nghiệp vụ.

## Migration

Sau khi cập nhật code, chạy migration `migrations/0003_pa3_registration.sql` một lần trên D1 `xldv` để thêm trường đăng ký PA3.

Migration 0002 bổ sung trạng thái xử lý nghiệp vụ nếu database chưa có các cột đó.
