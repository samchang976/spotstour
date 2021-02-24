/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 8.0.21 : Database - spotstourdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`spotstourdb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `spotstourdb`;

/*Table structure for table `city` */

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `cityId` INT NOT NULL AUTO_INCREMENT,
  `cityName` VARCHAR(20) NOT NULL,
  `countryId` INT NOT NULL,
  PRIMARY KEY (`cityId`),
  KEY `city_countryId_fk` (`countryId`),
  CONSTRAINT `city_countryId_fk` FOREIGN KEY (`countryId`) REFERENCES `country` (`countryId`)
) ENGINE=INNODB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

/*Data for the table `city` */

INSERT  INTO `city`(`cityId`,`cityName`,`countryId`) VALUES 
(1,'台北',1),
(2,'台中',1),
(3,'高雄',1),
(4,'東京',2),
(5,'大阪',2),
(6,'北海道',2),
(7,'京都',2),
(8,'名古屋',2),
(9,'上海',3),
(10,'北京',3),
(11,'深圳市',3),
(12,'廣州市',3),
(13,'重慶市',3),
(14,'天津市',3),
(15,'杭州市',3),
(16,'成都市',3),
(17,'首爾',4),
(18,'釜山',4),
(19,'大邱',4),
(20,'仁川',4),
(21,'光州',4),
(22,'水原市',4),
(23,'胡志明市',5),
(24,'河內',5),
(25,'紐約',13),
(26,'洛杉磯',13),
(27,'華盛頓哥倫',13),
(28,'芝加哥',13),
(29,'費城',13),
(30,'舊金山',13),
(31,'西雅圖',13),
(32,'波士頓',13),
(33,'墨西哥城',14),
(34,'瓜達拉哈拉',14),
(35,'蒙特雷',14),
(36,'莫雷利亞',14),
(37,'多倫多',15),
(38,'溫哥華',15),
(39,'蒙特婁',15),
(40,'渥太華',15),
(41,'卡加利',15),
(42,'倫敦',23),
(43,'曼徹斯特',23),
(44,'愛丁堡',23),
(45,'伯明翰',23),
(46,'布里斯托爾',23),
(47,'格拉斯哥',23),
(48,'巴黎',24),
(49,'里昂',24),
(50,'馬賽',24),
(51,'聖特拉斯堡',24),
(52,'里爾',24),
(53,'波爾多',24),
(54,'阿姆斯特丹',25),
(55,'鹿特丹',25),
(56,'海牙',25),
(57,'烏特勒支',25),
(58,'恩斯赫德',25);

/*Table structure for table `continent` */

DROP TABLE IF EXISTS `continent`;

CREATE TABLE `continent` (
  `continentId` INT NOT NULL AUTO_INCREMENT,
  `continentName` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`continentId`)
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `continent` */

INSERT  INTO `continent`(`continentId`,`continentName`) VALUES 
(1,'亞洲'),
(2,'美洲'),
(3,'歐洲'),
(4,'大洋洲');

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `countryId` INT NOT NULL AUTO_INCREMENT,
  `countryName` VARCHAR(20) NOT NULL,
  `continentId` INT NOT NULL,
  PRIMARY KEY (`countryId`),
  KEY `country_continentId_fk` (`continentId`),
  CONSTRAINT `country_continentId_fk` FOREIGN KEY (`continentId`) REFERENCES `continent` (`continentId`)
) ENGINE=INNODB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `country` */

INSERT  INTO `country`(`countryId`,`countryName`,`continentId`) VALUES 
(1,'台灣',1),
(2,'日本',1),
(3,'中國',1),
(4,'韓國',1),
(5,'越南',1),
(6,'泰國',1),
(7,'新加玻',1),
(8,'馬來西亞',1),
(9,'菲律賓',1),
(10,'印尼',1),
(11,'緬甸',1),
(13,'美國',2),
(14,'墨西哥',2),
(15,'加拿大',2),
(16,'古巴',2),
(17,'巴西',2),
(18,'秘魯',2),
(19,'智利',2),
(20,'阿根廷',2),
(21,'烏拉圭',2),
(22,'哥倫比亞',2),
(23,'英國',3),
(24,'法國',3),
(25,'荷蘭',3),
(26,'愛爾蘭',3),
(27,'比利時',3),
(28,'盧森堡',3),
(29,'烏克蘭',3),
(30,'白俄羅斯',3),
(31,'立陶宛',3),
(32,'希臘',3),
(33,'義大利',3),
(34,'葡萄牙',3),
(35,'梵諦岡',3),
(36,'羅馬尼亞',3),
(37,'塞爾維亞',3),
(38,'阿爾巴尼亞',3),
(39,'西班牙',3);

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `feedbackId` INT NOT NULL AUTO_INCREMENT,
  `feedbackText` VARCHAR(100) NOT NULL,
  `f_createTime` DATETIME NOT NULL,
  `fb_freeze` TINYINT NOT NULL DEFAULT '0',
  `itemId` INT NOT NULL,
  PRIMARY KEY (`feedbackId`),
  KEY `feedback_itemId_fk` (`itemId`),
  CONSTRAINT `feedback_itemId_fk` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `feedback` */

/*Table structure for table `item_type` */

DROP TABLE IF EXISTS `item_type`;

CREATE TABLE `item_type` (
  `itId` INT NOT NULL AUTO_INCREMENT,
  `itemType` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`itId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `item_type` */

