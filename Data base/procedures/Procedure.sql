use QuanLyBanHang;
go
-- 1. Thủ tục Đăng Nhập
CREATE OR ALTER PROCEDURE sp_DangNhap
    @MaCa CHAR(4),
    @MatKhauCa INT,
    @KetQua INT OUTPUT 
AS
BEGIN
    --khóa đọc-> Khắc phục Đọc dữ liệu rác
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 
    -- Kiểm tra tồn tại 
    IF NOT EXISTS (SELECT 1 FROM Calamviec WHERE MaCa = @MaCa AND MatKhauCa = @MatKhauCa)
    BEGIN
        PRINT N'Thất bại: Sai mã ca hoặc mật khẩu!';
        SET @KetQua = 0;
        RETURN 0; 
    END

    PRINT N'Thành công: Đăng nhập hợp lệ!';
    SET @KetQua = 1;
    RETURN 1;
END;
GO

-- 2. Thủ tục Tạo Đơn Hàng Mới
CREATE OR ALTER PROCEDURE sp_TaoDonHangMoi
    @MaCa CHAR(4),
    @MaDonMoi CHAR(4) OUTPUT
AS
BEGIN
    --khóa đọc-> Khắc phục Đọc dữ liệu rác
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 
    -- Validate đầu vào:
    IF NOT EXISTS (SELECT 1 FROM Calamviec WHERE MaCa = @MaCa)
    BEGIN
        PRINT N'Lỗi: Nhân viên (Mã ca) không tồn tại!';
        RETURN 0;
    END

    BEGIN TRY
        -- Bắt đầu Giao Tác
        BEGIN TRANSACTION;

        -- Dùng UPDLOCK, HOLDLOCK để khóa dòng (Tránh tranh chấp khi nhiều người tạo đơn cùng lúc)
        DECLARE @MaxDon INT;
        SELECT @MaxDon = ISNULL(MAX(CAST(RIGHT(MaDon, 3) AS INT)), 0) FROM Donhang WITH (UPDLOCK, HOLDLOCK);
        SET @MaDonMoi = 'D' + RIGHT('000' + CAST(@MaxDon + 1 AS VARCHAR(3)), 3);

        -- Thêm đơn hàng
        INSERT INTO Donhang (MaDon, ThoiGian, TongTien, MaCa)
        VALUES (@MaDonMoi, CAST(GETDATE() AS TIME), 0, @MaCa);

        -- Sinh mã Log và ghi lại lịch sử
        DECLARE @MaxLog INT, @MaLogMoi CHAR(4);
        SELECT @MaxLog = ISNULL(MAX(CAST(RIGHT(MaLog, 3) AS INT)), 0) FROM Lichsugiaotac WITH (UPDLOCK, HOLDLOCK);
        SET @MaLogMoi = 'L' + RIGHT('000' + CAST(@MaxLog + 1 AS VARCHAR(3)), 3);

        INSERT INTO Lichsugiaotac (MaLog, MaDon, MaCa, HanhDong, NoiDungChiTiet, ThoiGian)
        VALUES (@MaLogMoi, @MaDonMoi, @MaCa, 'Tao don moi', N'Khởi tạo đơn thành công', GETDATE());

        COMMIT TRANSACTION;
        PRINT N'Tạo đơn hàng thành công: ' + @MaDonMoi;
        RETURN 1;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        PRINT N'Lỗi giao tác: ' + ERROR_MESSAGE();
        RETURN 0;
    END CATCH
END;
GO

-- 3. Thủ tục Thêm Sản Phẩm Vào Đơn
CREATE OR ALTER PROCEDURE sp_ThemSanPhamVaoDon
    @MaDon CHAR(4),
    @MaCa CHAR(4),
    @MaSanPham CHAR(4),
    @Size VARCHAR(5),
    @SoLuong INT
AS
BEGIN
    --khóa đọc-> Khắc phục Đọc dữ liệu rác
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 
    IF NOT EXISTS (SELECT 1 FROM Donhang WHERE MaDon = @MaDon)
    BEGIN
        PRINT N'Lỗi: Đơn hàng không tồn tại!';
        RETURN 0;
    END

    IF NOT EXISTS (SELECT 1 FROM Sanpham WHERE MaSanPham = @MaSanPham)
    BEGIN
        PRINT N'Lỗi: Sản phẩm không tồn tại trong Menu!';
        RETURN 0;
    END

    IF @SoLuong <= 0
    BEGIN
        PRINT N'Lỗi: Số lượng nhập vào phải lớn hơn 0!';
        RETURN 0;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @GiaBan INT;
        -- 1. Lấy giá bán từ bảng sản phẩm (S-Lock)
        SELECT @GiaBan = GiaBan FROM Sanpham WHERE MaSanPham = @MaSanPham;

        -- 2. KIỂM TRA VÀ KHÓA DÒNG (Dùng UPDLOCK)
        -- Nếu món đã có, khóa dòng đó lại để chuẩn bị UPDATE
        -- Nếu chưa có, lệnh này sẽ không khóa gì cả và nhảy xuống phần ELSE
        IF EXISTS (SELECT 1 FROM Chitietdon WITH (UPDLOCK) WHERE MaDon = @MaDon AND MaSanPham = @MaSanPham)
        BEGIN
            UPDATE Chitietdon
            SET SoLuong = SoLuong + @SoLuong, 
                Size = @Size
            WHERE MaDon = @MaDon AND MaSanPham = @MaSanPham;
        END
        ELSE
        BEGIN
            -- Nếu chưa có món này trong đơn, tiến hành thêm mới
            INSERT INTO Chitietdon (MaDon, MaSanPham, Size, SoLuong, Gia)
            VALUES (@MaDon, @MaSanPham, @Size, @SoLuong, CAST(@GiaBan AS DECIMAL(18,0)));
        END
        
        -- ... (Phần ghi log phía sau giữ nguyên) ...

        COMMIT TRANSACTION;
        PRINT N'Đã thêm sản phẩm thành công';
        RETURN 1;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        PRINT N'Lỗi giao tác: ' + ERROR_MESSAGE();
        RETURN 0;
    END CATCH
