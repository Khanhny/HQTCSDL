create database POS
go

use POS
go
DROP TABLE IF EXISTS Calamviec;
DROP TABLE IF EXISTS Danhmuc;
DROP TABLE IF EXISTS SanPham;
DROP TABLE IF EXISTS Chitietdon;
DROP TABLE IF EXISTS Lichsugiaotac;
DROP TABLE IF EXISTS Donhang;
DROP TABLE IF EXISTS Doanhthu;

create table Calamviec
(
MaCa char(4) PRIMARY KEY,
TenCa NVarchar(30),
GioBatDau time,
GioKetThuc time,
MatKhauCa int
);

create table Danhmuc
(
MaDanhMuc char(4) primary key,
TenDanhMuc NVarchar(30)
);

create table Sanpham
(
MaSanPham  char(4),
TenSanPham NVarchar(30),
GiaBan int,
MaDanhMuc char(4),
Size char(4),
primary key (MaSanPham, Size),
foreign key (MaDanhMuc) references DanhMuc(MaDanhMuc)
);


create table Donhang
(
MaDon char(4) primary key,
ThoiGian datetime,
TongTien decimal(18,0),
MaCa char(4),
foreign key (MaCa) references Calamviec(MaCa)
);

create table Chitietdon
(
MaDon char(4),
MaSanPham char(4),
Size char(4),
SoLuong int,
Gia decimal(18,0),
primary key (MaDon, MaSanPham),
foreign key (MaDon) references Donhang(MaDon),
foreign key (MaSanPham, Size) references SanPham(MaSanPham, Size)
);

create table Doanhthu
(
DoanhThuTheoGio Decimal(18,0),
DoanhThuTheoCa Decimal(18,0),
DoanhThuTheoNgay Decimal(18,0)
);

create table Lichsugiaotac
(
MaLog char(4),
MaDon char(4),
MaCa char(4),
HanhDong varchar(30),
NoiDungChiTiet NVarchar(100),
ThoiGian datetime,
primary key (MaLog, MaDon, MaCa),
foreign key (MaDon) references Donhang(MaDon),
foreign key (MaCa) references Calamviec(MaCa)
);
go


DELETE FROM Chitietdon;
DELETE FROM Sanpham;
DELETE FROM Danhmuc;

--------------DỮ LIỆU-----------------------
INSERT INTO Sanpham(MaSanPham,TenSanPham,GiaBan,MaDanhMuc,Size) VALUES
('CF1', N'Cà phê đen', 20000, 'Cf','S'),
('CF2', N'Cà phê sữa', 20000, 'Cf','S'),
('CF3', N'Americano', 20000, 'Cf','S'),
('CF1', N'Cà phê đen', 25000, 'Cf','M'),
('CF2', N'Cà phê sữa', 25000, 'Cf','M'),
('CF3', N'Americano', 25000, 'Cf','M'),
('CF1', N'Cà phê đen', 30000, 'Cf','L'),
('CF2', N'Cà phê sữa', 30000, 'Cf','L'),
('CF3', N'Americano', 30000, 'Cf','L'),
-- Nhóm Trà sữa
('TS1', N'Trà sữa truyền thống', 25000, 'TS','S'),
('TS2', N'Trà sữa Oolong', 25000, 'TS','S'),
('TS1', N'Trà sữa truyền thống', 35000, 'TS','M'),
('TS2', N'Trà sữa Oolong', 35000, 'TS','M'),
('TS1', N'Trà sữa truyền thống', 45000, 'TS','L'),
('TS2', N'Trà sữa Oolong', 45000, 'TS','L'),
-- Nhóm Matcha
('MC1', N'Matcha dâu', 30000, 'MC','S'),
('MC2', N'Matcha Latte', 30000, 'MC','S'),
('MC1', N'Matcha dâu', 35000, 'MC','M'),
('MC2', N'Matcha Latte', 35000, 'MC','M'),
('MC1', N'Matcha dâu', 45000, 'MC','L'),
('MC2', N'Matcha Latte', 45000, 'MC','L'),
-- Nhóm Trà trái cây
('TTC1', N'Trà mãng cầu', 30000, 'TTC','S'),
('TTC2', N'Trà dâu', 30000, 'TTC','S'),
('TTC3', N'Trà đào', 30000, 'TTC','S'),
('TTC4', N'Trà nho', 30000, 'TTC','S'),
('TTC5', N'Trà vải', 30000, 'TTC','S'),
('TTC1', N'Trà mãng cầu', 40000, 'TTC','M'),
('TTC2', N'Trà dâu', 40000, 'TTC','M'),
('TTC3', N'Trà đào', 40000, 'TTC','M'),
('TTC4', N'Trà nho', 40000, 'TTC','M'),
('TTC5', N'Trà vải', 40000, 'TTC','M'),
('TTC1', N'Trà mãng cầu', 45000, 'TTC','L'),
('TTC2', N'Trà dâu', 45000, 'TTC','L'),
('TTC3', N'Trà đào', 45000, 'TTC','L'),
('TTC4', N'Trà nho', 45000, 'TTC','L'),
('TTC5', N'Trà vải', 45000, 'TTC','L');

