--- 3. VẤN ĐỀ: MẤT DL CẬP NHẬT (NHÂN VIÊN B)
USE QuanLyBanHang;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; 
BEGIN TRAN;
    DECLARE @SL_B INT;
    -- [THỜI ĐIỂM KHÓA]: Cả NV A và B cùng mở lấy thông tin số lượng (Cùng xin Lock-S).
    SELECT @SL_B = SoLuong FROM Chitietdon WHERE MaDon = 'D001' AND MaSanPham = 'SP01';
    PRINT N'NV B thấy số lượng là: ' + CAST(@SL_B AS VARCHAR);

    -- Đợi để đảm bảo NV A đã tỉnh dậy và đòi nâng cấp khóa trước.
    WAITFOR DELAY '00:00:07'; 

    PRINT N'NV B bấm Lưu (+5 ly)...';
    -- [CÁCH GIẢI QUYẾT 2PL]: NV B muốn lên Lock-X lại phải đợi NV A nhả Lock-S. 
    -- [KẾT QUẢ]: DEADLOCK. Hệ quản trị CSDL sẽ tự động phát hiện, HỦY (Abort) một trong hai người.
    UPDATE Chitietdon SET SoLuong = @SL_B + 5 WHERE MaDon = 'D001' AND MaSanPham = 'SP01';
COMMIT TRAN;