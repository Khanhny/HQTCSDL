USE QuanLyBanHang;
GO
BEGIN TRANSACTION;
    -- Sẽ XOAY VÒNG VÒNG ở đây vì T2 đang giữ R1
    SELECT * FROM Donhang WITH (XLOCK) WHERE MaDon = 'DH01';
    
    PRINT 'T3 da doc xong Donhang (R1)';
COMMIT;
