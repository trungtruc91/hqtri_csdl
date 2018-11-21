CREATE DATABASE QLTKNH
GO
-----------------------------------------------------
-----------------------------------------------------
USE QLTKNH
GO
---------------------------------------------
-- THE_NGAN_HANG
CREATE TABLE THE_NH(
	MaThe nvarchar(10),
	TenNH nvarchar(20),
	STK	nvarchar(20),
	Chinhanh	nvarchar(50),
	MaTK	nvarchar(10),
	constraint pk_mt primary key(Mathe)
)
---------------------------------------------
-- TAI_KHOAN
CREATE TABLE TAI_KHOAN(
	MaTK	nvarchar(10),	
	TenTK	nvarchar(20),
	NgaySinh	smalldatetime,
	DiaChi	nvarchar(50),
	SDT nvarchar(13),
	CMND	nvarchar(20),	
	GioiTinh nvarchar(10),
	NgayCap smalldatetime,
	Sodu money,
	MatKhau nvarchar(20),
	constraint pk_tk primary key(MaTK)
)
---------------------------------------------
-- LOAI_GIAO_DICH
CREATE TABLE LOAI_GD(
	MaLoaiGD	nvarchar(10),
	TenGD	nvarchar(50),
	constraint pk_mlgd primary key(MaLoaiGD)	
)
---------------------------------------------
-- GIAO_DICH
CREATE TABLE GIAO_DICH(
	MaGD	nvarchar(10),
	MaTK 	nvarchar(10),
	MaLoaiGD 	nvarchar(10),
	ThoiGian 	smalldatetime,
	SoTien money,
	MaTKNhan nvarchar(10)
	constraint pk_mgd primary key(MaGD)
)
--ADD_FK
ALTER TABLE THE_NH ADD CONSTRAINT fk_THE_NH_TAI_KHOAN FOREIGN KEY(MATK) REFERENCES TAI_KHOAN(MATK);
ALTER TABLE GIAO_DICH ADD CONSTRAINT fk_GIAO_DICH_LOAI_GD FOREIGN KEY(MaLoaiGD) REFERENCES LOAI_GD(MaLoaiGD);
ALTER TABLE GIAO_DICH ADD CONSTRAINT fk_GIAO_DICH_TAI_KHOAN FOREIGN KEY(MATK) REFERENCES TAI_KHOAN(MATK);

set dateformat dmy

