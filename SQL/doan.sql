--create database QLSV2
--go

use QLSV2
go

/*
create table SinhVien
(
MaSV nvarchar(8) not null unique,
Ho nvarchar(15) not null,
TenLot nvarchar(1),
Ten nvarchar(15) not null,
DienThoai nvarchar(13), 
MaKhoa nvarchar(10) not null,
MaLop nvarchar(10) not null,
primary key (MaSV)
)

create table GiaoVien
(
MaGV nvarchar(10) not null unique,
Ho nvarchar(15) not null,
TenLot nvarchar(1),
Ten nvarchar(15) not null,
DienThoai nvarchar(13), 
MaBoMon nvarchar(10) not null,
primary key (MaGV)

)


create table Khoa
(
MaKhoa nvarchar(10) not null unique,
TenKhoa nvarchar(255),
TruongKhoa nvarchar(10) 
primary key (MaKhoa)
)


create table BoMon
(
MaBoMon nvarchar(10) not null unique,
TenBoMon nvarchar(255) not null,
MaKhoa nvarchar(10) not null,
TruongBoMon nvarchar(10) 
primary key (MaBoMon)
)

create table MonHoc
(
MaMonHoc nvarchar(10) not null unique,
TenMonHoc nvarchar(255) not null,
MaBoMon nvarchar(10) not null,
SoTinChi int not null,
GhiChu nvarchar(225),
primary key (MaMonHoc)
)

create table KhoaHoc
(
MaKhoaHoc nvarchar(15) not null unique,
MaMonHoc nvarchar(10) not null,
HocKy nvarchar(1) not null,
NamHoc nvarchar(255) not null,
MaGV nvarchar(10) not null,
GhiChu nvarchar(225),
ChoPhepDangKy bit,
MaxSinhVien int,
LichDay nvarchar(255),
primary key (MaKhoaHoc)
)


create table DangKy 
(
MaSV nvarchar(8) not null,
MaKhoaHoc nvarchar(15) not null
)


*/


