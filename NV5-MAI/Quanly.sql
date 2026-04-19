--- 1. VẤN ĐỀ: KHÔNG ĐỌC LẠI DL (QUẢN LÝ)
USE QuanLyBanHang;
BEGIN TRAN;
    PRINT N'QL đang đổi giá Trà Đào thành 35k...';
    -- [THỜI ĐIỂM KHÓA]: Khi QL chạy lệnh UPDATE giá -> Hệ thống đặt Khóa Ghi (Lock-X).
    -- [CÁCH GIẢI QUYẾT 2PL]: QL sẽ bị ép chuyển sang trạng thái ĐỢI (Wait) cho đến khi NV chốt đơn xong.
    UPDATE Sanpham SET GiaBan = 35000 WHERE MaSanPham = 'SP01';
    
    PRINT N'QL đã đổi giá thành công!';
COMMIT TRAN;

----------------------------------------------------------------------------------
--- 2. VẤN ĐỀ: ĐỌC DL BÓNG MA (QUẢN LÝ)
USE QuanLyBanHang;
-- [CÁCH GIẢI QUYẾT 2PL]: QL phải áp dụng Khóa khoảng (Range Lock) hoặc Khóa bảng (Table Lock-S).
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE; 
BEGIN TRAN;
    PRINT N'QL chạy báo cáo đếm số đơn hàng lần 1...';
    -- [THỜI ĐIỂM KHÓA]: Khi QL chạy hàm đếm -> Đặt Khóa Đọc (Lock-S/Range Lock) lên tập hợp.
    SELECT COUNT(*) AS SoDon_Lan1 FROM Donhang;

    -- Giả lập thời gian xuất báo cáo (10 giây). Lock-S/Range Lock chặn mọi lệnh INSERT.
    WAITFOR DELAY '00:00:10'; 
    
    PRINT N'QL quét lại danh sách lần 2...';
    SELECT COUNT(*) AS SoDon_Lan2 FROM Donhang;
    PRINT N'Kết quả: Số lượng không đổi. Không có bóng ma xuất hiện!';
COMMIT TRAN;