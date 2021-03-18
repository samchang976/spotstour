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

/*Table structure for table `activity` */

DROP TABLE IF EXISTS `activity`;

CREATE TABLE `activity` (
  `activityId` INT NOT NULL AUTO_INCREMENT,
  `activityContent` VARCHAR(255) DEFAULT NULL,
  `activityHeader` VARCHAR(255) DEFAULT NULL,
  `activity_createTime` DATE DEFAULT NULL,
  `activity_freeze` INT DEFAULT NULL,
  `activityPic` MEDIUMBLOB,
  `activityFileName` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`activityId`)
) ENGINE=INNODB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `activity` */

INSERT  INTO `activity`(`activityId`,`activityContent`,`activityHeader`,`activity_createTime`,`activity_freeze`,`activityPic`,`activityFileName`) VALUES 
(1,'歡慶牛年，扭轉乾坤，購物好時機','新年特惠，全館免運! 活動到2021-01-03','2021-01-01',0,NULL,NULL),
(2,'新春特惠，全館免運! 活動到2021-02-15','新春優惠','2021-02-01',0,NULL,NULL),
(3,'快來買喔~~~','周年慶優惠，全館免運','2021-03-10',0,NULL,NULL),
(4,'全館巧克力商品結帳85折!','情人節優惠','2021-03-10',1,NULL,NULL);

/*Table structure for table `city` */

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `cityId` INT NOT NULL AUTO_INCREMENT,
  `cityName` VARCHAR(20) NOT NULL,
  `countryId` INT NOT NULL,
  PRIMARY KEY (`cityId`),
  KEY `city_countryId_fk` (`countryId`),
  CONSTRAINT `city_countryId_fk` FOREIGN KEY (`countryId`) REFERENCES `country` (`countryId`),
  CONSTRAINT `FK78hf6lwr8j8c707wuvur9e0am` FOREIGN KEY (`countryId`) REFERENCES `country` (`countryId`)
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
) ENGINE=INNODB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `continent` */

INSERT  INTO `continent`(`continentId`,`continentName`) VALUES 
(1,'亞洲'),
(2,'美洲'),
(3,'歐洲'),
(4,'非洲'),
(5,'大洋洲'),
(6,'南極洲');

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `countryId` INT NOT NULL AUTO_INCREMENT,
  `countryName` VARCHAR(20) NOT NULL,
  `continentId` INT NOT NULL,
  PRIMARY KEY (`countryId`),
  KEY `country_continentId_fk` (`continentId`),
  CONSTRAINT `country_continentId_fk` FOREIGN KEY (`continentId`) REFERENCES `continent` (`continentId`),
  CONSTRAINT `FKh5vexlgdygaio95pyc9akil7i` FOREIGN KEY (`continentId`) REFERENCES `continent` (`continentId`)
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
  CONSTRAINT `feedback_itemId_fk` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`),
  CONSTRAINT `FKs9iiqmtehauufulmipc8mu61r` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`)
) ENGINE=INNODB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `feedback` */

INSERT  INTO `feedback`(`feedbackId`,`feedbackText`,`f_createTime`,`fb_freeze`,`itemId`) VALUES 
(1,'好吃','2021-02-23 00:00:00',0,1),
(2,'很好吃','2021-02-24 00:00:00',0,1),
(3,'非常好吃','2021-02-25 00:00:00',0,1),
(4,'好吃!!','2021-02-23 00:03:00',0,2),
(5,'很好吃!!','2021-02-24 00:04:00',0,2),
(6,'非常好吃!!','2021-02-25 00:05:00',0,2);

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
  `item_freeze` TINYINT NOT NULL DEFAULT '0',
  `countryId` INT NOT NULL,
  PRIMARY KEY (`itemId`),
  KEY `item_itId_fk` (`itId`),
  KEY `item_countryId_fk` (`countryId`),
  CONSTRAINT `FKaaneiypx6x3kjdl2jjafx3fuu` FOREIGN KEY (`countryId`) REFERENCES `country` (`countryId`),
  CONSTRAINT `FKtffcamb09gjp3yigshjgybdvs` FOREIGN KEY (`itId`) REFERENCES `item_type` (`itId`),
  CONSTRAINT `item_countryId_fk` FOREIGN KEY (`countryId`) REFERENCES `country` (`countryId`),
  CONSTRAINT `item_itId_fk` FOREIGN KEY (`itId`) REFERENCES `item_type` (`itId`)
) ENGINE=INNODB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `item` */

