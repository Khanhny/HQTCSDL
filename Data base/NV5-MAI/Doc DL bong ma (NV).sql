use QuanLyBanHang
go
-- VẤN ĐỀ 2: ĐỌC DL BÓNG MA
---- (NHÂN VIÊN) ----

BEGIN TRAN;
-- NV tạo đơn thứ 11 (Cần xin Lock-X để INSERT dòng mới).
-- Lệnh này bị ĐỢI (Wait) vì vi phạm Range Lock của QL.
INSERT INTO Donhang (ThoiGian, TongTien, MaCa) 
VALUES (GETDATE(), 100000, 1);

COMMIT;
-- Đơn hàng mới chỉ được ghi nhận vào database SAU KHI QL xem xong báo cáo.


