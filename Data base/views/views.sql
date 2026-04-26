use QuanLyBanHang;
go
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
    Size,
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
    CREATE VIEW vw_ChonSize AS
SELECT 
    MaSanPham,
    TenSanPham,
    Size,
    GiaBan
FROM Sanpham

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
    dh.ThoiGian,
    dh.TongTien,
    dh.MaCa,
    ct.MaSanPham,
    ct.Size,
    ct.SoLuong,
    ct.Gia
from Donhang dh
join Chitietdon ct on dh.MaDon = ct.MaDon;
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
    cast(ThoiGian as DATE) as Ngay,
    sum(TongTien) as TongDoanhThuNgay,
    count(MaDon) as TongSoDonHang
from Donhang
group by cast (ThoiGian as DATE);
go 

--- 6.3. Doanh thu theo ca làm việc
CREATE OR ALTER view vw_DoanhThuTheoCa as
select 
    MaCa,
    cast(ThoiGian as DATE) as Ngay,
    sum(TongTien) as DoanhThuTheoCa
from Donhang
group by MaCa, cast(ThoiGian as DATE);
go 
    
-- 7. VIEW ĐƠN HÀNG
CREATE OR ALTER view vw_DonHang as
select * from Donhang;
go
    -- view chọn size 
CREATE VIEW vw_ChonSize AS
SELECT 
    MaSanPham,
    TenSanPham,
    Size,
    GiaBan
FROM Sanpham

