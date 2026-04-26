-- Giao tác T1: Nhân viên thanh toán
use QuanLyBanHang
go
BEGIN TRANSACTION;

    -- BƯỚC 1: Ép xin khóa trên bảng ID nhỏ trước (Bảng danh mục)
    SELECT * from DanhMuc WITH (XLOCK) 
    WHERE MaDanhMuc = 'cf'; 

    -- BƯỚC 2: Cập nhật Bảng chi tiết đơn (ID 2), thêm số liệu để chạy demo
    UPDATE ChiTietDon
    SET SoLuong = 10, Gia = 25000
    WHERE MaDon = 'DH001' AND MaSanPham = 'SP01';

    -- BƯỚC 3: Select lại danh mục để in hóa đơn 
    SELECT TenDanhMuc FROM DanhMuc WHERE MaDanhMuc = 'cf';

COMMIT;
