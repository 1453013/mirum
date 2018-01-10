--Tra Ngoc Hai 1453013
--P1

--Tao Database va cac table
CREATE DATABASE NganHang
GO

USE NganHang
GO 


Create Table LoaiTaiKhoan
(	
	MaLoai NVARCHAR (10),
	TenLoai NVARCHAR (20),
	Primary key (MaLoai)
)

GO

Create Table KhachHang
(
	MaKH NVARCHAR (20),
	HoTen NVARCHAR(50),
	NgaySinh date,
	CMND NVARCHAR (20),
	DiaChi NVARCHAR (50),
	Primary key(MaKH)
)

Go

Create Table TaiKhoan
(
	MaTK NVARCHAR (20),
	NgayLap date NOT NULL,
	SoDu decimal(38),
	TrangThai int,
	LoaiTK NVARCHAR (10) NOT NULL,
	MaKH NVARCHAR (20),
	Primary key (MaTK),
	FOREIGN KEY (LoaiTK)  REFERENCES  LoaiTaiKhoan(MaLoai),
	FOREIGN KEY (MaKH)  REFERENCES  KhachHang(MaKH)
)
GO	


Create Table GiaoDich
(
	MaGD NVARCHAR (50),
	MaTK NVARCHAR (20),
	SoTien decimal (38),
	ThoiGianGD NVARCHAR (50),
	GhiChu NVARCHAR (100),
	Primary key (MaGD),
	FOREIGN KEY (MaTK)  REFERENCES  TaiKhoan(MaTK),
)

Go


--Them du lieu

Insert into LoaiTaiKhoan 
values ('1','gold'),
		('2','silver'),
		('3','bronze')



Insert into KhachHang
values ('14','John Wick','9/7/1980','850275864994','123 6th St.Melbourne, FL 32904'),
		('25','Angela Paul','10/10/1982','39311312681','44 Shirley Ave. West Chicago, IL 60185'),
		('36','Nancy Garza','9/7/1980','850275864994','123 6th St.Melbourne, FL 32904')	


Insert into TaiKhoan
values ('1497','8/8/2016','20000000',2,'2','14'),
		('2511','9/10/2017','15000000',2,'1','25'),
		('3697','5/3/2016','2000000',1,'2','14')


Insert into GiaoDich 
values ('1497121217','1497','1000000','155','Chuyen tien cho ho hang')


Go

--Viet giao tac
--Declare :  
--trang thai : 0-bi huy  1-bi khoa 2-dang su dung
--ngay lap hop le : sau ngay he thong



--Giao tac xem so du
CREATE PROC XemSoDu
@MaTk nvarchar(20)ASBegin transaction
	
	Begin try 
		--kiem tra ma tai khoan ton tai
		if NOT EXISTS (Select *
			From TaiKhoan
			Where MaTk = @MaTK)
		Begin 
			Print 'MaTK khong ton tai'
			Rollback transaction
			return
		End

		--kiem tra tai khoan bi khoa
		if  EXISTS (Select *
			From TaiKhoan
			Where MaTk = @MaTK and TrangThai = 1)
		Begin 
			Print 'Tk bi khoa'
			Rollback transaction
			return
		End

		--kiem tra tai khoan bi huy
		if  EXISTS (Select *
			From TaiKhoan
			Where MaTk = @MaTK and TrangThai = 0)
		Begin 
			Print 'Tk bi huy'
			Rollback transaction
			return
		End

		End try

		Begin catch 
		-- bao loi
			print 'Loi dang nhap'
			rollback transaction
		End catch

		--bao thanh cong
		print 'Dang nhap thanh cong';

		print '' Select Sodu From TaiKhoan Where MaTk = @MaTk;

		commit transaction;
Go

