
/*Create proc KTSoDu3
	@MaTk nvarchar (20) = 12345678912345678912
AS*/

Begin

	Declare @Sodu decimal(38);
	Declare @MaTk nvarchar(20) = 12345678912345678912;

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

		if NOT EXISTS (Select *
			From TaiKhoan
			Where MaTk = @MaTK and TrangThai = 1)
		Begin 
			Print 'Tk bi khoa'
			Rollback transaction
			return
		End

		End try

		Begin catch 

			print 'Loi dang nhap'
			rollback transaction
		End catch

		print 'Dang nhap thanh cong';

		print '' Select Sodu From TaiKhoan Where MaTk = @MaTk;

		commit transaction;


END;



		