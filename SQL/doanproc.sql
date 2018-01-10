use QLSV2
go
/*
create proc sp_GiaoVienXemThongTinCaNhan
AS 
Begin transaction
	Begin try 
	if SUSER_SNAME()=null 
	Begin 
		print 'Thong tin nhap rong'
		rollback transaction
		return
	End

	End try
	 Begin catch 
			--bao loi
			print '1- Xem khong thanh cong'
			rollback transaction
	End catch
		Select * From GiaoVien where MaGV=SUSER_SNAME()
		commit transaction
Go

create proc sp_GiaoVienSuaThongTinCaNhan
@DienThoai nvarchar(13)
AS 
Begin transaction
	Begin try 
	if SUSER_SNAME()=null or @DienThoai=null
	Begin 
		print 'Thong tin nhap rong'
		rollback transaction
		return
	End

	
End try
	 Begin catch 
			--bao loi
			print '1- Xem khong thanh cong'
			rollback transaction
	End catch
		Update GiaoVien
		Set DienThoai = @DienThoai
		where MaGV= SUSER_SNAME()
		commit transaction
Go


create proc sp_SuaThongTinGiaoVien
@MaGV nvarchar(10),
@DienThoai nvarchar(13)
AS 
Begin transaction
	Begin try 
	if @MaGV=null or @DienThoai=null
	Begin 
		print 'Thong tin nhap rong'
		rollback transaction
		return
	End


	if NOT EXISTS (Select *
					From GiaoVien
					Where MaGV = @MaGV)
	Begin 
		print 'MaGV khong ton tai'
		rollback transaction
		return
	End
	End try
	 Begin catch 
			--bao loi
			print '1- Xem khong thanh cong'
			rollback transaction
	End catch
		Update GiaoVien
		Set DienThoai = @DienThoai
		where MaGV= @MaGV
		commit transaction
Go

*/

/*
create proc sp_TruongKhoaXemThongTinSinhVien
AS 
Begin transaction
Declare
@MaKhoa nvarchar(10)	

Begin try
	if NOT EXISTS ( Select * from Khoa where TruongKhoa = SUSER_SNAME() )
	Begin 
		print 'khong hop le'
		rollback transaction
		return
	End
End try
Begin catch
			--bao loi
			print '1- Xem khong thanh cong'
			rollback transaction
End catch
		
		
		Set @MaKhoa = ( Select MaKhoa from Khoa where TruongKhoa = SUSER_SNAME())
		Print @MaKhoa
		Select * From SinhVien where MaKhoa = @MaKhoa
		commit transaction
Go
*/


--create proc sp_XemDanhSachMonHocThuocBoMon 
--@MaBoMon nvarchar(10)
--AS
--Begin transaction
--Begin try
--	if (@MaBoMon = null)
--	Begin
--		print 'Thong tin nhap vao trong'
--		rollback transaction
--		return
--	End
--	if NOT EXISTS ( Select * from BoMon where MaBoMon = @MaBoMon )
--	Begin 
--		print 'Ma bo mon khong ton tai'
--		rollback transaction
--		return
--	End
--	if ( (Select distinct k.MaKhoa
--From BoMon bm, Khoa k
--Where 
--k.MaKhoa = bm.MaKhoa AND bm.MaBoMon = @MaBoMon) <> (Select distinct k.MaKhoa
--From BoMon bm, Khoa k, GiaoVien gv
--Where 
--bm.MaKhoa= k.MaKhoa
--AND gv.MaBoMon = bm.MaBoMon
--AND gv.MaGV = SUSER_SNAME()))
--	Begin
--		print 'Khong the xem danh sach bon hoc thuoc bo mon cua khoa khac'
--		rollback transaction
--		return
--	End

--End try
--Begin catch
--			--bao loi
--			print '1- Xem khong thanh cong'
--			rollback transaction
--End catch
--Select * From MonHoc where MaBoMon = @MaBoMon
--	commit transaction
--Go

