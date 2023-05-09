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


-- Dumping database structure for hbr
CREATE DATABASE IF NOT EXISTS `hbr` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `hbr`;

-- Dumping structure for table hbr.address
CREATE TABLE IF NOT EXISTS `address` (
  `address_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table hbr.book
CREATE TABLE IF NOT EXISTS `book` (
  `bId` int(11) NOT NULL,
  `bName` varchar(255) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `ISBN` int(11) NOT NULL,
  `price` double NOT NULL,
  `title` varchar(25) NOT NULL,
  PRIMARY KEY (`bId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table hbr.course
CREATE TABLE IF NOT EXISTS `course` (
  `course_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table hbr.credentialbean
CREATE TABLE IF NOT EXISTS `credentialbean` (
  `userID` bigint(20) NOT NULL AUTO_INCREMENT,
  `loginStatus` int(11) NOT NULL,
  `password` varchar(20) NOT NULL,
  `userType` varchar(15) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table hbr.credentials
CREATE TABLE IF NOT EXISTS `credentials` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `userID` varchar(255) DEFAULT NULL,
  `profile_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sg2lvsvhb61pnomyaxyvbripn` (`profile_id`),
  CONSTRAINT `FK_sg2lvsvhb61pnomyaxyvbripn` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table hbr.department
CREATE TABLE IF NOT EXISTS `department` (
  `deptId` int(11) NOT NULL,
  `deptName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`deptId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table hbr.employee
CREATE TABLE IF NOT EXISTS `employee` (
  `deptName` varchar(255) DEFAULT NULL,
  `joinDate` datetime DEFAULT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`pid`),
  CONSTRAINT `FK_hsk7r953xl8fww2u6o3831ayt` FOREIGN KEY (`pid`) REFERENCES `person` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table hbr.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `orderID` bigint(20) NOT NULL AUTO_INCREMENT,
  `mobileNo` varchar(10) NOT NULL,
  `city` varchar(15) NOT NULL,
  `state` varchar(15) NOT NULL,
  `orderStatus` varchar(15) DEFAULT NULL,
  `street` varchar(50) NOT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `totalPrice` double NOT NULL,
  `userID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  KEY `FK_fj9x12lojwenc6sac0hw57j6s` (`userID`),
  CONSTRAINT `FK_fj9x12lojwenc6sac0hw57j6s` FOREIGN KEY (`userID`) REFERENCES `credentialbean` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table hbr.owner
CREATE TABLE IF NOT EXISTS `owner` (
  `stakes` bigint(20) DEFAULT NULL,
  `stocks` bigint(20) DEFAULT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`pid`),
  CONSTRAINT `FK_9nuitm5d9edcwpv9iak3wnra6` FOREIGN KEY (`pid`) REFERENCES `person` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table hbr.person
CREATE TABLE IF NOT EXISTS `person` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table hbr.phone
CREATE TABLE IF NOT EXISTS `phone` (
  `phone_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(10) NOT NULL,
  `phone_type` varchar(10) NOT NULL,
  PRIMARY KEY (`phone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table hbr.profile
CREATE TABLE IF NOT EXISTS `profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table hbr.student
CREATE TABLE IF NOT EXISTS `student` (
  `student_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address_address_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `FK_gg59s5egp80dx9cuc3bikln5s` (`address_address_id`),
  CONSTRAINT `FK_gg59s5egp80dx9cuc3bikln5s` FOREIGN KEY (`address_address_id`) REFERENCES `address` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table hbr.student_course
CREATE TABLE IF NOT EXISTS `student_course` (
  `student_id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  PRIMARY KEY (`student_id`,`course_id`),
  KEY `FK_8eu2c4tg0i8amuwx6n6d4i8h0` (`course_id`),
  CONSTRAINT `FK_3shg469d7jsf2a81b5x62jlq1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `FK_8eu2c4tg0i8amuwx6n6d4i8h0` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table hbr.student_demo
CREATE TABLE IF NOT EXISTS `student_demo` (
  `rollno` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`rollno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table hbr.student_phone
CREATE TABLE IF NOT EXISTS `student_phone` (
  `student_id` bigint(20) NOT NULL,
  `phone_id` bigint(20) NOT NULL,
  PRIMARY KEY (`student_id`,`phone_id`),
  UNIQUE KEY `UK_47fvm2iwrl4atlgh5mbu6hfix` (`phone_id`),
  CONSTRAINT `FK_2y29rpk7akxnylxg45r3c9k5n` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `FK_47fvm2iwrl4atlgh5mbu6hfix` FOREIGN KEY (`phone_id`) REFERENCES `phone` (`phone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table hbr.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(25) NOT NULL,
  `userId` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table hbr.user_credentials
CREATE TABLE IF NOT EXISTS `user_credentials` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loginStatus` int(11) NOT NULL,
  `password` varchar(20) NOT NULL,
  `userID` varchar(6) DEFAULT NULL,
  `userType` varchar(15) NOT NULL DEFAULT 'C',
  `profile_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_f75dqhkg6hyoml1mo0b1y7qin` (`userID`),
  KEY `FK_ej3lk8yfco1uj4iydi358mo6q` (`profile_id`),
  CONSTRAINT `FK_ej3lk8yfco1uj4iydi358mo6q` FOREIGN KEY (`profile_id`) REFERENCES `user_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table hbr.user_profile
CREATE TABLE IF NOT EXISTS `user_profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city` varchar(20) NOT NULL,
  `emailID` varchar(30) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `gender` varchar(7) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `location` varchar(20) NOT NULL,
  `mobileNo` varchar(10) NOT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `state` varchar(20) NOT NULL,
  `street` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