select * from SanPham;
select* from DanhMuc;

GO
INSERT INTO Danhmuc(MaDanhMuc, TenDanhMuc) VALUES
('Cf',  'Cà Phê'),
('TS',  'Trà Sữa'),
('MC',  'Matcha'),
('TTC', 'Trà Trái Cây');

INSERT INTO Calamviec(MaCa, TenCa) VALUES
('Ca 1', N'Ca sáng'),
('Ca 2', N'Ca chiều');
go
------VIEW----------------
-- 1. VIEW ĐĂNG NHẬP
CREATE OR ALTER view vw_DangNhap as
select 
    MaCa, 
    MatKhauCa
from Calamviec;
go

-- 2. VIEW SẢN PHẨM 
CREATE OR ALTER view vw_SanPham as 
select
    MaSanPham, 
    TenSanPham, 
    GiaBan, 
    MaDanhMuc
from Sanpham;
go

-- 3. VIEW DANH MỤC SẢN PHẨM 
CREATE OR ALTER view vw_DanhMucSanPham as
select
    MaDanhMuc, 
    TenDanhMuc
from Danhmuc;
go

-- 4. VIEW CHI TIẾT ĐƠN HÀNG (GIỎ HÀNG)
CREATE OR ALTER view vw_ChiTietDonHang as
select 
    MaDon,
    MaSanPham,
    Size,
    SoLuong,
    Gia,
    (SoLuong * Gia) as ThanhTien
from Chitietdon;
go 

-- 5. VIEW CHI TIET SAN PHAM (Join bảng Donhang và Chitietdon)
CREATE OR ALTER view vw_ChiTietSanPham as
select
    dh.MaDon,
    sp.TenSanPham,
    dh.ThoiGian,
    dh.TongTien,
    dh.MaCa,
    ct.MaSanPham,
    ct.Size,
    ct.SoLuong,
    ct.Gia
from Donhang dh
join Chitietdon ct on dh.MaDon = ct.MaDon
join Sanpham sp on ct.MaSanPham = sp.MaSanPham;
go 
  
-- 6. VIEW BÁO CÁO DOANH THU
--- 6.1. Doanh thu theo gio
CREATE OR ALTER view vw_DoanhThuTheoGio as
select
    datepart(HOUR, ThoiGian) as Gio,
    sum(TongTien) as DoanhThuTheoGio
from Donhang
group by datepart(HOUR, ThoiGian);
go
    
--- 6.2. Doanh thu theo ngày
CREATE OR ALTER view vw_DoanhThuTheoNgay as
select
    cast(ThoiGian as DATETIME) as Ngay,
    sum(TongTien) as TongDoanhThuNgay,
    count(MaDon) as TongSoDonHang
