# XLDV 2026 – Dashboard ĐHNN

## Phiên bản báo cáo toàn bộ CSGD

Dashboard này giữ nguyên nguyên tắc **ĐHNN là đơn vị duy nhất cập nhật dữ liệu**.

### Báo cáo Excel
Nút **Xuất báo cáo tất cả CSGD** tạo file `Bao_cao_XLDV_2026_TAT_CA_CSGD.xlsx` gồm:

1. **Tong hop** – tổng số liệu toàn hệ thống, không phụ thuộc bộ lọc trên màn hình.
2. **Theo CSGD** – mỗi CSGD một dòng, có tổng SV, đã xác định, PA3, cảnh báo, cần xử lý và phân bố A2.1/A2.2/B1.1.
3. **Chi tiet tat ca** – toàn bộ sinh viên của tất cả CSGD trong một sheet.
4. **KQ_<CSGD>** – mỗi CSGD một sheet riêng, chứa đầy đủ kết quả của riêng trường đó.

### Phân quyền báo cáo
- ADMIN/ĐHNN: báo cáo toàn bộ CSGD.
- BGH: xem/báo cáo toàn hệ thống theo quyền được cấp.
- CSGD: hệ thống tự giới hạn dữ liệu theo CSGD của tài khoản.

### Nguyên tắc dữ liệu
Bộ lọc Dashboard chỉ phục vụ xem/tra cứu. Báo cáo tổng hợp chính thức của ĐHNN lấy toàn bộ dữ liệu mà tài khoản có quyền xem, để tránh tình trạng xuất báo cáo bị thiếu trường do người dùng đang lọc một CSGD.
