--- 3. MAT DU LIEU CAP NHAT (NHÂN VIÊN B)
-- Lý thuyết: NV B giữ Lock-S sau SELECT (REPEATABLE READ)
-- Cả A và B cùng nâng lên Lock-X → DEADLOCK → DBMS tự hủy 1 bên
USE QuanLyBanHang;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; 
BEGIN TRAN;
    DECLARE @SL_B INT;
    PRINT N'Nhân viên B đang lấy số lượng...';
    
    -- Bước 1: Giữ Lock-S (giống NV A)
    SELECT @SL_B = SoLuong FROM Chitietdon 
    WHERE MaDon = 'D001' AND MaSanPham = 'SP01';
    PRINT N'Nhân viên B THẤY số lượng là: ' + CAST(@SL_B AS VARCHAR);
    
    -- Bước 2: Đợi để đảm bảo NV A cũng đã SELECT xong và đang giữ Lock-S
    -- → Cả hai cùng giữ Lock-S, rồi cùng đòi Lock-X → mới sinh Deadlock đúng kịch bản
    WAITFOR DELAY '00:00:03';
    
    PRINT N'Nhân viên B bắt đầu lưu... (Sẽ gây ra Deadlock vì A đang giữ Lock-S)';
    -- Bước 3: Xin Lock-X → bị NV A chặn → Deadlock
    UPDATE Chitietdon SET SoLuong = @SL_B + 5 WHERE MaDon = 'D001' AND MaSanPham = 'SP01';
    PRINT N'Nhân viên B cập nhật xong! (+5 ly).';
COMMIT TRAN;