from Donhang
group by cast (ThoiGian as DATE);
go 

--- 6.3. Doanh thu theo ca làm việc
CREATE OR ALTER view vw_DoanhThuTheoCa as
select 
    MaCa,
    cast(ThoiGian as DATETIME) as Ngay,
    sum(TongTien) as DoanhThuTheoCa
from Donhang
group by MaCa, cast(ThoiGian as DATETIME);
go 
    
-- 7. VIEW ĐƠN HÀNG
CREATE OR ALTER view vw_DonHang as
select * from Donhang;
go
-- 8. VIEW ĐẦY ĐỦ ĐƠN HÀNG
CREATE OR ALTER VIEW vw_SanPham_DayDu AS
SELECT 
    sp.MaSanPham, 
    sp.TenSanPham, 
    sp.GiaBan, 
    dm.TenDanhMuc -- Lấy tên từ bảng Danh mục
FROM Sanpham sp
JOIN Danhmuc dm ON sp.MaDanhMuc = dm.MaDanhMuc;
GO

-------------------------------------------------FUNTION--------------------------
/*function fn_DemSoLuongSanPham
/* ở Bang chi tiet don hang ,(view gio hang)
*/*/
CREATE OR ALTER function fn_DemSoLuongSanPham(@MaDon char(4))
returns int 
as 
begin
declare @TongSoLuong int 
select @TongSoLuong= sum (CTD.SoLuong) 
from ChiTietDon CTD
where CTD.MaDon=@MaDon
return @TongSoLuong
end
GO

/* function fn_TinhTongTienDonHang(@MaDon nvarchar (20))
 * ở Bang chi tiet don hang ,(view gio hang) */
CREATE OR ALTER function fn_TinhTongTienDonHang(@MaDon char(4))
returns int 
as
begin
declare @TongTien int 
select @TongTien = sum(CTD.Gia*CTD.SoLuong)
from ChiTietDon CTD
where CTD.MaDon= @MaDon
return @TongTien
end
GO
/* fn_DoanhThuTheoNgay(@Ngay date)
 * Bảng đơn hàng, View báo cáo doanh thu 
*/
CREATE OR ALTER function fn_DoanhThuTheoNgay(@Ngay date)
returns int
as
begin
declare @DoanhThuTheoNgay int
select @DoanhThuTheoNgay= isnull(sum(DH.TongTien),0)
from Donhang DH WITH (SERIALIZABLE)
--áp dụng mức bảo vệ dữ liệu cao nhất và nghiêm ngặt nhất
where cast(DH.ThoiGian as date )= @Ngay
/*dùng cast as date -> Chuyển dữ liệu từ kiểu DATETIME-> chỉ lấy phần DATE (ngày/tháng/năm)
 * cast rất chính xác nên thích hợp dùng cho ngày tháng năm*/
return @DoanhThuTheoNgay
end
GO

/* fn_DoanhThuTheoCa(@MaCa int)
 * Bảng đơn hàng, View báo cáo doanh thu 
*/
CREATE OR ALTER function fn_DoanhThuTheoCa(@MaCa char(4))
returns int
as
begin
declare @DoanhThuTheoCa int
select @DoanhThuTheoCa = isnull(sum(DH.TongTien),0)
from Donhang DH WITH (SERIALIZABLE)
--áp dụng mức bảo vệ dữ liệu cao nhất và nghiêm ngặt nhất
where DH.MaCa= @MaCa
return @DoanhThuTheoCa
end
GO

