/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.7.22-log : Database - demo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`demo` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `demo`;

/*Table structure for table `item` */

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `ItemGID` varchar(100) NOT NULL,
  `ItemID` varchar(100) NOT NULL DEFAULT 'No Data',
  `ItemName` varchar(100) DEFAULT NULL,
  `ItemDesc` varchar(100) DEFAULT NULL,
  `Weight` decimal(18,6) DEFAULT NULL,
  `Volumn` decimal(18,6) DEFAULT NULL,
  `UDF01` varchar(100) DEFAULT NULL,
  `UDF02` varchar(100) DEFAULT NULL,
  `UDF03` varchar(100) DEFAULT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedDate` datetime DEFAULT NULL,
  `TS` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`ItemGID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `item_detail` */

DROP TABLE IF EXISTS `item_detail`;

CREATE TABLE `item_detail` (
  `GUID` varchar(100) NOT NULL,
  `ItemGID` varchar(100) NOT NULL,
  `LINE_ID` int(11) DEFAULT NULL,
  `LineName` varchar(100) DEFAULT NULL,
  `LineName2` bigint(20) DEFAULT NULL,
  `LineName3` bigint(20) DEFAULT NULL,
  `Content` text,
  `REMARK_CONTENT` text,
  PRIMARY KEY (`GUID`),
  KEY `ItemGID` (`ItemGID`),
  CONSTRAINT `item_detail_ibfk_1` FOREIGN KEY (`ItemGID`) REFERENCES `item` (`ItemGID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;