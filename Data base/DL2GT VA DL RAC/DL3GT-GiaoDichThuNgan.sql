use QuanLyBanHang
go

--- VẤN ĐỀ: KHÓA CHẾT 3 GIAO TÁC
---- NHÂN VIÊN A -----

-- NV A thêm món mới. Hệ thống gán mức ưu tiên NORMAL (tiêu chuẩn).
SET DEADLOCK_PRIORITY NORMAL; 

BEGIN TRAN;

-- NV A cập nhật số lượng. Hệ thống cấp Khóa Độc Quyền (Lock-X) trên bảng Chi Tiết Đơn ngay lập tức.
UPDATE ChiTietDon 
SET SoLuong = SoLuong + 1 
WHERE MaDon = 'DH01' AND MaSanPham = 'SP02';

WAITFOR DELAY '00:00:03';

-- NV A cộng dồn tiền -> Đòi cấp Lock-X trên bảng Đơn Hàng nhưng bị kẹt (WAIT).
UPDATE DonHang 
SET TongTien = TongTien + 25000 
WHERE MaDon = 'DH01';

COMMIT;
GO
