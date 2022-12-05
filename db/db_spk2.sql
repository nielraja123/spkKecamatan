-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2022 at 09:35 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_spk2`
--

-- --------------------------------------------------------

--
-- Table structure for table `kecamatan`
--

CREATE TABLE `kecamatan` (
  `kdKecamatan` int(11) NOT NULL,
  `kecamatan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kecamatan`
--

INSERT INTO `kecamatan` (`kdKecamatan`, `kecamatan`) VALUES
(11, 'Kec. Buahdua'),
(12, 'Kec. Cibugel'),
(13, 'Kec. Cimalaka'),
(14, 'Kec. Cimanggung'),
(15, 'Kec. Cisarua'),
(16, 'Kec. Cisitu'),
(17, 'Kec. Darmaraja'),
(18, 'Kec. Ganeas'),
(19, 'Kec. Conggeang'),
(20, 'Kec. Jatigede'),
(21, 'Kec. Jatinangor'),
(22, 'Kec. Jatinunggal'),
(23, 'Kec. Pamulihan'),
(24, 'Kec. Paseh'),
(25, 'Kec. Rancakalong'),
(26, 'Kec. Situraja'),
(27, 'Kec. Sukasari'),
(28, 'Kec. Sumedang Selatan'),
(29, 'Kec. Sumedang Utara'),
(30, 'Kec. Surian'),
(31, 'Kec. Tanjungkerta'),
(32, 'Kec. Tanjungmedar'),
(33, 'Kec. Tanjungsari'),
(34, 'Kec. Tomo'),
(35, 'Kec. Ujungjaya'),
(36, 'Kec. Wado');

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `kdKriteria` int(11) NOT NULL,
  `kriteria` varchar(100) NOT NULL,
  `sifat` char(1) NOT NULL,
  `bobot` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`kdKriteria`, `kriteria`, `sifat`, `bobot`) VALUES
(1, 'Jumlah KIP dari Pemerintah', 'B', 3),
(2, 'Jumlah Siswa Miskin yang Tidak Bersekolah', 'A', 4),
(3, 'Jumlah Siswa Miskin Tingkat SMA/MA yang Terbanyak', 'B', 3);

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `kdKecamatan` int(11) NOT NULL,
  `kdKriteria` int(11) NOT NULL,
  `nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`kdKecamatan`, `kdKriteria`, `nilai`) VALUES
(11, 1, 1075),
(11, 2, 795),
(11, 3, 3),
(12, 1, 124),
(12, 2, 754),
(12, 3, 3),
(13, 1, 253),
(13, 2, 1325),
(13, 3, 3),
(14, 1, 1674),
(14, 2, 3507),
(14, 3, 3),
(15, 1, 1147),
(15, 2, 605),
(15, 3, 2),
(16, 1, 788),
(16, 2, 1355),
(16, 3, 1),
(17, 1, 806),
(17, 2, 1746),
(17, 3, 3),
(18, 1, 1054),
(18, 2, 881),
(18, 3, 1),
(19, 1, 527),
(19, 2, 400),
(19, 3, 2),
(20, 1, 456),
(20, 2, 502),
(20, 3, 3),
(21, 1, 2519),
(21, 2, 2181),
(21, 3, 3),
(22, 1, 551),
(22, 2, 1919),
(22, 3, 3),
(23, 1, 903),
(23, 2, 1834),
(23, 3, 2),
(24, 1, 202),
(24, 2, 558),
(24, 3, 3),
(25, 1, 395),
(25, 2, 1070),
(25, 3, 2),
(26, 1, 353),
(26, 2, 1413),
(26, 3, 3),
(27, 1, 1054),
(27, 2, 870),
(27, 3, 3),
(28, 1, 391),
(28, 2, 2175),
(28, 3, 3),
(29, 1, 919),
(29, 2, 2614),
(29, 3, 3),
(31, 1, 271),
(31, 2, 778),
(31, 3, 3),
(32, 1, 233),
(32, 2, 592),
(32, 3, 2),
(33, 1, 655),
(33, 2, 1895),
(33, 3, 3),
(34, 1, 671),
(34, 2, 608),
(34, 3, 2),
(35, 1, 456),
(35, 2, 633),
(35, 3, 2),
(36, 1, 320),
(36, 2, 1903),
(36, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `subkriteria`
--

CREATE TABLE `subkriteria` (
  `kdSubKriteria` int(11) NOT NULL,
  `subKriteria` varchar(50) NOT NULL,
  `value` int(11) NOT NULL,
  `kdKriteria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subkriteria`
--

INSERT INTO `subkriteria` (`kdSubKriteria`, `subKriteria`, `value`, `kdKriteria`) VALUES
(16, 'SMA/MA Terbanyak', 3, 3),
(17, 'SMA/MA ada di tengah-tengah', 2, 3),
(18, 'SMA/MA Terkecil', 1, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`kdKecamatan`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`kdKriteria`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD UNIQUE KEY `indexNilai` (`kdKecamatan`,`kdKriteria`) USING BTREE,
  ADD KEY `kdKriteria` (`kdKriteria`);

--
-- Indexes for table `subkriteria`
--
ALTER TABLE `subkriteria`
  ADD PRIMARY KEY (`kdSubKriteria`),
  ADD KEY `kdKriteria` (`kdKriteria`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `kdKriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `subkriteria`
--
ALTER TABLE `subkriteria`
  MODIFY `kdSubKriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`kdKecamatan`) REFERENCES `kecamatan` (`kdKecamatan`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`kdKriteria`) REFERENCES `kriteria` (`kdKriteria`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `subkriteria`
--
ALTER TABLE `subkriteria`
  ADD CONSTRAINT `subkriteria_ibfk_1` FOREIGN KEY (`kdKriteria`) REFERENCES `kriteria` (`kdKriteria`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
