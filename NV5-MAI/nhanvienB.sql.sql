USE QuanLyBanHang;
GO
-- VẤN ĐỀ 3: MẤT DL CẬP NHẬT  (NHÂN VIÊN B)
-- CÁCH GIẢI QUYẾT 2PL:
--   Dùng REPEATABLE READ để Lock-S được giữ sau SELECT.
--   Kết quả: DBMS phát hiện deadlock và rollback 1 bên.
--   Transaction còn lại hoàn thành bình thường.

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN TRAN;

    DECLARE @SL_B INT;

    -- [LOCK-S ĐẶT TẠI ĐÂY — GIỮ ĐẾN KHI COMMIT] NV B mở đơn, gọi procedure đọc số lượng hiện tại.
    -- → Hệ thống đặt Lock-S lên bản ghi (D001, SP01) trong bảng Chitietdon.
    -- Lock-S tương thích với Lock-S của NV A nên cả hai cùng được cấp khóa đọc trên cùng 1 bản ghi.
    SELECT @SL_B = SoLuong
    FROM   Chitietdon
    WHERE  MaDon = 'D001' AND MaSanPham = 'SP01';

    PRINT N'[NV B - Vđề 3] Mở đơn, thấy số lượng: '
          + CAST(@SL_B AS VARCHAR(20))
          + N' ly  →  Đang giữ Lock-S trên Chitietdon.';

    -- Đợi 7 giây — lâu hơn NV A (5 giây) — để NV A kịp thức dậy và đòi nâng Lock-X trước.
    -- Lúc đó NV A đang đợi NV B nhả Lock-S,
    -- NV B thức dậy cũng đòi nâng Lock-X → cả hai cùng đợi nhau → DEADLOCK.
    WAITFOR DELAY '00:00:07';

    PRINT N'[NV B - Vđề 3] Bấm Lưu (+5 ly) → muốn nâng Lock-S lên Lock-X...';

    -- [NÂNG LOCK-S → LOCK-X TẠI ĐÂY] NV B gọi procedure UPDATE số lượng. → muốn nâng Lock-S lên Lock-X.
    -- Nhưng NV A đang giữ Lock-S trên cùng bản ghi → NV B bị ĐỢI.
    -- NV A cũng đang đợi NV B → Circular wait → DEADLOCK.
    -- DBMS sẽ tự động chọn 1 trong 2 làm "nạn nhân" và HỦY.
    EXEC sp_ThemSanPhamVaoDon
        @MaDon       = 'D001',
        @MaSanPham   = 'SP01',
        @SoLuongThem = 5;       -- NV B muốn thêm 5 ly

COMMIT TRAN;
GO