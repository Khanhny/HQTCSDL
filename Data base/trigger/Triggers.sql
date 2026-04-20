USE QuanLyBanHang;
GO

-- 1. Trigger Tự tạo mã đơn
CREATE OR ALTER TRIGGER trg_TuDongTaoMaDon
ON Donhang
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @MaDon VARCHAR(20);
    SELECT @MaDon = 'DH' + CONVERT(VARCHAR, GETDATE(), 112) + 
                    RIGHT('000' + CAST(ISNULL((SELECT COUNT(*) FROM Donhang), 0) + 1 AS VARCHAR), 3);
    
    INSERT INTO Donhang (MaDon, ThoiGian, TongTien, MaCa)
    SELECT @MaDon, GETDATE(), ISNULL(TongTien, 0), MaCa FROM inserted;
END;
GO

-- 2. Trigger Tự lấy Mã SP từ Tên SP
CREATE OR ALTER TRIGGER trg_TuDongLayMaSP
ON Chitietdon
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @MaDon varchar(20), @TenSP varchar(30), @SoLuong int, @Size varchar(5);
    DECLARE @MaSP_TimDuoc char(4), @Gia_TimDuoc int;

    -- Lấy dữ liệu 
    SELECT 
        @MaDon = MaDon,
        @SoLuong = SoLuong,
        @TenSP = MaSanPham, 
        @Size = Size
    from inserted;

    -- Tìm Mã và Giá
    SELECT 
        @MaSP_TimDuoc = MaSanPham,
        @Gia_TimDuoc = GiaBan
    from Sanpham
    where TenSanPham = @TenSP;

    IF @MaSP_TimDuoc is not null
    BEGIN 
        -- Chèn vào bảng thực 
        INSERT INTO Chitietdon(MaDon, MaSanPham, Size, SoLuong, Gia)
        VALUES (@MaDon, @MaSP_TimDuoc, @Size, @SoLuong, @Gia_TimDuoc);
    END
    ELSE
        PRINT 'Loi: Khong tim thay san pham ten ' + @TenSP;
END;
GO

-- 3. Trigger Cập nhật tổng tiền đơn hàng
CREATE OR ALTER TRIGGER trg_CapNhatTongTien
ON Chitietdon
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    UPDATE Donhang
    SET TongTien = ISNULL((SELECT SUM(SoLuong * Gia) FROM Chitietdon WHERE Chitietdon.MaDon = Donhang.MaDon), 0)
    WHERE MaDon IN (SELECT MaDon FROM inserted UNION SELECT MaDon FROM deleted);
END;
GO

--4.Trigger Ghi lịch sử khi tạo đơn 
CREATE OR ALTER TRIGGER trg_GhiLichSuKhiTaoDon
ON Donhang
AFTER INSERT
AS
BEGIN
    INSERT INTO Lichsugiaotac (MaDon, MaCa, HanhDong, NoiDungChiTiet)
    SELECT 
        MaDon, 
        MaCa, 
        N'Tạo mới', 
        N'Đơn hàng mới tại ca ' + CAST(MaCa AS VARCHAR)
        --cast để ép từ int thành chuỗi để + vào chuỗi
    FROM inserted;
END;

--CREATE OR ALTER TRIGGER trg_KhongChoXoaDanhMuc

--ON Danhmuc

--INSTEAD OF DELETE

--AS

--BEGIN

--    --khóa đọc

--    SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 

--    IF EXISTS (SELECT 1 FROM Sanpham WHERE MaDanhMuc IN (SELECT MaDanhMuc FROM deleted))

--    BEGIN

--        PRINT N'Lỗi: Không được xóa danh mục vì vẫn còn sản phẩm bên trong!';

--        ROLLBACK TRANSACTION;

--    END

--    ELSE

--    BEGIN

--        DELETE FROM Danhmuc WHERE MaDanhMuc IN (SELECT MaDanhMuc FROM deleted);

--    END

--END;

--GO