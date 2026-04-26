USE QuanLyBanHang;
GO

-------------------------------------------------------------------------
-- FILE: Kodoclaidl.sql  (Demo xu ly Khong doc lai du lieu - Non-Repeatable Read)
-------------------------------------------------------------------------

-- 1. sp_ThanhToanDonHang_Kodoclaidl
--    REPEATABLEREAD giu Lock-S tren ChiTietDon de dam bao
--    gia khong thay doi giua 2 lan doc trong cung 1 giao tac
CREATE OR ALTER PROCEDURE sp_ThanhToanDonHang_Kodoclaidl
    @MaDon VARCHAR(20)
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        DECLARE @TongTien INT;

        -- REPEATABLEREAD: giu Lock-S -> ngan UPDATE tu giao tac khac
        SELECT @TongTien = SUM(SoLuong * Gia)
        FROM Chitietdon WITH (REPEATABLEREAD)
        WHERE MaDon = @MaDon;

        UPDATE Donhang SET TongTien = @TongTien WHERE MaDon = @MaDon;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT ERROR_MESSAGE();
    END CATCH
END;
GO

-------------------------------------------------------------------------
-- 2. sp_LayDanhSachSanPham
--    REPEATABLEREAD giu Lock-S tren toan bo bang san pham
--    Ngan Quan ly UPDATE gia trong khi Nhan vien dang load menu
CREATE OR ALTER PROCEDURE sp_LayDanhSachSanPham
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        SELECT MaSanPham, TenSanPham, GiaBan, Size, SoLuong
        FROM Sanpham WITH (REPEATABLEREAD);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT ERROR_MESSAGE();
    END CATCH
END;
GO