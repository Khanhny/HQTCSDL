use QuanLyBanHang
go

--Nhân viên đang thêm sp vào đơn -> Quản lý không thể sửa giá 
CREATE OR ALTER PROCEDURE sp_ThemSanPhamVaoDon
    @MaDon VARCHAR(10),
    @MaSP INT,
    @SoLuong INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        -- 1. Đặt KHÓA ĐỌC S lên dòng sản phẩm để lấy giá bán
        DECLARE @GiaBan int;

        SELECT @GiaBan = GiaBan 
        FROM SanPham WITH (HOLDLOCK, ROWLOCK) -- HOLDLOCK giữ khóa S đến hết Tran, rowlock chỉ giữ khóa trên sòng đó
        WHERE MaSanPham = @MaSP;

        -- 2. Thêm vào đơn hàng với giá vừa lấy được
        INSERT INTO ChiTietDon (MaDon, MaSanPham, SoLuong, Gia)
        VALUES (@MaDon, @MaSP, @SoLuong, @GiaBan);

        COMMIT TRANSACTION; --Kết thúc
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'Loi: ';
    END CATCH
END;
go
--Quản lý đang sửa giá, nhân viên không thể làm gì (đọc,thêm) 
CREATE OR ALTER PROCEDURE sp_CapNhatGiaSanPham
    @MaSP INT,
    @GiaMoi int
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        -- 1. Đặt KHÓA GHI X để cập nhật (Tự động chặn các khóa S khác)
        UPDATE SanPham WITH (XLOCK, ROWLOCK)
        SET GiaBan = @GiaMoi
        WHERE MaSanPham = @MaSP;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'Loi: ' ;
    END CATCH
END;