--create database QLDT
go

use QLDT
go

/*
create table ChuDe
(
	MaCD nvarchar(10),
	TenCD nvarchar(50)
	Primary key (MaCD)
)

create table DeTai 
(
	MaDT nvarchar(10),
	TenDT nvarchar(50),
	CapQL int,
	KinhPhi decimal(38),
	NgayBD date,
	NgayKT date,
	MaCD nvarchar(10),
	GVCNDT nvarchar(10),
	Primary key (MaDT),
	Foreign key (MaCD) references ChuDe(MaCD)
)


create table GiaoVien
(
	MaGV nvarchar(10),
	HoTen nvarchar(50),
	Luong decimal(38),
	Phai int,
	NgSinh date,
	DiaChi nvarchar(50),
	GVQLCM nvarchar(10),
	MaBM nvarchar(10),
	Primary key (MaGV),
	Foreign key (GVQLCM) references GiaoVien(MaGV)
)

create table NguoiThan
(
	MaGV nvarchar(10),
	Ten nvarchar(30),
	NgSinh date,
	Phai bit,
	CONSTRAINT NgTHan_MaGV_Ten PRIMARY KEY (MaGv,Ten),
	Foreign key (MaGV) references GiaoVien(MaGV)
)

create table GvDt
(
	MaGV nvarchar(10),
	DienThoai nvarchar(20),
	CONSTRAINT GvDt_MaGV_DT PRIMARY KEY (MaGV,DienThoai),
	Foreign key (MaGV) references GiaoVien(MaGV)
)


create table Khoa
(	
	MaKhoa nvarchar(10),
	TenKhoa nvarchar(50),
	NamTL date,
	Phong nvarchar(10),
	DienThoai nvarchar(20),
	TruongKhoa nvarchar(10),
	NgayNhanChuc date,
	Primary key (MaKhoa),
	Foreign key (TruongKhoa) references GiaoVien(MaGV)
)

create table BoMon
(
	MaBM nvarchar(10),
	TenBM nvarchar(50),
	Phong nvarchar(10),
	DienThoai nvarchar(20),
	TruongBM nvarchar(10),
	MaKhoa nvarchar(10),
	NgayNhanChuc date,
	Primary key (MaBM),
	Foreign key (TruongBM) references GiaoVien(MaGV),
	Foreign key (MaKhoa) references Khoa(MaKhoa)
)


create table CongViec
(
	MaDT nvarchar(10) unique,
	SoTT tinyint,
	TenCV nvarchar(100),
	NgayBD date,
	NgayKT date,
	CONSTRAINT CongViec_MaDT_SoTT PRIMARY KEY (MaDT,SoTT),
	Foreign key (MaDT) references  DeTai(MaDT)
)


create table ThamGiaDT
(
	MaGV nvarchar(10),
	MaDT nvarchar(10),
	STT int IDENTITY(1,1),
	PhuCap decimal(38),
	KetQua nvarchar(50),
	CONSTRAINT ThamGiaDT_MaGV_MaDT_STT PRIMARY KEY (MaGV,MaDT,STT),
	Foreign key (MaGV) references GiaoVien(MaGV),
	Foreign key (MaDT) references CongViec(MaDT),
)


Alter table DeTai add foreign key (MaCD) references ChuDe(MaCD)

Alter table DeTai add foreign key (GVCNDT) references GiaoVien(MaGV)

Alter table GiaoVien add foreign key (MaBM) references BoMoN(MaBM)


GO


CREATE PROC ThemCongViec
@MaDT nvarchar(10),
@TenCV nvarchar(100),
@NgayBD date,
@NgayKT date
ASBegin transaction	Begin try 	if @MaDT = null OR @NgayBD = null or @NgayKT = null	Begin 		print 'Thong tin nhap khong hop le'		rollback transaction		return	End	if NOT EXISTS (Select *
					From DeTai
					Where MaDT = @MaDT)
	Begin 
		print 'MaDT khong hop le'
		rollback transaction
		return
	End
	
	if @NgayBD < (Select NgayBD From DeTai where MaDT = @MaDT)
		Begin 
			print 'Ngay bat dau khong hop le'
			rollback transaction
			return
		End
	
	if @NgayKT > (Select NgayKT From DeTai where MaDT = @MaDT)
		Begin 
			print 'Ngay bat dau khong hop le'
			rollback transaction
			return
		End
		
	 End try

	 Begin catch 
			--bao loi
			print '1- Them khong thanh cong'
			rollback transaction
	End catch
		--bao thanh cong ma them du lieu vao db
		Insert into CongViec values (@MaDT,@TenCV,null,@NgayBD,@NgayKT)	
		print '0- Them thanh cong';
		commit transactionGo


Create proc CapNhatCongViec@MaDT nvarchar(10),
@SoTT tinyint,
@TenCV nvarchar(100),
@NgayBD date,
@NgayKT date
ASBegin transaction	Begin try 	if @MaDT = null OR @NgayBD = null or @NgayKT = null	Begin 		print 'Thong tin nhap khong hop le'		rollback transaction		return	End	if NOT EXISTS (Select *
					From DeTai
					Where MaDT = @MaDT)
	Begin 
		print 'MaDT khong hop le'
		rollback transaction
		return
	End

	else if NOT EXISTS (Select *
					From CongViec
					Where MaDT = @MaDT AND SoTT= @SoTT)
	Begin 
		print 'STT khong hop le'
		rollback transaction
		return
	End
	
	if @NgayBD < (Select NgayBD From DeTai where MaDT = @MaDT)
		Begin 
			print 'Ngay bat dau khong hop le'
			rollback transaction
			return
		End
	
	if @NgayKT > (Select NgayKT From DeTai where MaDT = @MaDT)
		Begin 
			print 'Ngay bat dau khong hop le'
			rollback transaction
			return
		End
	
	if @TenCV = (Select NgayKT From DeTai where MaDT = @MaDT)
		Begin 
			print 'Vui long nhap ten cong viec moi'
			rollback transaction
			return
		End
	if @NgayBD = (Select NgayBD From DeTai where MaDT = @MaDT)
		Begin 
			print 'Vui long nhap ngay bat dau moi'
			rollback transaction
			return
		End
	
	if @NgayKT = (Select NgayKT From DeTai where MaDT = @MaDT)
		Begin 
			print 'Vui long nhap ngay cong viec moi'
			rollback transaction
			return
		End
	End try

	 Begin catch 
			--bao loi
			print '1- Cap nhat khong thanh cong'
			rollback transaction
	End catch
		--bao thanh cong ma them du lieu vao db
		Update CongViec
		Set TenCV=@TenCV , NgayBD = @NgayBD, NgayKT=@NgayKT
		Where (MaDT= @MaDT AND SoTT= @SoTT)
		print '0- Cap nhat thanh cong';
		commit transactionGo


Create Proc XoaCongViec@MaDT nvarchar(10),
@SoTT tinyint
ASBegin transaction	Begin try 	if @MaDT = null OR @SoTT = null	Begin 		print 'Thong tin nhap khong hop le'		rollback transaction		return	End	if NOT EXISTS (Select *
					From DeTai
					Where MaDT = @MaDT)
	Begin 
		print 'MaDT khong hop le'
		rollback transaction
		return
	End

	else if NOT EXISTS (Select *
					From CongViec
					Where MaDT = @MaDT AND SoTT= @SoTT)
	Begin 
		print 'STT khong hop le'
		rollback transaction
		return
	End
	

	if EXISTS (Select *
				From ThamGiaDT
				Where MaDT = @MaDT)
	Begin 
		print 'Cong viec da duoc phan cong, khong the xoa'
		rollback transaction
		return
	End
		
	 End try

	 Begin catch 
			--bao loi
			print '1- Xoa khong thanh cong'
			rollback transaction
	End catch
		delete from CongViec where (MaDT=@MaDT AND SoTT= @SoTT)
		print '0- Xoa cong viec thanh cong';
		if NOT EXISTS ( Select * from CongViec)
		delete from DeTai where (MaDT = @MaDT)
		print 'khong con cong viec nao, da xoa de tai'
		commit transactionGoCreate Proc ThemDeTai@MaDT nvarchar(10),
@TenDT nvarchar(50),
@CapQL int,
@KinhPhi decimal(38),
@NgayBD date,
@NgayKT date,
@MaCD nvarchar(10),
@GVCNDT nvarchar(10)
ASBegin transaction

	Begin try
		if @MaDT = null OR @TenDT = null or @CapQL = null or @KinhPhi=null or @NgayBD=null or @NgayKT=null or @MaCD=null or @GVCNDT=null		Begin 			print 'Thong tin nhap khong hop le'			rollback transaction			return		End
		if EXISTS (Select *
			From DeTai
			Where MaDT = @MaDT)
		Begin 
			Print 'De Tai da ton tai'
			Rollback transaction
			return
		End
		if NOT EXISTS (Select *
			From ChuDe
			Where MaCD = @MaCD)
		Begin 
			Print 'Chu de khong ton tai'
			Rollback transaction
			return
		End
		if NOT EXISTS (Select * 
			From Khoa 
			where TruongKhoa= @GVCNDT) AND NOT EXISTS (Select * 
			From BoMon 
			where TruongBM= @GVCNDT)
		Begin 
			Print 'GVCNDT khong hop le'
			Rollback transaction
			return
		End
		if @KinhPhi < @CapQL*3000000
		Begin 
			Print 'Kinh phi thap hon so voi cap quan ly quy dinh'
			Rollback transaction
			return
		End
		if @NgayBD > @NgayKT 
		Begin 
			Print 'Vui long nhap ngay bat dau va ngay ket thuc hop le'
			Rollback transaction
			return
		End
	End try
	 Begin catch 
			--bao loi
			print '1- Them khong thanh cong'
			rollback transaction
	End catch
		--bao thanh cong ma them du lieu vao db
		Insert into DeTai values (@MaDT,@TenDT,@CapQL,@KinhPhi,@NgayBD,@NgayKT,@MaCD,@GVCNDT)	
		print '0-Them thanh cong';
		commit transactionGoCreate Proc CapNhatDeTai@MaDT nvarchar(10),
@TenDT nvarchar(50),
@CapQL int,
@KinhPhi decimal(38),
@NgayBD date,
@NgayKT date,
@MaCD nvarchar(10),
@GVCNDT nvarchar(10)
ASBegin transaction

	Begin try
		if @MaDT = null OR @TenDT = null or @CapQL = null or @KinhPhi=null or @NgayBD=null or @NgayKT=null or @MaCD=null or @GVCNDT=null		Begin 			print 'Thong tin nhap khong hop le'			rollback transaction			return		End
		if NOT EXISTS (Select *
			From DeTai
			Where MaDT = @MaDT)
		Begin 
			Print 'De Tai khong ton tai'
			Rollback transaction
			return
		End
		if NOT EXISTS (Select *
			From ChuDe
			Where MaCD = @MaCD)
		Begin 
			Print 'Chu de khong ton tai'
			Rollback transaction
			return
		End
		if NOT EXISTS (Select * 
			From Khoa 
			where TruongKhoa= @GVCNDT) AND NOT EXISTS (Select * 
			From BoMon 
			where TruongBM= @GVCNDT)
		Begin 
			Print 'GVCNDT khong hop le'
			Rollback transaction
			return
		End		
		if @NgayBD > @NgayKT 
		Begin 
			Print 'Vui long nhap ngay bat dau va ngay ket thuc hop le'
			Rollback transaction
			return
		End

		if @CapQL < (Select CapQL from DeTai where MaDT = @MaDT) 
		Begin 
			Print 'Khong the giam cap quan ly'
			Rollback transaction
			return
		End
		Else if @KinhPhi < @CapQL*3000000
		Begin 
			Print 'Kinh phi thap hon so voi cap quan ly quy dinh'
			Rollback transaction
			return
		End
	End try
	 Begin catch 
			--bao loi
			print '1- Cap Nhat khong thanh cong'
			rollback transaction
	End catch
		--bao thanh cong ma them du lieu vao db
		Update DeTai
		Set TenDT=@TenDT , CapQL = @CapQL, KinhPhi=@KinhPhi, NgayBD=@NgayBD, NgayKT=@NgayKT, MaCD=@MaCD, GVCNDT=@GVCNDT
		Where (MaDT= @MaDT)
		print '0-Cap Nhat thanh cong';
		commit transactionGoCreate Proc XoaDeTai@MaDT nvarchar(10)
AS
Begin transaction
	Begin try
		if NOT EXISTS (Select *
			From DeTai
			Where MaDT = @MaDT)
		Begin 
			Print 'De Tai khong ton tai'
			Rollback transaction
			return
		End
		if EXISTS (Select * from ThamGiaDT where MaDT=@MaDT)
		Begin 
			Print 'De Tai da co nguoi tham gia khong the xoa'
			Rollback transaction
			return
		End
		else if (Select NgayBD From DeTai where MaDT = @MaDT) > GETDATE()
		Begin 
			Print 'De Tai chua ket thuc khong the xoa'
			Rollback transaction
			return
		End

	End try

		Begin catch 
			--bao loi
			print '1- Xoa khong thanh cong'
			rollback transaction
		End catch
		delete from DeTai where (MaDT=@MaDT)
		print '0- Xoa de tai thanh cong';
		commit transactionGo

*/

Insert into GiaoVien values ('ngson','Nguyen Son','30000000',1,'8/8/1980','25 Tan Hung St. Ward 12 Dist. 5',null,null),
							('ngphuc','Nguyen Phuc','20000000',1,'7/8/1982','148 BisNam Ky Khoi Nghia Street',null,null),
							('ngtuan','Nguyen Tuan','20000000',1,'9/3/1985','110 Nguyen Trong Tuyen, Ward 15',null,null),
							('ttu','Thanh Tu','15000000',0,'5/5/1986','27 Nguyen Trai St., Lane 263/18','ngson',null),
							('mthu','Minh Thu','15000000',0,'6/9/1987','26 BC Phan Van Tri Street, Ward 7','ngphuc',null),
							('nthao','Ngoc Thao','15000000',0,'3/5/1988','424 lane, Thuy Khue st','ngtuan',null)
							
Insert into Khoa values ('IT','Cong nghe thong tin','1990','I99','0982847199','ngson','1/1/2010')
/*


Insert into BoMon values ('KHMT','Khoa hoc may tinh','I98','0982847198','ngphuc','IT','1/2/2015'),
					 ('HTTT','He thong thong tin','I97','0982847197','ngtuan','IT','3/2/2012'),
					  ('TGMT','Thi Giac May Tinh','I96','0982847196','ngson','IT','3/5/2013')

Insert into ChuDe values ('1','Tich hop dich vu'),						 ('2','Hoc may thong kê và ung dung'),
						 ('3','Tuong tac nguoi-may')

Insert into DeTai values ('11','Xay dung ung dung tren thiet bi di dong de tra cuu thong tin theo dia diem','3','15000000','1/1/2017','12/12/2017','1','ngtuan'),
						 ('21','Nghien cuu phat trien he thong mLearning o quy mo nho','3','15000000','1/1/2017','12/12/2017','2','ngphuc'),
						 ('31','Xay dung cong cu ho tro soan thao van ban bang tieng noi tich hop trong Microsoft Word','3','15000000','1/1/2017','12/12/2017','2','ngson')

Insert into CongViec values ('11','1','Thu Thap Tai Lieu','2/1/2017','4/4/2017'),
							('21','1','Thu Thap Tai Lieu','2/1/2017','4/4/2017'),
							('31','1','Thu Thap Tai Lieu','2/1/2017','4/4/2017')

Insert into ThamGiaDT values ('ngtuan','11',null,'2/1/2017','4/4/2017'),
							('ngphuc','21',null,'2/1/2017','4/4/2017'),
							('ngson','31',null,'2/1/2017','4/4/2017')

				  
*/