USE QuanLyBanHang;
GO

-- 0. Tắt tạm cái Trigger cản đường
DISABLE TRIGGER trg_TuDongTaoMaDon ON Donhang;
GO

-- 1. DỌN DẸP DỮ LIỆU CŨ (Xóa bảng con trước, bảng cha sau)
DELETE FROM Chitietdon;
DELETE FROM Donhang;
DELETE FROM Sanpham;
DELETE FROM Danhmuc;
DELETE FROM Calamviec;
GO

-- 2. Thêm Ca làm việc
INSERT INTO Calamviec (MaCa, TenCa, GioBatDau, GioKetThuc, MatKhauCa) 
VALUES (1, 1, GETDATE(), GETDATE(), 1234);

-- 3. Thêm Danh mục
INSERT INTO Danhmuc (MaDanhMuc, TenDanhMuc) 
VALUES ('DM01', N'Đồ uống');

-- 4. Thêm Sản phẩm
INSERT INTO Sanpham (MaSanPham, TenSanPham, GiaBan, MaDanhMuc) 
VALUES ('SP01', N'Trà Đào', 30000, 'DM01');

INSERT INTO Sanpham (MaSanPham, TenSanPham, GiaBan, MaDanhMuc) 
VALUES ('SP02', N'Cafe Đen', 20000, 'DM01');

-- 5. Thêm Đơn hàng D001
INSERT INTO Donhang (MaDon, ThoiGian, TongTien, MaCa) 
VALUES ('D001', GETDATE(), 30000, 1);

-- 6. Thêm Chi tiết đơn
INSERT INTO Chitietdon (MaDon, MaSanPham, Size, SoLuong, Gia) 
VALUES ('D001', 'SP01', 'M', 1, 30000);
GO