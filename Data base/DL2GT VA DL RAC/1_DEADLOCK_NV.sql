USE QuanLyBanHang
GO

BEGIN TRAN
    SELECT * FROM DanhMuc WHERE MaDanhMuc = 'DM01'
    
    UPDATE ChiTietDon 
    SET SoLuong = 10 
    WHERE MaDonHang = 'DH01'
COMMIT
