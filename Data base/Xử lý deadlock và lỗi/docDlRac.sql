USE QuanLyBanHang;
GO

-------------------------------------------------------------------------
-- FILE: docDlRac.sql  (Demo xu ly Doc du lieu rac + Deadlock)
-------------------------------------------------------------------------

-- 1. sp_ThanhToanDonHang_docDlRac
--    Giai quyet Deadlock: Khoa bang DanhMuc (ID nho) truoc theo Ordering Protocol
--    Giai quyet Doc du lieu rac: READ COMMITTED + 2PL
CREATE OR ALTER PROCEDURE sp_ThanhToanDonHang_docDlRac
    @MaDon VARCHAR(20),
    @MaCa  INT,             -- INT cho khop voi bang Calamviec
    @MaDM  VARCHAR(10)      -- Tham so khoa theo thu tu Ordering Protocol
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- BUOC 1: Xin khoa X tren bang co ID nho (DanhMuc) truoc
        SELECT MaDanhMuc FROM Danhmuc WITH (XLOCK, HOLDLOCK) WHERE MaDanhMuc = @MaDM;

        -- BUOC 2: Tinh toan (REPEATABLEREAD chong Non-Repeatable Read)
        DECLARE @TongTien INT;
        SELECT @TongTien = SUM(SoLuong * Gia)
        FROM Chitietdon WITH (REPEATABLEREAD)
        WHERE MaDon = @MaDon;

        UPDATE Donhang
        SET TongTien = @TongTien, ThoiGian = GETDATE()
        WHERE MaDon = @MaDon;

        -- BUOC 3: Ghi log, MaLog la IDENTITY -> khong can sinh tay
        INSERT INTO Lichsugiaotac (MaDon, MaCa, HanhDong, NoiDungChiTiet, ThoiGian)
        VALUES (@MaDon, @MaCa, 'Thanh toan', N'Thanh toán thành công (docDlRac)', GETDATE());

        COMMIT TRANSACTION;
        RETURN 1;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        PRINT ERROR_MESSAGE();
        RETURN 0;
    END CATCH
END;
GO

-------------------------------------------------------------------------
-- 2. sp_QuanLyDonDepDanhMuc
--    Quan ly cung phai khoa DanhMuc truoc -> dam bao thu tu khoa nhat quan
CREATE OR ALTER PROCEDURE sp_QuanLyDonDepDanhMuc
    @MaDM       VARCHAR(10),
    @TenDMNew   NVARCHAR(50),
    @MaDonCheck VARCHAR(20)
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        -- BUOC 1: Xin khoa Ghi (X) tren DanhMuc truoc (cung thu tu voi NV)
        UPDATE Danhmuc SET TenDanhMuc = @TenDMNew WHERE MaDanhMuc = @MaDM;

        -- BUOC 2: Kiem tra bang phu
        SELECT * FROM Chitietdon WHERE MaDon = @MaDonCheck;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        PRINT ERROR_MESSAGE();
    END CATCH
END;
GO