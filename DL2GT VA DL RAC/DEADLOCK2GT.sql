CREATE OR ALTER PROCEDURE sp_NV_ThanhToanDon
    @MaDon VARCHAR(20),  
    @MaDanhMuc CHAR(4)  
AS
BEGIN
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
    
    BEGIN TRANSACTION;
    BEGIN TRY
        IF EXISTS (SELECT 1 FROM Danhmuc WITH (UPDLOCK, HOLDLOCK) WHERE MaDanhMuc = @MaDanhMuc)
        BEGIN
            IF EXISTS (SELECT 1 FROM Chitietdon WITH (UPDLOCK, HOLDLOCK) WHERE MaDon = @MaDon)
            BEGIN
                UPDATE Chitietdon 
                SET TrangThai = N'Đã thanh toán' 
                WHERE MaDon = @MaDon;
            END
        END

        COMMIT TRANSACTION;
        PRINT N'Thanh toán thành công.';
    END TRY
    BEGIN CATCH
        IF ERROR_NUMBER() = 1205
            PRINT N'Phát hiện Deadlock - Giao dịch bị hủy.';
        
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE sp_QL_XoaDanhMucAnToan
    @MaDanhMuc CHAR(4) 
AS
BEGIN
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
    
    BEGIN TRANSACTION;
    BEGIN TRY
        IF EXISTS (SELECT 1 FROM Danhmuc WITH (UPDLOCK, HOLDLOCK) WHERE MaDanhMuc = @MaDanhMuc)
        BEGIN
            IF NOT EXISTS (SELECT 1 FROM Sanpham WITH (UPDLOCK, HOLDLOCK) WHERE MaDanhMuc = @MaDanhMuc)
            BEGIN
                DELETE FROM Danhmuc WHERE MaDanhMuc = @MaDanhMuc;
                PRINT N'Xóa danh mục thành công.';
            END
            ELSE
            BEGIN
                PRINT N'Không thể xóa: Danh mục này đang chứa các sản phẩm.';
            END
        END
        ELSE
            PRINT N'Danh mục không tồn tại.';

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
