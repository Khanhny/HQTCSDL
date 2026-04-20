use QuanLyBanHang
go
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