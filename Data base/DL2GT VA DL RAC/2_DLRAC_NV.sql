-- T2: Nhân viên select giá
use QuanLyBanHang
go

BEGIN TRANSACTION
    SELECT GiaBan 
    FROM SanPham
    WHERE TenSanPham = N'Ca phe den' and size='M'
    -- Bị chặn, chờ T1 Commit/Rollback xong mới chạy được
COMMIT