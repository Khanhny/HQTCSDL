-- ĐẠI DIỆN CHO NHÂN VIÊN A (VÀ NHÂN VIÊN CHUNG)
--- VẤN ĐỀ 1: KHÔNG ĐỌC LẠI DỮ LIỆU
USE QuanLyBanHang;
-- [LÝ THUYẾT 2PL]: "Áp dụng khóa / Giao thức 2PL: NV giữ Lock-S cho đến khi thanh toán xong."
-- Giải thích: Lệnh REPEATABLE READ này chính là cách SQL Server kích hoạt 2PL để giữ chặt Khóa Đọc (Lock-S).
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; 
BEGIN TRAN;
    DECLARE @GiaHienTai INT;
    -- Hệ thống cấp Lock-S lên dòng Trà Đào (SP01) ngay tại dòng SELECT này.
    SELECT @GiaHienTai = GiaBan FROM Sanpham WHERE MaSanPham = 'SP01';
    PRINT N'1. Nhân viên check giá Trà Đào là: ' + CAST(@GiaHienTai AS VARCHAR);

    -- Giả lập thời gian khách loay hoay quét mã QR. 
    -- Trong suốt 5 giây này, Lock-S vẫn đang được giữ chặt (QL bị WAIT nếu chạy song song).
    WAITFOR DELAY '00:00:05'; 
    
    -- SELECT lần 2 ngay trong transaction để chứng minh giá KHÔNG bị đọc lại thành 35k.
    -- Nhờ REPEATABLE READ, dù QL đã COMMIT giá mới ở ngoài, NV vẫn nhìn thấy đúng giá 30k ban đầu.
    DECLARE @GiaKiemTra INT;
    SELECT @GiaKiemTra = GiaBan FROM Sanpham WHERE MaSanPham = 'SP01';
    PRINT N'2. Hệ thống đọc lại giá lần 2 (kiểm chứng): ' + CAST(@GiaKiemTra AS VARCHAR);

    -- [LÝ THUYẾT 2PL]: "Đảm bảo NV tính đúng giá 30k."
    PRINT N'3. Nhân viên bấm tính tiền với giá bảo toàn là: ' + CAST(@GiaHienTai AS VARCHAR);
-- [LÝ THUYẾT 2PL]: "...cho đến khi NV chốt đơn xong."
COMMIT TRAN; -- Lệnh COMMIT này chốt đơn xong, hệ thống tự động nhả Lock-S ra.
----------------------------------------------------------------------------------
--- VẤN ĐỀ 2: ĐỌC DỮ LIỆU BÓNG MA (NHÂN VIÊN)
USE QuanLyBanHang;
BEGIN TRAN;
    PRINT N'Nhân viên chuẩn bị chốt thêm 1 đơn mới...';

-- Đợi 2 giây để chắc chắn Quản lý đã chạy trước và giăng Range Lock lên bảng Donhang trước khi NV lao vào INSERT.
    WAITFOR DELAY '00:00:02';

    -- [LÝ THUYẾT 2PL]: "Khi NV muốn xin Lock-X để INSERT dòng mới, NV sẽ bị ĐỢI (Wait)"
    -- Giải thích: Lệnh INSERT này đòi xin Khóa Ghi (Lock-X). 
    -- Tuy nhiên, hệ thống nhận thấy bảng Donhang đang bị Quản lý giăng Khóa khoảng (Range Lock)
    -- Do đó, lệnh INSERT này sẽ bị "treo" cứng ngắc (chuyển sang trạng thái WAIT).
    INSERT INTO Donhang (MaDon, ThoiGian, TongTien, MaCa) 
    VALUES ('D002', GETDATE(), 50000, 1);
    -- [LÝ THUYẾT 2PL]: "...cho đến khi QL xuất báo cáo xong."
    -- Dòng PRINT này chỉ có thể chạy ĐƯỢC sau khi Quản lý bên Tab 1 chạy xong lệnh COMMIT.
    PRINT N'Nhân viên chốt đơn thành công (Chỉ chạy được sau khi QL báo cáo xong)!';
COMMIT TRAN;
----------------------------------------------------------------------------------
--- VẤN ĐỀ 3: MẤT DỮ LIỆU CẬP NHẬT 
USE QuanLyBanHang;
-- Kích hoạt 2PL: Mức REPEATABLE READ sẽ giữ Khóa Đọc (Lock-S) cho đến cuối giao dịch.
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; 
BEGIN TRAN;
    DECLARE @SL_A INT;
    -- [LÝ THUYẾT 2PL]: "Cả NV A và B cùng mở lấy thông tin số lượng (Cùng xin Lock-S)."
    -- Lệnh SELECT này thực thi, hệ thống lập tức cấp Khóa Đọc (Lock-S) cho NV A.
    SELECT @SL_A = SoLuong FROM Chitietdon WHERE MaDon = 'D001' AND MaSanPham = 'SP01';
    PRINT N'NV A thấy số lượng là: ' + CAST(@SL_A AS VARCHAR);

    -- Giả lập độ trễ 5 giây để NV A thong thả mở form, tạo cơ hội cho NV B cùng vào lấy Lock-S.
    -- [LÝ THUYẾT 2PL]: "NV A muốn lên Lock-X phải đợi NV B nhả Lock-S."
    -- NV A tỉnh dậy sau 5 giây và đòi Lock-X TRƯỚC (vì NV B đang đợi 7 giây).
    WAITFOR DELAY '00:00:05'; 

    PRINT N'NV A muốn thêm 2 ly...';
    -- [LÝ THUYẾT 2PL]: "Khi bấm Lưu, cả hai cùng chạy lệnh UPDATE (Cùng muốn nâng cấp lên Lock-X)."
    -- Giải thích: NV A chạy UPDATE nên đòi Lock-X, nhưng NV B cũng đang giữ Lock-S.
    -- NV A bắt buộc phải ĐỢI. Cùng lúc đó (2 giây sau) NV B tỉnh dậy cũng đòi Lock-X 
    -- và đụng Lock-S của A -> NV B cũng TREO -> Gây ra DEADLOCK!
    UPDATE Chitietdon SET SoLuong = @SL_A + 2 WHERE MaDon = 'D001' AND MaSanPham = 'SP01';
    PRINT N'NV A cập nhật xong! (+2 ly)';
COMMIT TRAN;