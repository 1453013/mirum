use QLSV2


--Select distinct k.MaKhoa
--From BoMon bm, Khoa k
--Where 
--k.MaKhoa = bm.MaKhoa AND bm.MaBoMon = 'it001'


--Select distinct  bm.MaBoMon From BoMon bm, Khoa k
--where bm.MaKhoa = (Select distinct k.MaKhoa
--From BoMon bm, Khoa k
--Where 
--k.MaKhoa = bm.MaKhoa AND bm.MaBoMon = 'it001')

--Select * 
--From MonHoc
--Where MaBoMon IN (
--Select distinct  bm.MaBoMon From BoMon bm, Khoa k
--where bm.MaKhoa = (Select distinct k.MaKhoa
--From BoMon bm, Khoa k
--Where 
--k.MaKhoa = bm.MaKhoa AND bm.MaBoMon = (
--Select MaBoMon
--From GiaoVien
--Where MaGV=))
--)


--Select distinct k.MaKhoa
--From BoMon bm, Khoa k
--Where 
--k.MaKhoa = bm.MaKhoa AND bm.MaBoMon = 'it001'

--Select distinct k.MaKhoa
--From BoMon bm, Khoa k, GiaoVien gv
--Where 
--bm.MaKhoa= k.MaKhoa
--AND gv.MaBoMon = bm.MaBoMon
--AND gv.MaGV = 'DQTuan'


--Declare @NamHoc  int
--Set @NamHoc = (Select NamHoc From KhoaHoc where MaKhoaHoc = 'BTF17732017')
--Print YEAR(getdate()) - @NamHoc

--Select * 
--From MonHoc
--Where MaBoMon IN (
--Select distinct  bm.MaBoMon From BoMon bm, Khoa k
--where k.TruongKhoa = 'nthung' )


--Select * 
--From MonHoc
--Where MaBoMon IN (
--Select distinct  bm.MaBoMon From BoMon bm, Khoa k
--where bm.MaKhoa = k.MaKhoa
--AND k.TruongKhoa = 'nthung'
--)


--Select * 
--From KhoaHoc
--Where
--ChoPhepDangKy = 1 AND
--MaMonHoc IN (
--Select distinct MaMonHoc
--From MonHoc
--Where MaBoMon IN (
--Select distinct  bm.MaBoMon From BoMon bm, Khoa k
--where (bm.MaKhoa = k.MaKhoa
--AND k.TruongKhoa = 'nthung') OR (bm.MaKhoa = (Select MaKhoa from GiaoVu where MaGVu= 'gctuong') )))


--Select MaGV
--From GiaoVien
--Where MaBoMon = ( Select MaBoMon From BoMon where TruongBoMon = 'ttbhanh')


--Select *
--From MonHoc
--Where MaBoMon IN (
--Select distinct  bm.MaBoMon From BoMon bm, Khoa k
--where bm.MaKhoa = k.MaKhoa
--AND k.MaKhoa = ( Select MaKhoa from GiaoVu where (MaGVu = 'ntvan')
--))

--Select *
--From GiaoVien
--Where MaBoMon =  ( Select MaBoMon from MonHoc where MaMonHoc='CTT451')

--Declare @MaMonHoc nvarchar(10),
--@HocKy nvarchar(1),
--@NamHoc nvarchar(255),
--@MaKhoaHoc nvarchar(15);

--Set @MaMonHoc = 'CTT303'
--Set @HocKy = '1'
--Set @NamHoc = '2018'

--Set @MaKhoaHoc = @MaMonHoc + @HocKy + @NamHoc

--Print @MaKhoaHoc



--Select * 
--From Diem
--Where MaKhoaHoc IN ( Select MaKhoaHoc From KhoaHoc 
--Where MaMonHoc IN (
--Select MaMonHoc from MonHoc where MaBoMon IN (
--Select distinct  bm.MaBoMon From BoMon bm, Khoa k
--where (bm.MaKhoa = k.MaKhoa
--AND k.TruongKhoa = '') OR (bm.MaKhoa = (Select MaKhoa from GiaoVu where MaGVu= 'ntvan') ))))

--Select MaKhoaHoc From KhoaHoc 
--Where MaMonHoc IN (
--Select MaMonHoc from MonHoc where MaBoMon IN (
--Select distinct  bm.MaBoMon From BoMon bm, Khoa k
--where (bm.MaKhoa = k.MaKhoa
--AND k.TruongKhoa = '') OR (bm.MaKhoa = (Select MaKhoa from GiaoVu where MaGVu= 'ntvan') )))



--if ((Select Count(*)
--From DangKy
--Where MaKhoaHoc = 'CTT00532017') = (Select MaxSinhVien From KhoaHoc where MaKhoaHoc = 'CTT00532017' ))
--begin
--	print 'Khoa hoc khong con cho trong'
--	rollback transaction
--	return
--end 

--Declare @A int
--Declare @B int


--Set @A  = (Select Count(*)
--From DangKy
--Where MaKhoaHoc = 'CTT00532017') 
--Set @B = (Select MaxSinhVien From KhoaHoc where MaKhoaHoc = 'CTT00532017' )

--Print @A
--Print @B



-- Select MaSV
--From DangKy
--where MaKhoaHoc IN ( Select MaKhoaHoc From KhoaHoc 
--Where MaMonHoc IN (
--Select MaMonHoc from MonHoc where MaBoMon IN (
--Select distinct  bm.MaBoMon From BoMon bm, Khoa k
--where (bm.MaKhoa = (Select MaKhoa from GiaoVu where MaGVu= 'ntvan')))))

--Select MaSV
--From SinhVien
--Where MaKhoa = (
--Select MaKhoa 
--From GiaoVu
--Where (MaGVu = 'ntvan'))

Select * from KhoaHoc where MaMonHoc IN (
Select MaMonHoc from MonHoc where MaBoMon IN (
Select distinct  MaBoMon From BoMon where MaKhoa = '53'))