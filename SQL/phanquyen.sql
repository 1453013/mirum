use QLSV2
go

--create role truongkhoa

--create role giaovien

--create role truongbomon

--create role giaovu

--create role sinhvien

--create login nthung with password = '1234',
--default_database = QLSV2
--create user truongkhoa60 for login nthung
--go

--create login hvkiem with password = '1234',
--default_database = QLSV2
--create user truongkhoa53 for login hvkiem
--go


--create login ttson with password = '4321',
--default_database= QLSV2
--create user giaovien1 for login ttson
--go

--create login ttbhanh with password = '7896',
--default_database = QLSV2
--create user truongbomonit2 for login ttbhanh
--go

--create login ntvan with password ='1111',
--default_database = QLSV2
--create user giaovu1 for login ntvan
--go


--create login [13531002] with password = '13531002',
--default_database = QLSV2
--create user sinhvien1 for login [13531002]

--create login [14601001] with password = '14601001',
--default_database = QLSV2
--create user sinhvien2 for login [14601001]



--Alter role truongkhoa Add member truongkhoa53
--go
--Alter role truongkhoa Add member truongkhoa60
--go
--Alter role giaovien Add member giaovien1
--go
--Alter role truongbomon Add member truongbomonit2
--go
--Alter role giaovu Add member giaovu1
--go
--Alter role sinhvien Add member sinhvien1
--go
--Alter role giaovien Add member truongbomonit2
--go
--Alter role sinhvien Add member sinhvien2
--go





--Create view GV_ThongtinGV AS
--Select * From GiaoVien
--where MaGV = SUSER_SNAME()

--go
--Grant select  ,update (DienThoai)
--On GV_ThongtinGV
--To giaovien
--With grant option 
--go


--GRANT EXECUTE ON OBJECT::sp_GiaoVienXemThongTinCaNhan
--TO GiaoVien;

-- GRANT EXECUTE ON OBJECT::sp_GiaoVienSuaThongTinCaNhan
--TO GiaoVien;

--GRANT EXECUTE ON OBJECT::sp_TruongKhoaXemThongTinSinhVien
--TO truongkhoa; 

--Create view MonHoc_ThuocKhoaCuaGiaoVien AS
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
--Where MaGV=SUSER_SNAME()))
--)

--Grant Select 
--On MonHoc_ThuocKhoaCuaGiaoVien
--To GiaoVien
--With grant option
--Go

--Grant EXECUTE ON OBJECT::sp_XemDanhSachMonHocThuocBoMon
--TO giaovien; 

--Grant EXECUTE ON OBJECT::sp_XemDanhSachMonHocThuocBoMon
--TO truongkhoa;


--Grant EXECUTE ON OBJECT::sp_XemDanhSachMonHocTrongHocKyCuThe
--TO giaovien; 

--Grant EXECUTE ON OBJECT::sp_XemDanhSachMonHocTrongHocKyCuThe
--TO truongkhoa; 

--Grant EXECUTE ON OBJECT::sp_GiaoVienXemDanhSachLopKhoaHoc
--TO giaovien; 

--Create view KhoaHoc_KhoaHocGiaoVienDaPhuTrach AS
--Select *
--From KhoaHoc
--Where KhoaHoc.MaGV = SUSER_SNAME()

--Grant select 
--On KhoaHoc_KhoaHocGiaoVienDaPhuTrach
--To GiaoVien
--with grant option
--Go

--Create view Diem_DiemThuocKhoaHocGiaoVienDangPhuTrach AS
--Select *
--From Diem
--Where MaKhoaHoc IN (Select MaKhoaHoc From KhoaHoc Where KhoaHoc.MaGV= SUSER_SNAME())

--Grant select 
--On Diem_DiemThuocKhoaHocGiaoVienDangPhuTrach
--To GiaoVien
--with grant option
--Go

--Grant  EXECUTE ON OBJECT::sp_GiaoVienXemBangDiemKhoaHoc
--TO giaovien;

--Grant  EXECUTE ON OBJECT::sp_GiaoVienUpdateDiemCuaSinhVienTrongKhoaHoc
--TO giaovien;

--Create view MonHoc_MonHocThuocKhoaCuaTruongKhoa
--AS
--Select * 
--From MonHoc
--Where MaBoMon IN (
--Select distinct  bm.MaBoMon From BoMon bm, Khoa k
--where bm.MaKhoa = k.MaKhoa
--AND k.TruongKhoa = SUSER_SNAME()
--)


