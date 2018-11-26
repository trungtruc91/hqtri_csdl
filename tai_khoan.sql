-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2018 at 05:22 AM
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
-- Database: `qltknh`
--

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
  `MatKhau` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tai_khoan`
--

INSERT INTO `tai_khoan` (`MaTK`, `TenTK`, `NgaySinh`, `DiaChi`, `SDT`, `CMND`, `GioiTinh`, `NgayCap`, `Sodu`, `MatKhau`) VALUES
('TK_01', 'Nguyen Van A', '2018-11-19', '873 Le Hong Phong, Q5, TpHCM', '0975141782', '261530872', '1', '0000-00-00', 12000000, '15426578'),
('TK_02', 'Tran Ngoc Han', '0000-00-00', '23/5 Nguyen Trai, Q5, TpHCM', '0983 355 888', '025797278', '2', '0000-00-00', 15000000, '14578953'),
('TK_03', 'Tran Ngoc Linh', '0000-00-00', '45 Nguyen Canh Chan, Q1, TpHCM', '01249469999', '301652591', '2', '0000-00-00', 30000000, '25469874'),
('TK_04', 'Tran Minh Long', '0000-00-00', '34 Truong Dinh, Q3, TpHCM', '0983730318', '079098003272', '1', '0000-00-00', 25000000, '14569874'),
('TK_05', 'Le Nhat Minh', '0000-00-00', '45/2 An Duong Vuong, Q5, TpHCM', '0914761877', '261572379', '1', '0000-00-00', 54000000, '36587425'),
('TK_06', 'Le Hoai Thuong', '0000-00-00', '32/3 Tran Binh Trong, Q5, TpHCM', '0976736328', '241687977', '2', '0000-00-00', 58000000, '125478956'),
('TK_07', 'Nguyen Van Tam', '0000-00-00', '873 Le Hong Phong, Q5, TpHCM', '098 429 8866', '233210430', '1', '0000-00-00', 14000000, '14784566'),
('TK_08', 'Phan Thi Thanh', '0000-00-00', '50/34 Le Dai Hanh, Q10, TpHCM', '0912446579', '022394370', '2', '0000-00-00', 23000000, '12354789'),
('TK_09', 'Le Ha Vinh', '0000-00-00', '34/34B Nguyen Trai, Q1, TpHCM', '0985021978', '079192003393', '1', '0000-00-00', 45000000, '486698775'),
('TK_10', 'Ha Duy Lap', '0000-00-00', '731 Tran Hung Dao, Q5, TpHCM', '0979490666', '281194790', '1', '0000-00-00', 17000000, '14569766354');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tai_khoan`
--
ALTER TABLE `tai_khoan`
  ADD PRIMARY KEY (`MaTK`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