/* fn_DoanhThuTheoCa(@MaCa int)
 * Bảng đơn hàng, View báo cáo doanh thu 
*/
CREATE OR ALTER function fn_DoanhThuTheoGio(@Gio int)
returns int
as
begin
declare @DoanhThuTheoGio int
select @DoanhThuTheoGio = isnull(sum(DH.TongTien),0)
from Donhang DH WITH (SERIALIZABLE)
--áp dụng mức bảo vệ dữ liệu cao nhất và nghiêm ngặt nhất
where datepart(hour,DH.ThoiGian)= @Gio
/*dùng datepart để lấy phần giờ, vì cast chính xác quá nên khó ss giây = -> dùng datepart hợp lý hơn)*/
return @DoanhThuTheoGio
end
GO

CREATE OR ALTER function fn_LayGiaSanPham(@MaSP char(4))
returns int
as
begin
    declare @Gia int
    select @Gia = GiaBan from Sanpham where MaSanPham = @MaSP
    return isnull(@Gia, 0)
end
GO

-------------STORE PROCEDURE--------------------------------
-- 1. Thủ tục Đăng Nhập
CREATE OR ALTER PROCEDURE sp_DangNhap
    @MaCa CHAR(4),
    @MatKhauCa INT,
    @KetQua INT OUTPUT 
AS
BEGIN
    --khóa đọc-> Khắc phục Đọc dữ liệu rác
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 
    -- Kiểm tra tồn tại 
    IF NOT EXISTS (SELECT 1 FROM Calamviec WHERE MaCa = @MaCa AND MatKhauCa = @MatKhauCa)
    BEGIN
        PRINT N'Thất bại: Sai mã ca hoặc mật khẩu!';
        SET @KetQua = 0;
        RETURN 0; 
    END

    PRINT N'Thành công: Đăng nhập hợp lệ!';
    SET @KetQua = 1;
    RETURN 1;
END;
GO

-- 2. Thủ tục Tạo Đơn Hàng Mới
CREATE OR ALTER PROCEDURE sp_TaoDonHangMoi
    @MaCa CHAR(4),
    @MaDonMoi CHAR(4) OUTPUT
AS
BEGIN
    --khóa đọc-> Khắc phục Đọc dữ liệu rác
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 
    -- Validate đầu vào:
    IF NOT EXISTS (SELECT 1 FROM Calamviec WHERE MaCa = @MaCa)
    BEGIN
        PRINT N'Lỗi: Nhân viên (Mã ca) không tồn tại!';
        RETURN 0;
    END

    BEGIN TRY
        -- Bắt đầu Giao Tác
        BEGIN TRANSACTION;

        -- Dùng UPDLOCK, HOLDLOCK để khóa dòng (Tránh tranh chấp khi nhiều người tạo đơn cùng lúc)
        DECLARE @MaxDon INT;
        SELECT @MaxDon = ISNULL(MAX(CAST(RIGHT(MaDon, 3) AS INT)), 0) FROM Donhang WITH (UPDLOCK, HOLDLOCK);
        SET @MaDonMoi = 'D' + RIGHT('000' + CAST(@MaxDon + 1 AS VARCHAR(3)), 3);

        -- Thêm đơn hàng
        INSERT INTO Donhang (MaDon, ThoiGian, TongTien, MaCa)
        VALUES (@MaDonMoi, GETDATE(), 0, @MaCa);

        -- Sinh mã Log và ghi lại lịch sử
        DECLARE @MaxLog INT, @MaLogMoi CHAR(4);
        SELECT @MaxLog = ISNULL(MAX(CAST(RIGHT(MaLog, 3) AS INT)), 0) FROM Lichsugiaotac WITH (UPDLOCK, HOLDLOCK);
        SET @MaLogMoi = 'L' + RIGHT('000' + CAST(@MaxLog + 1 AS VARCHAR(3)), 3);

        INSERT INTO Lichsugiaotac (MaLog, MaDon, MaCa, HanhDong, NoiDungChiTiet, ThoiGian)
        VALUES (@MaLogMoi, @MaDonMoi, @MaCa, 'Tao don moi', N'Khởi tạo đơn thành công', GETDATE());

        COMMIT TRANSACTION;
        PRINT N'Tạo đơn hàng thành công: ' + @MaDonMoi;
        RETURN 1;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        PRINT N'Lỗi giao tác: ' + ERROR_MESSAGE();
        RETURN 0;
    END CATCH
