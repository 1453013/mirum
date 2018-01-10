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
		commit transactionGoCreate proc CapNhatCongViec@MaDT nvarchar(10),
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
		commit transactionGoCreate Proc XoaCongViec@MaDT nvarchar(10),
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
			where TruongKhoa= @GVCNDT)
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
		commit transactionGo


Create Proc CapNhatDeTai@MaDT nvarchar(10),
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
			where TruongKhoa= @GVCNDT)
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