INSERT  INTO `item`(`itemId`,`itemHeader`,`itemPrice`,`itemQty`,`itemDes`,`itId`,`itemPic1`,`itemPic2`,`itemPic3`,`item_freeze`,`countryId`) VALUES 
(1,'MAMA泰國泡麵',10,35,'最常見的泰式泡麵，結合打拋豬肉和豬骨湯，口味偏清淡，三大品牌都有出這口味，但是最推MAMA的！',1,'itemImages/MAMA1.jpg','itemImages/MAMA2.jpg','itemImages/MAMA3.jpg',0,6),
(2,'紫玉酥禮盒(6入)',250,100,'台中大甲裕珍馨人氣商品！以大甲芋頭及優質米為開發概念，酥、鬆、Q多重口感在口中綻放！',1,'itemImages/紫玉酥禮盒1.jpg','itemImages/紫玉酥禮盒2.jpg','itemImages/紫玉酥禮盒3.jpg',0,1),
(3,'Press Butter Sand焦糖奶油餅',264,20,'當前東京最受矚目、最夯排隊伴手禮，焦糖奶油夾心餅，超級無敵有夠好吃！\r\n特製烤模壓製，餅乾酥香硬脆口感創舉大突破，內餡爆漿牽絲的奶油焦糖雙餡更是完美迷人不甜膩。',1,'itemImages/焦糖奶油餅1.jpg','itemImages/焦糖奶油餅2.jpg','itemImages/焦糖奶油餅3.jpg',0,2),
(4,'Panasonic水離子吹風機(EH-NA99)',4750,10,'同樣讓人用過後就回不去的日本神器，吹頭髮同時保濕、護法，實在是很厲害～。從EH-NA97型號到EH-NA99(最新)，使用者高達95%滿意！',4,'itemImages/水離子吹風機1.jpg','itemImages/水離子吹風機2.jpg','itemImages/水離子吹風機3.jpg',0,2),
(5,'Pocky蕃茄百利滋棒9袋入裝-134g',99,20,'★日本原裝進口★日本大廠GLICO格力高品牌★經典蕃茄百利滋口味9袋入獨立小包裝★分享方便，適合辦公室下午茶、點心',1,'itemImages/蕃茄百利滋棒1.jpg','itemImages/蕃茄百利滋棒2.jpg','itemImages/蕃茄百利滋棒3.jpg',0,2),
(6,'白色戀人巧克力餅乾36入 ',1500,10,'北海道限定 白い恋人',1,'itemImages/白色戀人巧克力餅乾1.jpg','itemImages/白色戀人巧克力餅乾2.jpg','itemImages/白色戀人巧克力餅乾3.jpg',0,2),
(7,'日本《金吾堂》芥末米果17枚',99,100,'★日本品牌《金吾堂》原裝進口★熱銷超過 60 年的米果經典老店★嚴選日本國產米，只用新鮮品質好原料',1,'itemImages/芥末米果1.jpg','itemImages/芥末米果2.jpg','itemImages/芥末米果3.jpg',0,2),
(8,'Glico固力果 冰淇淋杯餅乾 (87g)　',155,300,'★日本原裝進口 ★日本大廠Glico 固力果 ★冰淇淋造型餅乾 ★絕對讓您口感滿分',1,'itemImages/冰淇淋杯餅乾1.jpg','itemImages/冰淇淋杯餅乾2.jpg','itemImages/冰淇淋杯餅乾3.jpg',0,2),
(9,'美國 BLUE YETI 雪怪 USB麥克風 電容式麥克風 USB麥',6000,30,'極致專業的USB電容式麥克風 專屬3受音頭技術 可調四種不同收音模式:心型、雙向、全向、立體聲',4,'itemImages/電容式麥克風1.jpg','itemImages/電容式麥克風2.jpg','itemImages/電容式麥克風3.jpg',0,13),
(10,'一生懸命的米果 日本《金吾堂》甘口醬油米果7枚',99,300,'★日本品牌《金吾堂》原裝進口 ★熱銷超過 60 年的米果經典老店 ★嚴選日本國產米，只用新鮮品質好原料 ',1,'itemImages/甘口醬油米果1.jpg','itemImages/甘口醬油米果2.jpg','itemImages/甘口醬油米果3.jpg',0,2),
(11,'日本《金吾堂》和鹽米果7枚',99,200,'★日本品牌《金吾堂》原裝進口 ★熱銷超過 60 年的米果經典老店 ★嚴選日本國產米，只用新鮮品質好原料',1,'itemImages/和鹽米果1.jpg','itemImages/和鹽米果2.jpg','itemImages/和鹽米果3.jpg',0,2),
(12,'龜田手鹽屋鹽味米果9枚',79,100,'★日本原裝進口 ★口感堅脆，原味米果最對味 ★使用日本國產米製作，調味使用沈崎產鰹魚 ★原烤9枚超大片',1,'itemImages/龜田手鹽屋鹽味米果1.jpg','itemImages/龜田手鹽屋鹽味米果2.jpg','itemImages/龜田手鹽屋鹽味米果3.jpg',0,1),
(13,'日本《龜田》茶豆米果70g',79,200,'★日本米果大廠《龜田》製菓原裝進口 ★食鹽合成自日本赤穗天鹽與沖繩天日鹽 ★吃得到豆仁！原料 100％ 使用真實茶豆',1,'itemImages/茶豆米果1.jpg','itemImages/茶豆米果2.jpg','itemImages/茶豆米果3.jpg',0,2),
(14,'Honda製果 玉米濃湯餅 (90g)',59,300,'★日本原裝進口 ★日本超人氣熱銷商品 ★獨特玉米濃湯風味',1,'itemImages/玉米濃湯餅1.jpg','itemImages/玉米濃湯餅2.jpg','itemImages/玉米濃湯餅3.jpg',0,2),
(15,'Mondelez RITZ起士夾心餅乾 (160g)',105,300,'★知名餅乾RITZ ★酥脆餅乾搭配香濃起士 ★讓你欲罷不能的好滋味~',1,'itemImages/起士夾心餅乾1.jpg','itemImages/起士夾心餅乾2.jpg','itemImages/起士夾心餅乾3.jpg',0,2),
(16,'日本TWINBIRD-美型蒸氣掛燙機(白)TB-G006TW',1880,300,'◆ 超輕量設計，隨手熨燙 ◆ 設計美型，放在家中不突兀 ◆ 連續按壓，蒸氣不間斷',4,'itemImages/美型蒸氣掛燙機1.jpg','itemImages/美型蒸氣掛燙機2.jpg','itemImages/美型蒸氣掛燙機3.jpg',0,2),
(17,'日本TWINBIRD-多功能製麵包機PY-E632TW',3980,15,'◆業界最高，40種麵包/麵糰模式 ◆手動模式，不只有傻瓜模式，美味升級 ◆可獨立進行麵糰搓揉、發酵與烘焙',4,'itemImages/多功能製麵包機1.jpg','itemImages/多功能製麵包機2.jpg','itemImages/多功能製麵包機3.jpg',0,2),
(18,'[日本原裝] TIGER虎牌6人份微電腦炊飯電子鍋(JBV-S10R)',2990,10,'☆日本原裝進口 ☆內鍋再升級,黑色遠赤厚釜(1.7mm) ☆炊煮多種米飯，盡享美味',4,'itemImages/炊飯電子鍋1.jpg','itemImages/炊飯電子鍋2.jpg','itemImages/炊飯電子鍋3.jpg',0,2),
(19,'梨膏糖',280,100,'盛行於中國江南一代的梨膏糖可說是有百年的歷史，以梨汁、蜂蜜和各種草藥製成，主要功能為止咳化痰、開胃順氣。',1,'itemImages/梨膏糖1.jpg','itemImages/梨膏糖2.jpg','itemImages/梨膏糖3.jpg',0,3),
(20,'NewYork Perfect Cheese奶油起司脆餅',400,30,'由前白宮甜點師等人聯手研發，餅乾從包裝、造型感皆呈現超高質感，堪稱夢幻逸品無誤～',1,'itemImages/奶油起司脆餅1.jpg','itemImages/奶油起司脆餅2.jpg','itemImages/奶油起司脆餅3.jpg',0,2),
(21,'The Maple mania（楓糖奶油餅乾）',430,100,'選用加拿大楓糖搭配奶油巧克力，厚實大塊夾心非常厲害，濃郁楓糖香滿溢於口，愛不釋手啊。',1,'itemImages/楓糖奶油餅乾1.jpg','itemImages/楓糖奶油餅乾2.jpg','itemImages/楓糖奶油餅乾3.jpg',0,2),
(22,'東京晴空戀巧巧克力',350,220,'餅乾本身超級薄脆，輕碰就裂、清咬即碎，輕盈鬆化的口感，非常少有，波比特愛的～',1,'itemImages/東京晴空戀巧巧克力1.jpg','itemImages/東京晴空戀巧巧克力2.jpg','itemImages/東京晴空戀巧巧克力3.jpg',0,2),
(23,'東京牛奶起司工坊',300,150,'楓糖夾心餅乾是甜香，這款則是海鹽搭上爆濃鹹香起司味，兩者無法抉擇，都太太太好吃了。',1,'itemImages/東京牛奶起司工坊1.jpg','itemImages/東京牛奶起司工坊2.jpg','itemImages/東京牛奶起司工坊3.jpg',0,2),
(24,'R.L Waffle Cake（鬆餅蛋糕、棒狀鬆餅）',100,50,'發跡神戶，鬆餅口味多達20種，全國一天賣出4萬個，累積1千萬銷售量，超級驚人。發跡神戶，鬆餅口味多達20種，全國一天賣出4萬個，累積1千萬銷售量，超級驚人。',1,'itemImages/棒狀鬆餅1.jpg','itemImages/棒狀鬆餅2.jpg','itemImages/棒狀鬆餅3.jpg',0,2),
(25,'caffarel榛果巧克力派',380,250,'表面佈滿糖粒，派皮酥脆層層分明，入口後濃郁榛果巧克力醬半融於嘴，名店出手果然優秀。',1,'itemImages/榛果巧克力派1.jpg','itemImages/榛果巧克力派2.jpg','itemImages/榛果巧克力派3.jpg',0,2),
(26,'《CEZANNE》 血色腮紅',300,200,'這塊血色腮紅一擦上臉，馬上讓你白兩個色號，想要買還要用搶的呢！',3,'itemImages/血色腮紅1.jpg','itemImages/血色腮紅2.jpg','itemImages/血色腮紅3.jpg',0,2),
(27,'山善 多功能電子烤盤',5680,20,'多功能電子烤盤 (附平盤+章魚燒) YOF-W120 2色 附2枚烤盤 單身 小家庭 電烤盤推薦',4,'itemImages/多功能電子烤盤1.jpg','itemImages/多功能電子烤盤2.jpg','itemImages/多功能電子烤盤3.jpg',0,2);


