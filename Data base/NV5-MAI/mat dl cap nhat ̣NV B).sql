use QuanLyBanHang
go
--- VẤN ĐỀ 3: MẤT DỮ LIỆU CẬP NHẬT 
---- NHÂN VIÊN B ----
BEGIN TRAN;
DECLARE @SoLuongHienTai INT;
-- NV B cố lấy số lượng cafe nhưng NV A đang giữ khóa → bị ép ĐỢI (Wait) ngay từ đầu.
-- Chỉ đọc được dữ liệu SAU KHI NV A COMMIT. Lúc này @SoLuongHienTai = 3 (mới nhất).
SELECT @SoLuongHienTai = SoLuong 
FROM Sanpham --WITH (XLOCK) 
WHERE MaSanPham = 'CF1'; 
-- NV B tiếp tục cộng dồn đúng: 3+5=8. Không bị mất dữ liệu.
UPDATE Sanpham 
SET SoLuong = @SoLuongHienTai + 5 
WHERE MaSanPham = 'CF1';
COMMIT;
select * from SanPham where MaSanPham = 'CF1'and size = 'S'
