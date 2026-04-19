--- 1. VẤN ĐỀ 1: KHÔNG ĐỌC LẠI DỮ LIỆU
USE QuanLyBanHang;
BEGIN TRAN;
    PRINT N'Quản lý đang xin Khóa Ghi (Lock-X) để đổi giá...';
    -- [LÝ THUYẾT 2PL]: "Khi QL muốn xin Lock-X để đổi giá, QL sẽ bị ép chuyển sang trạng thái ĐỢI (Wait)"
    -- Giải thích: Lệnh UPDATE này sinh ra yêu cầu cấp Lock-X. Nhưng hệ thống phát hiện 
    -- Tab Nhân viên đang giữ Lock-S trên dòng SP01 này, nên hệ thống ép dòng UPDATE này bị treo (ĐỢI) cho đến khi Nhân viên gọi lệnh COMMIT xong.
    UPDATE Sanpham SET GiaBan = 35000 WHERE MaSanPham = 'SP01';
    
    PRINT N'Quản lý đổi giá THÀNH CÔNG (Sau khi Nhân viên đã nhả khóa)!';
COMMIT TRAN;
-----------------------------------------------------------------------
--- 2. VẤN ĐỀ 2: ĐỌC DỮ LIỆU BÓNG MA
-- [LÝ THUYẾT 2PL]: "QL phải áp dụng Khóa khoảng (Range Lock) hoặc Khóa bảng (Table Lock-S) trên bảng Donhang."
-- Giải thích: Trong T-SQL, mức cô lập SERIALIZABLE là mức cao nhất. Khi được gọi, nó sẽ tự động kích hoạt cơ chế Range Lock (Khóa khoảng) lên các dòng mà nó quét qua để ngăn hiện tượng Bóng ma.
USE QuanLyBanHang;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE; 
BEGIN TRAN;
    PRINT N'1. Quản lý đếm số lượng đơn hàng...';
    -- Lệnh SELECT này thực thi, Range Lock lập tức được giăng lên bảng Donhang.
    -- Nó khóa luôn cả những "khoảng trống" có khả năng được chèn dữ liệu mới vào.
    SELECT COUNT(*) AS SoDon_Lan1 FROM Donhang;
    -- [LÝ THUYẾT 2PL]: "...cho đến khi QL xuất báo cáo xong."
    -- Giả lập 10 giây để QL xử lý báo cáo, duy trì Range Lock đủ lâu để ép NV phải đợi.
    WAITFOR DELAY '00:00:10'; 
    
    PRINT N'2. Quản lý kiểm tra lại số lượng đơn...';
    SELECT COUNT(*) AS SoDon_Lan2 FROM Donhang;
    PRINT N'Kết quả: Số lượng không đổi (Bóng ma đã bị Range Lock chặn lại)!';
COMMIT TRAN; -- Chốt giao dịch, nhả Range Lock ra.