--create proc sp_XemDanhSachMonHocTrongHocKyCuThe
--@HocKy nvarchar(1),
--@NamHoc nvarchar(255)
--AS
--Begin transaction
--Begin try
--	if (@HocKy=null or @NamHoc=null)
--	Begin
--		print 'Thong tin nhap vao trong'
--		rollback transaction
--		return
--	End
--	if (@Hocky <> '1' AND @Hocky <> '2' AND @Hocky <> '3')
--	Begin
--		print 'Thong tin nhap vao khong hop le hoac khong co hoc ky do'
--		rollback transaction
--		return
--	End
--	if NOT EXISTS ( Select * From KhoaHoc where NamHoc = @NamHoc)
--	Begin
--		print 'Thong tin nhap vao khong hop le hoac khong co hoc ky do'
--		rollback transaction
--		return
--	End
--End try
--Begin catch
--			--bao loi
--			print '1- Xem khong thanh cong'
--			rollback transaction
--End catch
--Select * From KhoaHoc where HocKy = @HocKy AND NamHoc = @NamHoc
--commit transaction
--Go

--Create proc sp_GiaoVienXemDanhSachLopKhoaHoc
--@MaKhoaHoc nvarchar(15)
--AS
--Begin transaction
--Begin try 
--if (@MaKhoaHoc = null) 
--Begin
--	print 'Thong tin nhap vao rong'
--	rollback transaction
--	return
--End
--if ( (Select MaGV From KhoaHoc where MaKhoaHoc = @MaKhoaHoc) <> SUSER_SNAME())
--Begin
--	print 'Khong the xem danh sach lop ban khong phu trach'
--	rollback transaction
--	return
--End
--End try
--Begin catch
--			--bao loi
--			print '1- Xem khong thanh cong'
--			rollback transaction
--End catch

--Select sv.MaSV, sv.Ho +sv.TenLot+sv.Ten as HoTen, sv.MaLop 
--From SinhVien sv , DangKy dk
--where sv.MaSV = dk.MaSV
--AND dk.MaKhoaHoc = @MaKhoaHoc
--commit transaction
--Go


--Create proc sp_GiaoVienXemBangDiemKhoaHoc
--@MaKhoaHoc nvarchar(15)
--AS
--Begin transaction
--Begin try 
--if (@MaKhoaHoc = null) 
--Begin
--	print 'Thong tin nhap vao rong'
--	rollback transaction
--	return
--End
--if ( (Select MaGV From KhoaHoc where MaKhoaHoc = @MaKhoaHoc) <> SUSER_SNAME())
--Begin
--	print 'Khong the xem diem lop ban khong phu trach'
--	rollback transaction
--	return
--End
--End try
--Begin catch
--			--bao loi
--			print '1- Xem khong thanh cong'
--			rollback transaction
--End catch

--Select * From Diem where @MaKhoaHoc = MaKhoaHoc
--commit transaction
--Go




--Create proc sp_GiaoVienUpdateDiemCuaSinhVienTrongKhoaHoc
--@MaKhoaHoc nvarchar(15),
--@MaSV nvarchar(8),
--@Diem int
--AS
--Begin transaction
--Begin try
--if (@MaKhoaHoc = null or @MaSV = null or @Diem = null)
--Begin 
--	print 'Thong tin nhap vao rong'
--	rollback transaction
--	return
--End
--if NOT EXISTS ( Select * From KhoaHoc Where MaKhoaHoc = @MaKhoaHoc)
--Begin 
--	print 'Ma khoa hoc khong ton tai'
--	rollback transaction
--	return
--End

--if NOT EXISTS ( Select * From DangKy Where MaSV = @MaSV AND @MaKhoaHoc = MaKhoaHoc)
--Begin 
--	print 'Ma sinhvien khong ton tai'
--	rollback transaction
--	return
--End 
--if ( (Select MaGV From KhoaHoc where MaKhoaHoc = @MaKhoaHoc) <> SUSER_SNAME())
--Begin
--	print 'Khong the sua diem lop ban khong phu trach'
--	rollback transaction
--	return
--End
--if ( YEAR(getdate()) - (Select NamHoc From KhoaHoc where MaKhoaHoc = @MaKhoaHoc)  >4 )
--Begin
--	print 'Khong the sua diem vi da qua thoi han'
--	rollback transaction
--	return
--End
--End try
--Begin catch
--			--bao loi
--			print '1- Cap nhat khong thanh cong'
--			rollback transaction
--End catch
--Update Diem
--Set Diem = @Diem
--Where MaKhoaHoc= @MaKhoaHoc AND MaSV= @MaSV
--commit transaction
--Go

