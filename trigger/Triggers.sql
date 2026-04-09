USE QuanLyBanHang;
GO

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




CREATE OR ALTER TRIGGER trg_TuDongTaoMaDon
ON Donhang
INSTEAD OF INSERT
AS
BEGIN
   
    DECLARE @NewID VARCHAR(20);
    SELECT @NewID = 'DH' + CONVERT(VARCHAR, GETDATE(), 112) + 
                      RIGHT('000' + CAST(ISNULL((SELECT COUNT(*) FROM Donhang), 0) + 1 AS VARCHAR), 3);
    
    INSERT INTO Donhang (MaDon, ThoiGian, TongTien, MaCa)
    SELECT @NewID, GETDATE(), ISNULL(TongTien, 0), MaCa FROM inserted;
END;
GO

CREATE OR ALTER TRIGGER trg_CapNhatTongTien
ON ChitietDon
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
  
    UPDATE Donhang
    SET TongTien = (SELECT SUM(SoLuong * Gia) FROM ChitietDon WHERE ChitietDon.MaDon = Donhang.MaDon)
    WHERE MaDon IN (SELECT MaDon FROM inserted UNION SELECT MaDon FROM deleted);
END;
GO