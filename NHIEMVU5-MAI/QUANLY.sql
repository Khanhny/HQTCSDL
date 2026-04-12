--- KHONG DOC LAI DU LIEU
USE QuanLyBanHang;
BEGIN TRAN;
    PRINT N'Quản lý đang cố gắng đổi giá Trà Đào... (Sẽ bị treo chờ Tab 1)';
    
    -- Xin Khóa Ghi (Lock-X) nhưng bị Tab 1 chặn
    UPDATE Sanpham SET GiaBan = 35000 WHERE MaSanPham = 'SP01';
    
    PRINT N'Quản lý đổi giá THÀNH CÔNG (Sau khi Nhân viên đã tính tiền xong)!';
COMMIT TRAN;

-- BONG MA
USE QuanLyBanHang;
-- Mức này cho phép thấy Bóng ma
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; 

BEGIN TRAN;
    PRINT N'--- LẦN 1: Quản lý đếm số món hiện có ---';
    SELECT COUNT(*) AS SoLuong_Lan1 FROM Sanpham;
    
    PRINT N'Quản lý đang đợi 15 giây để xuất báo cáo... (Hãy sang Tab NV chạy ngay!)';
    WAITFOR DELAY '00:00:15'; 
    
    PRINT N'--- LẦN 2: Quản lý đếm lại lần nữa ---';
    SELECT COUNT(*) AS SoLuong_Lan2 FROM Sanpham;
    PRINT N'Kết quả: Xuất hiện Bóng ma!';
COMMIT TRAN;

