--(Chủ động nhận làm Nạn nhân)
CREATE OR ALTER PROCEDURE sp_QuanLy_DoiGia
    @MaSP CHAR(4), @GiaMoi INT
AS
BEGIN
    SET DEADLOCK_PRIORITY LOW; 
    
    BEGIN TRY
        BEGIN TRANSACTION;
            UPDATE SanPham SET GiaBan = @GiaMoi WHERE MaSP = @MaSP;
            WAITFOR DELAY '00:00:03'; 
            UPDATE ChiTietDon SET DonGia = @GiaMoi WHERE MaSP = @MaSP;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION; 
        IF ERROR_NUMBER() = 1205
            PRINT N'Lock Manager đã Hủy giao dịch Quản lý để phá bế tắc. Đang Auto-Retry...';
        ELSE
            PRINT N'Lỗi CSDL: ' + ERROR_MESSAGE();
    END CATCH
END;
GO
