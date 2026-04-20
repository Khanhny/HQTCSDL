use QuanLyBanHang 
go
CREATE OR ALTER PROCEDURE sp_NV_ThanhToanDon
    @MaDon VARCHAR(20)
AS
BEGIN
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
    
    BEGIN TRANSACTION;
    BEGIN TRY
        IF EXISTS (SELECT 1 FROM Donhang WITH (UPDLOCK, HOLDLOCK) WHERE MaDon = @MaDon)
        BEGIN
            UPDATE Donhang
            SET TongTien = ISNULL((
                SELECT SUM(SoLuong * Gia) 
                FROM Chitietdon 
                WHERE MaDon = @MaDon
            ), 0)
            WHERE MaDon = @MaDon;

            PRINT N'Đã cập nhật tổng tiền cho đơn hàng: ' + @MaDon;
        END
        ELSE
        BEGIN
            PRINT N'Lỗi: Không tìm thấy mã đơn hàng.';
        END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;
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
                PRINT N'Không thể xóa: Danh mục này đang chứa sản phẩm.';
            END
        END
        ELSE
        BEGIN
            PRINT N'Lỗi: Danh mục không tồn tại.';
        END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO
