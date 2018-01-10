--Tra Ngoc Hai 1453013
--Tao database
create database QLDT
go

use QLDT
go

--tao table


create table ChuDe
(
	MaCD nvarchar(10),
	TenCD nvarchar(225)
	Primary key (MaCD)
)
GO
create table DeTai 
(
	MaDT nvarchar(10),
	TenDT nvarchar(225),
	CapQL int,
	KinhPhi decimal(38),
	NgayBD date,
	NgayKT date,
	MaCD nvarchar(10),
	GVCNDT nvarchar(10),
	Primary key (MaDT),
	Foreign key (MaCD) references ChuDe(MaCD)
)
GO

create table GiaoVien
(
	MaGV nvarchar(10),
	HoTen nvarchar(225),
	Luong decimal(38),
	Phai int,
	NgSinh date,
	DiaChi nvarchar(225),
	GVQLCM nvarchar(10),
	MaBM nvarchar(10),
	Primary key (MaGV),
	Foreign key (GVQLCM) references GiaoVien(MaGV)
)
GO
create table NguoiThan
(
	MaGV nvarchar(10),
	Ten nvarchar(225),
	NgSinh date,
	Phai bit,
	CONSTRAINT NgTHan_MaGV_Ten PRIMARY KEY (MaGv,Ten),
	Foreign key (MaGV) references GiaoVien(MaGV)
)
GO
create table GvDt
(
	MaGV nvarchar(10),
	DienThoai nvarchar(20),
	CONSTRAINT GvDt_MaGV_DT PRIMARY KEY (MaGV,DienThoai),
	Foreign key (MaGV) references GiaoVien(MaGV)
)
GO
create table Khoa
(	
	MaKhoa nvarchar(10),
	TenKhoa nvarchar(225),
	NamTL date,
	Phong nvarchar(10),
	DienThoai nvarchar(20),
	TruongKhoa nvarchar(10),
	NgayNhanChuc date,
	Primary key (MaKhoa),
	Foreign key (TruongKhoa) references GiaoVien(MaGV)
)
GO
create table BoMon
(
	MaBM nvarchar(10),
	TenBM nvarchar(225),
	Phong nvarchar(10),
	DienThoai nvarchar(20),
	TruongBM nvarchar(10),
	MaKhoa nvarchar(10),
	NgayNhanChuc date,
	Primary key (MaBM),
	Foreign key (TruongBM) references GiaoVien(MaGV),
	Foreign key (MaKhoa) references Khoa(MaKhoa)
)
GO
create table CongViec
(
	MaDT nvarchar(10) not null,
	SoTT tinyint IDENTITY(1,1) not null,
	TenCV nvarchar(225),
	NgayBD date,
	NgayKT date,
)
GO
create table ThamGiaDT
(
	MaGV nvarchar(10) not null,
	MaDT nvarchar(10) not null,
	SoTT tinyint IDENTITY(1,1) not null,
	PhuCap decimal(38),
	KetQua nvarchar(225),
)
GO

-- them cac constraint
Alter table ThamGiaDT Add CONSTRAINT ThamGiaDT_MaGV_MaDT_SoTT PRIMARY KEY (MaGV,MaDT,SoTT)
GO
Alter table  ThamGiaDT Add CONSTRAINT ThamGiaDT_MaGV Foreign key (MaGV) references GiaoVien(MaGV)
GO
Alter table CongViec Add CONSTRAINT CongViec_MaDT_SoTT Primary key (MaDT,SoTT)
GO
Alter table CongViec Add constraint CongViec_MaDT foreign key(MaDT) references  DeTai(MaDT)
GO
Alter table DeTai add foreign key (MaCD) references ChuDe(MaCD)
GO
Alter table DeTai add foreign key (GVCNDT) references GiaoVien(MaGV)
GO
Alter table GiaoVien add foreign key (MaBM) references BoMoN(MaBM)
GO
Alter table  ThamGiaDT Add CONSTRAINT ThamGiaDT_MaDT Foreign key (MaDT,SoTT) references CongViec(MaDT,SoTT)
GO
--them du lieu
Insert into GiaoVien values ('ngson','Nguyen Son','30000000',1,'8/8/1980','25 Tan Hung St. Ward 12 Dist. 5',null,null),
							('ngphuc','Nguyen Phuc','20000000',1,'7/8/1982','148 BisNam Ky Khoi Nghia Street',null,null),
							('ngtuan','Nguyen Tuan','20000000',1,'9/3/1985','110 Nguyen Trong Tuyen, Ward 15',null,null),
							('ttu','Thanh Tu','15000000',0,'5/5/1986','27 Nguyen Trai St., Lane 263/18','ngson',null),
							('mthu','Minh Thu','15000000',0,'6/9/1987','26 BC Phan Van Tri Street, Ward 7','ngphuc',null),
							('nthao','Ngoc Thao','15000000',0,'3/5/1988','424 lane, Thuy Khue st','ngtuan',null)
				
Insert into Khoa values ('IT','Cong nghe thong tin','1990','I99','0982847199','ngson','1/1/2010')

Insert into BoMon values ('KHMT','Khoa hoc may tinh','I98','0982847198','ngphuc','IT','1/2/2015'),
					 ('HTTT','He thong thong tin','I97','0982847197','ngtuan','IT','3/2/2012'),
					  ('TGMT','Thi Giac May Tinh','I96','0982847196','ngson','IT','3/5/2013')

Insert into ChuDe values ('1','Tich hop dich vu'),
						 ('2','Hoc may thong kê ung dung'),
						 ('3','Tuong tac nguoi-may')

Insert into DeTai values ('11','Xay dung ung dung tren thiet bi di dong de tra cuu thong tin theo dia diem','3','15000000','1/1/2017','12/12/2017','1','ngtuan'),
						 ('21','Nghien cuu phat trien he thong mLearning o quy mo nho','3','15000000','1/1/2017','12/12/2017','2','ngphuc'),
						 ('31','Xay dung cong cu ho tro soan thao van ban bang tieng noi tich hop trong Microsoft Word','3','15000000','1/1/2017','12/12/2017','2','ngson')

Insert into CongViec values ('11','Thu Thap Tai Lieu','2/1/2017','4/4/2017'),
							('21','Thu Thap Tai Lieu','2/1/2017','4/4/2017'),
							('31','Thu Thap Tai Lieu','2/1/2017','4/4/2017')

Insert into ThamGiaDT values ('ngtuan','11','1000000','hoanthanh'),
							('ngphuc','21','1000000','hoanthanh'),
							('ngson','31','1000000','hoanthanh')

update GiaoVien 
	set MaBM = ('TGMT') where (MaGV='ngson' or MaGV='ttu')
update GiaoVien
	set MaBM = ('HTTT') where (MaGV='ngtuan' or MaGV='nthao')
update GiaoVien
	set MaBM = ('KHMT') where (MaGV='mthu' or MaGV='ngphuc')



-- Giao tac them nguoi than
-- kiem tra thong tin nhap co null khong
-- Kiem tra ma giao vien ton tai
-- Kiem tra nguoi sinh, gioi tinh hop le
Create proc ThemNguoiThan
@MaGV nvarchar(10),
@Ten nvarchar(225),
@NgaySinh date,
@Phai bit
AS
Begin transaction
	Begin try 
	if @MaGV = null OR @Ten = null or @NgaySinh = null or @Phai = null
	Begin 
		print 'Thong tin nhap khong hop le'
		rollback transaction
		return
	End


	if NOT EXISTS (Select *
					From GiaoVien
					Where MaGv = @MaGV)
	Begin 
		print 'MaGV khong ton tai'
		rollback transaction
		return
	End
	
	if @NgaySinh > GETDATE()
		Begin 
			print 'Ngay sinh khong hop le'
			rollback transaction
			return
		End
	if @Phai<>0 AND @Phai<>1
		Begin
			print 'Gioi tinh khong hop le'
			rollback transaction
			return
		End		
	 End try

	 Begin catch 
			--bao loi
			print '1- Them khong thanh cong'
			rollback transaction
	End catch
		--bao thanh cong va them du lieu vao db
		Insert into NguoiThan values (@MaGV,@Ten,@NgaySinh,@Phai)	
		print '0- Them thanh cong';
		commit transaction
GO 
-- goi store
EXECUTE ThemNguoiThan 'ngson','Nguyen Quy','10/10/2010',1 

-- giao tac them giao vien
-- kiem tra thong tin nhap vao co null khong
-- kiem tra ma bo mon, gv ql ton tai
-- kiem tra ngay sinh, gioi tinh hop le
Create proc ThemGiaoVien
@MaGV nvarchar(10),
@HoTen nvarchar(225),
@Luong decimal(38),
@Phai int,
@NgSinh date,
@DiaChi nvarchar(225),
@GVQLCM nvarchar(10),
@MaBM nvarchar(10)
AS
Begin transaction
	Begin try 
	if @MaGV = null OR @HoTen = null or @NgSinh = null or @Phai = null or @MaBM = null or @GVQLCM=null
	Begin 
		print 'Thong tin nhap khong hop le'
		rollback transaction
		return
	End

	if EXISTS (Select * 
				From GiaoVien 
				where MaGV=@MaGV)
	Begin 
		print 'MaGV da ton tai'
		rollback transaction
		return
	End
	if NOT EXISTS (Select *
					From GiaoVien
					Where MaGV = @GVQLCM)
	Begin 
		print 'GVQLCM khong ton tai'
		rollback transaction
		return
	End
	if NOT EXISTS (Select *
					From BoMon
					Where MaBM = @MaBM)
	Begin 
		print 'MaBM khong ton tai'
		rollback transaction
		return
	End
	if @NgSinh > GETDATE()
		Begin 
			print 'Ngay sinh khong hop le'
			rollback transaction
			return
		End
	if @Phai<>0 AND @Phai<>1
		Begin
			print 'Gioi tinh khong hop le'
			rollback transaction
			return
		End		
	 End try

	 Begin catch 
			--bao loi
			print '1- Them khong thanh cong'
			rollback transaction
	End catch
		--bao thanh cong va them du lieu vao db
		Insert into GiaoVien values (@MaGV,@HoTen,@Luong,@Phai,@NgSinh,@DiaChi,@GVQLCM,@MaBM)	
		print '0- Them thanh cong';
		commit transaction
GO 


--goi store
EXECUTE ThemGiaoVien 'ttuan','Tran Tuan','10000000','1','10/20/1989','180 Ly Chinh Thang Street, Ward 9, District 3','ngson','TGMT'

-- giao tac cap nhat truong bo mon
-- kiem tra thong tin nhap vao khong null
-- kiem tra ma bo mon ton tai
-- kiem tra giao vien thuoc bo mon do

Create proc CapNhatTruongBoMon
@MaBM nvarchar(10),
@TruongBM nvarchar(10),
@NgayNhanChuc date
AS
Begin transaction
	Begin try
		if @TruongBM = null OR @NgayNhanChuc = null or @MaBM = null
		Begin 
			print 'Thong tin nhap khong hop le'
			rollback transaction
			return
		End
		if NOT EXISTS (Select *
						From BoMon
						Where MaBM= @@MaBM)
		Begin 
			Print 'MaBM khong ton tai'
			rollback transaction
			return
		End
		if NOT EXISTS (Select *
						From GiaoVien
						Where MaGV= @TruongBM)
		Begin 
			Print 'MaGV khong ton tai'
			rollback transaction
			return
		End
		if @MaBM <> (Select MaBm From GiaoVien Where MaGV =@TruongBM)
		Begin
			Print 'Khong the set giao vien bo mon khac thanh truong bo mon nay'
			rollback transaction
			return
		End
	End try
	Begin catch 
			--bao loi
			print '1- Cap nhat khong thanh cong'
			rollback transaction
	End catch
		--bao thanh cong va them du lieu vao db
		Update BoMon
		Set TruongBM = @TruongBm, NgayNhanChuc=@NgayNhanChuc
		Where (MaBM = @MaBM)
		print '0- Cap nhat thanh cong';
		commit transaction
GO

--goi store
EXECUTE CapNhatTruongBoMon 'HTTT','ngtuan','10/10/2015'

-- giao tac cap nhat chu nhiem de tai
-- kiem tra thong tin nhap vao khong null
-- kiem tra ma de tai toan tai
-- kiem tra ma giao vien ton tai
Create proc CapNhatChuNhiemDeTai
@MaDT nvarchar(10),
@GVCNDT nvarchar(10)
AS
Begin transaction
	Begin try
		if @MaDT = null OR @GVCNDT = null 
		Begin 
			print 'Thong tin nhap khong hop le'
			rollback transaction
			return
		End
		if NOT EXISTS (Select *
						From DeTai
						Where MaDT= @MaDT)
		Begin 
			Print 'MaDT khong ton tai'
			rollback transaction
			return
		End
		if NOT EXISTS (Select *
						From GiaoVien
						Where MaGV= @GVCNDT)
		Begin 
			Print 'MaGV khong ton tai'
			rollback transaction
			return
		End
	End try
	Begin catch 
			--bao loi
			print '1- Cap nhat khong thanh cong'
			rollback transaction
	End catch
		--bao thanh cong va them du lieu vao db
		Update DeTai
		Set GVCNDT = @GVCNDT
		Where (MaDT = @MaDT)
		print '0- Cap nhat thanh cong';
		commit transaction
GO

EXECUTE CapNhatChuNhiemDeTai '11','ttu' 

-- giao tac them tham gia de tai
-- kiem tra ma giao vien ton tai
-- kiem tra ma de tai ton tai
-- kiem tra phu cap hop le 

Create proc ThemThamGiaDeTai
@MaGV nvarchar(10),
@MaDT nvarchar(10),
@PhuCap decimal(38),
@KetQua nvarchar(225)
AS
Begin transaction
	Begin try 
	if @MaGV = null OR @MaDT = null or @PhuCap = null or @KetQua = null
	Begin 
		print 'Thong tin nhap khong hop le'
		rollback transaction
		return
	End


	if NOT EXISTS (Select *
					From GiaoVien
					Where MaGv = @MaGV)
	Begin 
		print 'MaGV khong ton tai'
		rollback transaction
		return
	End
	
	if NOT EXISTS (Select *
					From CongViec
					Where MaDT = @MaDT)
	Begin 
		print 'MaDT khong ton tai'
		rollback transaction
		return
	End
	
	if @PhuCap > (Select KinhPhi From DeTai where MaDT = @MaDT)
	Begin 
		print 'Phu cap lon hon kinh phi cua de tai'
		rollback transaction
		return
	End
		
	 End try

	 Begin catch 
			--bao loi
			print '1- Them khong thanh cong'
			rollback transaction
	End catch
		--bao thanh cong va them du lieu vao db
		Insert into ThamGiaDT values (@MaGV,@MaDT,@PhuCap,@KetQua)	
		print '0- Them thanh cong';
		commit transaction
GO 
--goi store
EXECUTE ThemThamGiaDeTai 'ttu','21','2000000','Hoan thanh'

-- giao tac cap nhat tham gia de tai
-- kiem tra thong tin nhap vao khong null
-- kiem tra tham gia de tai ton tai
-- kiem tra phu cap moi phu hop voi kinh phi

Create proc CapNhatThamGiaDeTai 
@MaGV nvarchar(10),
@MaDT nvarchar(10),
@PhuCap decimal(38),
@KetQua nvarchar(225)
AS
Begin transaction
	Begin try 
	if @MaGV = null OR @MaDT = null or @PhuCap = null or @KetQua = null
	Begin 
		print 'Thong tin nhap khong hop le'
		rollback transaction
		return
	End


	if NOT EXISTS (Select *
					From ThamGiaDT
					Where MaGv = @MaGV AND MaDT=@MaDT)
	Begin 
		print 'ThamGiaDT khong ton tai'
		rollback transaction
		return
	End
	
	if @PhuCap > (Select KinhPhi From DeTai where MaDT = @MaDT)
	Begin 
		print 'Phu cap lon hon kinh phi cua de tai'
		rollback transaction
		return
	End
		
	 End try

	 Begin catch 
			--bao loi
			print '1- Cap nhat khong thanh cong'
			rollback transaction
	End catch
		--bao thanh cong va cap nhat du lieu vao db
		Update ThamGiaDT
		Set PhuCap= @PhuCap, KetQua= @KetQua
		Where MaDT = @MaDT AND MaGV = @MaGV
		print '0- Cap nhat thanh cong';
		commit transaction
GO 
--goi store
EXECUTE CapNhatThamGiaDeTai 'ngphuc','21','1500000','hoan thanh tot'

-- giao tac xoa tham gia de tai
-- kiem tra thong tin nhap vao khong null
-- kiem tra tham gia de tai ton tai
-- kiem tra cong viec da ket thuc hay chua
Create proc XoaThamGiaDeTai
@MaGV nvarchar(10),
@MaDT nvarchar(10)
AS
Begin transaction
Declare @SoTTtemp tinyint;
Set @SoTTtemp = (Select SoTT  from ThamGiaDT where MaDT=@MaDT)
Begin try 
if @MaGV = null OR @MaDT = null 
	Begin 
		print 'Thong tin nhap khong hop le'
		rollback transaction
		return
	End
	if NOT EXISTS (Select *
					From ThamGiaDT
					Where MaGv = @MaGV AND MaDT=@MaDT)
	Begin 
		print 'ThamGiaDT khong ton tai'
		rollback transaction
		return
	End


	if (Select NgayKT 
		from CongViec 
		where MaDT = @MaDT AND SoTT = @SoTTtemp) < GETDATE()
	Begin 
		print 'Cong viec chua ket thuc, khong the xoa tham gia'
		rollback transaction
		return
	End
	End try 
	Begin catch 
			--bao loi
			print '1- Xoa khong thanh cong'
			rollback transaction
	End catch
		--bao thanh cong va cap nhat du lieu vao db
		Delete from ThamGiaDT
		Where MaDT = @MaDT AND MaGV = @MaGV
		print '0- Xoa thanh cong';
		commit transaction
GO 

--goi store
EXECUTE XoaThamGiaDT 'ngtuan','11'