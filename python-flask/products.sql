-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 12, 2024 at 09:09 AM
-- Server version: 5.7.39
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nextjsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `price`) VALUES
(1, 'Iphone 15 Pro', '1.png', 30),
(2, 'Mac Mini 2', '2.png', 40),
(3, 'Redmi Note 13 6+128G/8+256G', '3.png', 45),
(4, 'Infinix Hot 40i, up to 16GB [8+ 256GB]', '4.png', 46),
(5, '2024 Chance To Win Realme C35 5G', '5.png', 47),
(6, 'Gadget and Smartphone Samsung', '6.png', 58),
(7, 'i14pro max 6.8 inch 10.0', '7.png', 125),
(8, 'Infinix Note 30i cellphones sale 2024', '8.png', 156),
(9, 'OPPO Reno10 Pro+ 5G original', '9.png', 256),
(10, 'Original infinix i15 Pro Max Cellphone', '10.png', 458),
(11, '2024Brand New i15 pro max Original', '11.png', 895),
(12, 'TECNO Pova 5 Pro 5G original', '12.png', 485),
(13, 'OPPO Reno11 Pro 5G original', '13.png', 369),
(14, '2024 i15 pro max cellphone original ', '14.png', 789),
(15, 'Infinix Smart 8 cellphones sale 2024', '15.png', 456),
(16, 'OPPO A3S Smartphone 6GB+128GB', '16.png', 123);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_products_image` (`image`),
  ADD UNIQUE KEY `ix_products_name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
