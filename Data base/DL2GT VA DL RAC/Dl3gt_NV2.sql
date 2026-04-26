USE QuanLyBanHang;
GO
BEGIN TRANSACTION;
    -- Khóa bảng Donhang (R1)
    UPDATE Donhang WITH (XLOCK) 
    SET TongTien = 150000 
    WHERE MaDon = 'DH01';
    
    PRINT 'T2 dang giu R1. Cho 10 giay de ban chay cac Tab khac...';
    WAITFOR DELAY '00:00:10'; 

    -- Khóa bảng Lichsugiaotac (R3)
    INSERT INTO Lichsugiaotac (MaDon, MaCa, HanhDong, NoiDungChiTiet, ThoiGian)
    VALUES ('DH01', 1, 'PAY', N'NV2 Thanh toan', GETDATE());
    
    PRINT 'T2 hoan tat!';
COMMIT;
