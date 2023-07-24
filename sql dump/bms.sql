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


-- Dumping database structure for bms
CREATE DATABASE IF NOT EXISTS `bms` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bms`;

-- Dumping structure for table bms.author
CREATE TABLE IF NOT EXISTS `author` (
  `authorname` varchar(25) NOT NULL,
  `mailID` varchar(25) NOT NULL,
  `ISBN` int(11) DEFAULT NULL,
  KEY `ISBN` (`ISBN`),
  CONSTRAINT `author_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table bms.book
CREATE TABLE IF NOT EXISTS `book` (
  `ISBN` int(11) NOT NULL,
  `title` varchar(25) NOT NULL,
  `category` varchar(25) NOT NULL,
  `NoOfBooks` int(11) DEFAULT NULL,
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table bms.bookissue
CREATE TABLE IF NOT EXISTS `bookissue` (
  `issueID` int(11) NOT NULL AUTO_INCREMENT,
  `usn` varchar(25) NOT NULL,
  `issueDate` date DEFAULT NULL,
  `returnDate` date DEFAULT NULL,
  `ISBN` int(11) DEFAULT NULL,
  PRIMARY KEY (`issueID`),
  KEY `usn` (`usn`),
  KEY `ISBN` (`ISBN`),
  CONSTRAINT `bookissue_ibfk_1` FOREIGN KEY (`usn`) REFERENCES `student` (`usn`),
  CONSTRAINT `bookissue_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table bms.student
CREATE TABLE IF NOT EXISTS `student` (
  `usn` varchar(25) NOT NULL,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`usn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table bms.users
CREATE TABLE IF NOT EXISTS `users` (
  `userName` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phoneNo` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
