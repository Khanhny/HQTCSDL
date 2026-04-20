use QuanLyBanHang
go
-- Thủ thanh toán T3  
CREATE OR ALTER PROCEDURE sp_ThanhToanDonHang
    @MaDon CHAR(4),
    @MaCa INT
AS
BEGIN
    -- [GIẢI PHÁP 1]: Đặt quyền ưu tiên CAO 
    SET DEADLOCK_PRIORITY HIGH;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 

    IF NOT EXISTS (SELECT 1 FROM Donhang WHERE MaDon = @MaDon)
    BEGIN
        PRINT N'Lỗi: Mã đơn cần thanh toán không tồn tại!';
        RETURN 0;
    END

    -- [GIẢI PHÁP 2]: Dùng TRY...CATCH để bắt lỗi tranh chấp
    BEGIN TRY
        BEGIN TRANSACTION;

            -- Cập nhật giờ thanh toán
            UPDATE Donhang 
            SET ThoiGian = GETDATE()
            WHERE MaDon = @MaDon;

            -- Ghi lịch sử
            DECLARE @MaxLog INT, @MaLogMoi CHAR(4);
            SELECT @MaxLog = ISNULL(MAX(CAST(RIGHT(MaLog, 3) AS INT)), 0) FROM Lichsugiaotac WITH (UPDLOCK, HOLDLOCK);
            SET @MaLogMoi = 'L' + RIGHT('000' + CAST(@MaxLog + 1 AS VARCHAR(3)), 3);

            INSERT INTO Lichsugiaotac (MaLog, MaDon, MaCa, HanhDong, NoiDungChiTiet, ThoiGian)
            VALUES (@MaLogMoi, @MaDon, @MaCa, 'Thanh toan', N'Thành công', GETDATE());

        COMMIT TRANSACTION;
        PRINT N'THANH TOÁN THÀNH CÔNG!';
        RETURN 1;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        
        -- Bắt mã lỗi 1205 để thông báo chạy lại
        IF ERROR_NUMBER() = 1205
            PRINT N'Xung đột dữ liệu. Hệ thống sẽ tự động thực thi lại...';
        ELSE
            PRINT N'Lỗi hệ thống: ' + ERROR_MESSAGE();
        RETURN 0;
    END CATCH
END;
GO
-- Thủ tục đổi giá T1
CREATE OR ALTER PROCEDURE sp_CapNhatGiaSanPham
    @MaCa INT,
    @MaSanPham CHAR(4),
    @GiaMoi INT
AS
BEGIN
    SET DEADLOCK_PRIORITY LOW;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 

    IF NOT EXISTS (SELECT 1 FROM Sanpham WHERE MaSanPham = @MaSanPham)
    BEGIN
        PRINT N'Lỗi: Sản phẩm không tồn tại!';
        RETURN 0;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

            -- 1. Cập nhật giá sản phẩm
            UPDATE Sanpham 
            SET GiaBan = @GiaMoi 
            WHERE MaSanPham = @MaSanPham;

            -- 2. Tạo mã Log mới
            DECLARE @MaxLog INT, @MaLogMoi CHAR(4);
            SELECT @MaxLog = ISNULL(MAX(CAST(RIGHT(MaLog, 3) AS INT)), 0) 
            FROM Lichsugiaotac WITH (UPDLOCK, HOLDLOCK);
            
            SET @MaLogMoi = 'L' + RIGHT('000' + CAST(@MaxLog + 1 AS VARCHAR(3)), 3);

            -- 3. Ghi lịch sử (SỬA LỖI TẠI ĐÂY)
            -- Giả sử bảng có các cột: MaLog, MaDon, MaCa, HanhDong, NoiDungChiTiet, ThoiGian
            INSERT INTO Lichsugiaotac (MaLog, MaDon, MaCa, HanhDong, NoiDungChiTiet, ThoiGian)
            VALUES (@MaLogMoi, NULL, @MaCa, 'Cap nhat gia', N'Đổi giá mới', GETDATE());

        COMMIT TRANSACTION;
        PRINT N'CẬP NHẬT GIÁ THÀNH CÔNG!';
        RETURN 1;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;

        IF ERROR_NUMBER() = 1205
            PRINT N'Xung đột dữ liệu (Deadlock). Hệ thống sẽ tự động thực thi lại...';
        ELSE
            PRINT N'Lỗi hệ thống: ' + ERROR_MESSAGE();
        RETURN 0;
    END CATCH
END;
GO