--create proc sp_TruongBoMonXemLichDayGiaoVienTrongHocKy
--@MaGV  nvarchar(10),
--@HocKy nvarchar(1),
--@NamHoc nvarchar(255)
--AS
--Begin transaction
--Begin try
--	if (@HocKy=null or @NamHoc=null)
--	Begin
--		print 'Thong tin nhap vao trong'
--		rollback transaction
--		return
--	End
--	if (@Hocky <> '1' AND @Hocky <> '2' AND @Hocky <> '3')
--	Begin
--		print 'Thong tin nhap vao khong hop le hoac khong co hoc ky do'
--		rollback transaction
--		return
--	End
--	if NOT EXISTS ( Select * From KhoaHoc where NamHoc = @NamHoc)
--	Begin
--		print 'Thong tin nhap vao khong hop le hoac khong co hoc ky do'
--		rollback transaction
--		return
--	End
--	if NOT EXISTS ( Select * From GiaoVien where MaGV= @MaGV)
--	Begin
--		print 'Ma giao vien khong ton tai'
--		rollback transaction
--		return
--	End
--	if	( @MaGV NOT IN ( Select MaGV From GiaoVien Where MaBoMon = ( Select MaBoMon From BoMon where TruongBoMon = SUSER_SNAME())))
--	Begin 
--		print 'Khong the xem lich day cua giao vien bo mon khac'
--		rollback transaction
--		return
--	End
--End try
--Begin catch
--			--bao loi
--			print '1- Xem khong thanh cong'
--			rollback transaction
--End catch

--Select 
--LichDay 
--From KhoaHoc 
--where @MaGV = MaGV AND @HocKy = HocKy AND @NamHoc=NamHoc

--commit transaction
--go

--Create proc sp_TruongBoMonUpdateMaxSinhVienChoKhoaHoc
--@MaKhoaHoc nvarchar(15),
--@MaxSinhVien int
--AS
--Begin transaction
--if ( @MaKhoaHoc = null or @MaxSinhVien=null)
--Begin
--	print 'Thong tin nhap vao trong'
--	rollback transaction
--	return
--End
--if ( @MaKhoaHoc NOT IN (Select MaKhoaHoc
--From KhoaHoc
--Where MaMonHoc IN (
--Select distinct MaMonHoc
--From MonHoc
--Where MaBoMon = (
--Select MaBoMon
--From BoMon
--where TruongBoMon = SUSER_SNAME()))
--)  )
--Begin 
--	print ' Khong the chinh sua khoa hoc thuoc bo mon khac'
--	rollback transaction
--	return
--End
--if ( (select ChoPhepDangKy from KhoaHoc where @MaKhoaHoc = MaKhoaHoc) = 0)
--Begin 
--	print ' Khong the chinh sua khoa hoc da dong'
--	rollback transaction
--	return
--End
--Update KhoaHoc
--Set MaxSinhVien= @MaxSinhVien
--Where @MaKhoaHoc = MaKhoaHoc
--commit transaction
--go


