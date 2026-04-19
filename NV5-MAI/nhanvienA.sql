USE QuanLyBanHang;
GO

-- VẤN ĐỀ 1: KHÔNG ĐỌC LẠI DL  (NHÂN VIÊN)
-- CÁCH GIẢI QUYẾT 2PL:
--   Dùng REPEATABLE READ → NV giữ Lock-S suốt transaction.
--   Khi QL muốn UPDATE giá (xin Lock-X) → QL bị ĐỢI vì Lock-X không tương thích với Lock-S đang được NV giữ.
--   NV luôn tính đúng giá 30k ban đầu cho đến khi COMMIT.

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN TRAN;

    DECLARE @GiaHienTai INT;

    -- [LOCK-S ĐẶT TẠI ĐÂY]
    -- NV gọi procedure để lấy giá hiển thị lên màn hình.
    -- Bên trong procedure có SELECT GiaBan từ Sanpha → Hệ thống đặt Lock-S lên bản ghi SP01.
    -- REPEATABLE READ đảm bảo Lock-S được GIỮ đến khi COMMIT.
EXEC sp_ThemSanPhamVaoDon
        @MaDon       = 'D001',
        @MaSanPham   = 'SP01',
        @SoLuongThem = 1;       
        
    -- Đọc lại giá vào biến để in ra màn hình demo
    SELECT @GiaHienTai = GiaBan
    FROM   Sanpham
    WHERE  MaSanPham = 'SP01';

    PRINT N'[NV - Vđề 1] Trà Đào hiện giá: '
          + CAST(@GiaHienTai AS VARCHAR(20))
          + N'đ  →  Đang giữ Lock-S trên Sanpham.';

    -- Giả lập NV đang loay hoay tính tiền (5 giây).
    -- Trong thời gian này Lock-S vẫn được giữ.
    -- QL muốn UPDATE giá → xin Lock-X → bị ĐỢI tại đây.
    WAITFOR DELAY '00:00:05';

    PRINT N'[NV - Vđề 1] Thanh toán với giá được bảo toàn: '
          + CAST(@GiaHienTai AS VARCHAR(20)) + N'đ  →  COMMIT, nhả Lock-S.';

-- COMMIT: nhả Lock-S → QL mới được phép UPDATE giá.
COMMIT TRAN;
GO
-- ------------------------------------------------------------
-- VẤN ĐỀ 2: ĐỌC DL BÓNG MA  (NHÂN VIÊN)
-- CÁCH GIẢI QUYẾT 2PL:
--   QL dùng SERIALIZABLE → hệ thống tự động đặt Range Lock (Khóa khoảng) lên toàn bộ tập hợp bản ghi trong Donhang.
--   Khi NV muốn INSERT (xin Lock-X) → NV bị ĐỢI vì Range Lock của QL chặn mọi thao tác INSERT mới vào bảng Donhang.
--   QL quét lại lần 2 vẫn thấy đúng N đơn → Không có bóng ma.

BEGIN TRAN;

    PRINT N'[NV - Vđề 2] Chuẩn bị chốt đơn D002 (sắp xin Lock-X)...';

    -- Đợi 2 giây để QL kịp chạy báo cáo lần 1 và giăng Range Lock lên bảng Donhang trước.
    WAITFOR DELAY '00:00:02';

    -- [LOCK-X ĐẶT TẠI ĐÂY]
    -- NV gọi procedure để INSERT đơn mới vào Donhang.
    -- → Hệ thống cố đặt Lock-X lên bản ghi mới.
    -- → Nhưng QL đang giữ Range Lock (SERIALIZABLE)
    --   → NV bị ĐỢI cho đến khi QL COMMIT và nhả Range Lock.
    EXEC sp_TaoDonHangMoi
        @MaDon    = 'D002',
        @TongTien = 50000,
        @MaCa     = 1;

    PRINT N'[NV - Vđề 2] Chốt đơn thành công sau khi QL nhả Range Lock!';

COMMIT TRAN;
GO
-- ------------------------------------------------------------
--- VẤN ĐỀ 3: MẤT DỮ LIỆU CẬP NHẬT (NHÂN VIÊN A)
-- CÁCH GIẢI QUYẾT 2PL: Dùng UPDLOCK trong Procedure.
USE QuanLyBanHang;
BEGIN TRAN;
    PRINT N'[NV A] Mở đơn, gọi procedure thêm 2 ly...';

    -- Bên trong SP có SELECT WITH (UPDLOCK). 
    -- NV A sẽ chiếm giữ UPDLOCK và chờ 5 giây (Giả lập thao tác).
    EXEC sp_ThemSanPhamVaoDon
        @MaDon       = 'D001',
        @MaSanPham   = 'SP01',
        @SoLuongThem = 2,
        @Delay       = '00:00:05'; -- Cố tình ngâm khóa 5 giây

    PRINT N'[NV A] Giao dịch hoàn tất, đã nhả UPDLOCK!';
COMMIT TRAN;
GO