USE QuanLyBanHang;
GO

-------------------------------------------------------------------------
-- FILE: DL2GT.sql  (Demo giai quyet Deadlock 2 giao tac)
-- Moi file demo dat ten rieng de tranh ghi de len nhau khi chay tuan tu
-------------------------------------------------------------------------

-- 1. sp_ThanhToanDonHang_DL2GT
--    Xu ly Deadlock: Khoa bang DanhMuc (ID nho) truoc theo Ordering Protocol
--    Xu ly Non-Repeatable Read: doc ChiTietDon voi REPEATABLEREAD
CREATE OR ALTER PROCEDURE sp_ThanhToanDonHang_DL2GT
    @MaDon VARCHAR(20),
    @MaCa  INT,             -- INT cho khop voi bang Calamviec
    @MaDM  VARCHAR(10)      -- Tham so de thuc hien khoa theo thu tu (demo Deadlock)
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        -- Ordering Protocol: khoa bang co ID nho (DanhMuc) truoc
        SELECT MaDanhMuc FROM Danhmuc WITH (XLOCK, HOLDLOCK) WHERE MaDanhMuc = @MaDM;

        -- REPEATABLEREAD giu Lock-S de chong Non-Repeatable Read
        DECLARE @TongTien INT;
        SELECT @TongTien = SUM(SoLuong * Gia)
        FROM Chitietdon WITH (REPEATABLEREAD)
        WHERE MaDon = @MaDon;

        UPDATE Donhang SET TongTien = @TongTien WHERE MaDon = @MaDon;

        -- MaLog la IDENTITY -> khong can sinh tay
        INSERT INTO Lichsugiaotac (MaDon, MaCa, HanhDong, NoiDungChiTiet, ThoiGian)
        VALUES (@MaDon, @MaCa, 'Thanh toan', N'Thanh toán thành công (DL2GT)', GETDATE());

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT ERROR_MESSAGE();
    END CATCH
END;
GO

-------------------------------------------------------------------------
-- 2. sp_CapNhatGiaSanPham  (xu ly Lost Update cho ma Log)
--    XLOCK + HOLDLOCK tren Lichsugiaotac khong con can thiet vi MaLog la IDENTITY
--    Giu XLOCK tren Sanpham de bao ve cap nhat gia
CREATE OR ALTER PROCEDURE sp_CapNhatGiaSanPham
    @MaCa      INT,         -- INT cho khop voi bang Calamviec
    @MaSanPham CHAR(4),
    @GiaMoi    INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

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

-------------------------------------------------------------------------
-- 3. sp_ThemSanPhamVaoDon  (xu ly Lost Update so luong)
--    XLOCK doc chiem dong SP ngay tu dau
CREATE OR ALTER PROCEDURE sp_ThemSanPhamVaoDon
    @MaDon   VARCHAR(20),
    @MaSP    CHAR(4),
    @Size    CHAR(3),
    @SoLuong INT,
    @Gia     INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        IF EXISTS (SELECT 1 FROM Chitietdon WITH (XLOCK, HOLDLOCK)
                   WHERE MaDon = @MaDon AND MaSanPham = @MaSP AND Size = @Size)
        BEGIN
            UPDATE Chitietdon
            SET SoLuong = SoLuong + @SoLuong
            WHERE MaDon = @MaDon AND MaSanPham = @MaSP AND Size = @Size;
        END
        ELSE
        BEGIN
            INSERT INTO Chitietdon (MaDon, MaSanPham, Size, SoLuong, Gia)
            VALUES (@MaDon, @MaSP, @Size, @SoLuong, @Gia);
        END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT ERROR_MESSAGE();
    END CATCH
END;
GO