--create proc sp_GiaoVuThemKhoaHoc
--@MaMonHoc nvarchar(10),
--@HocKy nvarchar(1),
--@NamHoc nvarchar(255),
--@MaGV nvarchar(10),
--@GhiChu nvarchar(225),
--@MaxSinhVien int,
--@LichDay nvarchar(255)
--AS 
--Begin transaction
--Declare
--@MaKhoaHoc nvarchar(15),
--@ChoPhepDangKy bit
--Begin try
--If (@MaMonHoc = null or @HocKy =null or @NamHoc = null or @LichDay = null)
--Begin 
--	print 'Thong tin nhap rong'
--	rollback transaction
--	return
--End
--if ( @HocKy <> 1  AND  @HocKy <> 2 AND  @HocKy <> 3)
--Begin 
--	print 'Thong tin nhap khong hop le'
--	rollback transaction
--	return
--End
--if ( @NamHoc < YEAR(getdate()))
--Begin 
--	print 'Thong tin nhap khong hop le'
--	rollback transaction
--	return
--End
--if EXISTS ( Select * from KhoaHoc where @MaMonHoc = MaMonHoc AND @HocKy = HocKy AND @NamHoc=  NamHoc AND @MaGV = MaGV)
--Begin 
--	print 'Khoa hoc da ton tai'
--	rollback transaction
--	return
--End
--if ( @MaMonHoc NOT IN (Select MaMonHoc
--From MonHoc
--Where MaBoMon IN (
--Select distinct  bm.MaBoMon From BoMon bm, Khoa k
--where bm.MaKhoa = k.MaKhoa
--AND k.MaKhoa = ( Select MaKhoa from GiaoVu where (MaGVu =  SUSER_SNAME())
--))))
--Begin
--	print 'Mon hoc khong thuoc khoa cua ban'
--	rollback transaction
--	return
--End
--if ( @MaGV NOT IN (Select @MaGV
--From GiaoVien
--Where MaBoMon IN (
--Select distinct  bm.MaBoMon From BoMon bm, Khoa k
--where bm.MaKhoa = k.MaKhoa
--AND k.MaKhoa = ( Select MaKhoa from GiaoVu where (MaGVu =  SUSER_SNAME())
--))) )
--Begin
--	print 'Giao vien khong thuoc khoa cua ban'
--	rollback transaction
--	return
--End
--if ( @MaGV NOT IN (Select @MaGV
--From GiaoVien
--Where MaBoMon =  ( Select MaBoMon from MonHoc where MaMonHoc=@MaMonHoc)))
--Begin
--	print 'Giao vien khong thuoc bo mon cua mon da chon'
--	rollback transaction
--	return
--End
--if ( @LichDay IN (
--Select LichDay from KhoaHoc where  HocKy = @HocKy AND NamHoc = @NamHoc)
--)
--Begin
--	print 'Lich day bi trung'
--	rollback transaction
--	return
--End
--End try
--Begin catch
--			--bao loi
--			print '1- Them khong thanh cong'
--			rollback transaction
--End catch

--If ( @GhiChu is null)
--	set @GhiChu = 'khong co ghi chu'

--If (@MaxSinhVien is null) 
--	set @MaxSinhVien = 30


--Set @MaKhoaHoc = @MaMonHoc + @HocKy + @NamHoc
--Set @ChoPhepDangKy = 1

--Insert into KhoaHoc values ( @MaKhoaHoc,@MaMonHoc,@HocKy,@MaMonHoc,@MaGV,@GhiChu,@ChoPhepDangKy,@MaxSinhVien,@LichDay)
--commit transaction
--go





--create proc sp_GiaoVuXemLichDayCuaGiaoVien
--@MaGV  nvarchar(10),
--@HocKy nvarchar(1),
--@NamHoc nvarchar(255)
--AS
--Begin transaction
--Begin try
--	if (@HocKy=null or @NamHoc=null)
--	Begin
--		print 'Thong tin nhap vao trong'
--		rollback transaction
--		return
--	End
--	if (@Hocky <> '1' AND @Hocky <> '2' AND @Hocky <> '3')
--	Begin
--		print 'Thong tin nhap vao khong hop le hoac khong co hoc ky do'
--		rollback transaction
--		return
--	End
--	if NOT EXISTS ( Select * From KhoaHoc where NamHoc = @NamHoc)
--	Begin
--		print 'Thong tin nhap vao khong hop le hoac khong co hoc ky do'
--		rollback transaction
--		return
--	End
--	if NOT EXISTS ( Select * From GiaoVien where MaGV= @MaGV)
--	Begin
--		print 'Ma giao vien khong ton tai'
--		rollback transaction
--		return
--	End
--	if	( @MaGV NOT IN (Select @MaGV
--		From GiaoVien
--		Where MaBoMon IN (
--		Select distinct  bm.MaBoMon From BoMon bm, Khoa k
--		where bm.MaKhoa = k.MaKhoa
--		AND k.MaKhoa = ( Select MaKhoa from GiaoVu where (MaGVu =  SUSER_SNAME())
--		))) )
--	Begin 
--		print 'Khong the xem lich day cua giao vien khoa khac'
--		rollback transaction
--		return
--	End
--End try
--Begin catch
--			--bao loi
--			print '1- Xem khong thanh cong'
--			rollback transaction
--End catch

--Select 
--LichDay 
--From KhoaHoc 
--where @MaGV = MaGV AND @HocKy = HocKy AND @NamHoc=NamHoc

--commit transaction
--go


