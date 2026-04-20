use QuanLyBanHang
go

-- VẤN ĐỀ 1: KHÔNG ĐỌC LẠI DL 
---- (NHÂN VIÊN) -----

BEGIN TRAN;
-- NV check giá món "Trà Đào". 
-- Dùng REPEATABLEREAD để ép hệ thống giữ Lock-S trên dòng này đến khi dứt điểm thanh toán.
SELECT GiaBan 
FROM Sanpham WITH (REPEATABLEREAD) 
WHERE TenSanPham = N'Trà Đào'; 
-- Kết quả hiển thị: 30.000
-- Giả lập độ trễ: NV tốn 10 giây để xác nhận với khách và bấm tính tiền
WAITFOR DELAY '00:00:10'; 
-- (Hệ thống thực hiện tính tiền dựa trên giá 30k)
COMMIT;
-- Lúc này NV mới nhả Lock-S

---- (QUẢN LÝ) ----

BEGIN TRAN;
-- QL cập nhật giá Trà Đào lên 35k. 
-- Lệnh này cần Khóa Ghi (Lock-X), nhưng do NV đang giữ Lock-S nên QL sẽ bị ép ĐỢI (Wait).
UPDATE Sanpham 
SET GiaBan = 35000 
WHERE TenSanPham = N'Trà Đào';
COMMIT;
-- Giao dịch của QL chỉ thành công SAU KHI nhân viên chốt đơn xong, đảm bảo bill của nhân viên không bị nhảy giá đột ngột. 
--=================================================================================
-- VẤN ĐỀ 2: ĐỌC DL BÓNG MA
---- (QUẢN LÝ) ----

BEGIN TRAN;

-- QL chạy báo cáo quét toàn bộ đơn hàng trong ngày.
-- Dùng SERIALIZABLE để khóa toàn bộ khoảng dữ liệu (Range Lock).
SELECT COUNT(MaDon) AS TongSoDon, SUM(TongTien) AS TongDoanhThu
FROM Donhang WITH (SERIALIZABLE)
WHERE CAST(ThoiGian AS DATE) = CAST(GETDATE() AS DATE);
-- Kết quả: 10 đơn - 1.000.000đ
-- Giả lập độ trễ: QL đang phân tích báo cáo
WAITFOR DELAY '00:00:10'; 
-- Đọc lại lần 2 để xuất báo cáo → vẫn đúng 10 đơn - 1.000.000đ, không có bóng ma nhờ Range Lock.
SELECT COUNT(MaDon) AS TongSoDon, SUM(TongTien) AS TongDoanhThu
FROM Donhang WITH (SERIALIZABLE)
WHERE CAST(ThoiGian AS DATE) = CAST(GETDATE() AS DATE);

COMMIT;

---- (NHÂN VIÊN) ----

BEGIN TRAN;
-- NV tạo đơn thứ 11 (Cần xin Lock-X để INSERT dòng mới).
-- Lệnh này bị ĐỢI (Wait) vì vi phạm Range Lock của QL.
INSERT INTO Donhang (ThoiGian, TongTien, MaCa) 
VALUES (GETDATE(), 50000, 'CA01');

COMMIT;
-- Đơn hàng mới chỉ được ghi nhận vào database SAU KHI QL xem xong báo cáo.
--- VẤN ĐỀ 3: MẤT DỮ LIỆU CẬP NHẬT 
---- NHÂN VIÊN A -----
BEGIN TRAN;
DECLARE @SoLuongHienTai INT;
-- NV A lấy số lượng cafe. Hệ thống cấp U-Lock cho NV A ngay lập tức.
SELECT @SoLuongHienTai = SoLuong 
FROM Sanpham WITH (UPDLOCK) 
WHERE MaSanPham = 'CF01'; 
WAITFOR DELAY '00:00:10'; 
-- NV A bấm Lưu → U-Lock nâng cấp thành Lock-X để ghi.
UPDATE Sanpham 
SET SoLuong = @SoLuongHienTai + 2 
WHERE MaSanPham = 'CF01';
COMMIT;
GO
---- NHÂN VIÊN B ----
BEGIN TRAN;
DECLARE @SoLuongHienTai INT;
-- NV B cố lấy số lượng cafe. Xin U-Lock nhưng không tương thích với U-Lock của NV A → bị ép ĐỢI (Wait) ngay từ đầu.
-- Chỉ đọc được dữ liệu SAU KHI NV A COMMIT. Lúc này @SoLuongHienTai = 3 (mới nhất).
SELECT @SoLuongHienTai = SoLuong 
FROM Sanpham WITH (UPDLOCK) 
WHERE MaSanPham = 'CF01'; 
-- NV B tiếp tục cộng dồn đúng: 3+5=8. Không bị mất dữ liệu.
UPDATE Sanpham 
SET SoLuong = @SoLuongHienTai + 5 
WHERE MaSanPham = 'CF01';
COMMIT;