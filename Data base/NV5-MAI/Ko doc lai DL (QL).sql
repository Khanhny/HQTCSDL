use QuanLyBanHang
go

-- VẤN ĐỀ 1: KHÔNG ĐỌC LẠI DL 
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