--giao tac them tai khoan CREATE PROC ThemTaiKhoan
@MaTk nvarchar(20),
@NgayLap date,
@Sodu decimal(38),
@TrangThai int,
@LoaiTK nvarchar (10),
@MaKh nvarchar (20)
ASBegin transaction

	Begin try 
		--kiem tra ma tai khoan ton tai
		if EXISTS (Select *
			From TaiKhoan
			Where MaTk = @MaTK)
		Begin 
			Print 'MaTK da ton tai'
			Rollback transaction
			return
		End
		--kiem tra so du
		if @Sodu < 100000 
		Begin 
			Print 'Khong du so du'
			Rollback transaction
			return
		End

		--kiem tra trang thai
		if @TrangThai <> 1 AND @TrangThai <>0 AND @TrangThai<>2
			Begin 
				Print 'Trang thai khong hop le'
				Rollback transaction
				return
			End
		else if @TrangThai = null
			Set @TrangThai = 2;
		
		--kiem tra loai tai khoan
		if NOT EXISTS (Select *
			From LoaiTaiKhoan
			Where MaLoai = @LoaiTK)
		Begin 
			Print 'Loai tai khoan khong hop le'
			Rollback transaction
			return
		End

		--kiem tra ma khach hang
		if NOT EXISTS (Select *
			From KhachHang
			Where MaKH = @MaKh)
		Begin 
			Print 'MaKH khong ton tai'
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
		set @NgayLap = GETDATE();
		Insert into TaiKhoan values (@MaTk,@NgayLap,@Sodu,@TrangThai,@LoaiTK,@MaKh)	
		print '0- Them thanh cong';
		commit transactionGo
--giao tac xoa tai khoan

CREATE PROC XoaTaiKhoan
@MaTk nvarchar(20)
AS
Begin transaction
	Begin try 
		--kiem tra tai khoan 
		if NOT EXISTS (Select *
			From TaiKhoan
			Where MaTk = @MaTK)
		Begin 
			Print 'MaTK khong ton tai'
			Rollback transaction
			return
		End

		--kiem tra tai khoan da giao dich chua 
		if EXISTS ( Select *
			From GiaoDich
			Where MaTk = @MaTk)
			Begin 
				Print 'Tk da thuc hien giao dich khong the xoa'
				Rollback transaction
				return
			End 

		End try

		Begin catch 
			--bao loi
			print '1-Xoa khong thanh cong'
			rollback transaction
		End catch
			--bao thanh cong va xoa du lieu khoi db
		delete from TaiKhoan where MaTK=@MaTk;
		print '0- Xoa thanh cong';
		commit transaction;

Go


--giao tac cap nhat tai khoan

CREATE PROC CapNhatTaiKhoan
	 @MaTk nvarchar(20),
	 @NgayLap date,
	 @Sodu decimal(38),
	 @TrangThai int
AS
Begin transaction
	Begin try 
		--kiem tra tai khoan
		if NOT EXISTS (Select *
			From TaiKhoan
			Where MaTk = @MaTK)
		Begin 
			Print 'MaTK khong ton tai'
			Rollback transaction
			return
		End
		--kiem tra so du moi
		if @Sodu < 100000 
		Begin 
			Print 'Khong du so du'
			Rollback transaction
			return
		End
		--kiem tra ngay lap moi
		if @NgayLap < getdate()
		Begin 
			Print 'Ngay khong hop le'
			Rollback transaction
			return
		End
		--kiem tra trang thai moi
		if @TrangThai <> 1 AND @TrangThai <>0 AND @TrangThai<>2
			Begin 
				Print 'Trang thai khong hop le'
				Rollback transaction
				return
			End
		End try
		Begin catch 
			--bao loi
			print '1- Cap nhat khong thanh cong'
			rollback transaction
		End catch
			--bao cao thanh cong va update du lieu
		Update TaiKhoan 
		Set SoDu = @Sodu,NgayLap = @NgayLap,TrangThai = @TrangThai
		Where MaTk =@MaTk;
		print '0- Cap nhat thanh cong';

		commit transaction;
Go

--script gọi store


EXECUTE XemSoDu 
@MaTk = 1497;


EXECUTE ThemTaiKhoan
@MaTK = 7914,
@NgayLap = '9/9/2018',
@SoDu = 200000,
@TrangThai = 2,
@LoaiTK = 1,
@MaKH = 14

GO

EXECUTE XoaTaiKhoan 
@MaTk = 3697

GO

EXECUTE CapNhatTaiKhoan
@MaTk = 4097,
@NgayLap = '8/8/2018',
@SoDu = 300000000,
@TrangThai = 2