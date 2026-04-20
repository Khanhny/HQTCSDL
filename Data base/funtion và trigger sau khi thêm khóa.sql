--Funtion sau khi thêm khóa:

CREATE OR ALTER FUNCTION fn_DemSoLuongSanPham(@MaDon NVARCHAR(20)) 

RETURNS INT 

AS 

BEGIN 

DECLARE @TongSoLuong INT; 

SELECT @TongSoLuong = SUM(CTD.SoLuong)

 FROM ChiTietDon CTD WITH (SERIALIZABLE) -- Khóa đọc S, ngăn insert mới vào range 

WHERE CTD.MaDon = @MaDon; 

RETURN @TongSoLuong; 

END 

GO 



CREATE OR ALTER FUNCTION fn_TinhTongTienDonHang(@MaDon CHAR(4)) 

RETURNS INT 

AS 

BEGIN

DECLARE @TongTien INT; 

SELECT @TongTien = SUM(CTD.Gia * CTD.SoLuong) 

FROM ChiTietDon CTD WITH (SERIALIZABLE) -- Khóa đọc S, ngăn thay đổi chi tiết đơn 

WHERE CTD.MaDon = @MaDon; 

RETURN @TongTien; 

END 

GO 



CREATE OR ALTER FUNCTION fn_DoanhThuTheoNgay(@Ngay DATE) 

RETURNS INT 

AS 

BEGIN 

DECLARE @DoanhThuTheoNgay INT; 

SELECT @DoanhThuTheoNgay = ISNULL(SUM(DH.TongTien), 0) 

FROM Donhang DH WITH (SERIALIZABLE) -- Khóa đọc S: đơn mới không được thêm vào doanh thu đang chốt 

WHERE CAST(DH.ThoiGian AS DATE) = @Ngay; 

RETURN @DoanhThuTheoNgay; 

END 

GO 



CREATE OR ALTER FUNCTION fn_DoanhThuTheoCa(@MaCa INT) 

RETURNS INT 

AS 

BEGIN 

DECLARE @DoanhThuTheoCa INT; 

SELECT @DoanhThuTheoCa = ISNULL(SUM(DH.TongTien), 0) 

FROM Donhang DH WITH (SERIALIZABLE) -- Khóa đọc S: cố định tập dữ liệu theo ca 

WHERE DH.MaCa = @MaCa; 

RETURN @DoanhThuTheoCa; 

END 

GO 



CREATE OR ALTER FUNCTION fn_DoanhThuTheoGio(@Gio INT) 

RETURNS INT 

AS 

BEGIN 

DECLARE @DoanhThuTheoGio INT; 

SELECT @DoanhThuTheoGio = ISNULL(SUM(DH.TongTien), 0) 

FROM Donhang DH WITH (SERIALIZABLE) -- Khóa đọc S: cố định tập dữ liệu theo giờ 

WHERE DATEPART(HOUR, DH.ThoiGian) = @Gio; 

RETURN @DoanhThuTheoGio; 

END 

GO



--Trigger sau khi thêm khóa:

CREATE OR ALTER TRIGGER trg_TuDongTaoMaDon 

ON Donhang 

INSTEAD OF INSERT 

AS 

BEGIN 

DECLARE @NewID VARCHAR(20); 

SELECT @NewID = 'DH' + CONVERT(VARCHAR, GETDATE(), 112) + RIGHT('000' + CAST(ISNULL((SELECT COUNT(*) FROM Donhang), 0) + 1 AS VARCHAR), 3); 

INSERT INTO Donhang (MaDon, ThoiGian, TongTien, MaCa) SELECT @NewID, GETDATE(), ISNULL(TongTien, 0), MaCa 

FROM inserted; 

END; 

GO 

-- ============================================= 

-- TRIGGER trg_CapNhatTongTien 

-- Cần KHÓA GHI X (UPDLOCK + ROWLOCK) trên Donhang 

-- Lý do : 

-- - Người A thêm món → trigger cập nhật TongTien 

-- - Người B thanh toán → đọc TongTien 

-- → Phải khóa X để B không đọc TongTien cũ/sai

 -- ============================================= 

CREATE OR ALTER TRIGGER trg_CapNhatTongTien 

ON ChiTietDon 

AFTER INSERT, UPDATE, DELETE 

AS 

BEGIN 

-- UPDLOCK: lấy khóa ghi X ngay khi đọc -> ngăn transaction khác đọc TongTien cũ 

-- ROWLOCK: khóa cấp dòng, không khóa cả bảng -> ít block hơn 

UPDATE DH 

SET DH.TongTien = ( 

SELECT ISNULL(SUM(CTD.SoLuong * CTD.Gia), 0) 

FROM ChiTietDon CTD 

WHERE CTD.MaDon = DH.MaDon

) 

FROM Donhang DH WITH (UPDLOCK, ROWLOCK) 

-- Khóa X: ngăn B đọc TongTien trong lúc A đang cập nhật 

WHERE DH.MaDon IN ( 

SELECT MaDon 

FROM inserted UNION 

SELECT MaDon 

FROM deleted ); 

END; 

GO