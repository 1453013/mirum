Begin

	Declare @Sodu decimal(38) = 10000000;
	Declare @MaTk nvarchar(20) = 12345678912345678960;
	Declare @TrangThai bit = 0;
	Declare @LoaiTK nvarchar (20) = 'Gold';
	Declare @MaKh nvarchar (20) = 03122017;

Begin transaction
	

	Begin try 
		if EXISTS (Select *
			From TaiKhoan
			Where MaTk = @MaTK)
		Begin 
			Print 'MaTK da ton tai'
			Rollback transaction
			return
		End

		if @Sodu < 100000 
		Begin 
			Print 'Khong du so du'
			Rollback transaction
			return
		End

		if @TrangThai <> 1 AND @TrangThai <>0
			Begin 
				Print 'Trang thai khong hop le'
				Rollback transaction
				return
			End
		else if @TrangThai = null
			Set @TrangThai = 1;


		if @LoaiTK <> 'Gold' AND  @LoaiTK <> 'Silver' AND @LoaiTK <> 'Bronze'
			Begin 
				Print 'Loai tai khoan khong hop le'
				Rollback transaction
				return
			End

		if EXISTS (Select *
			From TaiKhoan
			Where MaKH = @MaKh)
		Begin 
			Print 'MaKH da ton tai'
			Rollback transaction
			return
		End

		End try

		Begin catch 

			print '1- Them khong thanh cong'
			rollback transaction
		End catch

		print '0- Them thanh cong';

		--print '' Select Sodu From TaiKhoan Where MaTk = @MaTk;

		commit transaction;


END;