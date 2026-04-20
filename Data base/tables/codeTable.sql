USE QuanLyBanHang;
GO

DROP TABLE IF EXISTS Lichsugiaotac;
DROP TABLE IF EXISTS Chitietdon;
DROP TABLE IF EXISTS Doanhthu;
DROP TABLE IF EXISTS Donhang;
DROP TABLE IF EXISTS Sanpham;
DROP TABLE IF EXISTS Danhmuc;
DROP TABLE IF EXISTS Calamviec;
GO

CREATE TABLE Calamviec (
    MaCa int PRIMARY KEY,
    GioBatDau TIME,
    GioKetThuc TIME,
    MatKhauCa int
);

CREATE TABLE Danhmuc (
    MaDanhMuc char(4) PRIMARY KEY,
    TenDanhMuc varchar(30)
);

CREATE TABLE Sanpham (
    MaSanPham char(4) ,
    TenSanPham Varchar(30),
    GiaBan int,
    MaDanhMuc char(4),
    Size char(3) ,
    SoLuong int default 1,
    primary key (MaSanPham,Size),
    FOREIGN KEY (MaDanhMuc) REFERENCES Danhmuc(MaDanhMuc)
);

CREATE TABLE Donhang (
    MaDon VARCHAR(20) PRIMARY KEY,
    ThoiGian DATETIME DEFAULT GETDATE(),
    TongTien int DEFAULT 0,
    MaCa int,
    FOREIGN KEY (MaCa) REFERENCES Calamviec(MaCa)
);

CREATE TABLE Chitietdon (
    MaDon VARCHAR(20),
    MaSanPham char(4),
    Size char(3),
    SoLuong int,
    Gia decimal(18,0), -- Cột lưu giá tại thời điểm bán
    PRIMARY KEY (MaDon, MaSanPham, Size),
    FOREIGN KEY (MaDon) REFERENCES Donhang(MaDon),
    FOREIGN KEY (MaSanPham, Size) REFERENCES Sanpham(MaSanPham, Size)
);
GO

create table Doanhthu

(

DoanhThuTheoGio Decimal(18,0),

DoanhThuTheoCa Decimal(18,0),

DoanhThuTheoNgay Decimal(18,0)

);



create table Lichsugiaotac

(

MaLog int IDENTITY(1,1),

MaDon VARCHAR(20),

MaCa int,

HanhDong varchar(30),

NoiDungChiTiet NVarchar(100),

ThoiGian datetime,

primary key (MaLog, MaDon, MaCa),

foreign key (MaDon) references Donhang(MaDon),

foreign key (MaCa) references Calamviec(MaCa)

);

-- Chèn dữ liệu mẫu
INSERT INTO Calamviec VALUES (1, '06:00:00', '12:59:59', 111111), (2, '13:00:00', '18:00:00', 222222);
INSERT INTO Danhmuc VALUES ('Cf','CaPhe'), ('TS','TraSua'), ('MC','Matcha'), ('TTC','TraTraiCay');
-- Nhóm Cà phê (MaDanhMuc: 'Cf')

 
INSERT INTO Sanpham(MaSanPham,TenSanPham,GiaBan,MaDanhMuc,Size) VALUES
('CF1', 'Ca phe den', 20000, 'Cf','S'),

('CF2', 'Ca phe sua', 20000, 'Cf','S'),

('CF3', 'Americano', 20000, 'Cf','S'),

('CF1', 'Ca phe den', 25000, 'Cf','M'),

('CF2', 'Ca phe sua', 25000, 'Cf','M'),

('CF3', 'Americano', 25000, 'Cf','M'),

('CF1', 'Ca phe den', 30000, 'Cf','L'),

('CF2', 'Ca phe sua', 30000, 'Cf','L'),

('CF3', 'Americano', 30000, 'Cf','L'),

-- Nhóm Trà sữa (MaDanhMuc: 'TS')

('TS1', 'Tra sua truyen thong', 25000, 'TS','S'),
('TS2', 'Tra sua Olong', 25000, 'TS','S'),

('TS1', 'Tra sua truyen thong', 35000, 'TS','M'),

('TS2', 'Tra sua Olong', 35000, 'TS','M'),

('TS1', 'Tra sua truyen thong', 45000, 'TS','L'),

('TS2', 'Tra sua Olong', 45000, 'TS','L'),


-- Nhóm Matcha (MaDanhMuc: 'MC')

('MC1', 'Matcha dau', 30000, 'MC','S'),

('MC2', 'Matcha Latte', 30000, 'MC','S'),

('MC1', 'Matcha dau', 35000, 'MC','M'),

('MC2', 'Matcha Latte', 35000, 'MC','M'),

('MC1', 'Matcha dau', 45000, 'MC','L'),

('MC2', 'Matcha Latte', 45000, 'MC','L'),





-- Nhóm Trà trái cây (MaDanhMuc: 'TTC')

('TTC1', 'Tra mang cau', 30000, 'TTC','S'),

('TTC2', 'Tra dau', 30000, 'TTC','S'),

('TTC3', 'Tra dao', 30000, 'TTC','S'),

('TTC4', 'Tra nho', 30000, 'TTC','S'),

('TTC5', 'Tra vai', 30000, 'TTC','S'),


('TTC1', 'Tra mang cau', 40000, 'TTC','M'),

('TTC2', 'Tra dau', 40000, 'TTC','M'),

('TTC3', 'Tra dao', 40000, 'TTC','M'),

('TTC4', 'Tra nho', 40000, 'TTC','M'),

('TTC5', 'Tra vai', 40000, 'TTC','M'),


('TTC1', 'Tra mang cau', 45000, 'TTC','L'),

('TTC2', 'Tra dau', 45000, 'TTC','L'),

('TTC3', 'Tra dao', 45000, 'TTC','L'),

('TTC4', 'Tra nho', 45000, 'TTC','L'),

('TTC5', 'Tra vai', 45000, 'TTC','L');



