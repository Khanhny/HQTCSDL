--- VẤN ĐỀ 3: MẤT DỮ LIỆU CẬP NHẬT (NHÂN VIÊN B)
USE QuanLyBanHang;
BEGIN TRAN;
    PRINT N'[NV B] Mở đơn, gọi procedure thêm 5 ly...';

    -- NV B gọi SP, hệ thống cố gắng xin UPDLOCK.
    -- NHƯNG NV A đang giữ UPDLOCK -> NV B bị ép ĐỢI (Wait) ngay lập tức.
    -- (Không xảy ra vòng lặp Deadlock, chỉ là chờ đợi hợp lệ).
    EXEC sp_ThemSanPhamVaoDon
        @MaDon       = 'D001',
        @MaSanPham   = 'SP01',
        @SoLuongThem = 5,
        @Delay       = '00:00:00'; 

    PRINT N'[NV B] Giao dịch hoàn tất! Mọi dữ liệu đã được cộng dồn chính xác.';
COMMIT TRAN;
GO

-- KẾT QUẢ KIỂM CHỨNG CUỐI CÙNG
SELECT * FROM Chitietdon WHERE MaDon = 'D001' AND MaSanPham = 'SP01';
-- Sẽ in ra SoLuong = 8