CREATE OR ALTER PROCEDURE sp_NV_ThanhToanDon
    @MaDon INT,
    @MaDM INT
AS
BEGIN
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
    
    BEGIN TRANSACTION;
    BEGIN TRY
        IF EXISTS (SELECT 1 FROM DanhMuc WITH (UPDLOCK, HOLDLOCK) WHERE MaDM = @MaDM)
        BEGIN
            IF EXISTS (SELECT 1 FROM ChiTietDon WITH (UPDLOCK, HOLDLOCK) WHERE MaDon = @MaDon)
            BEGIN
                UPDATE ChiTietDon 
                SET TrangThai = N'Đã thanh toán' 
                WHERE MaDon = @MaDon;
            END
        END

        COMMIT TRANSACTION;
        PRINT N'Thanh toán thành công.';
    END TRY
    BEGIN CATCH
        IF ERROR_NUMBER() = 1205
        BEGIN
            PRINT N'Phát hiện Deadlock (TO) - Giao dịch bị hủy để giải phóng hệ thống.';
        END
        
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE sp_QL_XoaDanhMucAnToan
    @MaDM INT
AS
BEGIN
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
    
    BEGIN TRANSACTION;
    BEGIN TRY
        IF EXISTS (SELECT 1 FROM DanhMuc WITH (UPDLOCK, HOLDLOCK) WHERE MaDM = @MaDM)
        BEGIN
            IF NOT EXISTS (SELECT 1 FROM ChiTietDon WITH (UPDLOCK, HOLDLOCK) WHERE MaDM = @MaDM)
            BEGIN
                DELETE FROM DanhMuc WHERE MaDM = @MaDM;
                PRINT N'Xóa danh mục thành công.';
            END
            ELSE
            BEGIN
                PRINT N'Không thể xóa: Danh mục đang có đơn hàng.';
            END
        END
        ELSE
        BEGIN
            PRINT N'Danh mục không tồn tại.';
        END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
