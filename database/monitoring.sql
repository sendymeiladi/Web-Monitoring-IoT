-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 12, 2023 at 12:13 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `monitoring`
--

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `username` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `aktif` char(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`username`, `password`, `nama_lengkap`, `aktif`) VALUES
('admin', '$2y$10$nofDJeJH6N/Kgk1ouNSGle56LVXaN5EYnSLZ31LAQi8IzEaXBjp6G', 'admin ganteng', '1'),
('Budi', '$2y$10$qfGPC5FDwE0VmfR7ov841OWiiKPBglb1h.cN7NpkQs0tiav5M4N4.', 'Budi cilok', '1'),
('dery', '$2y$10$Q/0t40o99DF0Ac9SJ8N5Veg1GlRYlvszR9g0pUJvxyIdlXKgNV446', 'dery gondrong', '1'),
('sendy', '$2y$10$xwVgCpqLBnIHzoq4rWGlAOeCEaRzOioYLug/jGsmji1xHkhEe.eMS', 'sendy sehat', '0');

-- --------------------------------------------------------

--
-- Table structure for table `perangkat`
--

CREATE TABLE `perangkat` (
  `serialnumber` varchar(255) NOT NULL,
  `lokasi` text NOT NULL,
  `aktif` char(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `perangkat`
--

INSERT INTO `perangkat` (`serialnumber`, `lokasi`, `aktif`) VALUES
('11111', 'Gedung C', '0'),
('12345', 'Gedung A', '1'),
('4672597', 'Kamar', '1'),
('aaaaa', 'Gedung D', '0'),
('abcde', 'Gedung C', '1'),
('qwerty', 'Gedung B', '1'),
('wasd', 'Gedung F', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sensor`
--

CREATE TABLE `sensor` (
  `id` int NOT NULL,
  `waktu` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sensor` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `serialnumber` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sensor`
--

INSERT INTO `sensor` (`id`, `waktu`, `sensor`, `data`, `serialnumber`) VALUES
(1, '2023-04-04 08:51:38', 'Suhu', '30', 'qwerty'),
(4, '2023-04-05 17:07:01', 'suhu', '45', 'qwerty'),
(5, '2023-04-05 17:07:37', 'kelembaban', '75', '12345'),
(6, '2023-04-08 15:33:15', 'suhu', '33', 'wasd'),
(7, '2023-04-12 06:00:39', 'pot', '', '4672597'),
(8, '2023-04-12 06:25:39', 'pot', '1', '4672597'),
(9, '2023-04-12 07:05:02', 'suhu', '56', '4672597');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `perangkat`
--
ALTER TABLE `perangkat`
  ADD PRIMARY KEY (`serialnumber`);

--
-- Indexes for table `sensor`
--
ALTER TABLE `sensor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `serialnumber` (`serialnumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sensor`
--
ALTER TABLE `sensor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sensor`
--
ALTER TABLE `sensor`
  ADD CONSTRAINT `sensor_ibfk_1` FOREIGN KEY (`serialnumber`) REFERENCES `perangkat` (`serialnumber`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
