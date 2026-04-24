use QuanLyBanHang
go

--- VẤN ĐỀ: KHÓA CHẾT 3 GIAO TÁC
---- THU NGÂN -----

-- TN chốt thanh toán. Hệ thống gán quyền HIGH, bảo vệ tuyệt đối luồng doanh thu.
SET DEADLOCK_PRIORITY HIGH; 

BEGIN TRAN;

-- TN cập nhật giờ chốt đơn. Hệ thống cấp Khóa Độc Quyền (Lock-X) trên bảng Đơn Hàng ngay lập tức.
UPDATE DonHang 
SET ThoiGian = GETDATE() 
WHERE MaDon = 'DH01';

WAITFOR DELAY '00:00:05';

-- TN trừ tồn kho -> Đòi cấp Lock-X trên bảng Sản Phẩm nhưng đụng Quản lý -> Hoàn tất vòng Deadlock.
UPDATE SanPham 
SET SoLuong = SoLuong - 1 
WHERE MaSanPham = 'SP02';

COMMIT;
GO
