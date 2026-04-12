--- KHONG DOC LAI DU LIEU
USE QuanLyBanHang;
-- Ép hệ thống giữ Khóa Đọc (Lock-S) cho đến khi xong Giao tác
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN TRAN;
    DECLARE @GiaHienTai INT;
    SELECT @GiaHienTai = GiaBan FROM Sanpham WHERE MaSanPham = 'SP01';
    PRINT N'1. Nhân viên thấy Trà Đào giá: ' + CAST(@GiaHienTai AS VARCHAR);
    
    -- Giả lập thao tác chậm 5 giây
    WAITFOR DELAY '00:00:05'; 
    
    PRINT N'2. Nhân viên tính tiền xong với giá: ' + CAST(@GiaHienTai AS VARCHAR);
COMMIT TRAN;

ROLLBACK TRAN;

-- BONG MA
USE QuanLyBanHang;
BEGIN TRAN;
    PRINT N'Nhân viên đang chuẩn bị thêm món mới...';
    -- Đợi 5 giây để chắc chắn Quản lý đã chạy xong Lần 1
    WAITFOR DELAY '00:00:05'; 

    INSERT INTO Sanpham (MaSanPham, TenSanPham, GiaBan, MaDanhMuc)
    VALUES ('SP99', N'Trà Sữa Bóng Ma', 50000, 'DM01');
    
    PRINT N'Nhân viên đã thêm món thành công!';
COMMIT TRAN;


--- MAT DU LIEU CAP NHAT
-- NV A
USE QuanLyBanHang;
BEGIN TRAN;
    DECLARE @SL_A INT;
    -- Dùng UPDLOCK khóa dòng này ngay khi đọc
    SELECT @SL_A = SoLuong FROM Chitietdon WITH (UPDLOCK) 
    WHERE MaDon = 'D001' AND MaSanPham = 'SP01';
    
    PRINT N'Nhân viên A thấy số lượng là: ' + CAST(@SL_A AS VARCHAR);
    
    WAITFOR DELAY '00:00:05'; 
    
    UPDATE Chitietdon SET SoLuong = @SL_A + 2 WHERE MaDon = 'D001' AND MaSanPham = 'SP01';
    PRINT N'Nhân viên A cập nhật xong! (+2 ly)';
COMMIT TRAN;

-- NV B
USE QuanLyBanHang;
BEGIN TRAN;
    DECLARE @SL_B INT;
    PRINT N'Nhân viên B đang lấy số lượng... (Sẽ bị treo chờ Tab 1)';
    
    -- Bị chặn ngay tại dòng SELECT do Tab 1 đang giữ UPDLOCK
    SELECT @SL_B = SoLuong FROM Chitietdon WITH (UPDLOCK) 
    WHERE MaDon = 'D001' AND MaSanPham = 'SP01';
    
    -- Khi Tab 1 nhả khóa, @SL_B lấy được sẽ là 3 (chứ không phải 1)
    UPDATE Chitietdon SET SoLuong = @SL_B + 5 WHERE MaDon = 'D001' AND MaSanPham = 'SP01';
    PRINT N'Nhân viên B cập nhật xong! (+5 ly). Tổng cộng = 8 ly (Chính xác!)';
COMMIT TRAN;

USE QuanLyBanHang;
DELETE FROM Sanpham WHERE MaSanPham = 'SP99';
