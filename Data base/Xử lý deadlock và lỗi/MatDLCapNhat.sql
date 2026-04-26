USE QuanLyBanHang;
GO

-------------------------------------------------------------------------
-- FILE: MatDLCapNhat.sql  (Demo xu ly Mat du lieu cap nhat - Lost Update)
-------------------------------------------------------------------------

-- 1. sp_ThemSanPhamVaoDon  (xu ly tranh chap so luong trong don hang)
--    XLOCK + HOLDLOCK khoa ban ghi ngay tu buoc doc -> ngan T2 doc gia tri cu
CREATE OR ALTER PROCEDURE sp_ThemSanPhamVaoDon
    @MaDon   VARCHAR(20),
    @TenSP   NVARCHAR(30),
    @Size    CHAR(3),
    @SoLuong INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        DECLARE @MaSP_TimDuoc CHAR(4), @Gia_TimDuoc INT;

        -- XLOCK + HOLDLOCK: doc chiem quyen ghi ngay tu buoc SELECT
        -- Ngan cac giao tac khac doc/ghi den khi COMMIT
        SELECT @MaSP_TimDuoc = MaSanPham, @Gia_TimDuoc = GiaBan
        FROM Sanpham WITH (XLOCK, HOLDLOCK)
        WHERE TenSanPham = @TenSP AND Size = @Size;

        IF @MaSP_TimDuoc IS NOT NULL
        BEGIN
            IF EXISTS (SELECT 1 FROM Chitietdon WITH (XLOCK, HOLDLOCK)
                       WHERE MaDon = @MaDon AND MaSanPham = @MaSP_TimDuoc AND Size = @Size)
            BEGIN
                UPDATE Chitietdon
                SET SoLuong = SoLuong + @SoLuong
                WHERE MaDon = @MaDon AND MaSanPham = @MaSP_TimDuoc AND Size = @Size;
            END
            ELSE
            BEGIN
                INSERT INTO Chitietdon (MaDon, MaSanPham, Size, SoLuong, Gia)
                VALUES (@MaDon, @MaSP_TimDuoc, @Size, @SoLuong, @Gia_TimDuoc);
            END
        END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT N'Lỗi: ' + ERROR_MESSAGE();
    END CATCH
END;
GO

-------------------------------------------------------------------------
-- 2. sp_CapNhatGiaSanPham  (xu ly tranh chap khi nhieu QL cap nhat gia cung luc)
--    XLOCK tren Sanpham tu buoc doc -> dam bao khong bi ghi de
--    MaLog la IDENTITY -> khong can sinh tay
CREATE OR ALTER PROCEDURE sp_CapNhatGiaSanPham
    @MaCa      INT,         -- INT cho khop voi bang Calamviec
    @MaSanPham CHAR(4),
    @GiaMoi    INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        -- XLOCK ngay tu buoc SELECT de doc chiem quyen ghi
        SELECT GiaBan FROM Sanpham WITH (XLOCK, HOLDLOCK) WHERE MaSanPham = @MaSanPham;

        UPDATE Sanpham SET GiaBan = @GiaMoi WHERE MaSanPham = @MaSanPham;

        -- MaLog la IDENTITY -> khong can sinh tay, MaDon = NULL khi cap nhat gia
        INSERT INTO Lichsugiaotac (MaDon, MaCa, HanhDong, NoiDungChiTiet, ThoiGian)
        VALUES (NULL, @MaCa, N'Cập nhật giá',
                N'SP ' + @MaSanPham + N' thành ' + CAST(@GiaMoi AS VARCHAR), GETDATE());

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT ERROR_MESSAGE();
    END CATCH
END;
GO