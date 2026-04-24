use QuanLyBanHang
go

--- VẤN ĐỀ: KHÓA CHẾT 3 GIAO TÁC
---- QUẢN LÝ -----

-- QL đổi giá. Hệ thống gán quyền ưu tiên LOW để chuẩn bị "chém" nếu xảy ra kẹt xe.
SET DEADLOCK_PRIORITY LOW; 

BEGIN TRAN;

-- QL cập nhật giá. Hệ thống cấp Khóa Độc Quyền (Lock-X) trên bảng Sản Phẩm ngay lập tức.
UPDATE SanPham 
SET GiaBan = 35000 
WHERE MaSanPham = 'SP01';

WAITFOR DELAY '00:00:03';

-- QL bấm Lưu chi tiết đơn -> Đòi cấp Lock-X trên bảng Chi Tiết Đơn nhưng bị kẹt (WAIT).
UPDATE ChiTietDon 
SET Gia = 35000 
WHERE MaSanPham = 'SP01';

COMMIT;
GO
