--- KHONG DOC LAI DU LIEU
USE QuanLyBanHang;
BEGIN TRAN;
    PRINT N'Quản lý đang cố gắng đổi giá Trà Đào... (Sẽ bị treo chờ Tab 1)';
    
    -- Xin Khóa Ghi (Lock-X) nhưng bị Tab 1 chặn
    UPDATE Sanpham SET GiaBan = 35000 WHERE MaSanPham = 'SP01';
    
    PRINT N'Quản lý đổi giá THÀNH CÔNG (Sau khi Nhân viên đã tính tiền xong)!';
COMMIT TRAN;

-- BONG MA
-- Lý thuyết: QL dùng SERIALIZABLE → giữ Range Lock trên tập bản ghi Donhang
-- Khi NV cố INSERT đơn mới, NV bị ĐỢI cho đến khi QL COMMIT xong
USE QuanLyBanHang;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE; -- Tương đương Range Lock / Table Lock-S

BEGIN TRAN;
    PRINT N'--- LẦN 1: Quản lý đếm số đơn hàng hiện có ---';
    -- Đúng lý thuyết: bảng tác động là Donhang (QL đang chạy báo cáo đơn hàng)
    SELECT COUNT(*) AS SoDonHang_Lan1 FROM Donhang;
    
    PRINT N'Quản lý đang đợi 15 giây để xuất báo cáo... (Hãy sang Tab NV chạy ngay!)';
    WAITFOR DELAY '00:00:15'; -- Trong lúc này NV sẽ bị chặn khi cố INSERT
    
    PRINT N'--- LẦN 2: Quản lý đếm lại lần nữa ---';
    SELECT COUNT(*) AS SoDonHang_Lan2 FROM Donhang;
    PRINT N'Kết quả: Số lượng KHÔNG đổi → SERIALIZABLE đã ngăn Bóng ma thành công!';
COMMIT TRAN;
