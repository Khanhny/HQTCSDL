--- 1. VẤN ĐỀ: KHÔNG ĐỌC LẠI DL
--- Tình huống: NV check giá món "Trà Đào" (30k). QL đổi thành 35k. NV tính tiền bị lệch.
--- Bảng tác động: Sanpham

USE QuanLyBanHang;
-- [CÁCH GIẢI QUYẾT 2PL]: NV giữ Lock-S cho đến khi thanh toán xong.
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; 
BEGIN TRAN;
    DECLARE @GiaHienTai INT;
    -- [THỜI ĐIỂM KHÓA]: Khi NV lấy giá hiển thị lên màn hình -> Hệ thống đặt Khóa Đọc (Lock-S).
    SELECT @GiaHienTai = GiaBan FROM Sanpham WHERE MaSanPham = 'SP01';
    PRINT N'NV thấy Trà Đào giá 30k (Đang giữ Lock-S): ' + CAST(@GiaHienTai AS VARCHAR);

    -- Giả lập NV loay hoay tính tiền (5 giây). Lock-S vẫn được giữ, ép QL phải ĐỢI.
    WAITFOR DELAY '00:00:05'; 
    
    -- [CÁCH GIẢI QUYẾT 2PL]: Đảm bảo NV tính đúng giá 30k ban đầu.
    PRINT N'NV thanh toán hóa đơn với giá bảo toàn: ' + CAST(@GiaHienTai AS VARCHAR);
COMMIT TRAN;

----------------------------------------------------------------------------------
--- 2. VẤN ĐỀ: ĐỌC DL BÓNG MA
--- Tình huống: QL đếm 10 đơn. NV INSERT thêm 1 đơn. QL quét lại thấy 11 đơn.
--- Bảng tác động: Donhang

USE QuanLyBanHang;
BEGIN TRAN;
    PRINT N'NV chuẩn bị chốt thêm đơn mới (Xin Lock-X)...';
    -- Đợi 2 giây để QL kịp chạy báo cáo lần 1 và giăng Range Lock.
    WAITFOR DELAY '00:00:02';

    -- [THỜI ĐIỂM KHÓA]: Khi NV chạy thủ tục thêm đơn -> Đặt Khóa Ghi (Lock-X).
    -- [CÁCH GIẢI QUYẾT 2PL]: NV sẽ bị ĐỢI (Wait) cho đến khi QL xuất báo cáo xong.
    INSERT INTO Donhang (MaDon, ThoiGian, TongTien, MaCa) 
    VALUES ('D002', GETDATE(), 50000, 1);

    PRINT N'NV đã chốt đơn thành công sau khi QL nhả khóa!';
COMMIT TRAN;

----------------------------------------------------------------------------------
--- 3. VẤN ĐỀ: MẤT DL CẬP NHẬT (NHÂN VIÊN A)
--- Tình huống: A thêm 2 ly, B thêm 5 ly. Ghi đè mất dữ liệu của nhau.
--- Bảng tác động: Chitietdon

USE QuanLyBanHang;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; 
BEGIN TRAN;
    DECLARE @SL_A INT;
    -- [THỜI ĐIỂM KHÓA]: Cả NV A và B cùng mở lấy thông tin số lượng (Cùng xin Lock-S).
    SELECT @SL_A = SoLuong FROM Chitietdon WHERE MaDon = 'D001' AND MaSanPham = 'SP01';
    PRINT N'NV A thấy số lượng là: ' + CAST(@SL_A AS VARCHAR);

    -- Giả lập độ trễ để NV B cũng kịp vào lấy Lock-S.
    WAITFOR DELAY '00:00:05'; 

    PRINT N'NV A bấm Lưu (+2 ly)...';
    -- [THỜI ĐIỂM KHÓA]: Khi bấm Lưu -> muốn nâng cấp lên Lock-X.
    -- [CÁCH GIẢI QUYẾT 2PL]: NV A muốn lên Lock-X phải đợi NV B nhả Lock-S.
    -- Vì cả hai cùng đợi nhau -> Dẫn đến DEADLOCK.
    UPDATE Chitietdon SET SoLuong = @SL_A + 2 WHERE MaDon = 'D001' AND MaSanPham = 'SP01';
COMMIT TRAN;