USE QuanLyBanHang;
GO

-- fn_DemSoLuongSanPham: Dem tong so luong san pham trong 1 don hang
-- Dung o: Bang chi tiet don hang, View gio hang
CREATE OR ALTER FUNCTION fn_DemSoLuongSanPham(@MaDon VARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @TongSoLuong INT;
    SELECT @TongSoLuong = SUM(CTD.SoLuong)
    FROM Chitietdon CTD
    WHERE CTD.MaDon = @MaDon;
    RETURN @TongSoLuong;
END;
GO

-- fn_TinhTongTienDonHang: Tinh tong tien cua 1 don hang
-- Tham so MaDon doi thanh VARCHAR(20) cho khop voi bang Donhang
CREATE OR ALTER FUNCTION fn_TinhTongTienDonHang(@MaDon VARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @TongTien INT;
    SELECT @TongTien = SUM(CTD.Gia * CTD.SoLuong)
    FROM Chitietdon CTD
    WHERE CTD.MaDon = @MaDon;
    RETURN @TongTien;
END;
GO

-- fn_DoanhThuTheoNgay: Tong doanh thu theo ngay
-- SERIALIZABLE -> Range Lock, chong Phantom Read
CREATE OR ALTER FUNCTION fn_DoanhThuTheoNgay(@Ngay DATE)
RETURNS INT
AS
BEGIN
    DECLARE @DoanhThuTheoNgay INT;
    SELECT @DoanhThuTheoNgay = ISNULL(SUM(DH.TongTien), 0)
    FROM Donhang DH WITH (SERIALIZABLE)
    WHERE CAST(DH.ThoiGian AS DATE) = @Ngay;
    RETURN @DoanhThuTheoNgay;
END;
GO

-- fn_DoanhThuTheoCa: Tong doanh thu theo ca lam viec
-- @MaCa INT cho khop voi bang Calamviec
-- SERIALIZABLE -> Range Lock, chong Phantom Read
CREATE OR ALTER FUNCTION fn_DoanhThuTheoCa(@MaCa INT)
RETURNS INT
AS
BEGIN
    DECLARE @DoanhThuTheoCa INT;
    SELECT @DoanhThuTheoCa = ISNULL(SUM(DH.TongTien), 0)
    FROM Donhang DH WITH (SERIALIZABLE)
    WHERE DH.MaCa = @MaCa;
    RETURN @DoanhThuTheoCa;
END;
GO

-- fn_DoanhThuTheoGio: Tong doanh thu theo gio
-- SERIALIZABLE -> Range Lock, chong Phantom Read
CREATE OR ALTER FUNCTION fn_DoanhThuTheoGio(@Gio INT)
RETURNS INT
AS
BEGIN
    DECLARE @DoanhThuTheoGio INT;
    SELECT @DoanhThuTheoGio = ISNULL(SUM(DH.TongTien), 0)
    FROM Donhang DH WITH (SERIALIZABLE)
    WHERE DATEPART(HOUR, DH.ThoiGian) = @Gio;
    RETURN @DoanhThuTheoGio;
END;
GO