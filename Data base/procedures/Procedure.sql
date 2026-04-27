USE QuanLyBanHang;
GO

-- 1. Thu tuc Dang Nhap
CREATE OR ALTER PROCEDURE sp_DangNhap
    @MaCa     INT,          -- INT cho khop voi bang Calamviec
    @MatKhauCa INT,
    @KetQua   INT OUTPUT
AS
BEGIN
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
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

-- 2. Thu tuc Tao Don Hang Moi
CREATE OR ALTER PROCEDURE sp_TaoDonHangMoi
    @MaCa    INT,           -- INT cho khop voi bang Calamviec
    @MaDonMoi VARCHAR(20) OUTPUT
AS
BEGIN
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    IF NOT EXISTS (SELECT 1 FROM Calamviec WHERE MaCa = @MaCa)
    BEGIN
        PRINT N'Lỗi: Mã ca không tồn tại!';
        RETURN 0;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @MaxDon INT;
        SELECT @MaxDon = ISNULL(MAX(CAST(RIGHT(MaDon, 3) AS INT)), 0)
        FROM Donhang WITH (UPDLOCK, HOLDLOCK);
        SET @MaDonMoi = 'D' + RIGHT('000' + CAST(@MaxDon + 1 AS VARCHAR(3)), 3);

        INSERT INTO Donhang (MaDon, ThoiGian, TongTien, MaCa)
        VALUES (@MaDonMoi, GETDATE(), 0, @MaCa);

        -- MaLog la IDENTITY -> khong can sinh tay, chi insert cac cot can thiet
        INSERT INTO Lichsugiaotac (MaDon, MaCa, HanhDong, NoiDungChiTiet, ThoiGian)
        VALUES (@MaDonMoi, @MaCa, 'Tao don moi', N'Khởi tạo đơn thành công', GETDATE());

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

-- 3. Thu tuc Them San Pham Vao Don
CREATE OR ALTER PROCEDURE sp_ThemSanPhamVaoDon
    @MaDon     VARCHAR(20),
    @MaCa      INT,         -- INT cho khop voi bang Calamviec
    @MaSanPham CHAR(4),
    @Size      VARCHAR(5),
    @SoLuong   INT
AS
BEGIN
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    IF NOT EXISTS (SELECT 1 FROM Donhang WHERE MaDon = @MaDon)
    BEGIN PRINT N'Lỗi: Đơn hàng không tồn tại!'; RETURN 0; END
    IF NOT EXISTS (SELECT 1 FROM Sanpham WHERE MaSanPham = @MaSanPham)
    BEGIN PRINT N'Lỗi: Sản phẩm không tồn tại!'; RETURN 0; END
    IF @SoLuong <= 0
    BEGIN PRINT N'Lỗi: Số lượng phải lớn hơn 0!'; RETURN 0; END

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @GiaBan INT;
        SELECT @GiaBan = GiaBan FROM Sanpham WHERE MaSanPham = @MaSanPham AND Size = @Size;

        IF EXISTS (SELECT 1 FROM Chitietdon WITH (UPDLOCK)
                   WHERE MaDon = @MaDon AND MaSanPham = @MaSanPham AND Size = @Size)
        BEGIN
            UPDATE Chitietdon
            SET SoLuong = SoLuong + @SoLuong, Size = @Size
            WHERE MaDon = @MaDon AND MaSanPham = @MaSanPham AND Size = @Size;
        END
        ELSE
        BEGIN
            INSERT INTO Chitietdon (MaDon, MaSanPham, Size, SoLuong, Gia)
            VALUES (@MaDon, @MaSanPham, @Size, @SoLuong, CAST(@GiaBan AS DECIMAL(18,0)));
        END

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

-- 4. Thu tuc Chot Thanh Toan   
CREATE OR ALTER PROCEDURE sp_ThanhToanDonHang
    @MaDon VARCHAR(20),
    @MaCa  INT            -- INT cho khop voi bang Calamviec
AS
BEGIN
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    IF NOT EXISTS (SELECT 1 FROM Donhang WHERE MaDon = @MaDon)
    BEGIN PRINT N'Lỗi: Mã đơn không tồn tại!'; RETURN 0; END

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @TongTien INT;
        SELECT @TongTien = TongTien FROM Donhang WHERE MaDon = @MaDon;

        UPDATE Donhang SET ThoiGian = GETDATE() WHERE MaDon = @MaDon;

        -- MaLog la IDENTITY -> khong can sinh tay
        DECLARE @ChiTietLog NVARCHAR(100) =
            N'Chốt bill thành công. Khách trả: ' + CAST(@TongTien AS VARCHAR(20));
        INSERT INTO Lichsugiaotac (MaDon, MaCa, HanhDong, NoiDungChiTiet, ThoiGian)
        VALUES (@MaDon, @MaCa, 'Thanh toan', @ChiTietLog, GETDATE());

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

-- 5. Thu tuc Cap Nhat Gia San Pham
CREATE OR ALTER PROCEDURE sp_CapNhatGiaSanPham
    @MaCa      INT,        -- INT cho khop voi bang Calamviec
    @MaSanPham CHAR(4),
    @GiaMoi    INT
AS
BEGIN
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    IF NOT EXISTS (SELECT 1 FROM Sanpham WHERE MaSanPham = @MaSanPham)
    BEGIN PRINT N'Lỗi: Sản phẩm không tồn tại!'; RETURN 0; END

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE Sanpham SET GiaBan = @GiaMoi WHERE MaSanPham = @MaSanPham;

        -- MaLog la IDENTITY -> khong can sinh tay, MaDon = NULL khi cap nhat gia
        DECLARE @ChiTiet NVARCHAR(100) =
            N'Cập nhật giá SP ' + @MaSanPham + N' thành ' + CAST(@GiaMoi AS VARCHAR(20));
        INSERT INTO Lichsugiaotac (MaDon, MaCa, HanhDong, NoiDungChiTiet, ThoiGian)
        VALUES (NULL, @MaCa, 'Cap nhat gia', @ChiTiet, GETDATE());

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