END;
GO

-- 3. Thủ tục Thêm Sản Phẩm Vào Đơn
CREATE OR ALTER PROCEDURE sp_ThemSanPhamVaoDon
    @MaDon CHAR(4),
    @MaCa CHAR(4),
    @MaSanPham CHAR(4),
    @Size VARCHAR(5),
    @SoLuong INT
AS
BEGIN
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 
    IF NOT EXISTS (SELECT 1 FROM Donhang WHERE MaDon = @MaDon)
    BEGIN PRINT N'Lỗi: Đơn hàng không tồn tại!'; RETURN 0; END
    IF NOT EXISTS (SELECT 1 FROM Sanpham WHERE MaSanPham = @MaSanPham)
    BEGIN PRINT N'Lỗi: Sản phẩm không tồn tại!'; RETURN 0; END
    IF @SoLuong <= 0
    BEGIN PRINT N'Lỗi: Số lượng phải lớn hơn 0!'; RETURN 0; END

    BEGIN TRY
        BEGIN TRANSACTION;
        DECLARE @GiaBan INT;
        SELECT @GiaBan = GiaBan FROM Sanpham 
        WHERE MaSanPham = @MaSanPham AND Size = @Size;

        -- ↓ Thêm AND Size = @Size vào đây
        IF EXISTS (
            SELECT 1 FROM Chitietdon WITH (UPDLOCK) 
            WHERE MaDon = @MaDon AND MaSanPham = @MaSanPham AND Size = @Size
        )
        BEGIN
            UPDATE Chitietdon
            SET SoLuong = SoLuong + @SoLuong
            WHERE MaDon = @MaDon AND MaSanPham = @MaSanPham AND Size = @Size;
        END
        ELSE
        BEGIN
            INSERT INTO Chitietdon (MaDon, MaSanPham, Size, SoLuong, Gia)
            VALUES (@MaDon, @MaSanPham, @Size, @SoLuong, CAST(@GiaBan AS DECIMAL(18,0)));
        END

        UPDATE Donhang 
        SET TongTien = (SELECT SUM(SoLuong * Gia) FROM Chitietdon WHERE MaDon = @MaDon)
        WHERE MaDon = @MaDon;

        COMMIT TRANSACTION;
        RETURN 1;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        PRINT N'Lỗi: ' + ERROR_MESSAGE();
        RETURN 0;
    END CATCH
END;
GO
-- 4. Thủ tục Chốt Thanh Toán
CREATE OR ALTER PROCEDURE sp_ThanhToanDonHang
    @MaDon CHAR(4),
    @MaCa CHAR(4)
AS
BEGIN
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 
    IF NOT EXISTS (SELECT 1 FROM Donhang WHERE MaDon = @MaDon)
    BEGIN
        PRINT N'Lỗi: Mã đơn cần thanh toán không tồn tại!';
        RETURN 0;
    END
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Tính lại TongTien từ chi tiết đơn
        DECLARE @TongTien DECIMAL(18,0);
        SELECT @TongTien = ISNULL(SUM(SoLuong * Gia), 0) 
        FROM Chitietdon 
        WHERE MaDon = @MaDon;

        -- Cập nhật TongTien và ThoiGian (dùng GETDATE() thay vì CAST AS TIME)
        UPDATE Donhang 
        SET TongTien = @TongTien,
            ThoiGian = GETDATE()
        WHERE MaDon = @MaDon;

        -- Ghi log
        DECLARE @MaxLog INT, @MaLogMoi CHAR(4);
        SELECT @MaxLog = ISNULL(MAX(CAST(RIGHT(MaLog, 3) AS INT)), 0) 
        FROM Lichsugiaotac WITH (UPDLOCK, HOLDLOCK);
        SET @MaLogMoi = 'L' + RIGHT('000' + CAST(@MaxLog + 1 AS VARCHAR(3)), 3);

        DECLARE @ChiTietLog NVARCHAR(100) = N'Chốt bill thành công. Khách trả: ' + CAST(@TongTien AS VARCHAR(20));
        INSERT INTO Lichsugiaotac (MaLog, MaDon, MaCa, HanhDong, NoiDungChiTiet, ThoiGian)
        VALUES (@MaLogMoi, @MaDon, @MaCa, N'Thanh toan', @ChiTietLog, GETDATE());

        COMMIT TRANSACTION;
        PRINT N'THANH TOÁN THÀNH CÔNG: ' + @MaDon + N' - ' + CAST(@TongTien AS VARCHAR(20)) + N' VND';
        RETURN 1;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        PRINT N'Lỗi giao tác: ' + ERROR_MESSAGE();
        RETURN 0;
    END CATCH
