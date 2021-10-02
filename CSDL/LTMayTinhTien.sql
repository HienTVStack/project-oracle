
GO
CREATE TABLE tbl_NhomSanPham(
	PK_sNhomSanPhamID varchar(50) not null primary key,
	sTenNhomSanPham varchar(150) not null
)


INSERT INTO tbl_NhomSanPham VALUES ('Phone', 'Dien thoai')
INSERT INTO tbl_NhomSanPham VALUES ('Laptop', 'May tinh xach tay')
INSERT INTO tbl_NhomSanPham VALUES ('Computer', 'May tinh ban')

CREATE TABLE tbl_DanhMucSanPham (
	PK_sDanhMucSanPhamID varchar(50) not null primary key,
	FK_sNhomSanPhamID varchar(50) not null,
	sTenDanhMucSanPham varchar(150) not null	
)
GO

INSERT INTO tbl_DanhMucSanPham VALUES ('Iphone', 'Phone', 'Danh muc san pham Iphone')
INSERT INTO tbl_DanhMucSanPham VALUES ('SamSung', 'Phone', 'Danh muc san pham SamSung')
INSERT INTO tbl_DanhMucSanPham VALUES ('Hawai', 'Phone', 'Danh muc san pham Hawai')
INSERT INTO tbl_DanhMucSanPham VALUES ('LT-Dell', 'Laptop', 'Danh muc san pham laptop dell')
INSERT INTO tbl_DanhMucSanPham VALUES ('LT-Acer', 'Laptop', 'Danh muc san pham laptop acer')
INSERT INTO tbl_DanhMucSanPham VALUES ('LT-Thinkpad', 'Laptop', 'Danh muc san pham latop thinkpad')









