USE QuanLyBanHang;
GO

-------------------------------------------------------------------------
-- FILE: Docdlbongma.sql  (Demo xu ly cac van de doc du lieu)
-------------------------------------------------------------------------

-- 1. XU LY KHONG DOC LAI DUOC DL (NON-REPEATABLE READ)
CREATE OR ALTER PROCEDURE sp_LayChiTietSanPham_ThanhToan
    @MaSP CHAR(4),
    @Size CHAR(3)
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        -- REPEATABLEREAD giu Lock-S, ngan UPDATE tu giao tac khac den khi COMMIT
        SELECT MaSanPham, TenSanPham, GiaBan, Size
        FROM Sanpham WITH (REPEATABLEREAD)
        WHERE MaSanPham = @MaSP AND Size = @Size;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT ERROR_MESSAGE();
    END CATCH
END;
GO

-------------------------------------------------------------------------
-- 2. XU LY DOC DU LIEU BONG MA (PHANTOM READ)
--    SERIALIZABLE tao Range Lock ngan INSERT moi vao tap ket qua
CREATE OR ALTER FUNCTION fn_DoanhThuTheoNgay(@Ngay DATE)
RETURNS INT
AS
BEGIN
    DECLARE @DoanhThu INT;
    SELECT @DoanhThu = ISNULL(SUM(TongTien), 0)
    FROM Donhang WITH (SERIALIZABLE)
    WHERE CAST(ThoiGian AS DATE) = @Ngay;
    RETURN @DoanhThu;
END;
GO

CREATE OR ALTER FUNCTION fn_DoanhThuTheoCa(@MaCa INT)   -- INT cho khop voi bang
RETURNS INT
AS
BEGIN
    DECLARE @DoanhThu INT;
    SELECT @DoanhThu = ISNULL(SUM(TongTien), 0)
    FROM Donhang WITH (SERIALIZABLE)
    WHERE MaCa = @MaCa;
    RETURN @DoanhThu;
END;
GO

CREATE OR ALTER FUNCTION fn_DoanhThuTheoGio(@Gio INT)
RETURNS INT
AS
BEGIN
    DECLARE @DoanhThu INT;
    SELECT @DoanhThu = ISNULL(SUM(TongTien), 0)
    FROM Donhang WITH (SERIALIZABLE)
    WHERE DATEPART(HOUR, ThoiGian) = @Gio;
    RETURN @DoanhThu;
END;
GO

-------------------------------------------------------------------------
-- 3. XU LY MAT DU LIEU CAP NHAT (LOST UPDATE)
--    XLOCK + HOLDLOCK doc chiem quyen ghi ngay tu khau doc
CREATE OR ALTER PROCEDURE sp_CapNhatSoLuong
    @MaSP    CHAR(4),
    @Size    CHAR(3),
    @SlThem  INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        DECLARE @SoLuongHienTai INT;

        SELECT @SoLuongHienTai = SoLuong
        FROM Sanpham WITH (XLOCK, HOLDLOCK)
        WHERE MaSanPham = @MaSP AND Size = @Size;

        UPDATE Sanpham
        SET SoLuong = @SoLuongHienTai + @SlThem
        WHERE MaSanPham = @MaSP AND Size = @Size;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT ERROR_MESSAGE();
    END CATCH
END;
GO