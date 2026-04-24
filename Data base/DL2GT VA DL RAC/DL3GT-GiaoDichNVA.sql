--(Ưu tiên tiêu chuân)
CREATE OR ALTER PROCEDURE sp_NhanVienA_ThemMon
    @MaDon CHAR(4), @MaSP CHAR(4)
AS
BEGIN
    SET DEADLOCK_PRIORITY NORMAL; 
    BEGIN TRY
        BEGIN TRANSACTION;
            UPDATE ChiTietDon SET SoLuong = SoLuong + 1 WHERE MaDon = @MaDon AND MaSP = @MaSP;
            WAITFOR DELAY '00:00:03'; 
            UPDATE DonHang SET TongTien = TongTien + 25000 WHERE MaDon = @MaDon;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
    END CATCH
END;
GO
