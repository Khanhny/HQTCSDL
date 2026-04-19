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
-- VẤN ĐỀ 3: MẤT DL CẬP NHẬT  (NHÂN VIÊN A)
-- CÁCH GIẢI QUYẾT 2PL:
--   Dùng REPEATABLE READ để Lock-S được giữ sau SELECT (nếu dùng READ COMMITTED mặc định thì Lock-S nhả ngay sau SELECT, không tái hiện được deadlock này).
--   Kết quả: DBMS phát hiện deadlock và rollback 1 bên.

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN TRAN;

    DECLARE @SL_A INT;

    -- [LOCK-S ĐẶT TẠI ĐÂY — GIỮ ĐẾN KHI COMMIT]
    -- NV A mở đơn, gọi procedure đọc số lượng hiện tại.
    -- Bên trong procedure có SELECT SoLuong từ Chitietdon → Hệ thống đặt Lock-S lên bản ghi (D001, SP01).
    -- REPEATABLE READ giữ Lock-S này cho đến khi COMMIT.
    SELECT @SL_A = SoLuong
    FROM   Chitietdon
    WHERE  MaDon = 'D001' AND MaSanPham = 'SP01';

    PRINT N'[NV A - Vđề 3] Mở đơn, thấy số lượng: '
          + CAST(@SL_A AS VARCHAR(20))
          + N' ly  →  Đang giữ Lock-S trên Chitietdon.';

    -- Giả lập độ trễ (5 giây) để NV B kịp chạy SELECT và lấy Lock-S của mình trước khi NV A đòi nâng Lock-X.
    WAITFOR DELAY '00:00:05';

    PRINT N'[NV A - Vđề 3] Bấm Lưu (+2 ly) → muốn nâng Lock-S lên Lock-X...';

    -- [NÂNG LOCK-S → LOCK-X TẠI ĐÂY]
    -- NV A gọi procedure UPDATE số lượng.
    -- Bên trong procedure có UPDATE Chitietdon → muốn nâng Lock-S lên Lock-X.
    -- Nhưng NV B đang giữ Lock-S trên cùng bản ghi → NV A bị ĐỢI.
    -- NV B cũng đang đợi NV A nhả Lock-S để lên Lock-X → Circular wait → DEADLOCK.
    -- DBMS sẽ tự động HỦY (Abort) một trong hai.
    EXEC sp_ThemSanPhamVaoDon
        @MaDon       = 'D001',
        @MaSanPham   = 'SP01',
        @SoLuongThem = 2;       -- NV A muốn thêm 2 ly

COMMIT TRAN;
GO