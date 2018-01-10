Begin

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
			print '1-Xoa khong thanh cong'
			rollback transaction
		End catch

		print '0- Xoa thanh cong';

		--print '' Select Sodu From TaiKhoan Where MaTk = @MaTk;

		commit transaction;


END;