--create proc sp_GiaoVuXemThongTinCaNhan
--AS 
--Begin transaction
--	Begin try 
--	if SUSER_SNAME()=null 
--	Begin 
--		print 'Thong tin nhap rong'
--		rollback transaction
--		return
--	End

--	End try
--	 Begin catch 
--			--bao loi
--			print '1- Xem khong thanh cong'
--			rollback transaction
--	End catch
--		Select * From GiaoVu where MaGVu=SUSER_SNAME()
--		commit transaction
--Go

--create proc sp_GiaoVuSuaThongTinCaNhan
--@DienThoai nvarchar(13)
--AS 
--Begin transaction
--	Begin try 
--	if SUSER_SNAME()=null or @DienThoai=null
--	Begin 
--		print 'Thong tin nhap rong'
--		rollback transaction
--		return
--	End

	
--End try
--	 Begin catch 
--			--bao loi
--			print '1- Xem khong thanh cong'
--			rollback transaction
--	End catch
--		Update GiaoVu
--		Set DienThoai = @DienThoai
--		where MaGVu= SUSER_SNAME()
--		commit transaction
--Go

--create proc sp_GiaoVuThemDangKyKhoaHocChoSinhVien
--@MaSV nvarchar(8),
--@MaKhoaHoc nvarchar(15)
--AS
--Begin transaction
--Begin try
--if (@MaSV = null or @MaKhoaHoc = null)
--begin
--	print 'Thong tin nhap vao rong'
--	rollback transaction
--	return
--end
--if (@MaSV NOT IN(
--Select MaSV
--From SinhVien
--Where MaKhoa = (
--Select MaKhoa 
--From GiaoVu
--Where (MaGVu = SUSER_SNAME()))))
--begin
--	print 'Sinh vien khong thuoc khoa ban phu trach'
--	rollback transaction
--	return
--end
--if NOT EXISTS ( Select * From KhoaHoc where @MaKhoaHoc = MaKhoaHoc)
--begin
--	print 'Khoa hoc khong ton tai'
--	rollback transaction
--	return
--end	
--if ( @MaKhoaHoc NOT IN ( Select MaKhoaHoc From KhoaHoc 
--Where MaMonHoc IN (
--Select MaMonHoc from MonHoc where MaBoMon IN (
--Select distinct  bm.MaBoMon From BoMon bm, Khoa k
--where (bm.MaKhoa = (Select MaKhoa from GiaoVu where MaGVu= SUSER_SNAME()))))))
--begin
--	print 'Khoa hoc khong thuoc khoa ban quan ly'
--	rollback transaction
--	return
--end	
--if ( (Select ChoPhepDangKy From KhoaHoc where @MaKhoaHoc = MaKhoaHoc) = 0)
--begin
--	print 'Khoa hoc da dong'
--	rollback transaction
--	return
--end	
--if ((Select Count(*)
--From DangKy
--Where MaKhoaHoc = @MaKhoaHoc) = (Select MaxSinhVien From KhoaHoc where MaKhoaHoc = @MaKhoaHoc ))
--begin
--	print 'Khoa hoc khong con cho trong'
--	rollback transaction
--	return
--end
--if ( EXISTS (Select * From DangKy where MaKhoaHoc = @MaKhoaHoc AND MaSV = @MaSV))
--begin
--	print ' Da co dang ky cua sinh vien nay trong khoa hoc nay'
--	rollback transaction
--	return
--end
--End try
--Begin catch
--	bao loi
--			print '1- Them khong thanh cong'
--			rollback transaction
--End catch
--Insert into DangKy values ( @MaSV, @MaKhoaHoc)
--commit transaction
--go