END;
GO

-- 5. Thủ tục Cập Nhật Giá Sản Phẩm 
CREATE PROCEDURE sp_CapNhatGiaSanPham
    @MaCa CHAR(4),
    @MaSanPham CHAR(4),
    @GiaMoi INT
AS
BEGIN
    --khóa đọc-> Khắc phục Đọc dữ liệu rác
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 

    IF NOT EXISTS (SELECT 1 FROM Sanpham WHERE MaSanPham = @MaSanPham)
    BEGIN
        PRINT N'Lỗi: Sản phẩm không tồn tại!';
        RETURN 0;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Cập nhật giá
        UPDATE Sanpham 
        SET GiaBan = @GiaMoi
        WHERE MaSanPham = @MaSanPham;

        -- Sinh mã Log ghi lại
        DECLARE @MaxLog INT, @MaLogMoi CHAR(4);
        SELECT @MaxLog = ISNULL(MAX(CAST(RIGHT(MaLog, 3) AS INT)), 0) FROM Lichsugiaotac WITH (UPDLOCK, HOLDLOCK);
        SET @MaLogMoi = 'L' + RIGHT('000' + CAST(@MaxLog + 1 AS VARCHAR(3)), 3);

        DECLARE @ChiTiet NVARCHAR(100) = N'Cập nhật giá SP ' + @MaSanPham + N' thành ' + CAST(@GiaMoi AS VARCHAR(20));

        INSERT INTO Lichsugiaotac (MaLog, MaDon, MaCa, HanhDong, NoiDungChiTiet, ThoiGian)
        VALUES (@MaLogMoi, 'none', @MaCa, 'Cap nhat gia', @ChiTiet, GETDATE());

        COMMIT TRANSACTION;
        PRINT N'Cập nhật giá thành công!';
        RETURN 1;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        PRINT N'Lỗi giao tác: ' + ERROR_MESSAGE();
        RETURN 0;
    END CATCH
END;
GO

--6.Thủ tục Xóa sản phẩm khỏi giỏ hàng
CREATE OR ALTER PROCEDURE sp_XoaSanPhamKhoiDon
    @MaDon CHAR(4),
    @MaSanPham CHAR(4)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
        DELETE FROM Chitietdon WHERE MaDon = @MaDon AND MaSanPham = @MaSanPham;
        -- Cập nhật lại tổng tiền đơn hàng nếu cần
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
    END CATCH
END;
GO

-------------TRIGGER----------------------
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
go

CREATE OR ALTER TRIGGER trg_KhongChoXoaDanhMuc

ON Danhmuc

INSTEAD OF DELETE

AS

BEGIN
--khóa đọc

SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 
IF EXISTS (SELECT 1 FROM Sanpham WHERE MaDanhMuc IN (SELECT MaDanhMuc FROM deleted))
BEGIN
   PRINT N'Lỗi: Không được xóa danh mục vì vẫn còn sản phẩm bên trong!';
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        DELETE FROM Danhmuc WHERE MaDanhMuc IN (SELECT MaDanhMuc FROM deleted);
    END
