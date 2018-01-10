Begin
	Declare @MaTk nvarchar(20) = 12345678912345678960;
	--Declare @NgayLap date = 10/11/2017;
	Declare @Sodu decimal(38) = 20000000;
	Declare @TrangThai bit = 1;

Begin transaction
	

	Begin try 
		if NOT EXISTS (Select *
			From TaiKhoan
			Where MaTk = @MaTK)
		Begin 
			Print 'MaTK khong ton tai'
			Rollback transaction
			return
		End





		if @Sodu < 100000 
		Begin 
			Print 'Khong du so du'
			Rollback transaction
			return
		End

		else if @sodu > 10000
		Begin
			Update TaiKhoan 
			Set SoDu = @Sodu
			Where MatTk =@MaTk

		End
			
		if @TrangThai <> 1 AND @TrangThai <>0
			Begin 
				Print 'Trang thai khong hop le'
				Rollback transaction
				return
			End

		End try

		Begin catch 

			print '1- Cap nhat khong thanh cong'
			rollback transaction
		End catch

		print '0- Cap nhat thanh cong';

		--print '' Select Sodu From TaiKhoan Where MaTk = @MaTk;

		commit transaction;


END;