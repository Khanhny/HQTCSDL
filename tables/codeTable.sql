use QuanLyBanHang;
go

use QuanLyBanHang;
go
DROP TABLE IF EXISTS Lichsugiaotac;
DROP TABLE IF EXISTS Chitietdon;
DROP TABLE IF EXISTS Doanhthu;
DROP TABLE IF EXISTS Donhang;
DROP TABLE IF EXISTS Sanpham;
DROP TABLE IF EXISTS Danhmuc;
DROP TABLE IF EXISTS Calamviec;
GO

create table Calamviec
(
MaCa int PRIMARY KEY,
TenCa int,
GioBatDau DATETIME,
GioKetThuc DATETIME,
MatKhauCa int
);

create table Danhmuc
(
MaDanhMuc char(4) primary key,
TenDanhMuc varchar(30)
);

create table Sanpham
(
MaSanPham  char(4) primary key,
TenSanPham Varchar(30),
GiaBan int,
MaDanhMuc char(4),
foreign key (MaDanhMuc) references DanhMuc(MaDanhMuc) 
);
create table Donhang
(
MaDon char(4) primary key,
ThoiGian DATETIME,
TongTien int,
MaCa int,
foreign key (MaCa) references Calamviec(MaCa)
);

create table Chitietdon
(
MaDon char(4),
MaSanPham char(4),
Size varchar(5),
SoLuong int,
Gia decimal(18,0),
primary key (MaDon, MaSanPham),
foreign key (MaDon) references Donhang(MaDon),
foreign key (MaSanPham) references SanPham(MaSanPham)
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
MaCa int,
HanhDong varchar(30),
NoiDungChiTiet NVarchar(100),
ThoiGian datetime,
primary key (MaLog, MaDon, MaCa),
foreign key (MaDon) references Donhang(MaDon),
foreign key (MaCa) references Calamviec(MaCa)
);

