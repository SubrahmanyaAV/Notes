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


-- Dumping database structure for ecomapp
CREATE DATABASE IF NOT EXISTS `ecomapp` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ecomapp`;

-- Dumping structure for table ecomapp.orderitems
CREATE TABLE IF NOT EXISTS `orderitems` (
  `itemId` int(11) NOT NULL AUTO_INCREMENT,
  `o_Id` int(11) DEFAULT NULL,
  `itemName` varchar(100) NOT NULL,
  `itemPrice` varchar(100) NOT NULL,
  `itemQuantity` varchar(100) NOT NULL,
  PRIMARY KEY (`itemId`),
  KEY `o_Id` (`o_Id`),
  CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`o_Id`) REFERENCES `orders` (`o_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table ecomapp.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `o_Id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` varchar(100) NOT NULL,
  `userName` varchar(100) NOT NULL,
  `orderDate` date DEFAULT NULL,
  `dlvDate` date DEFAULT NULL,
  `status` varchar(100) NOT NULL,
  `totalCost` varchar(100) NOT NULL,
  PRIMARY KEY (`o_Id`),
  KEY `userName` (`userName`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userName`) REFERENCES `users` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table ecomapp.users
CREATE TABLE IF NOT EXISTS `users` (
  `userName` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phoneNo` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL,
  PRIMARY KEY (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
