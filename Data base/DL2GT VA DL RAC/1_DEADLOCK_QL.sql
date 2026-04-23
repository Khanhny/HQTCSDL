USE QuanLyBanHang
GO

BEGIN TRAN
    UPDATE DanhMuc 
    SET TenDanhMuc = N'Đồ uống đặc biệt' 
    WHERE MaDanhMuc = 'DM01'

    WAITFOR DELAY '00:00:05'

    SELECT * FROM ChiTietDon WHERE MaDonHang = 'DH01'
COMMIT
