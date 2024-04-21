-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2024 at 12:04 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `accepted_request`
--

CREATE TABLE `accepted_request` (
  `request_id` varchar(15) NOT NULL,
  `customer_id` varchar(10) DEFAULT NULL,
  `p_longitude` decimal(10,6) DEFAULT NULL,
  `p_latitude` decimal(10,6) DEFAULT NULL,
  `d_longitude` decimal(10,6) DEFAULT NULL,
  `d_latitude` decimal(10,6) DEFAULT NULL,
  `service_type` varchar(255) DEFAULT NULL,
  `package_size` varchar(255) DEFAULT NULL,
  `transaction_type` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `employ_id` varchar(10) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `r_barcode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` varchar(10) NOT NULL,
  `f_name` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `f_name`, `l_name`, `email`, `password`, `phone`, `balance`) VALUES
('CU94466', 'sahand', 'wrya', 'sahand@gmail.com', '41@Sahand66', '07701435930', 200.00),
('CU98203', 'rahand', 'wrya', 'rahand@gmail.com', '41@Kurd66', '9272633', 0.00);

--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `generate_customer_id` BEFORE INSERT ON `customer` FOR EACH ROW BEGIN
    SET NEW.customer_id = CONCAT('CU', LPAD(FLOOR(RAND() * 100000), 5, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `employ`
--

CREATE TABLE `employ` (
  `employ_id` varchar(10) NOT NULL,
  `f_name` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `employ`
--
DELIMITER $$
CREATE TRIGGER `generate_employ_id` BEFORE INSERT ON `employ` FOR EACH ROW BEGIN
    SET NEW.employ_id = CONCAT('EM', LPAD(FLOOR(RAND() * 100000), 5, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `request_id` varchar(15) NOT NULL,
  `customer_id` varchar(10) DEFAULT NULL,
  `p_longitude` decimal(10,6) DEFAULT NULL,
  `p_latitude` decimal(10,6) DEFAULT NULL,
  `d_longitude` decimal(10,6) DEFAULT NULL,
  `d_latitude` decimal(10,6) DEFAULT NULL,
  `service_type` varchar(255) DEFAULT NULL,
  `package_size` varchar(255) DEFAULT NULL,
  `transaction_type` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `employ_id` varchar(10) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE `keys` (
  `key_id` int(11) NOT NULL,
  `key_value` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `is_used` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `keys`
--

INSERT INTO `keys` (`key_id`, `key_value`, `amount`, `is_used`) VALUES
(1, 'abcd', 50.00, 1),
(2, 'as', 0.00, 1),
(3, 'ad', 0.00, 1),
(4, 'ww', 0.00, 1),
(5, 'dd', 0.00, 1),
(6, 'ee', 0.00, 1),
(7, 'et', 0.00, 1),
(8, 'ws', 0.00, 1),
(9, 'cc', 0.00, 1),
(10, 'r', 0.00, 1),
(11, 'l', 0.00, 1),
(12, 'v', 10.00, 1),
(13, 'o', 10.00, 1),
(14, 'aa', 100.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `real_time_location`
--

CREATE TABLE `real_time_location` (
  `location_id` int(11) NOT NULL,
  `e_longitude` decimal(10,6) DEFAULT NULL,
  `e_latitude` decimal(10,6) DEFAULT NULL,
  `employ_id` varchar(10) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `request_id` varchar(10) NOT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `package_size` varchar(255) DEFAULT NULL,
  `package_type` varchar(255) DEFAULT NULL,
  `service_type` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `destination` varchar(200) NOT NULL,
  `pickedup` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`request_id`, `customer_id`, `package_size`, `package_type`, `service_type`, `price`, `destination`, `pickedup`) VALUES
('221279', 'CU11234', '<1kg', 'Document', 'Drone', 2, 'TextEditingController#e8f4b(TextEditingValue(text: ┤jdjd├, selection: TextSelection.collapsed(offset: 4, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: ', 'TextEditingController#8b1c5(TextEditingValue(text: ┤dhhdd├, selection: TextSelection.collapsed(offset: 5, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end:'),
('331279', 'CU11234', '<1kg', 'Document', 'Drone', 2, 'TextEditingController#e8f4b(TextEditingValue(text: ┤jdjd├, selection: TextSelection.collapsed(offset: 4, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: ', 'TextEditingController#8b1c5(TextEditingValue(text: ┤dhhdd├, selection: TextSelection.collapsed(offset: 5, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end:'),
('551279', 'CU11234', '<1kg', 'Document', 'Car', 3, 'jdjd', 'dhhdd'),
('661279', 'CU11234', '<1kg', 'Document', 'Car', 3, '38373', '37373'),
('771279', 'CU11234', '<1kg', 'Document', 'Drone', 2, '38373', '37373');

--
-- Triggers `requests`
--
DELIMITER $$
CREATE TRIGGER `before_insert_requests` BEFORE INSERT ON `requests` FOR EACH ROW BEGIN
    SET NEW.request_id = CONCAT(
        LEFT(UUID(), 1), -- Taking the first character of UUID
        UPPER(LEFT(UUID(), 1)), -- Taking the first character of UUID and converting it to uppercase
        LPAD(CONV(RIGHT(UUID(), 12), 16, 10), 4, '0') -- Converting last part of UUID to base 10 and padding it to length 4
    );
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accepted_request`
--
ALTER TABLE `accepted_request`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `employ`
--
ALTER TABLE `employ`
  ADD PRIMARY KEY (`employ_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`key_id`);

--
-- Indexes for table `real_time_location`
--
ALTER TABLE `real_time_location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`request_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `key_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `real_time_location`
--
ALTER TABLE `real_time_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