/*Table structure for table `item_type` */

DROP TABLE IF EXISTS `item_type`;

CREATE TABLE `item_type` (
  `itId` INT NOT NULL AUTO_INCREMENT,
  `itemType` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`itId`)
) ENGINE=INNODB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `item_type` */

INSERT  INTO `item_type`(`itId`,`itemType`) VALUES 
(1,'食品'),
(2,'生活家居'),
(3,'美妝保養'),
(4,'家電3C'),
(5,'服飾配件');

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
  `mPic` VARCHAR(21000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `m_verify` TINYINT NOT NULL DEFAULT '0',
  `mPid` INT NOT NULL,
  PRIMARY KEY (`mId`),
  KEY `member_mPid_fk` (`mPid`),
  CONSTRAINT `FKm7kkdfwqd0u1h50am44ijl07e` FOREIGN KEY (`mPid`) REFERENCES `member_perm` (`mPid`),
  CONSTRAINT `member_mPid_fk` FOREIGN KEY (`mPid`) REFERENCES `member_perm` (`mPid`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `member` */

INSERT  INTO `member`(`mId`,`mAN`,`mPw`,`mGender`,`mName`,`mUid`,`mBDay`,`mEmail`,`mPhone`,`d_mAddress`,`m_createTime`,`mPic`,`m_verify`,`mPid`) VALUES 
(1,'spotstour','0000','男','諸葛村夫','F123456789','1987-08-07 00:00:00','spotstour@gmail.com','0912345678','台北市大同區民權西路1號','2021-02-25 00:00:00',NULL,1,2),
(2,'aaaaaa','aaaaaa','男','管理者','A123456789','2021-03-01 12:03:16','spotstour@gamil.com','0912345678','台北市信義區信義路100號','2021-03-10 12:03:53',NULL,1,1);

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
  CONSTRAINT `FK7qlib25hyrm5f49gklddrq9xn` FOREIGN KEY (`receiptTypeId`) REFERENCES `receipt_type` (`receiptTypeId`),
  CONSTRAINT `FKghucymwpuhvf2r2tpfyamwk7h` FOREIGN KEY (`shipTypeId`) REFERENCES `ship_type` (`shipTypeId`),
  CONSTRAINT `FKifkuprlm38e7yan6fb3dhedb` FOREIGN KEY (`oSid`) REFERENCES `ord_stat` (`oSid`),
  CONSTRAINT `FKny7ctr8pwt2uov8npjh4mhaci` FOREIGN KEY (`mId`) REFERENCES `member` (`mId`),
  CONSTRAINT `ord_mId_fk` FOREIGN KEY (`mId`) REFERENCES `member` (`mId`),
  CONSTRAINT `ord_oSid_fk` FOREIGN KEY (`oSid`) REFERENCES `ord_stat` (`oSid`),
  CONSTRAINT `ord_receiptTypeId_fk` FOREIGN KEY (`receiptTypeId`) REFERENCES `receipt_type` (`receiptTypeId`),
  CONSTRAINT `ord_shipTypeId_fk` FOREIGN KEY (`shipTypeId`) REFERENCES `ship_type` (`shipTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `ord` */

insert  into `ord`(`ord_Id`,`mId`,`oSid`,`s_createTime`,`o_createTime`,`s_mAddress`,`receiptTypeId`,`shipTypeId`) values 
(1,1,1,'2021-03-19 09:18:31','2021-03-10 09:18:49','台北市大同區民權西路1號',1,1),
(2,1,2,'2021-02-03 11:58:55','2021-02-19 03:58:59','台北市中山區民權東路100號',2,2),
(3,1,3,'2021-01-05 12:00:07','2021-01-29 16:00:11','台北市中山區民權東路200號',3,3);

/*Table structure for table `ord_detail` */

DROP TABLE IF EXISTS `ord_detail`;

CREATE TABLE `ord_detail` (
  `ord_dId` int NOT NULL AUTO_INCREMENT,
  `ord_Id` int NOT NULL,
  `ordQty` int NOT NULL,
  `itemId` int NOT NULL,
  PRIMARY KEY (`ord_dId`),
  KEY `ord_deatail_ord_Id_fk` (`ord_Id`),
  KEY `ord_deatail_itemId_fk` (`itemId`),
  CONSTRAINT `FK2juk7cejh9yhqu0dfgp3i54d3` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`),
  CONSTRAINT `FK7rq4ds1xrookjnyfp0oyvqn4v` FOREIGN KEY (`ord_Id`) REFERENCES `ord` (`ord_Id`),
  CONSTRAINT `ord_deatail_itemId_fk` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`),
  CONSTRAINT `ord_deatail_ord_Id_fk` FOREIGN KEY (`ord_Id`) REFERENCES `ord` (`ord_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `ord_detail` */

insert  into `ord_detail`(`ord_dId`,`ord_Id`,`ordQty`,`itemId`) values 
(1,1,2,1),
(2,1,3,2),
(3,1,4,3),
(4,2,4,1),
(5,2,4,2),
(6,2,4,3),
(7,3,5,1),
(8,3,1,2),
(9,3,2,3),
(10,3,2,4);

/*Table structure for table `ord_stat` */

DROP TABLE IF EXISTS `ord_stat`;

CREATE TABLE `ord_stat` (
  `oSid` int NOT NULL AUTO_INCREMENT,
  `ordStat` varchar(10) NOT NULL,
  PRIMARY KEY (`oSid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `ord_stat` */

insert  into `ord_stat`(`oSid`,`ordStat`) values 
(1,'訂單處理中'),
(2,'出貨中'),
(3,'已送達');

/*Table structure for table `params` */

DROP TABLE IF EXISTS `params`;

CREATE TABLE `params` (
  `paramId` int NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
  `typeName` varchar(10) NOT NULL,
  PRIMARY KEY (`paramId`)
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
  `pAddress` varchar(50) NOT NULL,
  `longitude` varchar(30) NOT NULL,
  `latitude` varchar(30) NOT NULL,
  `cityId` int NOT NULL,
  `mId` int NOT NULL,
  `placeTypeId` int NOT NULL,
  PRIMARY KEY (`portfolioId`),
  KEY `portfolio_cityId_fk` (`cityId`),
  KEY `portfolio_mId_fk` (`mId`),
  KEY `portfolio_placeTypeId_fk` (`placeTypeId`),
  CONSTRAINT `FK8m5tct44pltwr7jt8k2oqyuvr` FOREIGN KEY (`mId`) REFERENCES `member` (`mId`),
  CONSTRAINT `FK9v3eim27t5eu7bb6i6sv3ryeb` FOREIGN KEY (`placeTypeId`) REFERENCES `place_type` (`placeTypeId`),
  CONSTRAINT `FKo1tu242f22p34uayen175i8y` FOREIGN KEY (`cityId`) REFERENCES `city` (`cityId`),
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
  CONSTRAINT `FK1uut686ofs5t3rlehnn72tuwv` FOREIGN KEY (`portfolioId`) REFERENCES `portfolio` (`portfolioId`),
  CONSTRAINT `portfolioMsg_portfolioId_fk` FOREIGN KEY (`portfolioId`) REFERENCES `portfolio` (`portfolioId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `portfoliomsg` */

/*Table structure for table `receipt_type` */

DROP TABLE IF EXISTS `receipt_type`;

CREATE TABLE `receipt_type` (
  `receiptTypeId` int NOT NULL AUTO_INCREMENT,
  `receiptType` varchar(15) NOT NULL,
  PRIMARY KEY (`receiptTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `receipt_type` */

insert  into `receipt_type`(`receiptTypeId`,`receiptType`) values 
(1,'三聯式統一發票'),
(2,'二聯式統一發票'),
(3,'個人電子發票'),
(4,'公司戶電子發票'),
(5,'捐贈發票');

/*Table structure for table `record` */

DROP TABLE IF EXISTS `record`;

CREATE TABLE `record` (
  `recordId` int NOT NULL AUTO_INCREMENT,
  `portfolioId` int NOT NULL,
  `type` varchar(10) NOT NULL,
  `paramId` int NOT NULL,
  PRIMARY KEY (`recordId`),
  KEY `record_portfolioId_fk` (`portfolioId`),
  KEY `record_paramId_fk` (`paramId`),
  CONSTRAINT `FK5hwf0kbet9m9dd6d7ydvkbuls` FOREIGN KEY (`paramId`) REFERENCES `params` (`paramId`),
  CONSTRAINT `FKbopblbme50gdwh19qg9qphlw3` FOREIGN KEY (`portfolioId`) REFERENCES `portfolio` (`portfolioId`),
  CONSTRAINT `record_paramId_fk` FOREIGN KEY (`paramId`) REFERENCES `params` (`paramId`),
  CONSTRAINT `record_portfolioId_fk` FOREIGN KEY (`portfolioId`) REFERENCES `portfolio` (`portfolioId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `record` */

/*Table structure for table `report_type` */

DROP TABLE IF EXISTS `report_type`;

CREATE TABLE `report_type` (
  `rtId` int NOT NULL AUTO_INCREMENT,
  `reportType` varchar(20) NOT NULL,
  PRIMARY KEY (`rtId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `report_type` */

insert  into `report_type`(`rtId`,`reportType`) values 
(1,'血腥暴力'),
(2,'色情內容'),
(3,'不當營利'),
(4,'不當內容'),
(5,'這是垃圾訊息');

/*Table structure for table `ship_type` */

DROP TABLE IF EXISTS `ship_type`;

CREATE TABLE `ship_type` (
  `shipTypeId` int NOT NULL AUTO_INCREMENT,
  `shipType` varchar(15) NOT NULL,
  PRIMARY KEY (`shipTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `ship_type` */

insert  into `ship_type`(`shipTypeId`,`shipType`) values 
(1,'宅配'),
(2,'郵寄'),
(3,'7-11門市取貨'),
(4,'全家門市取貨'),
(5,'萊爾富門市取貨'),
(6,'OK門市取貨');

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
  CONSTRAINT `FK61woi9oewq06kw7xcsg47hm2f` FOREIGN KEY (`mId`) REFERENCES `member` (`mId`),
  CONSTRAINT `shoppingCart_itemId_fk` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`),
  CONSTRAINT `shoppingCart_mId_fk` FOREIGN KEY (`mId`) REFERENCES `member` (`mId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `shoppingcart` */

insert  into `shoppingcart`(`sc_Id`,`mId`,`itemId`,`s_ordQty`) values 
(1,1,1,5),
(2,1,2,3),
(3,1,5,1);

/*Table structure for table `video` */

DROP TABLE IF EXISTS `video`;

CREATE TABLE `video` (
  `videoId` int NOT NULL AUTO_INCREMENT,
  `videoFile` varchar(100) NOT NULL,
  `videoPic` varchar(21000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `v_freeze` tinyint NOT NULL DEFAULT '0',
  `portfolioId` int NOT NULL,
  PRIMARY KEY (`videoId`),
  KEY `video_portfolioId_fk` (`portfolioId`),
  CONSTRAINT `FKq04dmcepecgeqy8o00n7vq0sf` FOREIGN KEY (`portfolioId`) REFERENCES `portfolio` (`portfolioId`),
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
  CONSTRAINT `FKg19yhyg35qv5b9tfkiobvx5e9` FOREIGN KEY (`rtId`) REFERENCES `report_type` (`rtId`),
  CONSTRAINT `FKrvbi5kbcknnstq9jnq6je0vkt` FOREIGN KEY (`videoId`) REFERENCES `video` (`videoId`),
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
  CONSTRAINT `FKfnjwlw0urcysgotkifpdr03fj` FOREIGN KEY (`portfolioId`) REFERENCES `portfolio` (`portfolioId`),
  CONSTRAINT `watch_times_portfolioId_fk` FOREIGN KEY (`portfolioId`) REFERENCES `portfolio` (`portfolioId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `watch_times` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
