-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2018 at 10:18 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vidientu`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_info` (IN `matk` VARCHAR(10), IN `name` VARCHAR(225), IN `sdt` VARCHAR(225), IN `diachi` VARCHAR(225), IN `date` DATE)  BEGIN
        	IF EXISTS (SELECT * FROM `tai_khoan` WHERE `tai_khoan`.`MaTK`= `matk`)
            THEN
            	UPDATE `tai_khoan` SET `tai_khoan`.`TenTK`=`name`,
                						`tai_khoan`.`SDT`=`sdt`,
                                        `tai_khoan`.`DiaChi`=`diachi`,
                                        `tai_khoan`.`NgaySinh`=`date`
                                    WHERE `tai_khoan`.`MaTK`=`matk`;
             ELSE 
              SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: user not exists!';
             END IF;
        END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `giao_dich`
--

CREATE TABLE `giao_dich` (
  `MaGD` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MaTK` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MaLoaiGD` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ThoiGian` date DEFAULT NULL,
  `SoTien` int(11) DEFAULT NULL,
  `MaTKNhan` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `giao_dich`
--

INSERT INTO `giao_dich` (`MaGD`, `MaTK`, `MaLoaiGD`, `ThoiGian`, `SoTien`, `MaTKNhan`) VALUES
('GD_01', 'TK_01', 'LOAI_01', '2008-11-11', 150000, '422151'),
('GD_02', 'TK_10', 'TT_02', '2017-12-08', 4500000, '429418'),
('GD_03', 'TK_04', 'TT_03', '2015-11-01', 8500000, '970414'),
('GD_04', 'TK_05', 'TT_04', '2017-01-11', 1400000, '970407'),
('GD_05', 'TK_01', 'TT_05', '2016-03-10', 4500000, '970448'),
('GD_06', 'TK_06', 'TT_07', '2018-05-09', 1800000, '970419'),
('GD_07', 'TK_07', 'TT_08', '2017-11-05', 1540000, '970442'),
('GD_08', 'TK_09', 'LOAI_03', '2016-12-06', 1780000, '970449'),
('GD_09', 'TK_03', 'TT_05', '2017-01-11', 350000, '620164'),
('GD_10', 'TK_08', 'TT_07', '2017-11-05', 700000, '620166'),
('GD_11', 'TK_02', 'LOAI_02', '2017-01-11', 1600000, '620169');

--
-- Triggers `giao_dich`
--
DELIMITER $$
CREATE TRIGGER `ADD_GD_wallet` BEFORE INSERT ON `giao_dich` FOR EACH ROW BEGIN 
SET @ST:= new.SoTien; 
IF NOT EXISTS(SELECT * FROM `tai_khoan`WHERE `tai_khoan`.`Sodu`< @ST AND `tai_khoan`.`MaTK`=new.MaTK) AND (@ST > 0) 
THEN UPDATE `tai_khoan` SET SoDu=SoDu - @ST WHERE `tai_khoan`.`MaTK`= new.MaTK;
ELSE
 SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: soTien < sodu and sotien>0!';
END IF; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UP_GD_wallet` BEFORE UPDATE ON `giao_dich` FOR EACH ROW BEGIN SET @ST:= new.SoTien; 
IF NOT EXISTS(SELECT * FROM `tai_khoan`WHERE `tai_khoan`.`Sodu`< @ST AND `tai_khoan`.`MaTK`=new.MaTK) AND (@ST > 0) THEN 
UPDATE `tai_khoan` SET SoDu=SoDu - @ST WHERE `tai_khoan`.`MaTK`= new.MaTK; 
ELSE
 SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: soTien < sodu and sotien>0!';
END IF; 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `loai_gd`
--

CREATE TABLE `loai_gd` (
  `MaLoaiGD` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TenGD` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loai_gd`
--

INSERT INTO `loai_gd` (`MaLoaiGD`, `TenGD`) VALUES
('LOAI_01', 'NOP TIEN'),
('LOAI_02', 'CHUYEN KHOAN'),
('LOAI_03', 'RUT TIEN'),
('TT_01', 'THANH TOAN TIEN DIEN'),
('TT_02', 'THANH TOAN TIEN NUOC'),
('TT_03', 'THANH TOAN TIEN CUOC DIEN THOAI CO DINH'),
('TT_04', 'THANH TOAN CUOC DIEN THOAI DI DONG'),
('TT_05', 'THANH TOAN CUOC INTERNET'),
('TT_06', 'DONG TIEN HOC PHI'),
('TT_07', 'THANH TOAN TIEN VE MAY BAY'),
('TT_08', 'THANH TOAN TIEN VE TAU LUA');

-- --------------------------------------------------------

--
-- Table structure for table `tai_khoan`
--

CREATE TABLE `tai_khoan` (
  `MaTK` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TenTK` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `DiaChi` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SDT` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CMND` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GioiTinh` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NgayCap` date DEFAULT NULL,
  `Sodu` int(11) DEFAULT NULL,
  `MatKhau` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tai_khoan`
--

INSERT INTO `tai_khoan` (`MaTK`, `TenTK`, `NgaySinh`, `DiaChi`, `SDT`, `CMND`, `GioiTinh`, `NgayCap`, `Sodu`, `MatKhau`, `username`) VALUES
('TK_01', 'nguyen van a', '1990-02-12', '26 lehongphong, q5', '012345789', '261530872', '1', '2015-10-14', 8300000, '15426578', 'vannguyen'),
('TK_02', 'Tran Ngoc Han', '1974-04-03', '23/5 Nguyen Trai, Q5, TpHCM', '0983 355 888', '025797278', '2', '2010-10-10', 15000000, '14578953', 'ngochan'),
('TK_03', 'Tran Ngoc Linh', '1980-06-12', '45 Nguyen Canh Chan, Q1, TpHCM', '01249469999', '301652591', '2', '2017-03-01', 30000000, '25469874', 'ngoclinh123'),
('TK_04', 'Tran Minh Long', '1965-03-09', '34 Truong Dinh, Q3, TpHCM', '0983730318', '079098003272', '1', '2016-06-15', 25000000, '14569874', 'long333'),
('TK_05', 'Le Nhat Minh', '1950-03-10', '45/2 An Duong Vuong, Q5, TpHCM', '0914761877', '261572379', '1', '2012-02-03', 54000000, '36587425', 'minhnhat01'),
('TK_06', 'Le Hoai Thuong', '1981-12-31', '32/3 Tran Binh Trong, Q5, TpHCM', '0976736328', '241687977', '2', '2005-12-08', 58000000, '125478956', 'thuonghoai09'),
('TK_07', 'Nguyen Van Tam', '1971-04-06', '873 Le Hong Phong, Q5, TpHCM', '098 429 8866', '233210430', '1', '2013-09-16', 14000000, '14784566', 'tam666'),
('TK_08', 'Phan Thi Thanh', '1971-01-10', '50/34 Le Dai Hanh, Q10, TpHCM', '0912446579', '022394370', '2', '2013-07-10', 23000000, '12354789', 'thanh111'),
('TK_09', 'nguyen ban ba', '1991-11-11', '     ktx khu B, tx.Di An', '0123456789', '079192003393', '1', '2015-01-15', 45000000, '123456789', 'admin'),
('TK_10', 'Ha Duy Lap', '1983-05-02', '731 Tran Hung Dao, Q5, TpHCM', '0979490666', '281194790', '1', '2012-01-30', 17000000, '14569766354', 'lapthu123');

-- --------------------------------------------------------

--
-- Table structure for table `the_nh`
--

CREATE TABLE `the_nh` (
  `MaThe` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TenNH` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STK` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Chinhanh` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MaTK` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `the_nh`
--

INSERT INTO `the_nh` (`MaThe`, `TenNH`, `STK`, `Chinhanh`, `MaTK`) VALUES
('THE_01', 'ACB', '686868', '731 Tran Hung Dao, Q5, TpHCM', 'TK_01'),
('THE_02', 'Agribank', '97043668', '23/5 Nguyen Trai, Q5, TpHCM', 'TK_03'),
('THE_03', 'Oceanbank', '97043668', '45 Nguyen Canh Chan, Q1, TpHCM', 'TK_04'),
('THE_04', 'TPBank', '97043666', '50/34 Le Dai Hanh, Q10, TpHCM', 'TK_05'),
('THE_05', 'SeABank', '526418', '34 Truong Dinh, Q3, TpHCM', 'TK_07'),
('THE_06', 'BacABank', '428310', '227 Nguyen Van Cu, Q5, TpHCM', 'TK_04'),
('THE_07', 'VietinBank', '377160', '32/3 Tran Binh Trong, Q5, TpHCM', 'TK_10'),
('THE_08', 'BIDV', '436361', '45/2 An Duong Vuong, Q5, TpHCM', 'TK_05'),
('THE_09', 'VPBank', '436438', '873 Le Hong Phong, Q5, TpHCM', 'TK_09'),
('THE_10', 'Techcombank', '620009', '34/34B Nguyen Trai, Q1, TpHCM', 'TK_07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `giao_dich`
--
ALTER TABLE `giao_dich`
  ADD PRIMARY KEY (`MaGD`),
  ADD KEY `fk_GIAO_DICH_LOAI_GD` (`MaLoaiGD`),
  ADD KEY `fk_GIAO_DICH_TAI_KHOAN` (`MaTK`);

--
-- Indexes for table `loai_gd`
--
ALTER TABLE `loai_gd`
  ADD PRIMARY KEY (`MaLoaiGD`);

--
-- Indexes for table `tai_khoan`
--
ALTER TABLE `tai_khoan`
  ADD PRIMARY KEY (`MaTK`);

--
-- Indexes for table `the_nh`
--
ALTER TABLE `the_nh`
  ADD PRIMARY KEY (`MaThe`),
  ADD KEY `fk_THE_NH_TAI_KHOAN` (`MaTK`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `giao_dich`
--
ALTER TABLE `giao_dich`
  ADD CONSTRAINT `fk_GIAO_DICH_LOAI_GD` FOREIGN KEY (`MaLoaiGD`) REFERENCES `loai_gd` (`MaLoaiGD`),
  ADD CONSTRAINT `fk_GIAO_DICH_TAI_KHOAN` FOREIGN KEY (`MaTK`) REFERENCES `tai_khoan` (`MaTK`);

--
-- Constraints for table `the_nh`
--
ALTER TABLE `the_nh`
  ADD CONSTRAINT `fk_THE_NH_TAI_KHOAN` FOREIGN KEY (`MaTK`) REFERENCES `tai_khoan` (`MaTK`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
