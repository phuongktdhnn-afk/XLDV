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
