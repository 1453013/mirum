﻿use PARKING

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SET IDENTITY_INSERT  [dbo].[DS_NHANVIEN] ON


INSERT [dbo].[DS_NHANVIEN] ([MANV], [TENNHANVIEN], [STT], [MATKHAU], [HINH], [MANHOMNHANVIEN]) VALUES 
('3284196560','Nguyễn Nam Thanh',60,'8FF7C62AAF6276BE4C5674F55B56450G',null,1),
('3284196561','Lê Ngọc Dũng',61,'8FF7C62AAF6276BE4C5674F55B56450G',null,1),
('3284196562','Vũ Chiêu Phong',62,'8FF7C62AAF6276BE4C5674F55B56450G',null,1),
('3284196563','Hoàng Công Phụng',63,'8FF7C62AAF6276BE4C5674F55B56450G',null,1),
('3284196564','Lương Duy Thắng',64,'8FF7C62AAF6276BE4C5674F55B56450G',null,1),
('3284196565','Đỗ Ðình Chương',65,'8FF7C62AAF6276BE4C5674F55B56450G',null,1),
('3284196566','Phạm Mạnh Hà',66,'8FF7C62AAF6276BE4C5674F55B56450G',null,1),
('3284196567','Lạc Ðạt Hòa',67,'8FF7C62AAF6276BE4C5674F55B56450G',null,1),
('3284196568','Đỗ Việt Khang',68,'8FF7C62AAF6276BE4C5674F55B56450G',null,1),
('3284196569','Vương Hoài Tín',69,'8FF7C62AAF6276BE4C5674F55B56450G',null,1),
('3284196570','Nguyễn Mạnh Chiến',70,'8FF7C62AAF6276BE4C5674F55B56450G',null,1),
('3284196571','Sái An Nguyên',71,'8FF7C62AAF6276BE4C5674F55B56450G',null,1),
('3284196572','Huỳnh Ðông Dương',72,'8FF7C62AAF6276BE4C5674F55B56450G',null,1),
('3284196573','Chu Quốc Vũ',73,'8FF7C62AAF6276BE4C5674F55B56450G',null,1),
('3284196574','Nguyễn Quốc Hoàng',74,'8FF7C62AAF6276BE4C5674F55B56450G',null,1),
('3284196575','Triệu Vĩnh Hưng',75,'8FF7C62AAF6276BE4C5674F55B56450G',null,1);


SET IDENTITY_INSERT  [dbo].[DS_NHANVIEN] OFF