INSERT  INTO `item_type`(`itId`,`itemType`) VALUES 
(1,'水果'),
(2,'蔬菜'),
(3,'其他');

/*Table structure for table `item` */

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `itemId` INT NOT NULL AUTO_INCREMENT,
  `itemHeader` VARCHAR(40) NOT NULL,
  `itemPrice` INT NOT NULL,
  `itemQty` INT NOT NULL,
  `itemDes` VARCHAR(100) NOT NULL,
  `itId` INT NOT NULL,
  `itemPic1` VARCHAR(7000) DEFAULT NULL,
  `itemPic2` VARCHAR(7000) DEFAULT NULL,
  `itemPic3` VARCHAR(7000) DEFAULT NULL,
  `countryId` INT NOT NULL,
  PRIMARY KEY (`itemId`),
  KEY `item_countryId_fk` (`countryId`),
  KEY `FKtk3yc6xaj4aovx4t4h5k02a6d` (`itId`),
  CONSTRAINT `FKtk3yc6xaj4aovx4t4h5k02a6d` FOREIGN KEY (`itId`) REFERENCES `item_type` (`itId`),
  CONSTRAINT `item_countryId_fk` FOREIGN KEY (`countryId`) REFERENCES `country` (`countryId`),
  CONSTRAINT `item_itId_fk` FOREIGN KEY (`itId`) REFERENCES `item_type` (`itId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT  INTO `item`(`itemId`,`itemHeader`,`itemPrice`,`itemQty`,`itemDes`,`itId`,`itemPic1`,`itemPic2`,`itemPic3`,`countryId`) VALUES 
(1,'蘋果',100,50,'蘋果蘋果',1,NULL,NULL,NULL,1),
(2,'橘子',50,20,'橘子橘子',2,NULL,NULL,NULL,1),
(3,'奇異果',20,100,'奇異果奇異果',1,NULL,NULL,NULL,4),
(4,'水蜜桃',120,30,'水蜜桃水蜜桃',1,NULL,NULL,NULL,1);

/*Data for the table `item` */

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `mId` INT NOT NULL AUTO_INCREMENT,
  `mAN` VARCHAR(15) NOT NULL,
  `mPw` VARCHAR(15) NOT NULL,
  `mGender` VARCHAR(10) NOT NULL,
  `mName` VARCHAR(10) NOT NULL,
  `mUid` VARCHAR(10) NOT NULL,
  `mBDay` DATETIME NOT NULL,
  `mEmail` VARCHAR(30) NOT NULL,
  `mPhone` VARCHAR(10) NOT NULL,
  `d_mAddress` VARCHAR(40) NOT NULL,
  `m_createTime` DATETIME NOT NULL,
  `mPic` VARCHAR(10000) DEFAULT NULL,
  `m_verify` TINYINT NOT NULL DEFAULT '0',
  `mPid` INT NOT NULL,
  `fileName` VARCHAR(255) DEFAULT NULL,
  `memberId` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`mId`),
  KEY `member_mPid_fk` (`mPid`),
  CONSTRAINT `member_mPid_fk` FOREIGN KEY (`mPid`) REFERENCES `member_perm` (`mPid`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `member` */

INSERT  INTO `member`(`mId`,`mAN`,`mPw`,`mGender`,`mName`,`mUid`,`mBDay`,`mEmail`,`mPhone`,`d_mAddress`,`m_createTime`,`mPic`,`m_verify`,`mPid`,`fileName`,`memberId`) VALUES 
(1,'gust01505','0000','男','諸葛村夫','F120097463','0000-00-00 00:00:00','gust01505@gmail.com','0983774652','台北市天龍區民權西路天橋下','0000-00-00 00:00:00','0',0,1,NULL,NULL);

/*Table structure for table `member_perm` */

DROP TABLE IF EXISTS `member_perm`;

CREATE TABLE `member_perm` (
  `mPid` INT NOT NULL,
  `mPermissions` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`mPid`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `member_perm` */

INSERT  INTO `member_perm`(`mPid`,`mPermissions`) VALUES 
(0,'停權中'),
(1,'管理員'),
(2,'會員');

/*Table structure for table `ord` */

DROP TABLE IF EXISTS `ord`;

CREATE TABLE `ord` (
  `ord_Id` INT NOT NULL AUTO_INCREMENT,
  `mId` INT NOT NULL,
  `oSid` INT NOT NULL,
  `s_createTime` DATETIME NOT NULL,
  `o_createTime` DATETIME NOT NULL,
  `s_mAddress` VARCHAR(40) NOT NULL,
  `receiptTypeId` INT NOT NULL,
  `shipTypeId` INT NOT NULL,
  PRIMARY KEY (`ord_Id`),
  KEY `ord_mId_fk` (`mId`),
  KEY `ord_oSid_fk` (`oSid`),
  KEY `ord_receiptTypeId_fk` (`receiptTypeId`),
  KEY `ord_shipTypeId_fk` (`shipTypeId`),
  CONSTRAINT `ord_mId_fk` FOREIGN KEY (`mId`) REFERENCES `member` (`mId`),
  CONSTRAINT `ord_oSid_fk` FOREIGN KEY (`oSid`) REFERENCES `ord_stat` (`oSid`),
  CONSTRAINT `ord_receiptTypeId_fk` FOREIGN KEY (`receiptTypeId`) REFERENCES `receipt_type` (`receiptTypeId`),
  CONSTRAINT `ord_shipTypeId_fk` FOREIGN KEY (`shipTypeId`) REFERENCES `ship_type` (`shipTypeId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `ord` */

/*Table structure for table `ord_deatail` */

DROP TABLE IF EXISTS `ord_deatail`;

CREATE TABLE `ord_deatail` (
  `ord_dId` INT NOT NULL AUTO_INCREMENT,
  `ord_Id` INT NOT NULL,
  `ordQty` INT NOT NULL,
  `itemId` INT NOT NULL,
  PRIMARY KEY (`ord_dId`),
  KEY `ord_deatail_ord_Id_fk` (`ord_Id`),
  KEY `ord_deatail_itemId_fk` (`itemId`),
  CONSTRAINT `ord_deatail_itemId_fk` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`),
  CONSTRAINT `ord_deatail_ord_Id_fk` FOREIGN KEY (`ord_Id`) REFERENCES `ord` (`ord_Id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `ord_deatail` */

/*Table structure for table `ord_stat` */

DROP TABLE IF EXISTS `ord_stat`;

CREATE TABLE `ord_stat` (
  `oSid` INT NOT NULL AUTO_INCREMENT,
  `ordStat` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`oSid`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `ord_stat` */

/*Table structure for table `orderitems` */

DROP TABLE IF EXISTS `orderitems`;

CREATE TABLE `orderitems` (
  `seqno` INT NOT NULL AUTO_INCREMENT,
  `author` VARCHAR(255) DEFAULT NULL,
  `bookId` INT DEFAULT NULL,
  `companyName` VARCHAR(255) DEFAULT NULL,
  `description` VARCHAR(255) DEFAULT NULL,
  `discount` DOUBLE DEFAULT NULL,
  `orderNo` INT DEFAULT NULL,
  `quantity` INT DEFAULT NULL,
  `title` VARCHAR(255) DEFAULT NULL,
  `unitPrice` DOUBLE DEFAULT NULL,
  `FK_OrderBean_orderNo` INT DEFAULT NULL,
  PRIMARY KEY (`seqno`),
  KEY `FKeyhchb4i8iurymhbh38wsudis` (`FK_OrderBean_orderNo`),
  CONSTRAINT `FKeyhchb4i8iurymhbh38wsudis` FOREIGN KEY (`FK_OrderBean_orderNo`) REFERENCES `orders` (`orderNo`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `orderitems` */

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `orderNo` INT NOT NULL AUTO_INCREMENT,
  `bno` VARCHAR(255) DEFAULT NULL,
  `cancelTag` VARCHAR(255) DEFAULT NULL,
  `invoiceTitle` VARCHAR(255) DEFAULT NULL,
  `memberId` VARCHAR(255) DEFAULT NULL,
  `orderDate` DATETIME(6) DEFAULT NULL,
  `shippingAddress` VARCHAR(255) DEFAULT NULL,
  `shippingDate` DATETIME(6) DEFAULT NULL,
  `totalAmount` DOUBLE DEFAULT NULL,
  PRIMARY KEY (`orderNo`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

/*Table structure for table `params` */

DROP TABLE IF EXISTS `params`;

CREATE TABLE `params` (
  `type` VARCHAR(5) NOT NULL,
  `typeName` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `params` */

/*Table structure for table `place_type` */

DROP TABLE IF EXISTS `place_type`;

CREATE TABLE `place_type` (
  `placeTypeId` INT NOT NULL AUTO_INCREMENT,
  `placeType` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`placeTypeId`)
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `place_type` */

INSERT  INTO `place_type`(`placeTypeId`,`placeType`) VALUES 
(1,'景點'),
(2,'餐廳'),
(3,'旅館');

/*Table structure for table `portfolio` */

DROP TABLE IF EXISTS `portfolio`;

CREATE TABLE `portfolio` (
  `portfolioId` INT NOT NULL AUTO_INCREMENT,
  `portfolioName` VARCHAR(50) NOT NULL,
  `portfolioText` VARCHAR(255) NOT NULL,
  `p_createTime` DATETIME NOT NULL,
  `pAddress` VARCHAR(40) NOT NULL,
  `longitude` VARCHAR(10) NOT NULL,
  `latitude` VARCHAR(10) NOT NULL,
  `cityId` INT NOT NULL,
  `mId` INT NOT NULL,
  `placeTypeId` INT NOT NULL,
  PRIMARY KEY (`portfolioId`),
  KEY `portfolio_cityId_fk` (`cityId`),
  KEY `portfolio_mId_fk` (`mId`),
  KEY `portfolio_placeTypeId_fk` (`placeTypeId`),
  CONSTRAINT `portfolio_cityId_fk` FOREIGN KEY (`cityId`) REFERENCES `city` (`cityId`),
  CONSTRAINT `portfolio_mId_fk` FOREIGN KEY (`mId`) REFERENCES `member` (`mId`),
  CONSTRAINT `portfolio_placeTypeId_fk` FOREIGN KEY (`placeTypeId`) REFERENCES `place_type` (`placeTypeId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `portfolio` */

/*Table structure for table `portfoliomsg` */

DROP TABLE IF EXISTS `portfoliomsg`;

CREATE TABLE `portfoliomsg` (
  `portfolioMsgId` INT NOT NULL AUTO_INCREMENT,
  `portfolioId` INT NOT NULL,
  `msgText` VARCHAR(200) NOT NULL,
  `pm_createTime` DATETIME NOT NULL,
  `pmsg_freeze` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`portfolioMsgId`),
  KEY `portfolioMsg_portfolioId_fk` (`portfolioId`),
  CONSTRAINT `portfolioMsg_portfolioId_fk` FOREIGN KEY (`portfolioId`) REFERENCES `portfolio` (`portfolioId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `portfoliomsg` */

/*Table structure for table `receipt_type` */

DROP TABLE IF EXISTS `receipt_type`;

CREATE TABLE `receipt_type` (
  `receiptTypeId` INT NOT NULL AUTO_INCREMENT,
  `receiptType` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`receiptTypeId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `receipt_type` */

/*Table structure for table `record` */

DROP TABLE IF EXISTS `record`;

CREATE TABLE `record` (
  `recordId` INT NOT NULL AUTO_INCREMENT,
  `portfolioId` INT NOT NULL,
  `type` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`recordId`),
  KEY `record_portfolioId_fk` (`portfolioId`),
  KEY `record_type_fk` (`type`),
  CONSTRAINT `record_portfolioId_fk` FOREIGN KEY (`portfolioId`) REFERENCES `portfolio` (`portfolioId`),
  CONSTRAINT `record_type_fk` FOREIGN KEY (`type`) REFERENCES `params` (`type`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `record` */

/*Table structure for table `report_type` */

DROP TABLE IF EXISTS `report_type`;

CREATE TABLE `report_type` (
  `rtId` INT NOT NULL AUTO_INCREMENT,
  `reportType` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`rtId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `report_type` */

/*Table structure for table `ship_type` */

DROP TABLE IF EXISTS `ship_type`;

CREATE TABLE `ship_type` (
  `shipTypeId` INT NOT NULL AUTO_INCREMENT,
  `shipType` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`shipTypeId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `ship_type` */

/*Table structure for table `shoppingcart` */

DROP TABLE IF EXISTS `shoppingcart`;

CREATE TABLE `shoppingcart` (
  `sc_Id` INT NOT NULL AUTO_INCREMENT,
  `mId` INT NOT NULL,
  `itemId` INT NOT NULL,
  `s_ordQty` INT NOT NULL,
  PRIMARY KEY (`sc_Id`),
  KEY `shoppingCart_mId_fk` (`mId`),
  KEY `shoppingCart_itemId_fk` (`itemId`),
  CONSTRAINT `shoppingCart_itemId_fk` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`),
  CONSTRAINT `shoppingCart_mId_fk` FOREIGN KEY (`mId`) REFERENCES `member` (`mId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `shoppingcart` */

/*Table structure for table `video` */

DROP TABLE IF EXISTS `video`;

CREATE TABLE `video` (
  `videoId` INT NOT NULL AUTO_INCREMENT,
  `videoFile` VARCHAR(100) NOT NULL,
  `videoPic` VARCHAR(20000) NOT NULL,
  `v_freeze` TINYINT NOT NULL DEFAULT '0',
  `portfolioId` INT NOT NULL,
  PRIMARY KEY (`videoId`),
  KEY `video_portfolioId_fk` (`portfolioId`),
  CONSTRAINT `video_portfolioId_fk` FOREIGN KEY (`portfolioId`) REFERENCES `portfolio` (`portfolioId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `video` */

/*Table structure for table `video_report` */

DROP TABLE IF EXISTS `video_report`;

CREATE TABLE `video_report` (
  `reportId` INT NOT NULL AUTO_INCREMENT,
  `reportText` VARCHAR(100) NOT NULL,
  `rtId` INT NOT NULL,
  `videoId` INT NOT NULL,
  PRIMARY KEY (`reportId`),
  KEY `video_Report_videoId_fk` (`videoId`),
  KEY `video_Report_rtId_fk` (`rtId`),
  CONSTRAINT `video_Report_rtId_fk` FOREIGN KEY (`rtId`) REFERENCES `report_type` (`rtId`),
  CONSTRAINT `video_Report_videoId_fk` FOREIGN KEY (`videoId`) REFERENCES `video` (`videoId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `video_report` */

/*Table structure for table `watch_times` */

DROP TABLE IF EXISTS `watch_times`;

CREATE TABLE `watch_times` (
  `viewsId` INT NOT NULL AUTO_INCREMENT,
  `portfolioId` INT NOT NULL,
  `wt_createTime` DATETIME NOT NULL,
  PRIMARY KEY (`viewsId`),
  KEY `watch_times_portfolioId_fk` (`portfolioId`),
  CONSTRAINT `watch_times_portfolioId_fk` FOREIGN KEY (`portfolioId`) REFERENCES `portfolio` (`portfolioId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `watch_times` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
