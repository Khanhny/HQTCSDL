USE QuanLyBanHang;
GO

-- 1. Trigger Tu dong lay Ma SP tu Ten SP (da sua: dung CURSOR xu ly nhieu dong)
CREATE OR ALTER TRIGGER trg_TuDongLayMaSP
ON Chitietdon
INSTEAD OF INSERT
AS
BEGIN
    -- Khai bao bien cho cursor
    DECLARE @MaDon      VARCHAR(20),
            @TenSP      VARCHAR(30),
            @SoLuong    INT,
            @Size       CHAR(3);
    DECLARE @MaSP_TimDuoc CHAR(4),
            @Gia_TimDuoc  INT;

    -- Dung CURSOR de xu ly tung dong trong bang inserted
    -- (SELECT FROM inserted ma khong dung cursor chi lay duoc 1 dong cuoi)
    DECLARE cur CURSOR LOCAL FAST_FORWARD FOR
        SELECT MaDon, MaSanPham, Size, SoLuong FROM inserted;

    OPEN cur;
    FETCH NEXT FROM cur INTO @MaDon, @TenSP, @Size, @SoLuong;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- MaSanPham trong inserted chua TenSanPham (theo thiet ke cu), tim MaSP that
        SELECT @MaSP_TimDuoc = MaSanPham,
               @Gia_TimDuoc  = GiaBan
        FROM Sanpham
        WHERE TenSanPham = @TenSP AND Size = @Size;

        IF @MaSP_TimDuoc IS NOT NULL
        BEGIN
            INSERT INTO Chitietdon (MaDon, MaSanPham, Size, SoLuong, Gia)
            VALUES (@MaDon, @MaSP_TimDuoc, @Size, @SoLuong, @Gia_TimDuoc);
        END
        ELSE
            PRINT N'Lỗi: Không tìm thấy sản phẩm tên ' + @TenSP + N' size ' + @Size;

        -- Reset bien de tranh dung lai gia tri cu
        SET @MaSP_TimDuoc = NULL;
        SET @Gia_TimDuoc  = NULL;

        FETCH NEXT FROM cur INTO @MaDon, @TenSP, @Size, @SoLuong;
    END

    CLOSE cur;
    DEALLOCATE cur;
END;
GO

-- 2. Trigger Cap nhat tong tien don hang
CREATE OR ALTER TRIGGER trg_CapNhatTongTien
ON Chitietdon
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    UPDATE Donhang
    SET TongTien = ISNULL(
        (SELECT SUM(SoLuong * Gia) FROM Chitietdon WHERE Chitietdon.MaDon = Donhang.MaDon),
        0)
    WHERE MaDon IN (SELECT MaDon FROM inserted UNION SELECT MaDon FROM deleted);
END;
GO

-- 3. Trigger Ghi lich su khi tao don
--    MaLog la IDENTITY -> khong insert MaLog, SQL Server tu dong cap gia tri
--    Bo sung ThoiGian DEFAULT GETDATE() nen trigger khong can truyen
CREATE OR ALTER TRIGGER trg_GhiLichSuKhiTaoDon
ON Donhang
AFTER INSERT
AS
BEGIN
    INSERT INTO Lichsugiaotac (MaDon, MaCa, HanhDong, NoiDungChiTiet, ThoiGian)
    SELECT
        MaDon,
        MaCa,
        N'Tạo mới',
        N'Đơn hàng mới tại ca ' + CAST(MaCa AS VARCHAR),
        GETDATE()
    FROM inserted;
END;
GO