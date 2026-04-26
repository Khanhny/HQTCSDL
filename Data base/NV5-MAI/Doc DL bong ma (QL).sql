use QuanLyBanHang
go
-- VẤN ĐỀ 2: ĐỌC DL BÓNG MA
---- (QUẢN LÝ) ----

BEGIN TRAN;

-- QL chạy báo cáo quét toàn bộ đơn hàng trong ngày.
-- Dùng SERIALIZABLE để khóa toàn bộ khoảng dữ liệu (Range Lock).
SELECT COUNT(MaDon) AS TongSoDon, SUM(TongTien) AS TongDoanhThu
FROM Donhang WITH (SERIALIZABLE)
WHERE CAST(ThoiGian AS DATE) = CAST(GETDATE() AS DATE);
-- Kết quả: 10 đơn - 1.000.000đ
-- Đọc lại lần 2 để xuất báo cáo → vẫn đúng 10 đơn - 1.000.000đ, không có bóng ma nhờ Range Lock.
SELECT COUNT(MaDon) AS TongSoDon, SUM(TongTien) AS TongDoanhThu
FROM Donhang WITH (SERIALIZABLE)
WHERE CAST(ThoiGian AS DATE) = CAST(GETDATE() AS DATE);

COMMIT;
