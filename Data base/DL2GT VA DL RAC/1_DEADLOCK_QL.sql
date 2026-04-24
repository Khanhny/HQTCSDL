USE QuanLyBanHang
GO

BEGIN TRAN
    UPDATE DanhMuc 
    SET TenDanhMuc = N'Đồ uống đặc biệt' 
    WHERE MaDanhMuc = 'DM01'

    SELECT * FROM ChiTietDon WHERE MaDonHang = 'DH01'
COMMIT
