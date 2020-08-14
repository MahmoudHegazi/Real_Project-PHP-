-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 14, 2020 at 05:12 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myadmin`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL COMMENT 'update/comment id',
  `ticket_id` int(11) NOT NULL COMMENT 'which ticket this comment for ',
  `content` text NOT NULL COMMENT 'content',
  `image` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` text NOT NULL,
  `ticket_title` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `sub_location` varchar(255) DEFAULT NULL,
  `image` text,
  `resigned` varchar(3) NOT NULL COMMENT 'yes/no',
  `devices_count` int(2) DEFAULT NULL COMMENT 'employee can get no divces',
  `creator_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `maintenance`
--

CREATE TABLE `maintenance` (
  `id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL COMMENT 'device for this recored',
  `supplier_id` int(255) DEFAULT NULL COMMENT 'supplier_id',
  `creator_id` int(11) NOT NULL,
  `price` varchar(25) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL COMMENT 'ticket on this reocred',
  `last_employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `sup_id` int(11) NOT NULL COMMENT 'supplier_id',
  `name` varchar(255) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `sup_image` text COMMENT 'if no images uploaded upload default value',
  `sup_history` text,
  `extra_data` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tables contains suppliers info';

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `sup_id` int(11) NOT NULL,
  `maintenance_record_id` int(20) NOT NULL,
  `device_id` int(11) NOT NULL,
  `date_create` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `name` varchar(255) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `website` int(11) DEFAULT NULL,
  `image` int(11) NOT NULL,
  `isadmin` int(1) DEFAULT NULL,
  `user` varchar(20) NOT NULL,
  `password` varchar(150) NOT NULL,
  `tickets_count` varchar(25) DEFAULT NULL COMMENT 'number_of_users_tickets',
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `workstation`
--

CREATE TABLE `workstation` (
  `id` int(25) NOT NULL,
  `type` int(1) NOT NULL COMMENT '1= desktop/ 2 = laptop/ 3 = other',
  `service_tag` varchar(50) NOT NULL,
  `manufacture` varchar(255) DEFAULT NULL COMMENT 'model',
  `purchased_date` varchar(25) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `price` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='all devices';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creator_id` (`creator_id`);

--
-- Indexes for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creator_id` (`creator_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `device_id` (`device_id`),
  ADD KEY `last_employee_id` (`last_employee_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`sup_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creator_id` (`creator_id`),
  ADD KEY `device_id` (`device_id`),
  ADD KEY `maintenance_record_id` (`maintenance_record_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workstation`
--
ALTER TABLE `workstation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'update/comment id';

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `sup_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'supplier_id';

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workstation`
--
ALTER TABLE `workstation`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD CONSTRAINT `maintenance_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `maintenance_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`sup_id`),
  ADD CONSTRAINT `maintenance_ibfk_3` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`),
  ADD CONSTRAINT `maintenance_ibfk_4` FOREIGN KEY (`device_id`) REFERENCES `workstation` (`id`),
  ADD CONSTRAINT `maintenance_ibfk_5` FOREIGN KEY (`last_employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`device_id`) REFERENCES `workstation` (`id`),
  ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`maintenance_record_id`) REFERENCES `maintenance` (`id`);

--
-- Constraints for table `workstation`
--
ALTER TABLE `workstation`
  ADD CONSTRAINT `workstation_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`sup_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
