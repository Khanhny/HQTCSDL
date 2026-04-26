use QuanLyBanHang
go
--- VẤN ĐỀ 3: MẤT DỮ LIỆU CẬP NHẬT 
---- NHÂN VIÊN A -----
BEGIN TRAN;
DECLARE @SoLuongHienTai INT;
-- NV A lấy số lượng cafe. Hệ thống cấp UXLock cho NV A ngay lập tức.
SELECT @SoLuongHienTai = SoLuong 
FROM Sanpham WITH (Xlock) 
WHERE MaSanPham = 'CF1' and size = 'S'; 
WAITFOR DELAY '00:00:10'; 
-- NV A bấm Lưu 
UPDATE Sanpham 
SET SoLuong = @SoLuongHienTai + 2 
WHERE MaSanPham = 'CF1';
COMMIT;
GO
select * from SanPham where MaSanPham = 'CF1'and size = 'S'