END;
GO
drop procedure sp_ThanhToanDonHang
go
-- 4. Thủ tục Chốt Thanh Toán
CREATE PROCEDURE sp_ThanhToanDonHang
    @MaDon CHAR(4),
    @MaCa CHAR(4)
AS
BEGIN
    --khóa đọc-> Khắc phục Đọc dữ liệu rác
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 
    IF NOT EXISTS (SELECT 1 FROM Donhang WHERE MaDon = @MaDon)
    BEGIN
        PRINT N'Lỗi: Mã đơn cần thanh toán không tồn tại!';
        RETURN 0;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Tính lại một lần cuối cho an toàn (Double-check)
        DECLARE @TongTien INT;
        SELECT @TongTien = TongTien FROM Donhang WHERE MaDon = @MaDon;

        -- Chốt giờ thanh toán
        UPDATE Donhang 
        SET ThoiGian = CAST(GETDATE() AS TIME)
        WHERE MaDon = @MaDon;

        -- Ghi log thanh toán thành công
        DECLARE @MaxLog INT, @MaLogMoi CHAR(4);
        SELECT @MaxLog = ISNULL(MAX(CAST(RIGHT(MaLog, 3) AS INT)), 0) FROM Lichsugiaotac WITH (UPDLOCK, HOLDLOCK);
        SET @MaLogMoi = 'L' + RIGHT('000' + CAST(@MaxLog + 1 AS VARCHAR(3)), 3);

        DECLARE @ChiTietLog NVARCHAR(100) = N'Chốt bill thành công. Khách trả: ' + CAST(@TongTien AS VARCHAR(20));
        
        INSERT INTO Lichsugiaotac (MaLog, MaDon, MaCa, HanhDong, NoiDungChiTiet, ThoiGian)
        VALUES (@MaLogMoi, @MaDon, @MaCa, 'Thanh toan', @ChiTietLog, GETDATE());

        COMMIT TRANSACTION;
        PRINT N'======================================';
        PRINT N'THANH TOÁN THÀNH CÔNG CHO ĐƠN: ' + @MaDon;
        PRINT N'TỔNG TIỀN: ' + CAST(@TongTien AS VARCHAR(20)) + ' VND';
        PRINT N'======================================';
        RETURN 1;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        PRINT N'Lỗi giao tác: ' + ERROR_MESSAGE();
        RETURN 0;
    END CATCH
END;
GO
-- 5. Thủ tục Cập Nhật Giá Sản Phẩm 
CREATE PROCEDURE sp_CapNhatGiaSanPham
    @MaCa CHAR(4),
    @MaSanPham CHAR(4),
    @GiaMoi INT
AS
BEGIN
    --khóa đọc-> Khắc phục Đọc dữ liệu rác
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 

    IF NOT EXISTS (SELECT 1 FROM Sanpham WHERE MaSanPham = @MaSanPham)
    BEGIN
        PRINT N'Lỗi: Sản phẩm không tồn tại!';
        RETURN 0;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Cập nhật giá
        UPDATE Sanpham 
        SET GiaBan = @GiaMoi
        WHERE MaSanPham = @MaSanPham;

        -- Sinh mã Log ghi lại
        DECLARE @MaxLog INT, @MaLogMoi CHAR(4);
        SELECT @MaxLog = ISNULL(MAX(CAST(RIGHT(MaLog, 3) AS INT)), 0) FROM Lichsugiaotac WITH (UPDLOCK, HOLDLOCK);
        SET @MaLogMoi = 'L' + RIGHT('000' + CAST(@MaxLog + 1 AS VARCHAR(3)), 3);

        DECLARE @ChiTiet NVARCHAR(100) = N'Cập nhật giá SP ' + @MaSanPham + N' thành ' + CAST(@GiaMoi AS VARCHAR(20));

        INSERT INTO Lichsugiaotac (MaLog, MaDon, MaCa, HanhDong, NoiDungChiTiet, ThoiGian)
        VALUES (@MaLogMoi, NULL, @MaCa, 'Cap nhat gia', @ChiTiet, GETDATE());

        COMMIT TRANSACTION;
        PRINT N'Cập nhật giá thành công!';
        RETURN 1;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        PRINT N'Lỗi giao tác: ' + ERROR_MESSAGE();
        RETURN 0;
    END CATCH
END;
GO
