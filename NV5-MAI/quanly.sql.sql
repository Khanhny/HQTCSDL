USE QuanLyBanHang;
GO

-- VẤN ĐỀ 1: KHÔNG ĐỌC LẠI DL  (QUẢN LÝ)
-- CÁCH GIẢI QUYẾT 2PL:
--   NV dùng REPEATABLE READ giữ Lock-S suốt transaction.
--   QL bị ép vào trạng thái ĐỢI (Wait) cho đến khi NV COMMIT và nhả Lock-S. Đảm bảo NV luôn tính đúng giá 30k.

BEGIN TRAN;

    PRINT N'[QL - Vđề 1] Muốn đổi giá SP01 thành 35.000đ → đang xin Lock-X...';

    -- [LOCK-X ĐẶT TẠI ĐÂY]
    -- QL gọi procedure cập nhật giá.
    -- Bên trong procedure có UPDATE Sanpham SET GiaBan = 35000 → Hệ thống cố đặt Lock-X lên bản ghi SP01.
    -- Nhưng NV đang giữ Lock-S (REPEATABLE READ) trên cùng bản ghi → QL bị ĐỢI cho đến khi NV COMMIT và nhả Lock-S.
    EXEC sp_CapNhatGia
        @MaSanPham = 'SP01',
        @GiaMoi    = 35000;

    PRINT N'[QL - Vđề 1] Đổi giá thành công sau khi NV nhả Lock-S!';

COMMIT TRAN;
GO
-- ------------------------------------------------------------
-- VẤN ĐỀ 2: ĐỌC DL BÓNG MA  (QUẢN LÝ)
-- CÁCH GIẢI QUYẾT 2PL:
--   QL dùng SERIALIZABLE → Range Lock được đặt lên Donhang.
--   Khi NV muốn INSERT đơn mới (xin Lock-X) → NV bị ĐỢI vì Range Lock không cho phép INSERT vào vùng đang được khóa.
--   QL quét lại lần 2 vẫn thấy đúng N đơn → Không có bóng ma.
-- SERIALIZABLE: mức cô lập cao nhất  → tự động đặt Range Lock lên tập hợp bản ghi khi SELECT/COUNT
-- → ngăn mọi INSERT mới trong suốt transaction này
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN TRAN;

    DECLARE @SoDon1 INT;
    DECLARE @SoDon2 INT;

    -- [RANGE LOCK ĐẶT TẠI ĐÂY]
    -- QL gọi hàm đếm số đơn hàng theo ngày/ca.
    -- Bên trong hàm có SELECT COUNT(*) FROM Donhang → SERIALIZABLE đặt Range Lock lên toàn bộ Donhang.
    -- Mọi lệnh INSERT mới từ NV đều bị CHẶN từ thời điểm này.
    SET @SoDon1 = dbo.fn_DoanhThuTheoNgay();

    PRINT N'[QL - Vđề 2] Báo cáo lần 1 → Số đơn: '
          + CAST(@SoDon1 AS VARCHAR(20))
          + N'  →  Range Lock đang chặn mọi INSERT mới.';

    -- Giả lập thời gian QL đang xuất báo cáo (10 giây).
    -- Range Lock vẫn đang được giữ trong suốt thời gian này.
    -- NV muốn INSERT đơn D002 → bị ĐỢI tại đây.
    WAITFOR DELAY '00:00:10';

    PRINT N'[QL - Vđề 2] Quét lại lần 2...';

    -- Gọi lại hàm đếm lần 2.
    -- Vì Range Lock đã chặn INSERT của NV trong suốt transaction → Kết quả lần 2 phải bằng lần 1 → Không có bóng ma.
    SET @SoDon2 = dbo.fn_DoanhThuTheoNgay();

    PRINT N'[QL - Vđề 2] Báo cáo lần 2 → Số đơn: '
          + CAST(@SoDon2 AS VARCHAR(20));

    PRINT N'[QL - Vđề 2] Kết quả: '
          + CAST(@SoDon1 AS VARCHAR(20))
          + N' = '
          + CAST(@SoDon2 AS VARCHAR(20))
          + N'  →  Không có bóng ma xuất hiện!';

-- COMMIT: nhả Range Lock → NV mới được phép INSERT đơn D002.
COMMIT TRAN;
GO