-- Giao tác T2: Quản lý dọn dẹp
use QuanLyBanHang
go
BEGIN TRANSACTION;

    -- BƯỚC 1: Xin khóa Ghi (X) trên bảng ID nhỏ (Bảng danh mục)
    -- Nếu T1 đang chạy, T2 sẽ phải ĐỢI ở dòng lệnh này
    update DanhMuc
    set TenDanhMuc='CaPhe'
    WHERE MaDanhMuc = 'cf';

    -- Sau khi T1 xong, T2 mới chạy tiếp được xuống đây
    SELECT * FROM ChiTietDon WHERE MaDon = 'DH001';
COMMIT;