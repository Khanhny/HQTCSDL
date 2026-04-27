CREATE VIEW vw_ThanhCong AS
SELECT 
    d.MaDon,
    DATEADD(HOUR, 7, d.ThoiGian) AS ThoiGian,
    d.TongTien,
    d.MaCa
FROM Donhang d
WHERE d.TongTien > 0
