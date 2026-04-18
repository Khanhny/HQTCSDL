--- 1. KHONG DOC LAI DU LIEU (NHÂN VIÊN)
USE QuanLyBanHang;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN TRAN;
    DECLARE @GiaHienTai INT;
    SELECT @GiaHienTai = GiaBan FROM Sanpham WHERE MaSanPham = 'SP01';
    PRINT N'1. Nhân viên thấy Trà Đào giá: ' + CAST(@GiaHienTai AS VARCHAR);
    
    WAITFOR DELAY '00:00:05'; 
    
    PRINT N'2. Nhân viên tính tiền xong với giá: ' + CAST(@GiaHienTai AS VARCHAR);
COMMIT TRAN;

--- 2. BONG MA (NHÂN VIÊN)
-- Lý thuyết: NV xin Lock-X để INSERT đơn mới vào bảng Donhang
-- Với SERIALIZABLE bên QL, NV sẽ bị ĐỢI cho đến khi QL COMMIT xong
USE QuanLyBanHang;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; -- Mức mặc định của NV, QL mới là người chặn
BEGIN TRAN;
    PRINT N'Nhân viên đang chuẩn bị chốt đơn hàng mới...';
    WAITFOR DELAY '00:00:05'; -- Đợi để QL kịp chạy trước và giữ Range Lock

    -- Đúng lý thuyết: bảng tác động là Donhang, NV INSERT đơn mới (xin Lock-X)
    INSERT INTO Donhang (MaDon, ThoiGian, TongTien, MaCa)
    VALUES ('D002', GETDATE(), 50000, 1);

    PRINT N'Nhân viên chốt đơn thành công! (Chạy được vì QL đã COMMIT hoặc chưa giữ lock kịp)';
COMMIT TRAN;

--- 3. MAT DU LIEU CAP NHAT (NHÂN VIÊN A)
USE QuanLyBanHang;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; 
BEGIN TRAN;
    DECLARE @SL_A INT;
    SELECT @SL_A = SoLuong FROM Chitietdon 
    WHERE MaDon = 'D001' AND MaSanPham = 'SP01';
    
    PRINT N'Nhân viên A thấy số lượng là: ' + CAST(@SL_A AS VARCHAR);
    
    WAITFOR DELAY '00:00:05'; 
    
    PRINT N'Nhân viên A bắt đầu lưu...';
    UPDATE Chitietdon SET SoLuong = @SL_A + 2 WHERE MaDon = 'D001' AND MaSanPham = 'SP01';
    PRINT N'Nhân viên A cập nhật xong! (+2 ly)';
COMMIT TRAN;