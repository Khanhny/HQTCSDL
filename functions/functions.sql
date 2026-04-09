
/*function fn_DemSoLuongSanPham
/* ở Bang chi tiet don hang ,(view gio hang)
*/*/
use QuanLyBanHang;
go
CREATE OR ALTER function fn_DemSoLuongSanPham(@MaDon nvarchar(20))
returns int 
as 
begin

declare @TongSoLuong int 
select @TongSoLuong= sum (CTD.SoLuong) 
from ChiTietDon CTD
where CTD.MaDon=@MaDon
return @TongSoLuong
end
GO

/* function fn_TinhTongTienDonHang(@MaDon nvarchar (20))
 * ở Bang chi tiet don hang ,(view gio hang) */
CREATE OR ALTER function fn_TinhTongTienDonHang(@MaDon char(4))
returns int 
as
begin
declare @TongTien int 
select @TongTien = sum(CTD.Gia*CTD.SoLuong)
from ChiTietDon CTD
where CTD.MaDon= @MaDon
return @TongTien
end
GO
/* fn_DoanhThuTheoNgay(@Ngay date)
 * Bảng đơn hàng, View báo cáo doanh thu 
*/
CREATE OR ALTER function fn_DoanhThuTheoNgay(@Ngay date)
returns int
as
begin
declare @DoanhThuTheoNgay int
select @DoanhThuTheoNgay= isnull(sum(DH.TongTien),0)
from Donhang DH WITH (SERIALIZABLE)
--áp dụng mức bảo vệ dữ liệu cao nhất và nghiêm ngặt nhất
where cast(DH.ThoiGian as date )= @Ngay
/*dùng cast as date -> Chuyển dữ liệu từ kiểu DATETIME-> chỉ lấy phần DATE (ngày/tháng/năm)
 * cast rất chính xác nên thích hợp dùng cho ngày tháng năm*/
return @DoanhThuTheoNgay
end
GO

/* fn_DoanhThuTheoCa(@MaCa int)
 * Bảng đơn hàng, View báo cáo doanh thu 
*/
CREATE OR ALTER function fn_DoanhThuTheoCa(@MaCa int)
returns int
as
begin
declare @DoanhThuTheoCa int
select @DoanhThuTheoCa = isnull(sum(DH.TongTien),0)
from Donhang DH WITH (SERIALIZABLE)
--áp dụng mức bảo vệ dữ liệu cao nhất và nghiêm ngặt nhất
where DH.MaCa= @MaCa
return @DoanhThuTheoCa
end
GO

/* fn_DoanhThuTheoCa(@MaCa int)
 * Bảng đơn hàng, View báo cáo doanh thu 
*/
CREATE OR ALTER function fn_DoanhThuTheoGio(@Gio int)
returns int
as
begin
declare @DoanhThuTheoGio int
select @DoanhThuTheoGio = isnull(sum(DH.TongTien),0)
from Donhang DH WITH (SERIALIZABLE)
--áp dụng mức bảo vệ dữ liệu cao nhất và nghiêm ngặt nhất
where datepart(hour,DH.ThoiGian)= @Gio
/*dùng datepart để lấy phần giờ, vì cast chính xác quá nên khó ss giây = -> dùng datepart hợp lý hơn)*/
return @DoanhThuTheoGio
end
GO