--Grant all PRIVILEGES
--On MonHoc_MonHocThuocKhoaCuaTruongKhoa
--To truongkhoa
--with grant option
--Go

--Create view KhoaHoc_KhoaHocDangMo
--AS
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
--AND k.TruongKhoa = SUSER_SNAME()) OR (bm.MaKhoa = (Select MaKhoa from GiaoVu where MaGVu= SUSER_SNAME()) )))

--Grant all PRIVILEGES
--On MonHoc_MonHocDangMo
--To truongkhoa
--with grant option
--go


--Grant select 
--On KhoaHoc_KhoaHocDangMo
--To giaovu
--with grant option
--go


--Grant EXECUTE ON OBJECT::sp_TruongBoMonXemLichDayGiaoVienTrongHocKy
--TO truongbomon;

--Grant select, update
--On KhoaHoc_KhoaHocDangMo(MaxSinhVien)
--To truongbomon
--with grant option
--go

--Grant EXECUTE ON OBJECT::sp_TruongBoMonUpdateMaxSinhVienChoKhoaHoc
--TO truongbomon;



--Grant EXECUTE ON OBJECT::sp_GiaoVuThemKhoaHoc
--To giaovu

--Create view DangKy_XemDanhSachDangKyMon
--AS
--Select * 
--From DangKy
--Where MaKhoaHoc IN ( Select MaKhoaHoc From KhoaHoc 
--Where MaMonHoc IN (
--Select MaMonHoc from MonHoc where MaBoMon IN (
--Select distinct  bm.MaBoMon From BoMon bm, Khoa k
--where (bm.MaKhoa = k.MaKhoa
--AND k.TruongKhoa = SUSER_SNAME()) OR (bm.MaKhoa = (Select MaKhoa from GiaoVu where MaGVu= SUSER_SNAME()) ))))

--Grant all 
--on DangKy_XemDanhSachDangKyMon
--to giaovu
--go

--Grant all 
--on DangKy_XemDanhSachDangKyMon
--to truongkhoa
--go

--Grant EXECUTE ON OBJECT::sp_GiaoVuXemLichDayCuaGiaoVien
--to giaovu

--Create view Diem_DiemCuaKhoa
--AS
--Select * 
--From Diem
--Where MaKhoaHoc IN ( Select MaKhoaHoc From KhoaHoc 
--Where MaMonHoc IN (
--Select MaMonHoc from MonHoc where MaBoMon IN (
--Select distinct  bm.MaBoMon From BoMon bm, Khoa k
--where (bm.MaKhoa = k.MaKhoa
--AND k.TruongKhoa = SUSER_SNAME()) OR (bm.MaKhoa = (Select MaKhoa from GiaoVu where MaGVu= SUSER_SNAME()) ))))

--Grant Select
--on Diem_DiemCuaKhoa
--To giaovu
--go

--Grant select, update 
--on Diem_DiemCuaKhoa
--to truongkhoa


--Create view GiaoVu_ThongTinGV
--AS
--Select * From GiaoVu
--where MaGVu = SUSER_SNAME()

--Grant select 
--on GiaoVu_ThongTinGV
--to GiaoVu

--Grant execute on object::sp_GiaoVuXemThongTinCaNhan
--to giaovu

--Grant execute on object::sp_GiaoVuSuaThongTinCaNhan
--to giaovu

--grant execute on object::sp_GiaoVuThemDangKyKhoaHocChoSinhVien
--to giaovu

--grant execute on object::sp_GiaoVuHuyDangKyKhoaHocChoSinhVien
--to giaovu

--grant execute on object::sp_SinhVienXemDanhSachMonDangMo
--to sinhvien

--grant execute on object::sp_SinhVienDangKyKhoaHoc
--to sinhvien

--grant execute on object::sp_SinhVienHuyDangKyKhoaHoc
--to sinhvien

--grant execute on object::sp_SinhVienXemDiem
--to sinhvien

--grant execute on object::sp_SinhVienSuaThongTinCaNhan
--to sinhvien

--grant execute on object::sp_GiaoVuSuaThongTinSinhVien
--to giaovu  


--Create view SinhVien_CaNhanSinhVien
--AS
--Select * From SinhVien
--where MaSV = SUSER_SNAME()

--go

--grant select 
--on SinhVien_CaNhanSinhVien
--to sinhvien