-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.2.12-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for pos
CREATE DATABASE IF NOT EXISTS `pos` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pos`;

-- Dumping structure for table pos.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `cartID` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `cost` double NOT NULL,
  `orderDate` tinyblob DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `f_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`cartID`),
  KEY `FK_867x3yysb1f3jk41cv3vsoejj` (`customer_id`),
  KEY `FK_h4ftfanh1ky637ocpdabtuv7` (`f_id`),
  CONSTRAINT `FK_867x3yysb1f3jk41cv3vsoejj` FOREIGN KEY (`customer_id`) REFERENCES `user_credentials` (`id`),
  CONSTRAINT `FK_h4ftfanh1ky637ocpdabtuv7` FOREIGN KEY (`f_id`) REFERENCES `food` (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table pos.food
CREATE TABLE IF NOT EXISTS `food` (
  `f_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `foodID` varchar(6) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `foodSize` varchar(15) NOT NULL,
  `type` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table pos.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `o_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orderStatus` varchar(15) DEFAULT NULL,
  `orderDate` tinyblob NOT NULL,
  `orderID` varchar(6) DEFAULT NULL,
  `totalPrice` double NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `s_id` bigint(20) DEFAULT NULL,
  `mobileNo` varchar(10) NOT NULL,
  `city` varchar(15) NOT NULL,
  `state` varchar(15) NOT NULL,
  `street` varchar(50) NOT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `cartID` int(11) DEFAULT NULL,
  PRIMARY KEY (`o_id`),
  KEY `FK_astys1dv61mdlp0n0wx0574r2` (`customer_id`),
  KEY `FK_kat9k6mul3dlbs82y8wnp44l` (`s_id`),
  KEY `FK_1jl4d1kh4qdy5xeuxce50n4ji` (`cartID`),
  CONSTRAINT `FK_1jl4d1kh4qdy5xeuxce50n4ji` FOREIGN KEY (`cartID`) REFERENCES `cart` (`cartID`),
  CONSTRAINT `FK_astys1dv61mdlp0n0wx0574r2` FOREIGN KEY (`customer_id`) REFERENCES `user_credentials` (`id`),
  CONSTRAINT `FK_kat9k6mul3dlbs82y8wnp44l` FOREIGN KEY (`s_id`) REFERENCES `store` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table pos.ordersdemo
CREATE TABLE IF NOT EXISTS `ordersdemo` (
  `orderID` bigint(20) NOT NULL AUTO_INCREMENT,
  `orderDate` tinyblob NOT NULL,
  `orderStatus` varchar(15) DEFAULT NULL,
  `storeID` varchar(15) DEFAULT NULL,
  `totalPrice` double NOT NULL,
  `userID` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`orderID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table pos.store
CREATE TABLE IF NOT EXISTS `store` (
  `s_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city` varchar(15) NOT NULL,
  `mobileNo` varchar(10) NOT NULL,
  `name` varchar(15) NOT NULL,
  `pincode` varchar(10) NOT NULL,
  `state` varchar(15) NOT NULL,
  `storeID` varchar(6) DEFAULT NULL,
  `street` varchar(50) NOT NULL,
  PRIMARY KEY (`s_id`),
  UNIQUE KEY `UK_mwicjgpv36mj36ktnv70cihix` (`storeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table pos.user_credentials
CREATE TABLE IF NOT EXISTS `user_credentials` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `isActive` varchar(255) NOT NULL,
  `loginStatus` int(11) NOT NULL,
  `password` varchar(20) NOT NULL,
  `userID` varchar(6) DEFAULT NULL,
  `userType` varchar(15) NOT NULL DEFAULT 'C',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table pos.user_profile
CREATE TABLE IF NOT EXISTS `user_profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city` varchar(20) NOT NULL,
  `dateOfBirth` varchar(255) NOT NULL,
  `emailID` varchar(30) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `gender` varchar(7) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `location` varchar(20) NOT NULL,
  `mobileNo` varchar(10) NOT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `state` varchar(20) NOT NULL,
  `street` varchar(30) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_juu2an6e8ovwrq35dqjt0gsq1` (`customer_id`),
  CONSTRAINT `FK_juu2an6e8ovwrq35dqjt0gsq1` FOREIGN KEY (`customer_id`) REFERENCES `user_credentials` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