--create proc sp_GiaoVuHuyDangKyKhoaHocChoSinhVien
--@MaSV nvarchar(8),
--@MaKhoaHoc nvarchar(15)
--AS
--Begin transaction
--Begin try
--if (@MaSV = null or @MaKhoaHoc = null)
--begin
--	print 'Thong tin nhap vao rong'
--	rollback transaction
--	return
--end
--if (@MaSV NOT IN(
--Select MaSV
--From SinhVien
--Where MaKhoa = (
--Select MaKhoa 
--From GiaoVu
--Where (MaGVu = SUSER_SNAME()))))
--begin
--	print 'Sinh vien khong thuoc khoa ban phu trach'
--	rollback transaction
--	return
--end
--if NOT EXISTS ( Select * From KhoaHoc where @MaKhoaHoc = MaKhoaHoc)
--begin
--	print 'Khoa hoc khong ton tai'
--	rollback transaction
--	return
--end	
--if ( @MaKhoaHoc NOT IN ( Select MaKhoaHoc From KhoaHoc 
--Where MaMonHoc IN (
--Select MaMonHoc from MonHoc where MaBoMon IN (
--Select distinct  bm.MaBoMon From BoMon bm, Khoa k
--where (bm.MaKhoa = (Select MaKhoa from GiaoVu where MaGVu= SUSER_SNAME()))))))
--begin
--	print 'Khoa hoc khong thuoc khoa ban quan ly'
--	rollback transaction
--	return
--end
--if ( (Select ChoPhepDangKy From KhoaHoc where @MaKhoaHoc = MaKhoaHoc) = 0)
--begin
--	print 'Khoa hoc da dong'
--	rollback transaction
--	return
--end		
--if ( NOT EXISTS (Select * From DangKy where MaKhoaHoc = @MaKhoaHoc AND MaSV = @MaSV))
--begin
--	print ' Khong co dang ky cua sinh vien nay trong khoa hoc nay'
--	rollback transaction
--	return
--end
--End try
--Begin catch
--	--bao loi
--			print '1- Them khong thanh cong'
--			rollback transaction
--End catch
--Delete
--From DangKy
--Where MaSV = @MaSV AND @MaKhoaHoc = MaKhoaHoc
--commit transaction
--go


--create proc sp_SinhVienXemDanhSachMonDangMo
--AS
--Begin transaction
--Begin try
-- if NOT EXISTS ( Select * From SinhVien where MaSV = SUSER_SNAME())
-- begin
--	print 'Error'
--	rollback transaction
-- end
--End try
-- Begin catch
--	--bao loi
--			print '1- Xem khong thanh cong'
--			rollback transaction
--End catch
--Declare @MaKhoa nvarchar(10)

--Set @MaKhoa = ( Select MaKhoa From SinhVien where MaSV = SUSER_SNAME())


--Select MaKhoaHoc,MaMonHoc,MaGV,LichDay  from KhoaHoc where MaMonHoc IN (
--Select MaMonHoc from MonHoc where MaBoMon IN (
--Select distinct  MaBoMon From BoMon where MaKhoa = @MaKhoa)) AND ChoPhepDangKy = 1

--commit transaction
--go

--create proc sp_SinhVienDangKyKhoaHoc
--@MaKhoaHoc nvarchar(15)
--AS
--Begin transaction
--Declare @MaKhoa nvarchar(10)
--Set @MaKhoa = ( Select MaKhoa From SinhVien where MaSV = SUSER_SNAME())
--Begin try
--if ( @MaKhoaHoc NOT IN(Select MaKhoaHoc from KhoaHoc where MaMonHoc IN (
--Select MaMonHoc from MonHoc where MaBoMon IN (
--Select distinct  MaBoMon From BoMon where MaKhoa = @MaKhoa))))
--Begin 
--	print 'Khoa hoc khong thuoc khoa cua ban'
--	rollback transaction
--end
--if NOT EXISTS ( Select * from KhoaHoc where @MaKhoaHoc = MaKhoaHoc)
--Begin 
--	print 'Khoa hoc khong ton tai hoac da dong'
--	rollback transaction
--end
--if (( Select ChoPhepDangKy from KhoaHoc where @MaKhoaHoc = MaKhoaHoc) = 0 )
--Begin 
--	print 'Khoa hoc da dong'
--	rollback transaction
--end
--if EXISTS ( Select * from DangKy where @MaKhoaHoc = MaKhoaHoc AND MaSV = SUSER_SNAME())
--Begin
--	print 'Ban da dang ky roi ma'
--	rollback transaction
--end
--if ((Select Count(*)
--From DangKy
--Where MaKhoaHoc = @MaKhoaHoc) = (Select MaxSinhVien From KhoaHoc where MaKhoaHoc = @MaKhoaHoc ))
--begin
--	print 'Khoa hoc khong con cho trong'
--	rollback transaction
--	return
--end
--End try
--Begin catch
--	--bao loi
--			print '1- Xem khong thanh cong'
--			rollback transaction
--End catch
--Insert into DangKy values ( SUSER_SNAME(), @MaKhoaHoc)
--commit transaction
--go



