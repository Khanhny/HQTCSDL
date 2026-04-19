--- 3. VẤN ĐỀ 3: MẤT DỮ LIỆU CẬP NHẬT 
USE QuanLyBanHang;
-- Kích hoạt 2PL: Mức REPEATABLE READ sẽ giữ Khóa Đọc (Lock-S) cho đến cuối giao dịch.
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; 
BEGIN TRAN;
    DECLARE @SL_B INT;
    -- [LÝ THUYẾT 2PL]: "Cả NV A và B cùng mở lấy thông tin số lượng (Cùng xin Lock-S)."
    -- Lệnh SELECT này chạy thành công vì Lock-S của B hoàn toàn tương thích với Lock-S của A.
    -- Hiện tại: Cả A và B đều đang ôm Lock-S.
    SELECT @SL_B = SoLuong FROM Chitietdon WHERE MaDon = 'D001' AND MaSanPham = 'SP01'; 
    PRINT N'NV B thấy số lượng là: ' + CAST(@SL_B AS VARCHAR); 

    -- Đúng với lý thuyết: "NV A muốn lên Lock-X phải đợi NV B nhả Lock-S"
    -- -> A đòi trước, B đòi sau -> cả hai đều bị TREO -> DEADLOCK!
    WAITFOR DELAY '00:00:07';  

    PRINT N'NV B muốn thêm 5 ly...';
    -- [LÝ THUYẾT 2PL]: "NV B muốn lên Lock-X lại phải đợi NV A nhả Lock-S. Dẫn đến DEADLOCK."
    -- Giải thích: NV B đòi lên Lock-X nhưng đụng Lock-S của A -> NV B bị TREO.
    -- Lúc này NV A cũng đang bị treo vì đụng Lock-S của B.
    -- [KẾT QUẢ]: "Hệ quản trị CSDL sẽ tự động phát hiện, HỦY (Abort) một trong hai người." 
    -- (Sẽ thấy một bảng báo lỗi Error 1205 đỏ chót xuất hiện ở 1 trong 2 Tab).
    UPDATE Chitietdon SET SoLuong = @SL_B + 5 WHERE MaDon = 'D001' AND MaSanPham = 'SP01';
    PRINT N'NV B cập nhật xong! (+5 ly).';
COMMIT TRAN;