END;
GO

select * from SanPham;

SELECT COLUMN_NAME, DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Sanpham';

select * from Calamviec;
SELECT MaDon, ThoiGian, TongTien FROM Donhang ORDER BY MaDon DESC;

SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Donhang';

ALTER TABLE Donhang ALTER COLUMN ThoiGian DATETIME;
UPDATE Donhang SET ThoiGian = GETDATE() WHERE ThoiGian IS NULL OR YEAR(ThoiGian) = 1900;

UPDATE d
SET d.TongTien = (SELECT ISNULL(SUM(ct.SoLuong * ct.Gia), 0) 
                  FROM Chitietdon ct WHERE ct.MaDon = d.MaDon)
FROM Donhang d;

SELECT name FROM sys.key_constraints WHERE parent_object_id = OBJECT_ID('Chitietdon');

ALTER TABLE Chitietdon DROP CONSTRAINT PK__Chitietd__F225812A6FC1FB66;

UPDATE Chitietdon SET Size = 'M' WHERE Size IS NULL;

SELECT name, type_desc 
FROM sys.objects 
WHERE parent_object_id = OBJECT_ID('Chitietdon');

ALTER TABLE Chitietdon DROP CONSTRAINT FK_Chitietdon_Sanpham;
ALTER TABLE Chitietdon DROP CONSTRAINT PK_Chitietdon;

-- Bước 1: Xóa FK cũ
ALTER TABLE Chitietdon DROP CONSTRAINT FK__Chitietdo__MaDon__5CA1C101;

-- Bước 2: Đổi Size thành char(5) NOT NULL
ALTER TABLE Chitietdon ALTER COLUMN Size CHAR(5) NOT NULL;

-- Bước 3: Thêm PK mới
ALTER TABLE Chitietdon 
ADD CONSTRAINT PK_Chitietdon PRIMARY KEY (MaDon, MaSanPham, Size);

-- Bước 4: Thêm lại FK MaDon
ALTER TABLE Chitietdon 
ADD CONSTRAINT FK_Chitietdon_Donhang 
FOREIGN KEY (MaDon) REFERENCES Donhang(MaDon);

-- Bước 5: Thêm FK MaSanPham + Size
ALTER TABLE Chitietdon 
ADD CONSTRAINT FK_Chitietdon_Sanpham 
FOREIGN KEY (MaSanPham, Size) REFERENCES Sanpham(MaSanPham, Size);

-- Bước 6: Xóa dữ liệu cũ bị trùng
DELETE FROM Chitietdon;

SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'Size' AND TABLE_NAME IN ('Sanpham', 'Chitietdon');

-- Bước 1: Xóa PK trước
ALTER TABLE Chitietdon DROP CONSTRAINT PK_Chitietdon;

-- Bước 2: Đổi Size thành char(4)
ALTER TABLE Chitietdon ALTER COLUMN Size CHAR(4) NOT NULL;

-- Bước 3: Thêm lại PK
ALTER TABLE Chitietdon 
ADD CONSTRAINT PK_Chitietdon PRIMARY KEY (MaDon, MaSanPham, Size);

-- Bước 4: Thêm FK
ALTER TABLE Chitietdon 
ADD CONSTRAINT FK_Chitietdon_Sanpham 
FOREIGN KEY (MaSanPham, Size) REFERENCES Sanpham(MaSanPham, Size);

EXEC sp_helptext 'sp_ThemSanPhamVaoDon';

delete from Chitietdon;

select* from Chitietdon;

SELECT * FROM Donhang ORDER BY MaDon DESC;

UPDATE Donhang SET ThoiGian = GETDATE() WHERE YEAR(ThoiGian) = 1900;

SELECT * FROM Chitietdon WHERE MaDon = 'D036';
