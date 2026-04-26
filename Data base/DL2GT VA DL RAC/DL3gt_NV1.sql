USE QuanLyBanHang;
GO
BEGIN TRANSACTION;
    -- Ép NV1 đợi R1 trước để đảm bảo thứ tự trật tự
    SELECT MaDon FROM Donhang WITH (XLOCK) WHERE MaDon = 'DH01';

    -- Sửa chi tiết (R2)
    UPDATE Chitietdon SET SoLuong = 5 WHERE MaDon = 'DH01';
    
    -- Ghi log (R3)
    INSERT INTO Lichsugiaotac (MaDon, MaCa, HanhDong, NoiDungChiTiet, ThoiGian)
    VALUES ('DH01', 1, 'ADD', N'NV1 Them mon', GETDATE());

    PRINT 'NV1 hoan tat!';
COMMIT;