CREATE TABLE tbl_GiamGia (
	PK_iGiamGiaID int GENERATED ALWAYS AS IDENTITY primary key,
	sTenGiamGia varchar(150) not null,
	sMoTa varchar(150),
	dNgayBatDauGiamGia date,
	dNgayKetThucGiamGia date,
	fMucGiamGia float,
	bHienThi int default 1
)
--  constraint cons_chk_bHienThi check(bHienThi IN(1, 0)
insert into tbl_giamgia(sTenGiamGia, sMoTa, dNgayBatDauGiamGia, dNgayKetThucGiamGia, fMucGiamGia)
values ('Chua co chuong trinh giam gia', 'Chua co chuong trinh giam gia', to_date('2015-01-01', 'yy-mm-dd'), to_date('2015-01-01', 'yy-mm-dd'), 0);

GO
CREATE TABLE tbl_SanPham (
	PK_iSanPhamID int GENERATED ALWAYS AS IDENTITY not null primary key,
	FK_sDanhMucSanPhamID varchar(50) not null,
	FK_iGiamGiaID int not null,
	FK_iKhoHangID int not null,
	sTenSanPham varchar(150) not null,
	sMoTa varchar(200) not null,
	sXuatXu varchar(150) not null,
	fGiaBan FLOAT not null check (fGiaBan >= 0),
	iSoLuongTon	int not null,
	sImage varchar(200) default NULL,
	iSoLuongXem int default 0,
	bConHang int default 1,
	bBanChay int default 1,
	bHienThi int default 1	
)
GO
drop table tbl_SanPham


CREATE TABLE tbl_TaiKhoan (
	PK_iTaiKhoanID int GENERATED ALWAYS AS IDENTITY not null primary key,
	--sTenDangNhap varchar(150) not null,
	sMatKhau varchar (150) not null,
	sEmail varchar (150),
	sChucVu varchar (150) not null,
	sHoTen varchar (150) not null,
	iNamSinh int, 
	bGioiTinh int default 1,
	sDiaChi varchar (200) default 'Undefined',
	sSoDienThoai varchar(15),
	bQuyenDangNhap int default 1 
)
GO
--INSERT INTO tbl_TaiKhoan OUTPUT INSERTED.PK_iTaiKhoanID	VALUES	('admin',	'VanHien.gmWork.it@gmail.com',	N'ADMIN', 	N'Tr?n V?n Hi?n',	2001,      	'True',	N'Qu?ng Nam',	'123',	'True'),
--																('admin',	'hientranvan27@gmail.com',	N'Thu ngân',	N'Hi?n',	2001,      	'True',	N'Qu?ng Nam',	'0337122712',	'True')
--																
GO
CREATE TABLE tbl_DonHang (
	PK_iDonHang int GENERATED ALWAYS AS IDENTITY not null primary key,
	FK_iKhachHangID int  not null,
	FK_HinhThucThanhToanID int not null,
	FK_iTaiKhoanID int not null,
	dNgayDatHang date not null,
	dNgayGiaoHang date not null,
	sDiaChiGiaoHang varchar(150) not null,
	sGhiChu varchar(150),
	bTinhTrangThanhToan int default 0, --1 là thành công
	bTinhTrangGiaoHang int default 0, -- là dã giao
	fTongTien float	
)
GO
CREATE TABLE tbl_ChiTietDonHang (
	PK_iChiTietDonHang int GENERATED ALWAYS AS IDENTITY not null primary key,
	FK_iDonHang int not null,
	FK_iSanPhamID int not null,
	iSoLuong int default 1,
	fGiaBan float,
	fGiamGia float default 0,	
	constraint FK_CTDonHang_DonHang foreign key (FK_iDonHang) references tbl_DonHang (PK_iDonHang)
)

GO

CREATE TABLE tbl_KhachHang (
	PK_iKhachHangID int GENERATED ALWAYS AS IDENTITY not null primary key,
	--sTenDangNhap varchar(150) not null,
	sMatKhau varchar (150) not null,
	sCauHoiBiMat varchar (150), 
	sCauTraLoiBiMat varchar(150),
	sHoTen varchar(150),
	iNamSinh int check (iNamSinh <= 2020),
	bGioiTinh int, -- 1 là nam
	sDiaChi varchar (150) default '',
	sSoDienThoai varchar(15) not null,
	sNgayDangKy varchar(50),
	bQuyenDangNhap int default 0 -- 1 là admin
)
GO



--INSERT INTO tbl_KhachHang(sMatKhau, sHoTen, iNamSinh, bGioiTinh, sSoDienThoai, sNgayDangKy, bQuyenDangNhap) OUTPUT INSERTED.PK_iKhachHangID VALUES	('123', N'Tr?n V?n ??c',	1987,	'True',		'0905896272',	'26/7/2021',	'True')

GO
CREATE TABLE tbl_HinhThucThanhToan (
	PK_iHinhThucThanhToanID int GENERATED ALWAYS AS IDENTITY not null primary key,
	sTenHinhThucThanhToan varchar(150) not null,
	sMoTa varchar(150) default '',
	bHienThi int default 1
)
GO
insert into tbl_HinhThucThanhToan (sTenHinhThucThanhToan, sMoTa, bHienThi) values ('Cash','Cash',1),
insert into tbl_HinhThucThanhToan (sTenHinhThucThanhToan, sMoTa, bHienThi) values ('VNPay','VNPay',1)
insert into tbl_HinhThucThanhToan (sTenHinhThucThanhToan, sMoTa, bHienThi) values ('Credit','Credit',1)
insert into tbl_HinhThucThanhToan (sTenHinhThucThanhToan, sMoTa, bHienThi) values ('Momo','Momo',1)
GO
CREATE TABLE tbl_ThanhToan (
	PK_iThanhToanID int GENERATED ALWAYS AS IDENTITY not null primary key,
	FK_iTaiKhoan int not null,
	FK_iDonHangID int not null,
	dNgayThanhToan date,
	fSoTien float default 0 check (fSoTien >= 0),
	bTrangThai int default 1  -- 1 là thành công
)

GO
CREATE TABLE tbl_Image (
	PK_iImageID int GENERATED ALWAYS AS IDENTITY not null primary key,
	FK_iSanPham int null,
	sImage varchar(200),
	bHienThi int default 1 --1  Là Hi?n th?
)

GO


CREATE TABLE tbl_TaiKhoanQuyen (
	PK_iTaiKhoanQuyenID int GENERATED ALWAYS AS IDENTITY not null primary key,
	FK_iTaiKhoanID int not null,
	FK_iPhanQuyen int not null

)
--insert into tbl_TaiKhoanQuyen output inserted.PK_iTaiKhoanQuyenID values (1,1)
GO
CREATE TABLE tbl_PhanQuyen (
	PK_iPhanQuyenID int GENERATED ALWAYS AS IDENTITY not null primary key,
	sTenQuyen varchar(50),
	iLoaiQuyen int
)
---insert into tbl_PhanQuyen output inserted.PK_iPhanQuyenID values (N'Truy c?p',1)
alter table tbl_DanhMucSanPham 
add constraint FK_Nhom_DanhMuc_SP foreign key (FK_sNhomSanPhamID) references tbl_NhomSanPham(PK_sNhomSanPhamID)
go


alter table tbl_SanPham
add constraint FK_SP_DanhMucSP foreign key (FK_sDanhMucSanPhamID) references tbl_DanhMucSanPham (PK_sDanhMucSanPhamID)
go

alter table tbl_SanPham
add constraint FK_SanPham_GiamGia foreign key (FK_iGiamGiaID) references tbl_GiamGia (PK_iGiamGiaID)
go

alter table tbl_ChiTietDonHang
add constraint FK_CTDonHang_SanPham foreign key (FK_iSanPhamID) references tbl_SanPham (PK_iSanphamID)

go
alter table tbl_Image
add constraint FK_image_SanPham foreign key (FK_iSanPham) references tbl_SanPham (PK_iSanPhamID)
go
alter table tbl_DonHang
add constraint FK_DonHang_KhachHang foreign key (FK_iKhachHangID) references tbl_KhachHang (PK_iKhachHangID)
GO
ALTER TABLE tbl_DonHang
ADD CONSTRAINT FK_DH_TK FOREIGN KEY (FK_iTaiKhoanID) references tbl_TaiKhoan(PK_iTaiKhoanID)
go
alter table tbl_DonHang
add constraint FK_DonHang_HTThanhToan foreign key (FK_HinhThucThanhToanID) references tbl_HinhThucThanhToan (PK_iHinhThucThanhToanID)
go


go

alter table tbl_ThanhToan
add constraint FK_ThanhToan_TaiKhoan foreign key (FK_iTaiKhoan) references tbl_TaiKhoan (PK_iTaiKhoanID)
go

alter table tbl_TaiKhoanQuyen 
add constraint FK_TKQuyen_PhanQuyen foreign key (FK_iPhanQuyen) references tbl_PhanQuyen (PK_iPhanQuyenID)
go
alter table tbl_TaiKhoanQuyen
add constraint FK_TKQuyen_TaiKhoan foreign key (FK_iTaiKhoanID) references tbl_TaiKhoan (PK_iTaiKhoanID)
go


--Ph?n nh?p d? li?u

--INSERT INTO tbl_PhanQuyen(sTenQuyen) values (N'Thu ngân'), ('admin')
--
--INSERT INTO tbl_TaiKhoanQuyen(FK_iTaiKhoanID, FK_iPhanQuyen) values (2, 2)
--
--INSERT INTO tbl_KhachHang(sMatKhau, sHoTen, sSoDienThoai) VALUES ('khachhang', N'Khách hàng vãng lai', '192168132')
--INSERT INTO tbl_TaiKhoanQuyen VALUES (1, 2) INSERT INTO tbl_TaiKhoanQuyen VALUES  (1, 1) INSERT INTO tbl_TaiKhoanQuyen VALUES  (2, 1)
go

 go
 
alter table 
 alter column FK_iSanPham int null
 go

 INSERT INTO tbl_NhomSanPham VALUES ( 'NSP_DT','?i?n Tho?i'),
									('NSP_Laptop', 'Laptop'),
									('NSP_Maytinh', 'Máy tính ?? bàn')
GO								
INSERT INTO tbl_DanhMucSanPham VALUES   ('Huawei','NSP_DT', N'Các dòng s?n ph?m ?i?n tho?i c?a hãng Huawei'),
                                        ('OPPO', 'NSP_DT', N'Các dòng s?n ph?m ?i?n tho?i c?a hãng OPPO'),
										('Samsung', 'NSP_DT', N'Các dòng s?n ph?m ?i?n tho?i c?a hãng Samsung'),
										('Xiaomi', 'NSP_DT', N'Các dòng s?n ph?m ?i?n tho?i c?a hãng Xiaomi'),
										('Iphone','NSP_DT', N'Các dòng s?n ph?m ?i?n tho?i Iphone'),
										('Laptop Dell', 'NSP_Laptop', N'Các dòng s?n ph?m máy tính xách tay Dell'),
										('Laptop Macbook','NSP_Laptop',N'Các dòng s?n ph?m máy tính xách tay Macbook'),
										('Laptop HP','NSP_Laptop',N'Các dòng s?n ph?m máy tính xách tay HP'),
										('Laptop Asus','NSP_Laptop',N'Các dòng s?n ph?m máy tính xách tay Asus'),
										('Laptop Lenovo','NSP_Laptop',N'Các dòng s?n ph?m máy tính xách tay Lenovo'),										
										('Máy tính Dell', 'NSP_Maytinh', N'Các lo?i máy tính ?? bàn Dell'),
										('Máy tính Asus','NSP_MayTinh',N'Các lo?i máy tính ?? bàn Asus')

GO
INSERT INTO tbl_SanPham(FK_sDanhMucSanPhamID, FK_IGIAMGIAID, FK_IKHOHANGID, STENSANPHAM, SMOTA, SXUATXU, FGIABAN, ISOLUONGTON, SIMAGE, ISOLUONGXEM, BCONHANG, BBANCHAY, BHIENTHI)
VALUES	('Hawai', 1, 1, 'Dien thoai Hawai', 'Mo ta dien thoai', 'VietNam', 3000000, 0, '600_ip6_silver_800x800_3.jpg', 10, 1, 1, 1),
																('Iphone', 1, 1, N'?i?n thoai Iphone 6s', N'Test', N'Vi?t Nam', 3200000, 10, 'images/600_ip6_silver_800x800_3.jpg', 10, 1, 1, 1),
																('Iphone', 1, 1, N'?i?n tho?i iphone 12', N'Dòng s?n ph?m s?n xu?t n?m 2019', N'Vi?t Nam', 11200000, 10, 'images/600_ip6_silver_800x800_3.jpg', 10, 1, 1, 1),
																('Iphone', 1, 1, N'?i?n tho?i iphone X', N'Dòng s?n ph?m khác v?i các lo?i iphone', N'Vi?t Nam', 9800000, 10, 'images/ipX_silver_800x800_3.jpg', 10, 1, 1, 1),
																('Iphone', 1, 1, N'?i?n tho?i iphone 5', N'?i?n tho?i cùi b?p', N'Vi?t Nam', 500000, 10, 'images/dell-xps-15-lid2-800x533-c-720x720-1.jpg', 10, 1, 1, 1),
																('Laptop Dell', 1, 1, N'Laptop dell 520SSD x 8GB', N'Laptop ??nh pro', N'Vi?t Nam', 19800000, 10, 'images/dell-xps-15-lid2-800x533-c-720x720-1.jpg', 10, 1, 1, 1),
																('Laptop Dell',1,1,N'Laptop dell 512SSD x 8GB',N'Laptop ??nh pro',N'Vi?t Nam',24000000,20,'images/dell- Inspiron- 5410- N4I5147W.jpg',10,1,1,1),
																('Laptop Macbook',1,1,N'Laptop macbook pro M1 2020 space GREY(MYD82SA/A)',N'Laptop macbook ra m?t n?m 2020',N'Vi?t Nam',33000000,10,'images/macbook_pro_m1_greyZ11C000Cj.jpg',10,1,1,1),
																('Laptop Macbook',1,1,N'Laptop macbook pro M1 2020 space GREY(Z11C000Cj)',N'Laptop macbook ra m?t n?m 2020',N'Vi?t Nam',55000000,10,'images/macbook_pro_m1_greyZ11C000Cj.jpg',10,1,1,1),
																('Laptop HP',1,1,N'Laptop HP Pavilion 15 eg0505TU i5 1135G7/8GB/512GB/Win10 (46M02PA)',N'Laptop cùi b?p',N'Vi?t Nam',1800000,10,'images/HP__Pavilion_ 15_ eg0505TU_ i5.jpg',10,1,1,1),
																('Laptop HP',1,1,N'Laptop HP Pavilion Gaming 15 dk1159TX i7 10750H/8GB/32GB+512GB/4GB GTX1650Ti/Win10 (31J36PA)',N'Laptop cùi b?p',N'Vi?t Nam',1800000,10,'images/HP_Pavilion_ Gaming _15_ dk1159TX _i7.jpg',10,1,1,1),
																('Laptop Asus',1,1,N'Laptop Asus VivoBook A515EA i3 1115G4/8GB/512GB/Win10 (BN975T)',N'Laptop cùi b?p',N'Vi?t Nam',16000000,10,'images/Asus_ VivoBook _A515EA_ i3.jpg',10,1,1,1),
																('Laptop Asus',1,1,N'Laptop Asus VivoBook A515EP i5 1135G7/8GB/512GB/2GB MX330/Win10 (BN334T) ',N'Laptop cùi b?p',N'Vi?t Nam',16000000,10,'images/Asus_ VivoBook _A515EP_ i5.jpg',10,1,1,1),
																('Laptop Lenovo',1,1,N'Laptop Lenovo Ideapad 5 15ITL05 i5 1135G7/8GB/512GB/2GB MX450/Win10 (82FG00P5VN) ',N'Laptop ??nh pro',N'Vi?t Nam',20000000,10,'images/Lenovo_Ideapad_ 5_ 15ITL05_ i5.jpg',10,1,1,1),
																('Laptop Lenovo',1,1,N'Laptop Lenovo Yoga Slim 7 14IIL05 i5 1035G4/8GB/512GB/Win10 (82A1007UVN)  ',N'Laptop ??nh pro',N'Vi?t Nam',20000000,10,'images/lenovo-yoga-slim-7-giare-note.jpg',10,1,1,1),
																('OPPO', 1, 1, N'?i?n tho?i oppo A3S', N'Dòng s?n ph?m c?a oppo', N'Vi?t Nam', 3200000, 10, 'images/oppo_A35.jpg', 10, 1, 1, 1),
																('OPPO',1,1,N'?i?n tho?i oppo Reno5',N'Dòng s?n ph?m c?a oppo',N'Vi?t Nam',7000000,10,'images/oppo_Reno5.jpg',10,1,1,1),
																('OPPO',1,1,N'?i?n tho?i oppo Reno6',N'Dòng s?n ph?m c?a oppo',N'Vi?t Nam',13000000,10,'images/oppo_Reno6.jpg',10,1,1,1),
																('OPPO',1,1,N'?i?n tho?i oppo A74',N'Dòng s?n ph?m c?a oppo',N'Vi?t Nam',6000000,10,'images/oppo_A74.jpg',10,1,1,1),
																('SamSung',1,1,N'?i?n tho?i SamSung A22',N'Dòng s?n ph?m c?a SamSung',N'Vi?t Nam',22000000,10,'images/samsung_A22.jpg',10,1,1,1),
																('SamSung',1,1,N'?i?n tho?i SamSung A32',N'Dòng s?n ph?m c?a SamSung',N'Vi?t Nam',23000000,10,'images/samsung_A32.jpg',10,1,1,1),
																('SamSung',1,1,N'?i?n tho?i SamSung A12',N'Dòng s?n ph?m c?a SamSung',N'Vi?t Nam',24000000,10,'images/samsung_A12.jpg',10,1,1,1),
																('SamSung',1,1,N'?i?n tho?i SamSung A52',N'Dòng s?n ph?m c?a SamSung',N'Vi?t Nam',25000000,10,'images/samsung_A52.jpg',10,1,1,1),
																('Xiaomi',1,1,N'?i?n thoai Xiaomi Redmi Note 10',N'Dòng s?n ph?m c?a Xiaomi',N'Vi?t Nam',6000000,10,'images/xiaomi_redmi_note_10.jpg',10,1,1,1),
																('Xiaomi',1,1,N'?i?n thoai Xiaomi Redmi 9T',N'Dòng s?n ph?m c?a Xiaomi',N'Vi?t Nam',4000000,10,'images/xiaomi_redmi_9T.jpg',10,1,1,1),
																('Xiaomi',1,1,N'?i?n thoai Xiaomi Redmi Note 10Pro',N'Dòng s?n ph?m c?a Xiaomi',N'Vi?t Nam',7000000,10,'images/xiaomi_redmi_note_10Pro.jpg',10,1,1,1),
																('Xiaomi',1,1,N'?i?n thoai Xiaomi Redmi Note 10S',N'Dòng s?n ph?m c?a Xiaomi',N'Vi?t Nam',5000000,10,'images/xiaomi_redmi_note_10S.jpg',10,1,1,1),
																('Máy tính Dell',1,1,N'Máy tính ?? bàn dell i3',N' DELL I3 VOSTRO 3888 MT 70226497',N'Vi?t Bam',13000000,10,'images/dell_i3.jpg',10,1,1,1),
																('Máy tính Dell',1,1,N'Máy tính ?? bàn dell i5',N' DELL I5 OPTIPLEX 3080 MT 42OT380001',N'Vi?t Bam',17000000,10,'images/dell_i5.jpg',10,1,1,1),
																('Máy tính Asus',1,1,N'Máy tính ?? bàn Asus ',N'PC Asus All in One V222FA',N'Vi?t Nam',17000000,10,'images/Asus_ All_ in_ One_ V222FA.jpg',10,1,1,1),
																('Máy tính Asus',1,1,N'Máy tính ?? bàn Asus ',N'PC Asus All in One V222F',N'Vi?t Nam',17000000,10,'images/Asus_ All_ in_ One_ V222F.jpg',10,1,1,1)



INSERT INTO tbl_TaiKhoan(SMATKHAU, SCHUCVU, SHOTEN, INAMSINH, BGIOITINH, SDIACHI, SSODIENTHOAI, BQUYENDANGNHAP)
VALUES ('123', 'Cashier', 'Van Hien', 2001, 1, 'Quang Nam', '0337122712', 1)

select sTenHinhThucThanhToan FROM tbl_HinhThucThanhToan

select * from tbl_DonHang

select * from tbl_ChiTietDonHang

SELECT * FROM tbl_KhoHang
GO
select * from v&database

select * from tbl_KhachHang

select * from tbl_DanhMucSanPHam

select * from tbl_NhomSanPham

select * from tbl_KhachHang
SET DATEFORMAT dmy
INSERT INTO tbl_DonHang(FK_IKHACHHANGID, FK_HINHTHUCTHANHTOANID, FK_ITAIKHOANID, DNGAYDATHANG, DNGAYGIAOHANG, SDIACHIGIAOHANG, SGHICHU, BTINHTRANGTHANHTOAN, BTINHTRANGGIAOHANG, FTONGTIEN)
VALUES (1, 1, 1, '2-10-2021', '2-10-2021', 'aaa', 'aaa', 1, 1, 3000000)


alter table tbl_DonHang
modify DNGAYGIAOHANG varchar(20)

select * from tbl_DonHang

select * from tbl_ChiTietDonHang where FK_iDonHang = 14


SELECT fTongTien FROM tbl_ChiTietDonHang, tbl_DonHang, tbl_SanPham
WHERE tbl_ChiTietDonHang.FK_iDonHang = tbl_DonHang.PK_iDonHang
AND tbl_ChiTietDonHang.FK_iSanPhamID = tbl_SanPham.PK_iSanPhamID
AND FK_iTaiKhoanID = '1'
AND bTinhTrangThanhToan = '0'
and rownum <= 1
ORDER BY PK_iDonHang DESC
LIMIT 1;