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
    MaCa        INT PRIMARY KEY,
    TenCa       NVARCHAR(30),
    GioBatDau   TIME,
    GioKetThuc  TIME,
    MatKhauCa   INT
);

CREATE TABLE Danhmuc (
    MaDanhMuc CHAR(4) PRIMARY KEY,
    TenDanhMuc VARCHAR(30)
);

CREATE TABLE Sanpham (
    MaSanPham  CHAR(4),
    TenSanPham NVARCHAR(30),
    GiaBan     INT,
    MaDanhMuc  CHAR(4),
    Size       CHAR(3),
    SoLuong    INT DEFAULT 1,
    PRIMARY KEY (MaSanPham, Size),
    FOREIGN KEY (MaDanhMuc) REFERENCES Danhmuc(MaDanhMuc)
);

CREATE TABLE Donhang (
    MaDon     VARCHAR(20) PRIMARY KEY,
    ThoiGian  DATETIME DEFAULT GETDATE(),
    TongTien  INT DEFAULT 0,
    MaCa      INT,
    FOREIGN KEY (MaCa) REFERENCES Calamviec(MaCa)
);

CREATE TABLE Chitietdon (
    MaDon      VARCHAR(20),
    MaSanPham  CHAR(4),
    Size       CHAR(3),
    SoLuong    INT,
    Gia        DECIMAL(18,0),
    PRIMARY KEY (MaDon, MaSanPham, Size),
    FOREIGN KEY (MaDon) REFERENCES Donhang(MaDon),
    FOREIGN KEY (MaSanPham, Size) REFERENCES Sanpham(MaSanPham, Size)
);

CREATE TABLE Doanhthu (
    DoanhThuTheoGio  DECIMAL(18,0),
    DoanhThuTheoCa   DECIMAL(18,0),
    DoanhThuTheoNgay DECIMAL(18,0)
);

-- MaLog la IDENTITY -> tu dong tang, chi la PK duy nhat
-- MaDon co the NULL (vi du khi cap nhat gia san pham khong co don hang)
CREATE TABLE Lichsugiaotac (
    MaLog          INT IDENTITY(1,1) PRIMARY KEY,
    MaDon          VARCHAR(20)   NULL,
    MaCa           INT           NOT NULL,
    HanhDong       VARCHAR(30),
    NoiDungChiTiet NVARCHAR(100),
    ThoiGian       DATETIME      DEFAULT GETDATE(),
    FOREIGN KEY (MaDon) REFERENCES Donhang(MaDon),
    FOREIGN KEY (MaCa)  REFERENCES Calamviec(MaCa)
);
GO

-- Du lieu mau
INSERT INTO Calamviec (MaCa, TenCa, GioBatDau, GioKetThuc, MatKhauCa)
VALUES (1, N'Ca sáng', '06:00:00', '12:59:59', 111111),
       (2, N'Ca chiều', '13:00:00', '18:00:00', 222222);

INSERT INTO Danhmuc VALUES ('Cf','CaPhe'), ('TS','TraSua'), ('MC','Matcha'), ('TTC','TraTraiCay');

INSERT INTO Sanpham (MaSanPham, TenSanPham, GiaBan, MaDanhMuc, Size) VALUES
('CF1', 'Ca phe den',  20000, 'Cf', 'S'), ('CF2', 'Ca phe sua', 20000, 'Cf', 'S'), ('CF3', 'Americano', 20000, 'Cf', 'S'),
('CF1', 'Ca phe den',  25000, 'Cf', 'M'), ('CF2', 'Ca phe sua', 25000, 'Cf', 'M'), ('CF3', 'Americano', 25000, 'Cf', 'M'),
('CF1', 'Ca phe den',  30000, 'Cf', 'L'), ('CF2', 'Ca phe sua', 30000, 'Cf', 'L'), ('CF3', 'Americano', 30000, 'Cf', 'L'),
('TS1', 'Tra sua truyen thong', 25000, 'TS', 'S'), ('TS2', 'Tra sua Olong', 25000, 'TS', 'S'),
('TS1', 'Tra sua truyen thong', 35000, 'TS', 'M'), ('TS2', 'Tra sua Olong', 35000, 'TS', 'M'),
('TS1', 'Tra sua truyen thong', 45000, 'TS', 'L'), ('TS2', 'Tra sua Olong', 45000, 'TS', 'L'),
('MC1', 'Matcha dau',  30000, 'MC', 'S'), ('MC2', 'Matcha Latte', 30000, 'MC', 'S'),
('MC1', 'Matcha dau',  35000, 'MC', 'M'), ('MC2', 'Matcha Latte', 35000, 'MC', 'M'),
('MC1', 'Matcha dau',  45000, 'MC', 'L'), ('MC2', 'Matcha Latte', 45000, 'MC', 'L'),
('TTC1','Tra mang cau',30000, 'TTC','S'), ('TTC2','Tra dau', 30000,'TTC','S'), ('TTC3','Tra dao', 30000,'TTC','S'),
('TTC4','Tra nho',     30000, 'TTC','S'), ('TTC5','Tra vai', 30000,'TTC','S'),
('TTC1','Tra mang cau',40000, 'TTC','M'), ('TTC2','Tra dau', 40000,'TTC','M'), ('TTC3','Tra dao', 40000,'TTC','M'),
('TTC4','Tra nho',     40000, 'TTC','M'), ('TTC5','Tra vai', 40000,'TTC','M'),
('TTC1','Tra mang cau',45000, 'TTC','L'), ('TTC2','Tra dau', 45000,'TTC','L'), ('TTC3','Tra dao', 45000,'TTC','L'),
('TTC4','Tra nho',     45000, 'TTC','L'), ('TTC5','Tra vai', 45000,'TTC','L');
GO