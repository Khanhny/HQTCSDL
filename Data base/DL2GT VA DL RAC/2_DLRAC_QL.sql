-- T1: Quản lý cập nhật giá
use QuanLyBanHang
go

BEGIN TRANSACTION
select * from SanPham 
where TenSanPham = N'Ca phe den' and size ='M'
    UPDATE SanPham WITH (XLOCK)
    SET GiaBan = 50000
    WHERE TenSanPham = N'Ca phe den'
    
    -- Chưa commit, T2 sẽ bị chặn ở đây
ROLLBACK -- 