---- THE_NGAN_HANG--
insert into THE_NH values('THE_01','ACB','686868','731 Tran Hung Dao, Q5, TpHCM','TK_01')
insert into THE_NH values('THE_02','Agribank','97043668','23/5 Nguyen Trai, Q5, TpHCM','TK_03')
insert into THE_NH values('THE_03','Oceanbank','97043668','45 Nguyen Canh Chan, Q1, TpHCM','TK_04')
insert into THE_NH values('THE_04','TPBank','97043666','50/34 Le Dai Hanh, Q10, TpHCM','TK_05')
insert into THE_NH values('THE_05','SeABank','526418','34 Truong Dinh, Q3, TpHCM','TK_07')
insert into THE_NH values('THE_06','BacABank','428310','227 Nguyen Van Cu, Q5, TpHCM','TK_04')
insert into THE_NH values('THE_07','VietinBank','377160','32/3 Tran Binh Trong, Q5, TpHCM','TK_10')
insert into THE_NH values('THE_08','BIDV','436361','45/2 An Duong Vuong, Q5, TpHCM','TK_05')
insert into THE_NH values('THE_09','VPBank','436438','873 Le Hong Phong, Q5, TpHCM','TK_09')
insert into THE_NH values('THE_10','Techcombank','620009','34/34B Nguyen Trai, Q1, TpHCM','TK_07')
-- TAI_KHOAN
insert into TAI_KHOAN values('TK_01','Nguyen Van A','22/10/1966','873 Le Hong Phong, Q5, TpHCM','0975141782','261530872','1','14/10/2015',12000000,'15426578')
insert into TAI_KHOAN values('TK_02','Tran Ngoc Han','03/04/1974','23/5 Nguyen Trai, Q5, TpHCM','0983 355 888','025797278','2','10/10/2010',15000000,'14578953')
insert into TAI_KHOAN values('TK_03','Tran Ngoc Linh','12/06/1980','45 Nguyen Canh Chan, Q1, TpHCM','01249469999','301652591','2','01/03/2017',30000000,'25469874')
insert into TAI_KHOAN values('TK_04','Tran Minh Long','09/03/1965','34 Truong Dinh, Q3, TpHCM','0983730318','079098003272','1','15/6/2016',25000000,'14569874')
insert into TAI_KHOAN values('TK_05','Le Nhat Minh','10/03/1950','45/2 An Duong Vuong, Q5, TpHCM','0914761877','261572379','1','03/2/2012',54000000,'36587425')
insert into TAI_KHOAN values('TK_06','Le Hoai Thuong','31/12/1981','32/3 Tran Binh Trong, Q5, TpHCM','0976736328','241687977','2','08/12/2005',58000000,'125478956')
insert into TAI_KHOAN values('TK_07','Nguyen Van Tam','06/04/1971','873 Le Hong Phong, Q5, TpHCM','098 429 8866','233210430','1','16/9/2013',14000000,'14784566')
insert into TAI_KHOAN values('TK_08','Phan Thi Thanh','10/01/1971','50/34 Le Dai Hanh, Q10, TpHCM','0912446579','022394370','2','10/7/2013',23000000,'12354789')
insert into TAI_KHOAN values('TK_09','Le Ha Vinh','03/09/1979','34/34B Nguyen Trai, Q1, TpHCM','0985021978','079192003393','1','15/01/2015',45000000,'486698775')
insert into TAI_KHOAN values('TK_10','Ha Duy Lap','02/05/1983','731 Tran Hung Dao, Q5, TpHCM','0979490666','281194790','1','30/01/2012',17000000,'14569766354')
-- LOAI_GIAO_DICH
insert into LOAI_GD values('LOAI_01','NOP TIEN')
insert into LOAI_GD values('LOAI_02','CHUYEN KHOAN')
insert into LOAI_GD values('LOAI_03','RUT TIEN')
insert into LOAI_GD values('TT_01','THANH TOAN TIEN DIEN')
insert into LOAI_GD values('TT_02','THANH TOAN TIEN NUOC')
insert into LOAI_GD values('TT_03','THANH TOAN TIEN CUOC DIEN THOAI CO DINH')
insert into LOAI_GD values('TT_04','THANH TOAN CUOC DIEN THOAI DI DONG')
insert into LOAI_GD values('TT_05','THANH TOAN CUOC INTERNET')
insert into LOAI_GD values('TT_06','DONG TIEN HOC PHI')
insert into LOAI_GD values('TT_07','THANH TOAN TIEN VE MAY BAY')
insert into LOAI_GD values('TT_08','THANH TOAN TIEN VE TAU LUA')
-- GIAO_DICH
insert into GIAO_DICH values('GD_01','TK_01','LOAI_01','11/11/2008',150000,'422151')
insert into GIAO_DICH values('GD_02','TK_10','TT_02','08/12/2017',4500000,'429418')
insert into GIAO_DICH values('GD_03','TK_04','TT_03','01/11/2015',8500000,'970414')
insert into GIAO_DICH values('GD_04','TK_05','TT_04','11/01/2017',1400000,'970407')
insert into GIAO_DICH values('GD_05','TK_01','TT_05','10/3/2016',4500000,'970448')
insert into GIAO_DICH values('GD_06','TK_06','TT_07','09/5/2018',1800000,'970419')
insert into GIAO_DICH values('GD_07','TK_07','TT_08','05/11/2017',1540000,'970442')
insert into GIAO_DICH values('GD_08','TK_09','LOAI_03','06/12/2016',1780000,'970449')
insert into GIAO_DICH values('GD_09','TK_03','TT_05','11/01/2017',350000,'620164')
insert into GIAO_DICH values('GD_10','TK_08','TT_07','05/11/2017',700000,'620166')
insert into GIAO_DICH values('GD_11','TK_02','LOAI_02','11/01/2017',1600000,'620169')
SELECT * FROM TAI_KHOAN
SELECT * FROM THE_NH
SELECT * FROM GIAO_DICH
SELECT * FROM LOAI_GD