USE QuanLyBanHang
GO

BEGIN TRAN
    UPDATE ChiTietDon 
    SET SoLuong = 10 
    WHERE MaDonHang = 'DH01'

    WAITFOR DELAY '00:00:05'

    SELECT * FROM DanhMuc WHERE MaDanhMuc = 'DM01'
COMMIT
