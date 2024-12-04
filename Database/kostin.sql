-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2023 at 05:23 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `golivin`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `entry_date` datetime(6) DEFAULT NULL,
  `exit_date` datetime(6) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `pencari_kost_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `entry_date`, `exit_date`, `payment_status`, `pencari_kost_id`, `room_id`) VALUES
(1, '2023-12-29 00:00:00.000000', '2023-12-28 00:00:00.000000', 'unpaid', 1, 52),
(2, '2023-12-28 00:00:00.000000', '2024-01-26 00:00:00.000000', 'unpaid', 1, 2),
(3, '2023-12-26 00:00:00.000000', '2024-01-30 00:00:00.000000', 'paid', 1, 1),
(52, '2023-12-27 00:00:00.000000', '2024-01-27 00:00:00.000000', 'paid', 1, 102),
(102, '2023-12-29 00:00:00.000000', '2024-02-23 00:00:00.000000', 'paid', 1, 152);

-- --------------------------------------------------------

--
-- Table structure for table `kost`
--

CREATE TABLE `kost` (
  `kost_id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `allowed_female` bit(1) DEFAULT NULL,
  `allowed_male` bit(1) DEFAULT NULL,
  `approved` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pemilik_kost_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kost`
--

INSERT INTO `kost` (`kost_id`, `address`, `allowed_female`, `allowed_male`, `approved`, `name`, `pemilik_kost_id`) VALUES
(1, 'pga', b'1', b'0', b'1', 'sazira', 1),
(2, 'sukabirus', b'0', b'1', b'0', 'adakos', 1),
(3, 'sukabirus', b'0', b'1', b'0', 'adakos', 1),
(4, 'sukabirus', b'0', b'1', b'0', 'adakos', 1),
(52, 'sukabirus', b'0', b'1', b'0', 'adakos', NULL),
(53, 'sukabirus', b'0', b'1', b'0', 'adakos', NULL),
(54, 'sukabirus', b'0', b'1', b'0', 'adakos', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `payment_amount` int(11) DEFAULT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `payment_method` varchar(45) DEFAULT NULL,
  `pencari_kost_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pemilik_kost`
--

CREATE TABLE `pemilik_kost` (
  `pemilik_kost_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pemilik_kost`
--

INSERT INTO `pemilik_kost` (`pemilik_kost_id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `pencari_kost`
--

CREATE TABLE `pencari_kost` (
  `pencari_kost_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pencari_kost`
--

INSERT INTO `pencari_kost` (`pencari_kost_id`) VALUES
(1),
(2),
(52);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_id` int(11) NOT NULL,
  `booked` bit(1) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `kost_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_id`, `booked`, `description`, `price`, `kost_id`) VALUES
(1, b'1', NULL, 2100000, 1),
(2, b'1', NULL, 2100000, 1),
(52, b'1', 'kamar mandi dalam', 100000, 1),
(102, b'1', 'kamar Mandi Dalam\r\nAC', 2100000, 1),
(152, b'1', 'lengkap, parkiran, ac, wc', 2100000, 1),
(202, b'0', 'kamar mandi dalam', 2500000, 1),
(203, b'0', 'kamar mandi dalam ac', 2500000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `pemilik_id` int(11) DEFAULT NULL,
  `pencari_kost_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email`, `password`, `phone_number`, `username`, `admin_id`, `pemilik_id`, `pencari_kost_id`) VALUES
(1, 'aliciaparinussa@gmail.com', '123', '021', 'alicia', NULL, 1, NULL),
(2, 'aliciaparinussa@student.telkomuniversity.ac.id', '123', '021', 'cia', NULL, NULL, 1),
(52, 'aliciaparinussa1@gmail.com', '123', '0821', 'admin', 1, NULL, NULL),
(102, '', '', '', '', NULL, NULL, 2),
(152, 'alicia@gmail.com', '123', '01234', 'aliciaparinussa', NULL, NULL, 52);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD UNIQUE KEY `UK_f8g9hchhrh483y78iebt0l7t4` (`room_id`),
  ADD KEY `FKb4sqswbtlc55s4etjib35a2h9` (`pencari_kost_id`);

--
-- Indexes for table `kost`
--
ALTER TABLE `kost`
  ADD PRIMARY KEY (`kost_id`),
  ADD KEY `FKkjbicf6joamvq4gcd0hq7c9ep` (`pemilik_kost_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `pemilik_kost`
--
ALTER TABLE `pemilik_kost`
  ADD PRIMARY KEY (`pemilik_kost_id`);

--
-- Indexes for table `pencari_kost`
--
ALTER TABLE `pencari_kost`
  ADD PRIMARY KEY (`pencari_kost_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `FKslsssewo8coih329mk4oswcfp` (`kost_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `UK_gh40rf50g7ot1dodjtygnq6im` (`admin_id`),
  ADD UNIQUE KEY `UK_8wjtidr0d006g9d9lo3qkidii` (`pemilik_id`),
  ADD UNIQUE KEY `UK_oqdaw0sgat4j14fx4pd0wim55` (`pencari_kost_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `FKb4sqswbtlc55s4etjib35a2h9` FOREIGN KEY (`pencari_kost_id`) REFERENCES `pencari_kost` (`pencari_kost_id`),
  ADD CONSTRAINT `FKq83pan5xy2a6rn0qsl9bckqai` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`);

--
-- Constraints for table `kost`
--
ALTER TABLE `kost`
  ADD CONSTRAINT `FKkjbicf6joamvq4gcd0hq7c9ep` FOREIGN KEY (`pemilik_kost_id`) REFERENCES `pemilik_kost` (`pemilik_kost_id`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `FKslsssewo8coih329mk4oswcfp` FOREIGN KEY (`kost_id`) REFERENCES `kost` (`kost_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FKn1k3jmj3lglxypxktpos1othi` FOREIGN KEY (`pemilik_id`) REFERENCES `pemilik_kost` (`pemilik_kost_id`),
  ADD CONSTRAINT `FKni7k8xv4yx9yrdlv3f8efgn9c` FOREIGN KEY (`pencari_kost_id`) REFERENCES `pencari_kost` (`pencari_kost_id`),
  ADD CONSTRAINT `FKpi0nc9w2flbfset55lce6a63f` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