--create proc sp_SinhVienHuyDangKyKhoaHoc
--@MaKhoaHoc nvarchar(15)
--AS
--Begin transaction
--Declare @MaKhoa nvarchar(10)
--Set @MaKhoa = ( Select MaKhoa From SinhVien where MaSV = SUSER_SNAME())
--Begin try
--if ( @MaKhoaHoc NOT IN(Select MaKhoaHoc from KhoaHoc where MaMonHoc IN (
--Select MaMonHoc from MonHoc where MaBoMon IN (
--Select distinct  MaBoMon From BoMon where MaKhoa = @MaKhoa))))
--Begin 
--	print 'Khong the thao tac tren khoa hoc khong thuoc khoa cua ban'
--	rollback transaction
--end
--if NOT EXISTS ( Select * from KhoaHoc where @MaKhoaHoc = MaKhoaHoc)
--Begin 
--	print 'Khoa hoc khong ton tai hoac da dong'
--	rollback transaction
--end
--if (( Select ChoPhepDangKy from KhoaHoc where @MaKhoaHoc = MaKhoaHoc) = 0 )
--Begin 
--	print 'Khoa hoc da dong'
--	rollback transaction
--end
--if NOT EXISTS ( Select * from DangKy where @MaKhoaHoc = MaKhoaHoc AND MaSV = SUSER_SNAME())
--Begin
--	print 'Ban chua dang ky '
--	rollback transaction
--end
--End try
--Begin catch
--	--bao loi
--			print '1- Huy dang ky khong thanh cong'
--			rollback transaction
--End catch
--Delete from DangKy
--where MaKhoaHoc = @MaKhoaHoc AND MaSV= SUSER_SNAME()
--commit transaction
--go

--create proc sp_SinhVienXemDiem
--AS
--Begin transaction
--Begin try
--if NOT EXISTS ( Select * from Diem where MaSV = SUSER_SNAME())
--begin
--	print 'Empty'
--	rollback transaction
--end
--End try
--Begin catch
--	--bao loi
--			print '1- Xem khong thanh cong'
--			rollback transaction
--End catch
--Select * from Diem where MaSV = SUSER_SNAME()
--commit transaction
--go


--create proc sp_SinhVienSuaThongTinCaNhan
--@DienThoai nvarchar(13) 
--AS
--Begin transaction
--Begin try
--if NOT EXISTS ( Select * from Diem where MaSV = SUSER_SNAME())
--begin
--	print 'Empty'
--	rollback transaction
--end
--End try
--Begin catch
--	--bao loi
--			print '1- Xem khong thanh cong'
--			rollback transaction
--End catch
--Update SinhVien
--Set DienThoai = @DienThoai 
--Where MaSV = SUSER_SNAME()
--commit transaction
--go


--create proc sp_GiaoVuSuaThongTinSinhVien
--@MaSVcu nvarchar(8),
--@MaKhoa nvarchar(10),
--@MaLop nvarchar(10),
--@MaSVmoi nvarchar(8) 
--AS 
--Begin transaction
--Begin try
--if (@MaSVcu NOT IN(
--Select MaSV
--From SinhVien
--Where MaKhoa = (
--Select MaKhoa 
--From GiaoVu
--Where (MaGVu = SUSER_SNAME()))))
--begin
--	print 'Sinh vien khong thuoc khoa ban phu trach'
--	rollback transaction
--	return
--end	

--if NOT EXISTS ( Select * From Khoa where MaKhoa = @MaKhoa )
--begin
--	print 'Khoa khong ton tai'
--	rollback transaction
--	return
--end	

--if NOT EXISTS ( Select * From LopHoc where MaKhoa = @MaKhoa AND MaLop = @MaLop )
--begin
--	print 'Lop khong ton tai hoac khong thuoc khoa da chon'
--	rollback transaction
--	return
--end	
--End try
--Begin catch
--	--bao loi
--			print '1- Sua khong thanh cong'
--			rollback transaction
--End catch

--Update SinhVien
--Set MaSV = @MaSVmoi, MaKhoa = @MaKhoa, MaLop = @MaLop 
--Where MaSV = @MaSVcu
--commit transaction
--go




