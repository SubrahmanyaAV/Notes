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


-- Dumping database structure for infrasuppengg
CREATE DATABASE IF NOT EXISTS `infrasuppengg` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `infrasuppengg`;

-- Dumping structure for table infrasuppengg.attendance_entry
CREATE TABLE IF NOT EXISTS `attendance_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empId` varchar(25) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `pid` varchar(50) NOT NULL,
  `projectname` varchar(255) NOT NULL,
  `location_address` varchar(500) DEFAULT NULL,
  `LAT` varchar(255) NOT NULL,
  `LON` varchar(255) NOT NULL,
  `ATT_DATE` date NOT NULL,
  `ATT_TSP` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table infrasuppengg.project
CREATE TABLE IF NOT EXISTS `project` (
  `pid` varchar(50) NOT NULL,
  `projectname` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `startdate` varchar(100) DEFAULT NULL,
  `enddate` varchar(100) DEFAULT NULL,
  `isactive` varchar(10) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table infrasuppengg.project_assignment
CREATE TABLE IF NOT EXISTS `project_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empId` varchar(25) NOT NULL,
  `pid` varchar(50) NOT NULL,
  `startdate` varchar(100) DEFAULT NULL,
  `enddate` varchar(100) DEFAULT NULL,
  `active` varchar(5) DEFAULT 'Y',
  PRIMARY KEY (`id`),
  KEY `empId` (`empId`),
  KEY `pid` (`pid`),
  CONSTRAINT `project_assignment_ibfk_1` FOREIGN KEY (`empId`) REFERENCES `user` (`empId`),
  CONSTRAINT `project_assignment_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `project` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=387 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table infrasuppengg.project_status
CREATE TABLE IF NOT EXISTS `project_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empId` varchar(25) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `pid` varchar(50) NOT NULL,
  `projectname` varchar(255) NOT NULL,
  `status_desc` varchar(500) DEFAULT NULL,
  `ps_date` date NOT NULL,
  `ps_tsp` datetime NOT NULL,
  `img` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table infrasuppengg.user
CREATE TABLE IF NOT EXISTS `user` (
  `empId` varchar(25) NOT NULL,
  `email` varchar(100) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT 'U',
  `password` longtext DEFAULT NULL,
  `isactive` varchar(10) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