/*


create table GiaoVu
(
MaGVu nvarchar(15) not null unique,
Ho nvarchar(15) not null,
TenLot nvarchar(1),
Ten nvarchar(15) not null,
DienThoai nvarchar(13), 
MaKhoa nvarchar(10) not null
primary key (MaGVu)
)

create table Diem
(
MaSV nvarchar(8) not null unique,
MaKhoaHoc nvarchar(15) not null,
Diem int not null
)

create table LopHoc
(
MaLop nvarchar(10) not null unique,
TenLop nvarchar(255),
MaKhoa nvarchar(10) not null,
primary key (MaLop)
)
go


Alter table Diem Add constraint Diem_MaSV_MaKhoaHoc Primary key (MaSV,MaKhoaHoc)
Go


Alter table GiaoVu add foreign key (MaKhoa) references Khoa(MaKhoa)
Go

Alter table LopHoc add foreign key (MaKhoa) references Khoa(MaKhoa)
Go

Alter table SinhVien add foreign key (MaKhoa) references Khoa(MaKhoa)
Go

Alter table SinhVien add foreign key (MaLop) references LopHoc(MaLop)
Go

Alter table KhoaHoc add foreign key (MaMonHoc) references MonHoc(MaMonHoc)
Go

Alter table MonHoc add foreign key (MaBoMon) references BoMon(MaBoMon)
Go

Alter table BoMon add foreign key (MaKhoa) references Khoa(MaKhoa)
Go

Alter table BoMon add foreign key (TruongBoMon) references GiaoVien(MaGV)
Go

Alter table Khoa add foreign key (TruongKhoa) references GiaoVien(MaGV)
Go

Alter table Diem add foreign key (MaSV) references SinhVien(MaSV)
Go

 
Alter table Diem add foreign key (MaKhoaHoc) references KhoaHoc(MaKhoaHoc)
Go

Alter table KhoaHoc add foreign key (MaGV) references GiaoVien(MaGV)
Go


Alter table DangKy Add constraint DangKy_MaSV_MaKhoaHoc Primary key (MaSV,MaKhoaHoc)
Go

Alter table DangKy add foreign key (MaSV) references SinhVien(MaSV)
Go
 
Alter table DangKy add foreign key (MaKhoaHoc) references KhoaHoc(MaKhoaHoc)
Go

insert into Khoa (MaKhoa,TenKhoa)  values
('53','Cong nghe thong tin'),
('60','Cong nghe sinh hoc,')


insert into BoMon (MaBoMon,TenBoMon,MaKhoa) values
('IT001','Thi giac may tinh va khoa hoc Ro-bot','53'),
('IT002','Mang may tinh & Vien thong','53'),
('IT003','Khoa hoc may tinh','53'),
('BT001','Cong nghe Thuc pham','60'),
('BT002','Quan li Nguon loi Thuy san','60'),
('BT003','Hoa sinh','60')


insert into MonHoc values 
('CTT451','Nhập môn thị giác máy tính','IT001','4'),
('CTT310','Xử lý ảnh và video số','IT001','4'),
('CTT005','Ly thuyet do thi','IT001','4'),
('CTT303','Co so tri tue nhan tao','IT001','4'),
('CTT455','Computer graphic','IT001','4'),
('CTT105','Mang may tinh','IT002','4'),
('CTT528','Pha trien ung dung web','IT002','4'),
('CTT103','Hệ điều hành','IT002','4'),
('CTT110','Thiết kế mạng','IT002','4'),
('CTT339','Big data','IT003','4'),
('CTT203','He quan tri co so du lieu','IT003','4'),
('CTT505','Phan tich thiet ke he thong thong tin','IT003','4'),
('CTT104','Kien truc may tinh va hop ngu','IT003','4'),
('CTT501','Lap trinh window','IT003','4'),
('BTF204','Vi sinh thực phẩm','BT001','4'),
('BTF165','Công nghệ lên men','BT001','4'),
('BTF401','Công nghệ chế biến sữa và các sản phẩm sữa','BT001','4'),
('BTF302','Phân tích thực phẩm','BT001','4'),
('BTF402','Công nghệ đồ uống','BT001','4'),
('BTF220','Sinh học biển','BT002','4'),
('BTF200','Phương pháp viết báo cáo khoa học ','BT002','4'),
('BTF177','CNSH môi trường','BT002','4'),
('BTF208','CNSH biển','BT002','4'),
('BTF305','Di truyền và chọn giống thủy sản ','BT002','4'),
('BTF217','Di truyền phân tử','BT003','4'),
('BTF211','Di truyền y học','BT003','4'),
('BTF207','Dược học người','BT003','4'),
('BTF219','Thiết kế và thử nghiệm thuốc','BT003','4'),
('BTF185','CNSH dược','BT003','4')




Insert into GiaoVien values
('HVKiem','Hung','V','Kiem',null,'IT003'),
('NTHung','Nguyen','T','Hung',null,'BT001'),
('NMTriet','Nguyen','M','Triet',null,'IT001'),
('TTBHanh','Tran Thi','B','Hanh',null,'IT002'),
('DBTien','Dinh','B','Tien',null,'IT003'),
('NVToan','Nguyen','V','Toan',null,'BT001'),
('PVHung','Pham','V','Hung',null,'BT002'),
('TTTMai','Tran T','T','Mai',null,'BT003'),
('TTSon','Tran','T','Son',null,'IT001'),
('NNThao','Nguyen','N','Thao',null,'IT001'),
('CXNam','Cao','X','Nam',null,'IT001'),
('BTDanh','Bui','T','Danh',null,'IT001'),
('LVLong','Le','V','Long',null,'IT002'),
('LVMinh','Luong','V','Minh',null,'IT002'),
('NDHuy','Nguyen','D','Huy',null,'IT002'),
('LTNhan','Le','T','Nhan',null,'IT003'),
('PTBHue','Pham Thi','B','Hue',null,'IT003'),
('NTMThu','Nguyen Tran','M','Thu',null,'IT003'),
('NQMinh','Nghiem','Q','Minh',null,'IT003'),
('TDQuang','Tran','D','Quang',null,'IT003'),
('DQTuan','Dang','Q','Tuan',null,'BT001'),
('LQPhu','Le','Q','Phu',null,'BT001'),
('NKPhung','Nguyen','K','Phung',null,'BT001'),
('MDViet','Mai','D','Viet',null,'BT001'),
('BKBinh','Bui','K','Binh',null,'BT002'),
('LMTuong','Lieu','M','Tuong',null,'BT002'),
('NQThong','Ngu','Q','Thong',null,'BT002'),
('VTDat','Vinh','T','Dat',null,'BT002'),
('TQThang','Thach','Q','Thang',null,'BT003'),
('QVHai','Quyen','V','Hai',null,'BT003'),
('BHBinh','Bui','H','Hinh',null,'BT003'),
('LTVo','Ly','T','Vo',null,'BT003')


Insert into LopHoc values
('13IT1','Cong nghe thong tin khoa 13 lop so 1','53'),
('13IT2','Cong nghe thong tin khoa 13 lop so 2','53'),
('13IT3','Cong nghe thong tin khoa 13 lop so 3','53'),
('14IT1','Cong nghe thong tin khoa 14 lop so 1','53'),
('14IT2','Cong nghe thong tin khoa 14 lop so 2','53'),
('14IT3','Cong nghe thong tin khoa 14 lop so 3','53'),
('13BT1','Cong nghe sinh hoc khoa 13 lop so 1','60'),
('13BT2','Cong nghe sinh hoc khoa 13 lop so 2','60'),
('13BT3','Cong nghe sinh hoc khoa 13 lop so 3','60'),
('14BT1','Cong nghe sinh hoc khoa 14 lop so 1','60'),
('14BT2','Cong nghe sinh hoc khoa 14 lop so 2','60'),
('14BT3','Cong nghe sinh hoc khoa 14 lop so 3','60')


insert into SinhVien values ('13531001', 'Pham', 'V', 'Bao', null,'53','13IT1')
insert into SinhVien values ('13531002', 'Vo', 'V', 'Dung', null,'53','13IT1')
insert into SinhVien values ('13531003', 'Van', 'P', 'Phuc', null,'53','13IT1')
insert into SinhVien values ('13531004', 'Bui', 'N', 'Binh', null,'53','13IT1')
insert into SinhVien values ('13531005', 'Le', 'V', 'Sang', null,'53','13IT1')
insert into SinhVien values ('13531006', 'Vo', 'H', 'Ha', null,'53','13IT1')
insert into SinhVien values ('13531007', 'Le', 'B', 'Mong', null,'53','13IT1')
insert into SinhVien values ('13531008', 'Vu', 'C', 'Huong', null,'53','13IT1')
insert into SinhVien values ('13531009', 'Dinh', 'B', 'Ha', null,'53','13IT1')
insert into SinhVien values ('13531010', 'Ho', 'V', 'My', null,'53','13IT1')

insert into SinhVien values ('13532011', 'Dinh', 'L', 'Mong', null,'53','13IT2')
insert into SinhVien values ('13532012', 'Do', 'B', 'Phuong', null,'53','13IT2')
insert into SinhVien values ('13532013', 'Dong', 'L', 'Binh', null,'53','13IT2')
insert into SinhVien values ('13532014', 'Than', 'P', 'My', null,'53','13IT2')
insert into SinhVien values ('13532015', 'Phan', 'N', 'My', null,'53','13IT2')
insert into SinhVien values ('13532016', 'Dang', 'C', 'Thanh', null,'53','13IT2')
insert into SinhVien values ('13532017', 'Huynh', 'D', 'Huong', null,'53','13IT2')
insert into SinhVien values ('13532018', 'Hoang', 'P', 'Phuc', null,'53','13IT2')
insert into SinhVien values ('13532019', 'Dao', 'C', 'Phuc', null,'53','13IT2')
insert into SinhVien values ('13532020', 'Dong', 'C', 'Sang', null,'53','13IT2')

insert into SinhVien values ('13533021', 'Ly', 'P', 'Bao', null,'53','13IT3')
insert into SinhVien values ('13533022', 'Phung', 'V', 'Giao', null,'53','13IT3')
insert into SinhVien values ('13533023', 'Dang', 'P', 'Duyen', null,'53','13IT3')
insert into SinhVien values ('13533024', 'Cao', 'V', 'Thuy', null,'53','13IT3')
insert into SinhVien values ('13533025', 'Huynh', 'H', 'Phuong', null,'53','13IT3')
insert into SinhVien values ('13533026', 'Van', 'H', 'Thuy', null,'53','13IT3')
insert into SinhVien values ('13533027', 'Dinh', 'P', 'Dung', null,'53','13IT3')
insert into SinhVien values ('13533028', 'Vo', 'P', 'Duy', null,'53','13IT3')
insert into SinhVien values ('13533029', 'Dao', 'V', 'Bach', null,'53','13IT3')
insert into SinhVien values ('13533030', 'Van', 'V', 'Duyen', null,'53','13IT3')

insert into SinhVien values ('14531001', 'Pham', 'L', 'Nam', null,'53','14IT1')
insert into SinhVien values ('14531002', 'Lam', 'T', 'Sao', null,'53','14IT1')
insert into SinhVien values ('14531003', 'Le', 'T', 'Khang', null,'53','14IT1')
insert into SinhVien values ('14531004', 'Do', 'H', 'An', null,'53','14IT1')
insert into SinhVien values ('14531005', 'Huynh', 'T', 'Binh', null,'53','14IT1')
insert into SinhVien values ('14531006', 'Phung', 'P', 'Bach', null,'53','14IT1')
insert into SinhVien values ('14531007', 'Hoang', 'L', 'Thanh', null,'53','14IT1')
insert into SinhVien values ('14531008', 'Phan', 'L', 'Duy',  null,'53','14IT1')
insert into SinhVien values ('14531009', 'Do', 'N', 'Binh',  null,'53','14IT1')
insert into SinhVien values ('14531010', 'Nguyen', 'C', 'Linh',  null,'53','14IT1')

insert into SinhVien values ('14532011', 'Phung', 'C', 'Duyen',  null,'53','14IT2')
insert into SinhVien values ('14532012', 'Ly', 'N', 'Sinh',  null,'53','14IT2')
insert into SinhVien values ('14532013', 'Lam', 'B', 'Huong',  null,'53','14IT2')
insert into SinhVien values ('14532014', 'Than', 'P', 'Minh',  null,'53','14IT2')
insert into SinhVien values ('14532015', 'Than', 'V', 'Linh',  null,'53','14IT2')
insert into SinhVien values ('14532016', 'Le', 'B', 'My',  null,'53','14IT2')
insert into SinhVien values ('14532017', 'Bui', 'B', 'Phuong',  null,'53','14IT2')
insert into SinhVien values ('14532018', 'Bui', 'H', 'An',  null,'53','14IT2')
insert into SinhVien values ('14532019', 'Ho', 'V', 'Minh',  null,'53','14IT2')
insert into SinhVien values ('14533020', 'Dao', 'L', 'Ha',  null,'53','14IT2')

insert into SinhVien values ('14533021', 'Hoang', 'V', 'Duyen',  null,'53','14IT3')
insert into SinhVien values ('14533022', 'Ta', 'L', 'Bao',  null,'53','14IT3')
insert into SinhVien values ('14533023', 'Cao', 'H', 'Sinh',  null,'53','14IT3')
insert into SinhVien values ('14533024', 'Phung', 'L', 'Thao',  null,'53','14IT3')
insert into SinhVien values ('14533025', 'Vuong', 'B', 'Thuy',  null,'53','14IT3')
insert into SinhVien values ('14533026', 'Dong', 'N', 'Nam',  null,'53','14IT3')
insert into SinhVien values ('14533027', 'Nguyen', 'T', 'An',  null,'53','14IT3')
insert into SinhVien values ('14533028', 'Dinh', 'L', 'My',  null,'53','14IT3')
insert into SinhVien values ('14533029', 'Phan', 'D', 'Ha',  null,'53','14IT3')
insert into SinhVien values ('14533030', 'Huynh', 'N', 'Sang',  null,'53','14IT3')

insert into SinhVien values ('13601001', 'Tran', 'T', 'Sao',  null,'60','13BT1')
insert into SinhVien values ('13601002', 'Do', 'H', 'Sang',  null,'60','13BT1')
insert into SinhVien values ('13601003', 'Trinh', 'L', 'Thuy',  null,'60','13BT1')
insert into SinhVien values ('13601004', 'Dao', 'D', 'Hong',  null,'60','13BT1')
insert into SinhVien values ('13601005', 'Duong', 'L', 'Ha',  null,'60','13BT1')
insert into SinhVien values ('13601006', 'Dao', 'V', 'Mong',  null,'60','13BT1')
insert into SinhVien values ('13601007', 'Dong', 'N', 'Sao',  null,'60','13BT1')
insert into SinhVien values ('13601008', 'Phan', 'N', 'Giao',  null,'60','13BT1')
insert into SinhVien values ('13601009', 'Phung', 'V', 'Minh',  null,'60','13BT1')
insert into SinhVien values ('13601010', 'Vuong', 'P', 'Ha',  null,'60','13BT1')

insert into SinhVien values ('13602011', 'Ho', 'L', 'Thao',  null,'60','13BT2')
insert into SinhVien values ('13602012', 'Huynh', 'L', 'Khang',  null,'60','13BT2')
insert into SinhVien values ('13602013', 'Ho', 'D', 'Hong',  null,'60','13BT2')
insert into SinhVien values ('13602014', 'Ho', 'V', 'Mong',  null,'60','13BT2')
insert into SinhVien values ('13602015', 'Duong', 'D', 'Hong',  null,'60','13BT2')
insert into SinhVien values ('13602016', 'Duong', 'V', 'Mong',  null,'60','13BT2')
insert into SinhVien values ('13602017', 'Huynh', 'N', 'An',  null,'60','13BT2')
insert into SinhVien values ('13602018', 'Dinh', 'L', 'Bach',  null,'60','13BT2')
insert into SinhVien values ('13602019', 'Pham', 'N', 'Anh',  null,'60','13BT2')
insert into SinhVien values ('13602020', 'Le', 'V', 'An',  null,'60','13BT2')

insert into SinhVien values ('13603021', 'Nguyen', 'N', 'Sang',  null,'60','13BT3')
insert into SinhVien values ('13603022', 'Than', 'N', 'Duy',  null,'60','13BT3')
insert into SinhVien values ('13603023', 'Ho', 'C', 'Phuc',  null,'60','13BT3')
insert into SinhVien values ('13603024', 'Vo', 'C', 'Hong',  null,'60','13BT3')
insert into SinhVien values ('13603025', 'Phan', 'D', 'Thao',  null,'60','13BT3')
insert into SinhVien values ('13603026', 'Duong', 'V', 'Bach',  null,'60','13BT3')
insert into SinhVien values ('13603027', 'Le', 'B', 'Minh',  null,'60','13BT3')
insert into SinhVien values ('13603028', 'Le', 'H', 'Linh',  null,'60','13BT3')
insert into SinhVien values ('13603029', 'Dang', 'B', 'Thuy',  null,'60','13BT3')
insert into SinhVien values ('13603030', 'Ho', 'L', 'Ha',  null,'60','13BT3')

insert into SinhVien values ('14601001', 'Vuong', 'C', 'Thanh',  null,'60','14BT1')
insert into SinhVien values ('14601002', 'Ly', 'B', 'Anh',  null,'60','14BT1')
insert into SinhVien values ('14601003', 'Than', 'C', 'Ha',  null,'60','14BT1')
insert into SinhVien values ('14601004', 'Lam', 'L', 'Sang',  null,'60','14BT1')
insert into SinhVien values ('14601005', 'Hoang', 'T', 'Hong',  null,'60','14BT1')
insert into SinhVien values ('14601006', 'Vu', 'T', 'Anh',  null,'60','14BT1')
insert into SinhVien values ('14601007', 'Le', 'B', 'Bach',  null,'60','14BT1')
insert into SinhVien values ('14601008', 'Bui', 'H', 'Sang',  null,'60','14BT1')
insert into SinhVien values ('14601009', 'Tran', 'H', 'Huong',  null,'60','14BT1')
insert into SinhVien values ('14601010', 'Dong', 'P', 'Anh',  null,'60','14BT1')

insert into SinhVien values ('14602011', 'Phi', 'D', 'Tam',  null,'60','14BT2')
insert into SinhVien values ('14602012', 'Nguyen', 'B', 'Duong',  null,'60','14BT2')
insert into SinhVien values ('14602013', 'Nguyen', 'C', 'Quan',  null,'60','14BT2')
insert into SinhVien values ('14602014', 'Dang', 'L', 'Khiem',  null,'60','14BT2')
insert into SinhVien values ('14602015', 'Tran', 'T', 'An',  null,'60','14BT2')
insert into SinhVien values ('14602016', 'Thach', 'T', 'Anh',  null,'60','14BT2')
insert into SinhVien values ('14602017', 'Nguyen', 'B', 'Thong',  null,'60','14BT2')
insert into SinhVien values ('14602018', 'Mai', 'H', 'Ngoc',  null,'60','14BT2')
insert into SinhVien values ('14602019', 'Thao', 'H', 'Thach',  null,'60','14BT2')
insert into SinhVien values ('14602020', 'Ho', 'P', 'Nhan',  null,'60','14BT2')

insert into SinhVien values ('14603021', 'Ly', 'C', 'Thu',  null,'60','14BT3')
insert into SinhVien values ('14603022', 'Hoang', 'B', 'Huong',  null,'60','14BT3')
insert into SinhVien values ('14603023', 'Tran', 'M', 'Hong',  null,'60','14BT3')
insert into SinhVien values ('14603024', 'Duong', 'N', 'Duy',  null,'60','14BT3')
insert into SinhVien values ('14603025', 'Nguyen', 'V', 'Phuc',  null,'60','14BT3')
insert into SinhVien values ('14603026', 'Dang', 'M', 'Sang',  null,'60','14BT3')
insert into SinhVien values ('14603027', 'Nguyen', 'L', 'Thu',  null,'60','14BT3')
insert into SinhVien values ('14603028', 'Tran', 'T', 'Khang',  null,'60','14BT3')
insert into SinhVien values ('14603029', 'Than', 'M', 'Minh',  null,'60','14BT3')
insert into SinhVien values ('14603030', 'Dao', 'M', 'Thu',  null,'60','14BT3')


Insert into GiaoVu values
('NTVan','Nguyen','T','Van',null,'53'),
('ATHuong','An','T','Huong',null,'53'),
('GCTuong','Gia','C','Tuong',null,'60'),
('THThuy','Tran','H','Thuy',null,'60')


Update Khoa Set TruongKhoa = 'HVKiem' where MaKhoa = '53'
Update Khoa Set TruongKhoa = 'NTHung' where MaKhoa = '60'


Update BoMon set TruongBoMon = 'NMTriet' where MaBoMon='IT001'
Update BoMon set TruongBoMon = 'TTBHanh' where MaBoMon='IT002'
Update BoMon set TruongBoMon = 'DBTien' where MaBoMon='IT003'
Update BoMon set TruongBoMon = 'NVToan' where MaBoMon='BT001'
Update BoMon set TruongBoMon = 'PVHung' where MaBoMon='BT002'
Update BoMon set TruongBoMon = 'TTTMai' where MaBoMon='BT003'



Insert into KhoaHoc values
('CTT45112018','CTT451','1','2018','TTSon',null,1,30,'1thu23thu44thu43thu6'),
('CTT31012018','CTT310','1','2018','NNThao',null,1,30,'1thu23thu44thu43thu6'),
('CTT10512018','CTT105','1','2018','LVLong',null,1,30,'1thu23thu44thu43thu6'),
('CTT33912018','CTT339','1','2018','LTNhan',null,1,30,'1thu23thu44thu43thu6'),
('CTT20312018','CTT203','1','2018','PTBHue',null,1,30,'1thu23thu44thu43thu6'),
('BTF20412018','BTF204','1','2018','DQTuan',null,1,30,'1thu23thu44thu43thu6'),
('BTF16512018','BTF165','1','2018','LQPhu',null,1,30,'1thu23thu44thu43thu6'),
('BTF22012018','BTF220','1','2018','BKBinh',null,1,30,'1thu23thu44thu43thu6'),
('BTF21712018','BTF217','1','2018','TQThang',null,1,30,'1thu23thu44thu43thu6'),
('BTF21112018','BTF211','1','2018','QVHai',null,1,30,'1thu23thu44thu43thu6'),
('CTT00532017','CTT005','3','2017','CXNam',null,0,30,'1thu23thu44thu43thu6'),
('CTT30332017','CTT303','3','2017','BTDanh',null,0,30,'1thu23thu44thu43thu6'),
('CTT52832017','CTT528','3','2017','LVMinh',null,0,30,'1thu23thu44thu43thu6'),
('CTT10332017','CTT103','3','2017','NDHuy',null,0,30,'1thu23thu44thu43thu6'),
('CTT50532017','CTT505','3','2017','NTMThu',null,0,30,'1thu23thu44thu43thu6'),
('BTF40132017','BTF401','3','2017','NKPhung',null,0,30,'1thu23thu44thu43thu6'),
('BTF30232017','BTF302','3','2017','MDViet',null,0,30,'1thu23thu44thu43thu6'),
('BTF17732017','BTF177','3','2017','NQThong',null,0,30,'1thu23thu44thu43thu6'),
('BTF20832017','BTF208','3','2017','VTDat',null,0,30,'1thu23thu44thu43thu6'),
('BTF21932017','BTF219','3','2017','LTVo',null,0,30,'1thu23thu44thu43thu6')

Insert into DangKy values
('13531001','CTT45112018'),
('13531002','CTT45112018'),
('13531003','CTT45112018'),
('13531004','CTT45112018'),
('13531005','CTT45112018'),
('13531006','CTT45112018'),
('13531007','CTT45112018'),
('13531008','CTT45112018'),
('13531009','CTT45112018'),
('14601001','BTF20412018'),
('14601002','BTF20412018'),
('14601003','BTF20412018'),
('14601004','BTF20412018'),
('14601005','BTF20412018'),
('14601006','BTF20412018'),
('14601007','BTF20412018'),
('13531001','CTT00532017'),
('13531002','CTT00532017'),
('13531003','CTT00532017'),
('13531004','CTT00532017'),
('13531005','CTT00532017'),
('13531006','CTT00532017'),
('13531007','CTT00532017'),
('13531008','CTT00532017'),
('13531009','CTT00532017')


Insert into Diem values 
('13531001','CTT00532017',8),
('13531002','CTT00532017',7),
('13531003','CTT00532017',6),
('13531004','CTT00532017',8),
('13531005','CTT00532017',8),
('13531006','CTT00532017',9),
('13531007','CTT00532017',10),
('13531008','CTT00532017',6),
('13531009','CTT00532017',7)

*/































