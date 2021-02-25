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
  `cityId` int NOT NULL AUTO_INCREMENT,
  `cityName` varchar(20) NOT NULL,
  `countryId` int NOT NULL,
  PRIMARY KEY (`cityId`),
  KEY `city_countryId_fk` (`countryId`),
  CONSTRAINT `city_countryId_fk` FOREIGN KEY (`countryId`) REFERENCES `country` (`countryId`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

/*Data for the table `city` */

insert  into `city`(`cityId`,`cityName`,`countryId`) values 
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
  `continentId` int NOT NULL AUTO_INCREMENT,
  `continentName` varchar(15) NOT NULL,
  PRIMARY KEY (`continentId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `continent` */

insert  into `continent`(`continentId`,`continentName`) values 
(1,'亞洲'),
(2,'美洲'),
(3,'歐洲'),
(4,'非洲'),
(5,'大洋洲'),
(6,'南極洲');

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `countryId` int NOT NULL AUTO_INCREMENT,
  `countryName` varchar(20) NOT NULL,
  `continentId` int NOT NULL,
  PRIMARY KEY (`countryId`),
  KEY `country_continentId_fk` (`continentId`),
  CONSTRAINT `country_continentId_fk` FOREIGN KEY (`continentId`) REFERENCES `continent` (`continentId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `country` */

insert  into `country`(`countryId`,`countryName`,`continentId`) values 
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
  `feedbackId` int NOT NULL AUTO_INCREMENT,
  `feedbackText` varchar(100) NOT NULL,
  `f_createTime` datetime NOT NULL,
  `fb_freeze` tinyint NOT NULL DEFAULT '0',
  `itemId` int NOT NULL,
  PRIMARY KEY (`feedbackId`),
  KEY `feedback_itemId_fk` (`itemId`),
  CONSTRAINT `feedback_itemId_fk` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `feedback` */

/*Table structure for table `item` */

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `itemId` int NOT NULL AUTO_INCREMENT,
  `itemHeader` varchar(40) NOT NULL,
  `itemPrice` int NOT NULL,
  `itemQty` int NOT NULL,
  `itemDes` varchar(100) NOT NULL,
  `itId` int NOT NULL,
  `itemPic1` varchar(7000) DEFAULT NULL,
  `itemPic2` varchar(7000) DEFAULT NULL,
  `itemPic3` varchar(7000) DEFAULT NULL,
  `item_freeze` tinyint NOT NULL DEFAULT '0',
  `countryId` int NOT NULL,
  PRIMARY KEY (`itemId`),
  KEY `item_itId_fk` (`itId`),
  KEY `item_countryId_fk` (`countryId`),
  CONSTRAINT `item_countryId_fk` FOREIGN KEY (`countryId`) REFERENCES `country` (`countryId`),
  CONSTRAINT `item_itId_fk` FOREIGN KEY (`itId`) REFERENCES `item_type` (`itId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `item` */

insert  into `item`(`itemId`,`itemHeader`,`itemPrice`,`itemQty`,`itemDes`,`itId`,`itemPic1`,`itemPic2`,`itemPic3`,`item_freeze`,`countryId`) values 
(1,'MAMA泰國泡麵',10,35,'最常見的泰式泡麵，結合打拋豬肉和豬骨湯，口味偏清淡，三大品牌都有出這口味，但是最推MAMA的！',1,NULL,NULL,NULL,0,6),
(2,'紫玉酥禮盒(6入)',250,100,'台中大甲裕珍馨人氣商品！以大甲芋頭及優質米為開發概念，酥、鬆、Q多重口感在口中綻放！',1,NULL,NULL,NULL,0,1),
(3,'Press Butter Sand焦糖奶油餅',264,20,'當前東京最受矚目、最夯排隊伴手禮，焦糖奶油夾心餅，超級無敵有夠好吃！\r\n特製烤模壓製，餅乾酥香硬脆口感創舉大突破，內餡爆漿牽絲的奶油焦糖雙餡更是完美迷人不甜膩。',1,NULL,NULL,NULL,0,2),
(4,'Panasonic水離子吹風機(EH-NA99)',4750,5,'同樣讓人用過後就回不去的日本神器，吹頭髮同時保濕、護法，實在是很厲害～。從EH-NA97型號到EH-NA99(最新)，使用者高達95%滿意！',4,NULL,NULL,NULL,0,2);

/*Table structure for table `item_type` */

DROP TABLE IF EXISTS `item_type`;

CREATE TABLE `item_type` (
  `itId` int NOT NULL AUTO_INCREMENT,
  `itemType` varchar(10) NOT NULL,
  PRIMARY KEY (`itId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `item_type` */

insert  into `item_type`(`itId`,`itemType`) values 
(1,'食品'),
(2,'生活家居'),
(3,'美妝保養'),
(4,'家電3C'),
(5,'服飾配件');

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `mId` int NOT NULL AUTO_INCREMENT,
  `mAN` varchar(15) NOT NULL,
  `mPw` varchar(15) NOT NULL,
  `mGender` varchar(10) NOT NULL,
  `mName` varchar(10) NOT NULL,
  `mUid` varchar(10) NOT NULL,
  `mBDay` datetime NOT NULL,
  `mEmail` varchar(30) NOT NULL,
  `mPhone` varchar(10) NOT NULL,
  `d_mAddress` varchar(40) NOT NULL,
  `m_createTime` datetime NOT NULL,
  `mPic` varchar(10000) DEFAULT NULL,
  `m_verify` tinyint NOT NULL DEFAULT '0',
  `mPid` int NOT NULL,
  PRIMARY KEY (`mId`),
  KEY `member_mPid_fk` (`mPid`),
  CONSTRAINT `member_mPid_fk` FOREIGN KEY (`mPid`) REFERENCES `member_perm` (`mPid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `member` */

insert  into `member`(`mId`,`mAN`,`mPw`,`mGender`,`mName`,`mUid`,`mBDay`,`mEmail`,`mPhone`,`d_mAddress`,`m_createTime`,`mPic`,`m_verify`,`mPid`) values 
(1,'spotstour','0000','男','諸葛村夫','F123456789','1987-08-07 00:00:00','spotstour@gmail.com','0912345678','台北市天龍區民權西路天橋下','2021-02-25 00:00:00',NULL,1,2);

/*Table structure for table `member_perm` */

DROP TABLE IF EXISTS `member_perm`;

CREATE TABLE `member_perm` (
  `mPid` int NOT NULL AUTO_INCREMENT,
  `mPermissions` varchar(10) NOT NULL,
  PRIMARY KEY (`mPid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `member_perm` */

insert  into `member_perm`(`mPid`,`mPermissions`) values 
(1,'管理員'),
(2,'會員'),
(3,'停權中');

/*Table structure for table `ord` */

DROP TABLE IF EXISTS `ord`;

CREATE TABLE `ord` (
  `ord_Id` int NOT NULL AUTO_INCREMENT,
  `mId` int NOT NULL,
  `oSid` int NOT NULL,
  `s_createTime` datetime NOT NULL,
  `o_createTime` datetime NOT NULL,
  `s_mAddress` varchar(40) NOT NULL,
  `receiptTypeId` int NOT NULL,
  `shipTypeId` int NOT NULL,
  PRIMARY KEY (`ord_Id`),
  KEY `ord_mId_fk` (`mId`),
  KEY `ord_oSid_fk` (`oSid`),
  KEY `ord_receiptTypeId_fk` (`receiptTypeId`),
  KEY `ord_shipTypeId_fk` (`shipTypeId`),
  CONSTRAINT `ord_mId_fk` FOREIGN KEY (`mId`) REFERENCES `member` (`mId`),
  CONSTRAINT `ord_oSid_fk` FOREIGN KEY (`oSid`) REFERENCES `ord_stat` (`oSid`),
  CONSTRAINT `ord_receiptTypeId_fk` FOREIGN KEY (`receiptTypeId`) REFERENCES `receipt_type` (`receiptTypeId`),
  CONSTRAINT `ord_shipTypeId_fk` FOREIGN KEY (`shipTypeId`) REFERENCES `ship_type` (`shipTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ord` */

/*Table structure for table `ord_deatail` */

DROP TABLE IF EXISTS `ord_deatail`;

CREATE TABLE `ord_deatail` (
  `ord_dId` int NOT NULL AUTO_INCREMENT,
  `ord_Id` int NOT NULL,
  `ordQty` int NOT NULL,
  `itemId` int NOT NULL,
  PRIMARY KEY (`ord_dId`),
  KEY `ord_deatail_ord_Id_fk` (`ord_Id`),
  KEY `ord_deatail_itemId_fk` (`itemId`),
  CONSTRAINT `ord_deatail_itemId_fk` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`),
  CONSTRAINT `ord_deatail_ord_Id_fk` FOREIGN KEY (`ord_Id`) REFERENCES `ord` (`ord_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ord_deatail` */

/*Table structure for table `ord_stat` */

DROP TABLE IF EXISTS `ord_stat`;

CREATE TABLE `ord_stat` (
  `oSid` int NOT NULL AUTO_INCREMENT,
  `ordStat` varchar(10) NOT NULL,
  PRIMARY KEY (`oSid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ord_stat` */

/*Table structure for table `params` */

DROP TABLE IF EXISTS `params`;

CREATE TABLE `params` (
  `type` varchar(10) NOT NULL,
  `typeName` varchar(10) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `params` */

/*Table structure for table `place_type` */

DROP TABLE IF EXISTS `place_type`;

CREATE TABLE `place_type` (
  `placeTypeId` int NOT NULL AUTO_INCREMENT,
  `placeType` varchar(20) NOT NULL,
  PRIMARY KEY (`placeTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `place_type` */

insert  into `place_type`(`placeTypeId`,`placeType`) values 
(1,'景點'),
(2,'餐廳'),
(3,'旅館');

/*Table structure for table `portfolio` */

DROP TABLE IF EXISTS `portfolio`;

CREATE TABLE `portfolio` (
  `portfolioId` int NOT NULL AUTO_INCREMENT,
  `portfolioName` varchar(50) NOT NULL,
  `portfolioText` varchar(255) NOT NULL,
  `p_createTime` datetime NOT NULL,
  `pAddress` varchar(40) NOT NULL,
  `longitude` varchar(10) NOT NULL,
  `latitude` varchar(10) NOT NULL,
  `cityId` int NOT NULL,
  `mId` int NOT NULL,
  `placeTypeId` int NOT NULL,
  PRIMARY KEY (`portfolioId`),
  KEY `portfolio_cityId_fk` (`cityId`),
  KEY `portfolio_mId_fk` (`mId`),
  KEY `portfolio_placeTypeId_fk` (`placeTypeId`),
  CONSTRAINT `portfolio_cityId_fk` FOREIGN KEY (`cityId`) REFERENCES `city` (`cityId`),
  CONSTRAINT `portfolio_mId_fk` FOREIGN KEY (`mId`) REFERENCES `member` (`mId`),
  CONSTRAINT `portfolio_placeTypeId_fk` FOREIGN KEY (`placeTypeId`) REFERENCES `place_type` (`placeTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `portfolio` */

insert  into `portfolio`(`portfolioId`,`portfolioName`,`portfolioText`,`p_createTime`,`pAddress`,`longitude`,`latitude`,`cityId`,`mId`,`placeTypeId`) values 
(1,'台北101','位於臺灣臺北市信義區的摩天大樓，樓高508米（1,667英尺），地上101層、地下5層，總樓地板面積37萬1千平方公尺。','2021-02-25 00:00:00','台北市信義區市府路45號','121.564','25.033',1,1,1),
(2,'龍虎塔','位於台灣高雄市左營區蓮花湖的一座寺廟。這座寺廟建於1976年。其中一座塔是虎塔，另一座是龍塔。','2021-01-22 00:00:00','高雄市左營區蓮潭路9號','120.292','22.680',3,1,1),
(3,'武陵農場','位於台灣台中市和平區平等里，是親近雪霸國家公園的重要遊憩據點，海拔1750公尺至2200公尺，為中華民國國軍退除役官兵輔導委員會所經營之公有事業。','2020-11-16 00:00:00','台中市和平區武陵路3-1號','121.308','24.345',2,1,1);

/*Table structure for table `portfoliomsg` */

DROP TABLE IF EXISTS `portfoliomsg`;

CREATE TABLE `portfoliomsg` (
  `portfolioMsgId` int NOT NULL AUTO_INCREMENT,
  `portfolioId` int NOT NULL,
  `msgText` varchar(200) NOT NULL,
  `pm_createTime` datetime NOT NULL,
  `pmsg_freeze` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`portfolioMsgId`),
  KEY `portfolioMsg_portfolioId_fk` (`portfolioId`),
  CONSTRAINT `portfolioMsg_portfolioId_fk` FOREIGN KEY (`portfolioId`) REFERENCES `portfolio` (`portfolioId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `portfoliomsg` */

/*Table structure for table `receipt_type` */

DROP TABLE IF EXISTS `receipt_type`;

CREATE TABLE `receipt_type` (
  `receiptTypeId` int NOT NULL AUTO_INCREMENT,
  `receiptType` varchar(15) NOT NULL,
  PRIMARY KEY (`receiptTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `receipt_type` */

/*Table structure for table `record` */

DROP TABLE IF EXISTS `record`;

CREATE TABLE `record` (
  `recordId` int NOT NULL AUTO_INCREMENT,
  `portfolioId` int NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`recordId`),
  KEY `record_portfolioId_fk` (`portfolioId`),
  KEY `record_type_fk` (`type`),
  CONSTRAINT `record_portfolioId_fk` FOREIGN KEY (`portfolioId`) REFERENCES `portfolio` (`portfolioId`),
  CONSTRAINT `record_type_fk` FOREIGN KEY (`type`) REFERENCES `params` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `record` */

/*Table structure for table `report_type` */

DROP TABLE IF EXISTS `report_type`;

CREATE TABLE `report_type` (
  `rtId` int NOT NULL AUTO_INCREMENT,
  `reportType` varchar(20) NOT NULL,
  PRIMARY KEY (`rtId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `report_type` */

/*Table structure for table `ship_type` */

DROP TABLE IF EXISTS `ship_type`;

CREATE TABLE `ship_type` (
  `shipTypeId` int NOT NULL AUTO_INCREMENT,
  `shipType` varchar(15) NOT NULL,
  PRIMARY KEY (`shipTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `ship_type` */

insert  into `ship_type`(`shipTypeId`,`shipType`) values 
(1,'宅配'),
(2,'郵寄'),
(3,'7-11門市取貨'),
(4,'全家門市取貨'),
(5,'萊爾富門市取貨');

/*Table structure for table `shoppingcart` */

DROP TABLE IF EXISTS `shoppingcart`;

CREATE TABLE `shoppingcart` (
  `sc_Id` int NOT NULL AUTO_INCREMENT,
  `mId` int NOT NULL,
  `itemId` int NOT NULL,
  `s_ordQty` int NOT NULL,
  PRIMARY KEY (`sc_Id`),
  KEY `shoppingCart_mId_fk` (`mId`),
  KEY `shoppingCart_itemId_fk` (`itemId`),
  CONSTRAINT `shoppingCart_itemId_fk` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`),
  CONSTRAINT `shoppingCart_mId_fk` FOREIGN KEY (`mId`) REFERENCES `member` (`mId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shoppingcart` */

/*Table structure for table `video` */

DROP TABLE IF EXISTS `video`;

CREATE TABLE `video` (
  `videoId` int NOT NULL AUTO_INCREMENT,
  `videoFile` varchar(100) NOT NULL,
  `videoPic` varchar(20000) NOT NULL,
  `v_freeze` tinyint NOT NULL DEFAULT '0',
  `portfolioId` int NOT NULL,
  PRIMARY KEY (`videoId`),
  KEY `video_portfolioId_fk` (`portfolioId`),
  CONSTRAINT `video_portfolioId_fk` FOREIGN KEY (`portfolioId`) REFERENCES `portfolio` (`portfolioId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `video` */

/*Table structure for table `video_report` */

DROP TABLE IF EXISTS `video_report`;

CREATE TABLE `video_report` (
  `reportId` int NOT NULL AUTO_INCREMENT,
  `reportText` varchar(100) NOT NULL,
  `rtId` int NOT NULL,
  `videoId` int NOT NULL,
  PRIMARY KEY (`reportId`),
  KEY `video_Report_videoId_fk` (`videoId`),
  KEY `video_Report_rtId_fk` (`rtId`),
  CONSTRAINT `video_Report_rtId_fk` FOREIGN KEY (`rtId`) REFERENCES `report_type` (`rtId`),
  CONSTRAINT `video_Report_videoId_fk` FOREIGN KEY (`videoId`) REFERENCES `video` (`videoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `video_report` */

/*Table structure for table `watch_times` */

DROP TABLE IF EXISTS `watch_times`;

CREATE TABLE `watch_times` (
  `viewsId` int NOT NULL AUTO_INCREMENT,
  `portfolioId` int NOT NULL,
  `wt_createTime` datetime NOT NULL,
  PRIMARY KEY (`viewsId`),
  KEY `watch_times_portfolioId_fk` (`portfolioId`),
  CONSTRAINT `watch_times_portfolioId_fk` FOREIGN KEY (`portfolioId`) REFERENCES `portfolio` (`portfolioId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `watch_times` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
