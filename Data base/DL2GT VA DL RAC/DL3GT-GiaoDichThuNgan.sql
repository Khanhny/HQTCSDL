-- (Quyền ưu tiên cao nhất)
CREATE OR ALTER PROCEDURE sp_ThuNgan_ThanhToan
    @MaDon CHAR(4), @MaSP CHAR(4)
AS
BEGIN
    SET DEADLOCK_PRIORITY HIGH; 
    BEGIN TRY
        BEGIN TRANSACTION;
            UPDATE DonHang SET TrangThai = N'Đã thanh toán' WHERE MaDon = @MaDon;
            WAITFOR DELAY '00:00:03'; 
            UPDATE SanPham SET SoLuong = SoLuong - 1 WHERE MaSP = @MaSP;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
    END CATCH
END;
GO