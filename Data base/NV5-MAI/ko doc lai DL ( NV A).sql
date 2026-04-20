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