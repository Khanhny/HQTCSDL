-- Thủ tục thanh toán
CREATE OR ALTER PROCEDURE sp_ThanhToanDonHang
    @MaDon CHAR(4),
    @MaCa INT
AS
BEGIN
    -- [GIẢI QUYẾT DEADLOCK]: Bảo vệ luồng Thanh toán bằng mức ưu tiên cao nhất
    SET DEADLOCK_PRIORITY HIGH;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 

    IF NOT EXISTS (SELECT 1 FROM Donhang WHERE MaDon = @MaDon)
    BEGIN
        PRINT N'Lỗi: Mã đơn cần thanh toán không tồn tại!';
        RETURN 0;
    END

    -- Cài đặt thông số cho vòng lặp Retry tự động
    DECLARE @RetryCount INT = 0;
    DECLARE @MaxRetries INT = 3;
    DECLARE @Success BIT = 0;

    WHILE @RetryCount < @MaxRetries AND @Success = 0
    BEGIN
        -- [GIẢI QUYẾT DEADLOCK]: Bọc giao tác trong khối TRY...CATCH
        BEGIN TRY
            BEGIN TRANSACTION;

            -- Tính lại tổng tiền và chốt hóa đơn
            DECLARE @TongTien INT;
            SELECT @TongTien = TongTien FROM Donhang WHERE MaDon = @MaDon;

            UPDATE Donhang 
            SET ThoiGian = GETDATE()
            WHERE MaDon = @MaDon;

            -- Ghi Lịch sử giao tác
            DECLARE @MaxLog INT, @MaLogMoi CHAR(4);
            SELECT @MaxLog = ISNULL(MAX(CAST(RIGHT(MaLog, 3) AS INT)), 0) FROM Lichsugiaotac WITH (UPDLOCK, HOLDLOCK);
            SET @MaLogMoi = 'L' + RIGHT('000' + CAST(@MaxLog + 1 AS VARCHAR(3)), 3);

            DECLARE @ChiTietLog NVARCHAR(100) = N'Chốt bill thành công. Tổng: ' + CAST(@TongTien AS VARCHAR(20));
            INSERT INTO Lichsugiaotac (MaLog, MaDon, MaCa, HanhDong, NoiDungChiTiet, ThoiGian)
            VALUES (@MaLogMoi, @MaDon, @MaCa, 'Thanh toan', @ChiTietLog, GETDATE());

            COMMIT TRANSACTION;
            
            -- Giao dịch thành công, thoát vòng lặp
            SET @Success = 1; 
            PRINT N'THANH TOÁN THÀNH CÔNG CHO ĐƠN: ' + @MaDon;
            RETURN 1;

        END TRY
        BEGIN CATCH
            -- Có lỗi xảy ra, lập tức Rollback để nhả toàn bộ khóa đang giữ
            IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;

            -- [GIẢI QUYẾT DEADLOCK]: Nếu mã lỗi là 1205 (Deadlock), tiến hành Retry
            IF ERROR_NUMBER() = 1205
            BEGIN
                SET @RetryCount = @RetryCount + 1;
                PRINT N'Hệ thống đang bận (Deadlock). Tự động thử lại lần ' + CAST(@RetryCount AS VARCHAR);
                WAITFOR DELAY '00:00:01'; -- Nghỉ 1 giây rồi chạy lại
            END
            ELSE
            BEGIN
                -- Lỗi cú pháp hoặc lỗi khác thì báo lỗi và dừng hoàn toàn
                PRINT N'Lỗi hệ thống: ' + ERROR_MESSAGE();
                RETURN 0; 
            END
        END CATCH
    END

    IF @Success = 0
        PRINT N'Giao dịch thanh toán thất bại: Hệ thống quá tải sau 3 lần thử.';
    RETURN 0;
END;
GO
-- Thủ tục cập nhập giá
CREATE OR ALTER PROCEDURE sp_CapNhatGiaSanPham
    @MaCa INT,
    @MaSanPham CHAR(4),
    @GiaMoi INT
AS
BEGIN
    -- [GIẢI QUYẾT DEADLOCK]: Hạ mức ưu tiên, nhường tài nguyên cho Thanh toán nếu xảy ra tranh chấp
    SET DEADLOCK_PRIORITY LOW;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 

    IF NOT EXISTS (SELECT 1 FROM Sanpham WHERE MaSanPham = @MaSanPham)
    BEGIN
        PRINT N'Lỗi: Sản phẩm không tồn tại!';
        RETURN 0;
    END

    DECLARE @RetryCount INT = 0;
    DECLARE @MaxRetries INT = 3;
    DECLARE @Success BIT = 0;

    WHILE @RetryCount < @MaxRetries AND @Success = 0
    BEGIN
        BEGIN TRY
            BEGIN TRANSACTION;

            -- Cập nhật giá sản phẩm
            UPDATE Sanpham 
            SET GiaBan = @GiaMoi 
            WHERE MaSanPham = @MaSanPham;

            -- Ghi Lịch sử giao tác
            DECLARE @MaxLog INT, @MaLogMoi CHAR(4);
            SELECT @MaxLog = ISNULL(MAX(CAST(RIGHT(MaLog, 3) AS INT)), 0) FROM Lichsugiaotac WITH (UPDLOCK, HOLDLOCK);
            SET @MaLogMoi = 'L' + RIGHT('000' + CAST(@MaxLog + 1 AS VARCHAR(3)), 3);

            DECLARE @ChiTiet NVARCHAR(100) = N'Cập nhật giá SP ' + @MaSanPham + N' thành ' + CAST(@GiaMoi AS VARCHAR(20));
            INSERT INTO Lichsugiaotac (MaLog, MaDon, MaCa, HanhDong, NoiDungChiTiet, ThoiGian)
            VALUES (@MaLogMoi, NULL, @MaCa, 'Cap nhat gia', @ChiTiet, GETDATE());

            COMMIT TRANSACTION;
            
            SET @Success = 1;
            PRINT N'Cập nhật giá thành công!';
            RETURN 1;

        END TRY
        BEGIN CATCH
            IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;

            -- Nếu bị hệ thống chọn làm nạn nhân (1205), tự động lùi lại và thử sau
            IF ERROR_NUMBER() = 1205
            BEGIN
                SET @RetryCount = @RetryCount + 1;
                PRINT N'Bị chọn làm nạn nhân (Deadlock). Đang rút lui và thử lại lần ' + CAST(@RetryCount AS VARCHAR);
                WAITFOR DELAY '00:00:01';
            END
            ELSE
            BEGIN
                PRINT N'Lỗi: ' + ERROR_MESSAGE();
                RETURN 0;
            END
        END CATCH
    END

    IF @Success = 0
        PRINT N'Cập nhật giá thất bại. Vui lòng thao tác lại sau!';
    RETURN 0;
END;
GO