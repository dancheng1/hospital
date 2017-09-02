/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.54 : Database - fuyou
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`fuyou` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `fuyou`;

/*Table structure for table `ims_account` */

DROP TABLE IF EXISTS `ims_account`;

CREATE TABLE `ims_account` (
  `acid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `hash` varchar(8) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `isconnect` tinyint(4) NOT NULL,
  `isdeleted` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`acid`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `ims_account` */

insert  into `ims_account`(`acid`,`uniacid`,`hash`,`type`,`isconnect`,`isdeleted`) values (1,1,'uRr8qvQV',1,0,1),(2,2,'I6IGhkf1',1,1,0);

/*Table structure for table `ims_account_wechats` */

DROP TABLE IF EXISTS `ims_account_wechats`;

CREATE TABLE `ims_account_wechats` (
  `acid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `token` varchar(32) NOT NULL,
  `access_token` varchar(1000) NOT NULL,
  `encodingaeskey` varchar(255) NOT NULL,
  `level` tinyint(4) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `account` varchar(30) NOT NULL,
  `original` varchar(50) NOT NULL,
  `signature` varchar(100) NOT NULL,
  `country` varchar(10) NOT NULL,
  `province` varchar(3) NOT NULL,
  `city` varchar(15) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  `key` varchar(50) NOT NULL,
  `secret` varchar(50) NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `subscribeurl` varchar(120) NOT NULL,
  `auth_refresh_token` varchar(255) NOT NULL,
  PRIMARY KEY (`acid`),
  KEY `idx_key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_account_wechats` */

insert  into `ims_account_wechats`(`acid`,`uniacid`,`token`,`access_token`,`encodingaeskey`,`level`,`name`,`account`,`original`,`signature`,`country`,`province`,`city`,`username`,`password`,`lastupdate`,`key`,`secret`,`styleid`,`subscribeurl`,`auth_refresh_token`) values (1,1,'omJNpZEhZeHj1ZxFECKkP48B5VFbk1HP','','',1,'we7team','','','','','','','','',0,'','',1,'',''),(2,2,'sK4b768kV7zz66kHvW0FWVQBG0g4B6fg','','V4648p5Pk4B6hy94gG5hBn5zZ6854KKPA611YV495N5',4,'公主岭市妇幼保健院','gh_e588da7749e4','gh_e588da7749e4','','','','','','',0,'wx2a109d5b3c890d4a','b188aee7dd3648dc39ebb7263e82e81d',0,'','');

/*Table structure for table `ims_activity_clerk_menu` */

DROP TABLE IF EXISTS `ims_activity_clerk_menu`;

CREATE TABLE `ims_activity_clerk_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `displayorder` int(4) NOT NULL,
  `pid` int(6) NOT NULL,
  `group_name` varchar(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `url` varchar(60) NOT NULL,
  `type` varchar(20) NOT NULL,
  `permission` varchar(50) NOT NULL,
  `system` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `ims_activity_clerk_menu` */

insert  into `ims_activity_clerk_menu`(`id`,`uniacid`,`displayorder`,`pid`,`group_name`,`title`,`icon`,`url`,`type`,`permission`,`system`) values (1,0,0,0,'mc','快捷交易','','','','mc_manage',1),(2,0,0,1,'','积分充值','fa fa-money','credit1','modal','mc_credit1',1),(3,0,0,1,'','余额充值','fa fa-cny','credit2','modal','mc_credit2',1),(4,0,0,1,'','消费','fa fa-usd','consume','modal','mc_consume',1),(5,0,0,1,'','发放会员卡','fa fa-credit-card','card','modal','mc_card',1),(6,0,0,0,'stat','数据统计','','','','stat_manage',1),(7,0,0,6,'','积分统计','fa fa-bar-chart','./index.php?c=stat&a=credit1','url','stat_credit1',1),(8,0,0,6,'','余额统计','fa fa-bar-chart','./index.php?c=stat&a=credit2','url','stat_credit2',1),(9,0,0,6,'','现金消费统计','fa fa-bar-chart','./index.php?c=stat&a=cash','url','stat_cash',1),(10,0,0,6,'','会员卡统计','fa fa-bar-chart','./index.php?c=stat&a=card','url','stat_card',1),(11,0,0,0,'activity','系统优惠券核销','','','','activity_card_manage',1),(12,0,0,11,'','折扣券核销','fa fa-money','./index.php?c=activity&a=consume&do=display&type=1','url','activity_consume_coupon',1),(13,0,0,11,'','代金券核销','fa fa-money','./index.php?c=activity&a=consume&do=display&type=2','url','activity_consume_token',1),(14,0,0,0,'wechat','微信卡券核销','','','','wechat_card_manage',1),(15,0,0,14,'','卡券核销','fa fa-money','./index.php?c=wechat&a=consume','url','wechat_consume',1),(16,0,0,6,'','收银台收款统计','fa fa-bar-chart','./index.php?c=stat&a=paycenter','url','stat_paycenter',1);

/*Table structure for table `ims_activity_clerks` */

DROP TABLE IF EXISTS `ims_activity_clerks`;

CREATE TABLE `ims_activity_clerks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `storeid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `password` (`password`),
  KEY `openid` (`openid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_activity_clerks` */

/*Table structure for table `ims_activity_coupon_allocation` */

DROP TABLE IF EXISTS `ims_activity_coupon_allocation`;

CREATE TABLE `ims_activity_coupon_allocation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `couponid` int(10) unsigned NOT NULL,
  `groupid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`couponid`,`groupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_activity_coupon_allocation` */

/*Table structure for table `ims_activity_coupon_modules` */

DROP TABLE IF EXISTS `ims_activity_coupon_modules`;

CREATE TABLE `ims_activity_coupon_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `couponid` int(10) unsigned NOT NULL,
  `module` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `couponid` (`couponid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_activity_coupon_modules` */

/*Table structure for table `ims_activity_exchange` */

DROP TABLE IF EXISTS `ims_activity_exchange`;

CREATE TABLE `ims_activity_exchange` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `thumb` varchar(500) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `extra` varchar(3000) NOT NULL,
  `credit` int(10) unsigned NOT NULL,
  `credittype` varchar(10) NOT NULL,
  `pretotal` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `total` int(10) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `starttime` int(10) unsigned NOT NULL,
  `endtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extra` (`extra`(333))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_activity_exchange` */

/*Table structure for table `ims_activity_exchange_trades` */

DROP TABLE IF EXISTS `ims_activity_exchange_trades`;

CREATE TABLE `ims_activity_exchange_trades` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `exid` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `uniacid` (`uniacid`,`uid`,`exid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_activity_exchange_trades` */

/*Table structure for table `ims_activity_exchange_trades_shipping` */

DROP TABLE IF EXISTS `ims_activity_exchange_trades_shipping`;

CREATE TABLE `ims_activity_exchange_trades_shipping` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `exid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `province` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `district` varchar(30) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `mobile` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_activity_exchange_trades_shipping` */

/*Table structure for table `ims_activity_modules` */

DROP TABLE IF EXISTS `ims_activity_modules`;

CREATE TABLE `ims_activity_modules` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `exid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `available` int(10) unsigned NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `uniacid` (`uniacid`),
  KEY `module` (`module`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_activity_modules` */

/*Table structure for table `ims_activity_modules_record` */

DROP TABLE IF EXISTS `ims_activity_modules_record`;

CREATE TABLE `ims_activity_modules_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `num` tinyint(3) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_activity_modules_record` */

/*Table structure for table `ims_activity_stores` */

DROP TABLE IF EXISTS `ims_activity_stores`;

CREATE TABLE `ims_activity_stores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `category` varchar(255) NOT NULL,
  `province` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `district` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `photo_list` varchar(10000) NOT NULL,
  `avg_price` int(10) unsigned NOT NULL,
  `recommend` varchar(255) NOT NULL,
  `special` varchar(255) NOT NULL,
  `introduction` varchar(255) NOT NULL,
  `open_time` varchar(50) NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `source` tinyint(3) unsigned NOT NULL,
  `message` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `location_id` (`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_activity_stores` */

/*Table structure for table `ims_archive` */

DROP TABLE IF EXISTS `ims_archive`;

CREATE TABLE `ims_archive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(288) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `stage_date` int(11) DEFAULT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `content` varchar(2295) DEFAULT NULL,
  `date` varchar(450) DEFAULT NULL,
  `id_number` varchar(450) DEFAULT NULL,
  `phone` varchar(180) DEFAULT NULL,
  `flag` int(11) DEFAULT '1',
  `type_son` int(11) DEFAULT NULL COMMENT '病情类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

/*Data for the table `ims_archive` */

insert  into `ims_archive`(`id`,`name`,`type`,`stage_date`,`ownerId`,`content`,`date`,`id_number`,`phone`,`flag`,`type_son`) values (3,'从v',1,1502933027,1,'范文金风科技索；','2017-06-19','220183199910212365','1464364546',1,1),(25,'danxhengsss',1,1502676586,3,'hdhj我回去弄','2017-08-30','220822199702111914','dhsjdkdkk',1,2),(39,'小白白',1,1503450166,12,'热武器热无额绕弯儿','2017-08-30','220166199411022644','14798562314',1,3),(41,'产妇1',2,1503455921,12,'让我范文芳','2017-08-30','123213435436547567','54345346554',1,6),(42,'产妇1',2,1503456231,12,'让我范文芳','2017-08-30','123213435436547567','54345346554',1,5),(43,'产妇1',2,1503456255,12,'让我范文芳','2017-08-30','123213435436547567','54345346554',1,7),(44,'产妇1',2,1503456299,12,'让我范文芳','2017-08-30','123213435436547567','54345346554',1,9),(45,'产妇1',2,1503456301,12,'让我范文芳','2017-08-30','123213435436547567','54345346554',1,6),(46,'产妇1',2,1503456302,12,'让我范文芳','2017-08-30','123213435436547567','54345346554',1,5),(47,'测试数据',2,1503459104,4,'34543他让我而他认为','2017-08-30','666666666666666666','77777777777',0,6),(54,'痛苦不错',1,1503475689,6,'聚聚吧','2017-08-30','853835835853526753','69855447248',1,1),(57,'当成',1,1504060271,13,'好咯噢耶','2017-09-30','220822199702111964','15843646837',0,2),(58,'破纪录',1,1504060403,13,'热控','2017-08-30','888888888888888888','13546319764',0,2),(71,'曲小冷',1,1504062090,6,'招人招人','2017-08-13','461916546467667676','14794645575',1,1),(72,'8-11',1,1504062133,6,'去去去','2017-08-11','484676679767675575','14794645676',1,1),(73,'婴儿2',1,1504062270,6,'','2017-08-30','565242426754735475','13255452688',1,3),(74,'攻击',1,1504063117,13,'亲我','2017-08-10','123456789123456789','13546464646',0,4),(83,'fvdsf',1,1504081792,0,'rtet','2017-08-30','213333333333333333','14444444444',1,1),(84,'文件精神',1,1504081871,0,'r','2017-08-30','222232423333333333','13146494944',1,1),(85,'j_vuvugy',2,1504160633,13,'guuuj','2017-08-31','111111111111111111','13843646837',0,6),(86,'大家觉',1,1504160789,14,'睡觉睡觉','2017-08-31','111111111111111111','13111111111',1,1),(87,'哈哈',1,1504162552,14,'还是','2017-08-31','122131323232323241','13154994999',1,1);

/*Table structure for table `ims_archive_msg` */

DROP TABLE IF EXISTS `ims_archive_msg`;

CREATE TABLE `ims_archive_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(127) DEFAULT NULL COMMENT '消息模板名称',
  `daytime` int(11) DEFAULT NULL COMMENT '提醒间隔天数',
  `monthtime` int(11) DEFAULT NULL COMMENT '提醒间隔月数',
  `pushmsg` varchar(1023) DEFAULT NULL COMMENT '提醒消息',
  `typeId` int(11) DEFAULT NULL COMMENT '病情类型id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `ims_archive_msg` */

insert  into `ims_archive_msg`(`id`,`name`,`daytime`,`monthtime`,`pushmsg`,`typeId`) values (1,'第一个模板qw',6,0,'你该吃药了！！！',1),(2,'第二个模板',0,1,'你真该吃药了！！！',1),(3,'第三个模板',NULL,1,'你该吃药了！！！真的就安静安静安静安静安静安静啊啊骄傲骄傲安静安静安静安静啊啊骄傲骄傲骄傲骄傲骄傲安静安静安静嗷嗷叫',2),(5,'测试第一个模板',2,0,'成功了',2),(7,'dasdg1',2,0,'wangqwdas',2),(11,'哈哈',1,0,'qweqweq',1),(16,'大三大四的',333333,0,'dasda',1),(17,'合法身份',1,0,'打撒所大所多',1),(19,'gead',1,0,'dasd',1),(20,'sadas',0,4,'dasda',3);

/*Table structure for table `ims_archive_type` */

DROP TABLE IF EXISTS `ims_archive_type`;

CREATE TABLE `ims_archive_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `typeName` varchar(127) DEFAULT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `ims_archive_type` */

insert  into `ims_archive_type`(`id`,`typeName`) values (1,'儿童1'),(2,'产妇1'),(3,'妇科1'),(4,'第一个分类'),(5,'打撒dasdad');

/*Table structure for table `ims_archive_type_son` */

DROP TABLE IF EXISTS `ims_archive_type_son`;

CREATE TABLE `ims_archive_type_son` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(127) DEFAULT NULL COMMENT '病情类型名称',
  `parentId` int(11) DEFAULT NULL COMMENT '档案类型id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `ims_archive_type_son` */

insert  into `ims_archive_type_son`(`id`,`name`,`parentId`) values (1,'初生婴儿嗷嗷',1),(2,'初生婴儿1',1),(3,'初生婴儿2',1),(4,'初生婴儿3',1),(5,'产妇1',2),(6,'产妇2',2),(7,'产妇3',2),(8,'产妇4',2),(9,'产妇5',2),(10,'妇科1',3),(11,'妇科2',3),(12,'妇科3',3),(13,'妇科4',3),(14,'阿达',1),(15,'阿达',1),(18,'是',1),(19,'啊啊啊啊',0),(20,'阿达',0),(21,'初生婴儿12',0),(22,'初生婴儿123',0),(23,'初生婴儿三生三世',0),(24,'初生婴儿54321',0);

/*Table structure for table `ims_article_category` */

DROP TABLE IF EXISTS `ims_article_category`;

CREATE TABLE `ims_article_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `ims_article_category` */

insert  into `ims_article_category`(`id`,`title`,`displayorder`,`type`) values (1,'111',1,'news');

/*Table structure for table `ims_article_news` */

DROP TABLE IF EXISTS `ims_article_news`;

CREATE TABLE `ims_article_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_show_home` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `cateid` (`cateid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `ims_article_news` */

insert  into `ims_article_news`(`id`,`cateid`,`title`,`content`,`thumb`,`source`,`author`,`displayorder`,`is_display`,`is_show_home`,`createtime`,`click`) values (1,1,'111111','<p>额鹅鹅鹅鹅鹅鹅鹅鹅鹅鹅鹅鹅鹅鹅鹅<br/></p>','','','',0,1,1,1502769340,0);

/*Table structure for table `ims_article_notice` */

DROP TABLE IF EXISTS `ims_article_notice`;

CREATE TABLE `ims_article_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_show_home` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `cateid` (`cateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_article_notice` */

/*Table structure for table `ims_article_unread_notice` */

DROP TABLE IF EXISTS `ims_article_unread_notice`;

CREATE TABLE `ims_article_unread_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notice_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `is_new` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `notice_id` (`notice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_article_unread_notice` */

/*Table structure for table `ims_basic_reply` */

DROP TABLE IF EXISTS `ims_basic_reply`;

CREATE TABLE `ims_basic_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `content` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `ims_basic_reply` */

insert  into `ims_basic_reply`(`id`,`rid`,`content`) values (2,16,'111111');

/*Table structure for table `ims_business` */

DROP TABLE IF EXISTS `ims_business`;

CREATE TABLE `ims_business` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `dist` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `lng` varchar(10) NOT NULL,
  `lat` varchar(10) NOT NULL,
  `industry1` varchar(10) NOT NULL,
  `industry2` varchar(10) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lat_lng` (`lng`,`lat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_business` */

/*Table structure for table `ims_core_attachment` */

DROP TABLE IF EXISTS `ims_core_attachment`;

CREATE TABLE `ims_core_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_core_attachment` */

/*Table structure for table `ims_core_cache` */

DROP TABLE IF EXISTS `ims_core_cache`;

CREATE TABLE `ims_core_cache` (
  `key` varchar(50) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_core_cache` */

insert  into `ims_core_cache`(`key`,`value`) values ('setting','a:8:{s:9:\"copyright\";a:1:{s:6:\"slides\";a:3:{i:0;s:58:\"https://img.alicdn.com/tps/TB1pfG4IFXXXXc6XXXXXXXXXXXX.jpg\";i:1;s:58:\"https://img.alicdn.com/tps/TB1sXGYIFXXXXc5XpXXXXXXXXXX.jpg\";i:2;s:58:\"https://img.alicdn.com/tps/TB1h9xxIFXXXXbKXXXXXXXXXXXX.jpg\";}}s:8:\"authmode\";i:1;s:5:\"close\";a:2:{s:6:\"status\";s:1:\"0\";s:6:\"reason\";s:0:\"\";}s:8:\"register\";a:4:{s:4:\"open\";i:1;s:6:\"verify\";i:0;s:4:\"code\";i:1;s:7:\"groupid\";i:1;}s:5:\"basic\";a:1:{s:8:\"template\";s:7:\"default\";}s:8:\"platform\";a:5:{s:5:\"token\";s:32:\"JIuD8bDZzrzRIRrabRu0dJ0cdA5irURI\";s:14:\"encodingaeskey\";s:43:\"titP0930ZdpRAZDrR1sIZPfftsp3apa1P1Xp50epg1S\";s:9:\"appsecret\";s:0:\"\";s:5:\"appid\";s:0:\"\";s:9:\"authstate\";i:1;}s:4:\"site\";a:6:{s:3:\"key\";s:5:\"99417\";s:5:\"token\";s:32:\"c29a6da90359b7dd94c6aa7a1ae97db2\";s:3:\"url\";s:22:\"http://fuyou.vlsoft.cn\";s:7:\"version\";s:3:\"1.0\";s:6:\"family\";s:1:\"v\";s:15:\"profile_perfect\";b:1;}s:6:\"upload\";a:2:{s:5:\"image\";a:4:{s:5:\"thumb\";i:0;s:5:\"width\";i:800;s:10:\"extentions\";a:4:{i:0;s:3:\"gif\";i:1;s:3:\"jpg\";i:2;s:4:\"jpeg\";i:3;s:3:\"png\";}s:5:\"limit\";i:5000;}s:5:\"audio\";a:2:{s:10:\"extentions\";a:1:{i:0;s:3:\"mp3\";}s:5:\"limit\";i:5000;}}}'),('unimodules:2:1','a:13:{s:5:\"basic\";a:19:{s:3:\"mid\";s:1:\"1\";s:4:\"name\";s:5:\"basic\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本文字回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"和您进行简单对话\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:4:\"news\";a:19:{s:3:\"mid\";s:1:\"2\";s:4:\"name\";s:4:\"news\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"基本混合图文回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:33:\"为你提供生动的图文资讯\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"music\";a:19:{s:3:\"mid\";s:1:\"3\";s:4:\"name\";s:5:\"music\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本音乐回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:39:\"提供语音、音乐等音频类回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:7:\"userapi\";a:19:{s:3:\"mid\";s:1:\"4\";s:4:\"name\";s:7:\"userapi\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:21:\"自定义接口回复\";s:7:\"version\";s:3:\"1.1\";s:7:\"ability\";s:33:\"更方便的第三方接口设置\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:6:\"config\";a:6:{i:1;b:1;i:2;b:1;i:3;b:1;i:4;b:1;i:5;b:1;i:6;b:1;}s:7:\"enabled\";i:1;s:9:\"isdisplay\";i:1;}s:8:\"recharge\";a:19:{s:3:\"mid\";s:1:\"5\";s:4:\"name\";s:8:\"recharge\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"会员中心充值模块\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"提供会员充值功能\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:6:\"custom\";a:19:{s:3:\"mid\";s:1:\"6\";s:4:\"name\";s:6:\"custom\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:15:\"多客服转接\";s:7:\"version\";s:5:\"1.0.0\";s:7:\"ability\";s:36:\"用来接入腾讯的多客服系统\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:17:\"http://bbs.we7.cc\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:6:{i:0;s:5:\"image\";i:1;s:5:\"voice\";i:2;s:5:\"video\";i:3;s:8:\"location\";i:4;s:4:\"link\";i:5;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:6:\"images\";a:19:{s:3:\"mid\";s:1:\"7\";s:4:\"name\";s:6:\"images\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本图片回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"video\";a:19:{s:3:\"mid\";s:1:\"8\";s:4:\"name\";s:5:\"video\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本视频回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"voice\";a:19:{s:3:\"mid\";s:1:\"9\";s:4:\"name\";s:5:\"voice\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本语音回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供语音回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"chats\";a:19:{s:3:\"mid\";s:2:\"10\";s:4:\"name\";s:5:\"chats\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"发送客服消息\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:77:\"公众号可以在粉丝最后发送消息的48小时内无限制发送消息\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:6:\"wxcard\";a:19:{s:3:\"mid\";s:2:\"11\";s:4:\"name\";s:6:\"wxcard\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"微信卡券回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"微信卡券回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:9:\"paycenter\";a:19:{s:3:\"mid\";s:2:\"12\";s:4:\"name\";s:9:\"paycenter\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:9:\"收银台\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:9:\"收银台\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:4:\"core\";a:5:{s:5:\"title\";s:24:\"系统事件处理模块\";s:4:\"name\";s:4:\"core\";s:8:\"issystem\";i:1;s:7:\"enabled\";i:1;s:9:\"isdisplay\";i:0;}}'),('userbasefields','a:44:{s:7:\"uniacid\";s:17:\"同一公众号id\";s:7:\"groupid\";s:8:\"分组id\";s:7:\"credit1\";s:6:\"积分\";s:7:\"credit2\";s:6:\"余额\";s:7:\"credit3\";s:19:\"预留积分类型3\";s:7:\"credit4\";s:19:\"预留积分类型4\";s:7:\"credit5\";s:19:\"预留积分类型5\";s:7:\"credit6\";s:19:\"预留积分类型6\";s:10:\"createtime\";s:12:\"加入时间\";s:6:\"mobile\";s:12:\"手机号码\";s:5:\"email\";s:12:\"电子邮箱\";s:8:\"realname\";s:12:\"真实姓名\";s:8:\"nickname\";s:6:\"昵称\";s:6:\"avatar\";s:6:\"头像\";s:2:\"qq\";s:5:\"QQ号\";s:6:\"gender\";s:6:\"性别\";s:5:\"birth\";s:6:\"生日\";s:13:\"constellation\";s:6:\"星座\";s:6:\"zodiac\";s:6:\"生肖\";s:9:\"telephone\";s:12:\"固定电话\";s:6:\"idcard\";s:12:\"证件号码\";s:9:\"studentid\";s:6:\"学号\";s:5:\"grade\";s:6:\"班级\";s:7:\"address\";s:6:\"地址\";s:7:\"zipcode\";s:6:\"邮编\";s:11:\"nationality\";s:6:\"国籍\";s:6:\"reside\";s:9:\"居住地\";s:14:\"graduateschool\";s:12:\"毕业学校\";s:7:\"company\";s:6:\"公司\";s:9:\"education\";s:6:\"学历\";s:10:\"occupation\";s:6:\"职业\";s:8:\"position\";s:6:\"职位\";s:7:\"revenue\";s:9:\"年收入\";s:15:\"affectivestatus\";s:12:\"情感状态\";s:10:\"lookingfor\";s:13:\" 交友目的\";s:9:\"bloodtype\";s:6:\"血型\";s:6:\"height\";s:6:\"身高\";s:6:\"weight\";s:6:\"体重\";s:6:\"alipay\";s:15:\"支付宝帐号\";s:3:\"msn\";s:3:\"MSN\";s:6:\"taobao\";s:12:\"阿里旺旺\";s:4:\"site\";s:6:\"主页\";s:3:\"bio\";s:12:\"自我介绍\";s:8:\"interest\";s:12:\"兴趣爱好\";}'),('usersfields','a:45:{s:8:\"realname\";s:12:\"真实姓名\";s:8:\"nickname\";s:6:\"昵称\";s:6:\"avatar\";s:6:\"头像\";s:2:\"qq\";s:5:\"QQ号\";s:6:\"mobile\";s:12:\"手机号码\";s:3:\"vip\";s:9:\"VIP级别\";s:6:\"gender\";s:6:\"性别\";s:9:\"birthyear\";s:12:\"出生生日\";s:13:\"constellation\";s:6:\"星座\";s:6:\"zodiac\";s:6:\"生肖\";s:9:\"telephone\";s:12:\"固定电话\";s:6:\"idcard\";s:12:\"证件号码\";s:9:\"studentid\";s:6:\"学号\";s:5:\"grade\";s:6:\"班级\";s:7:\"address\";s:12:\"邮寄地址\";s:7:\"zipcode\";s:6:\"邮编\";s:11:\"nationality\";s:6:\"国籍\";s:14:\"resideprovince\";s:12:\"居住地址\";s:14:\"graduateschool\";s:12:\"毕业学校\";s:7:\"company\";s:6:\"公司\";s:9:\"education\";s:6:\"学历\";s:10:\"occupation\";s:6:\"职业\";s:8:\"position\";s:6:\"职位\";s:7:\"revenue\";s:9:\"年收入\";s:15:\"affectivestatus\";s:12:\"情感状态\";s:10:\"lookingfor\";s:13:\" 交友目的\";s:9:\"bloodtype\";s:6:\"血型\";s:6:\"height\";s:6:\"身高\";s:6:\"weight\";s:6:\"体重\";s:6:\"alipay\";s:15:\"支付宝帐号\";s:3:\"msn\";s:3:\"MSN\";s:5:\"email\";s:12:\"电子邮箱\";s:6:\"taobao\";s:12:\"阿里旺旺\";s:4:\"site\";s:6:\"主页\";s:3:\"bio\";s:12:\"自我介绍\";s:8:\"interest\";s:12:\"兴趣爱好\";s:7:\"uniacid\";s:17:\"同一公众号id\";s:7:\"groupid\";s:8:\"分组id\";s:7:\"credit1\";s:6:\"积分\";s:7:\"credit2\";s:6:\"余额\";s:7:\"credit3\";s:19:\"预留积分类型3\";s:7:\"credit4\";s:19:\"预留积分类型4\";s:7:\"credit5\";s:19:\"预留积分类型5\";s:7:\"credit6\";s:19:\"预留积分类型6\";s:10:\"createtime\";s:12:\"加入时间\";}'),('module_receive_enable','a:0:{}'),('unimodules::','a:13:{s:5:\"basic\";a:19:{s:3:\"mid\";s:1:\"1\";s:4:\"name\";s:5:\"basic\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本文字回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"和您进行简单对话\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:4:\"news\";a:19:{s:3:\"mid\";s:1:\"2\";s:4:\"name\";s:4:\"news\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"基本混合图文回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:33:\"为你提供生动的图文资讯\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"music\";a:19:{s:3:\"mid\";s:1:\"3\";s:4:\"name\";s:5:\"music\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本音乐回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:39:\"提供语音、音乐等音频类回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:7:\"userapi\";a:19:{s:3:\"mid\";s:1:\"4\";s:4:\"name\";s:7:\"userapi\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:21:\"自定义接口回复\";s:7:\"version\";s:3:\"1.1\";s:7:\"ability\";s:33:\"更方便的第三方接口设置\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:8:\"recharge\";a:19:{s:3:\"mid\";s:1:\"5\";s:4:\"name\";s:8:\"recharge\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"会员中心充值模块\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"提供会员充值功能\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:6:\"custom\";a:19:{s:3:\"mid\";s:1:\"6\";s:4:\"name\";s:6:\"custom\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:15:\"多客服转接\";s:7:\"version\";s:5:\"1.0.0\";s:7:\"ability\";s:36:\"用来接入腾讯的多客服系统\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:17:\"http://bbs.we7.cc\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:6:{i:0;s:5:\"image\";i:1;s:5:\"voice\";i:2;s:5:\"video\";i:3;s:8:\"location\";i:4;s:4:\"link\";i:5;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:6:\"images\";a:19:{s:3:\"mid\";s:1:\"7\";s:4:\"name\";s:6:\"images\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本图片回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"video\";a:19:{s:3:\"mid\";s:1:\"8\";s:4:\"name\";s:5:\"video\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本视频回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"voice\";a:19:{s:3:\"mid\";s:1:\"9\";s:4:\"name\";s:5:\"voice\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本语音回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供语音回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"chats\";a:19:{s:3:\"mid\";s:2:\"10\";s:4:\"name\";s:5:\"chats\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"发送客服消息\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:77:\"公众号可以在粉丝最后发送消息的48小时内无限制发送消息\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:6:\"wxcard\";a:19:{s:3:\"mid\";s:2:\"11\";s:4:\"name\";s:6:\"wxcard\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"微信卡券回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"微信卡券回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:9:\"paycenter\";a:19:{s:3:\"mid\";s:2:\"12\";s:4:\"name\";s:9:\"paycenter\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:9:\"收银台\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:9:\"收银台\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:4:\"core\";a:5:{s:5:\"title\";s:24:\"系统事件处理模块\";s:4:\"name\";s:4:\"core\";s:8:\"issystem\";i:1;s:7:\"enabled\";i:1;s:9:\"isdisplay\";i:0;}}'),('unicount:2','s:1:\"1\";'),('unimodules::1','a:13:{s:5:\"basic\";a:19:{s:3:\"mid\";s:1:\"1\";s:4:\"name\";s:5:\"basic\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本文字回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"和您进行简单对话\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:4:\"news\";a:19:{s:3:\"mid\";s:1:\"2\";s:4:\"name\";s:4:\"news\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"基本混合图文回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:33:\"为你提供生动的图文资讯\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"music\";a:19:{s:3:\"mid\";s:1:\"3\";s:4:\"name\";s:5:\"music\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本音乐回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:39:\"提供语音、音乐等音频类回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:7:\"userapi\";a:19:{s:3:\"mid\";s:1:\"4\";s:4:\"name\";s:7:\"userapi\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:21:\"自定义接口回复\";s:7:\"version\";s:3:\"1.1\";s:7:\"ability\";s:33:\"更方便的第三方接口设置\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:8:\"recharge\";a:19:{s:3:\"mid\";s:1:\"5\";s:4:\"name\";s:8:\"recharge\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"会员中心充值模块\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"提供会员充值功能\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:6:\"custom\";a:19:{s:3:\"mid\";s:1:\"6\";s:4:\"name\";s:6:\"custom\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:15:\"多客服转接\";s:7:\"version\";s:5:\"1.0.0\";s:7:\"ability\";s:36:\"用来接入腾讯的多客服系统\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:17:\"http://bbs.we7.cc\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:6:{i:0;s:5:\"image\";i:1;s:5:\"voice\";i:2;s:5:\"video\";i:3;s:8:\"location\";i:4;s:4:\"link\";i:5;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:6:\"images\";a:19:{s:3:\"mid\";s:1:\"7\";s:4:\"name\";s:6:\"images\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本图片回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"video\";a:19:{s:3:\"mid\";s:1:\"8\";s:4:\"name\";s:5:\"video\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本视频回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"voice\";a:19:{s:3:\"mid\";s:1:\"9\";s:4:\"name\";s:5:\"voice\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本语音回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供语音回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"chats\";a:19:{s:3:\"mid\";s:2:\"10\";s:4:\"name\";s:5:\"chats\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"发送客服消息\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:77:\"公众号可以在粉丝最后发送消息的48小时内无限制发送消息\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:6:\"wxcard\";a:19:{s:3:\"mid\";s:2:\"11\";s:4:\"name\";s:6:\"wxcard\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"微信卡券回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"微信卡券回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:9:\"paycenter\";a:19:{s:3:\"mid\";s:2:\"12\";s:4:\"name\";s:9:\"paycenter\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:9:\"收银台\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:9:\"收银台\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:4:\"core\";a:5:{s:5:\"title\";s:24:\"系统事件处理模块\";s:4:\"name\";s:4:\"core\";s:8:\"issystem\";i:1;s:7:\"enabled\";i:1;s:9:\"isdisplay\";i:0;}}'),('unisetting:2','a:23:{s:7:\"uniacid\";s:1:\"2\";s:8:\"passport\";a:4:{s:8:\"focusreg\";i:1;s:4:\"item\";s:6:\"mobile\";s:4:\"type\";s:8:\"password\";s:5:\"audit\";i:0;}s:5:\"oauth\";a:2:{s:7:\"account\";s:1:\"2\";s:4:\"host\";s:0:\"\";}s:11:\"jsauth_acid\";s:1:\"0\";s:2:\"uc\";s:0:\"\";s:6:\"notify\";s:0:\"\";s:11:\"creditnames\";a:2:{s:7:\"credit1\";a:2:{s:5:\"title\";s:6:\"积分\";s:7:\"enabled\";i:1;}s:7:\"credit2\";a:2:{s:5:\"title\";s:6:\"余额\";s:7:\"enabled\";i:1;}}s:15:\"creditbehaviors\";a:2:{s:8:\"activity\";s:7:\"credit1\";s:8:\"currency\";s:7:\"credit2\";}s:7:\"welcome\";s:0:\"\";s:7:\"default\";s:0:\"\";s:15:\"default_message\";a:3:{s:5:\"image\";a:3:{s:4:\"type\";s:7:\"keyword\";s:6:\"module\";s:0:\"\";s:7:\"keyword\";s:6:\"tupian\";}s:8:\"location\";a:3:{s:4:\"type\";s:7:\"keyword\";s:6:\"module\";s:0:\"\";s:7:\"keyword\";s:6:\"weizhi\";}s:5:\"trace\";a:3:{s:4:\"type\";s:7:\"keyword\";s:6:\"module\";s:0:\"\";s:7:\"keyword\";s:6:\"weizhi\";}}s:9:\"shortcuts\";s:0:\"\";s:7:\"payment\";s:0:\"\";s:4:\"stat\";a:3:{s:11:\"msg_history\";i:1;s:10:\"msg_maxday\";i:30;s:9:\"use_ratio\";i:1;}s:12:\"default_site\";s:1:\"2\";s:4:\"sync\";s:1:\"0\";s:8:\"recharge\";s:0:\"\";s:9:\"tplnotice\";s:0:\"\";s:10:\"grouplevel\";s:1:\"0\";s:8:\"mcplugin\";s:0:\"\";s:15:\"exchange_enable\";s:1:\"0\";s:11:\"coupon_type\";s:1:\"0\";s:7:\"menuset\";s:0:\"\";}'),('accesstoken:2','a:2:{s:5:\"token\";s:138:\"uRwWfbsMcsd0FOh_dlQf-p-BWsre_Qk3q1g2vEY4-MKn5vJdFAoKBncHYiub-czDf3B3_s1ZFRc-ydNiBClmGy3H-ibPTClWuXu0p5m6TfUeYzKw0EcFi1gOtqDxVhjkRPYaABAGEN\";s:6:\"expire\";i:1504268192;}'),('jsticket:2','a:2:{s:6:\"ticket\";s:86:\"kgt8ON7yVITDhtdwci0qeakSR6q3x34Uq5fZp1Pdg1aFThcjpDxjhw7jO7svij1CdFMfNL9DZWak5sQrY96Xkg\";s:6:\"expire\";i:1504268192;}'),('stat:todaylock:2','a:1:{s:6:\"expire\";i:1504260264;}'),('system_frame','a:3:{s:8:\"platform\";a:3:{i:0;a:2:{s:5:\"title\";s:12:\"基本功能\";s:5:\"items\";a:9:{i:0;a:5:{s:2:\"id\";s:1:\"3\";s:5:\"title\";s:12:\"文字回复\";s:3:\"url\";s:38:\"./index.php?c=platform&a=reply&m=basic\";s:15:\"permission_name\";s:20:\"platform_reply_basic\";s:6:\"append\";a:2:{s:5:\"title\";s:26:\"<i class=\"fa fa-plus\"></i>\";s:3:\"url\";s:46:\"./index.php?c=platform&a=reply&do=post&m=basic\";}}i:1;a:5:{s:2:\"id\";s:1:\"4\";s:5:\"title\";s:12:\"图文回复\";s:3:\"url\";s:37:\"./index.php?c=platform&a=reply&m=news\";s:15:\"permission_name\";s:19:\"platform_reply_news\";s:6:\"append\";a:2:{s:5:\"title\";s:26:\"<i class=\"fa fa-plus\"></i>\";s:3:\"url\";s:45:\"./index.php?c=platform&a=reply&do=post&m=news\";}}i:2;a:5:{s:2:\"id\";s:1:\"5\";s:5:\"title\";s:12:\"音乐回复\";s:3:\"url\";s:38:\"./index.php?c=platform&a=reply&m=music\";s:15:\"permission_name\";s:20:\"platform_reply_music\";s:6:\"append\";a:2:{s:5:\"title\";s:26:\"<i class=\"fa fa-plus\"></i>\";s:3:\"url\";s:46:\"./index.php?c=platform&a=reply&do=post&m=music\";}}i:3;a:5:{s:2:\"id\";s:1:\"6\";s:5:\"title\";s:12:\"图片回复\";s:3:\"url\";s:39:\"./index.php?c=platform&a=reply&m=images\";s:15:\"permission_name\";s:21:\"platform_reply_images\";s:6:\"append\";a:2:{s:5:\"title\";s:26:\"<i class=\"fa fa-plus\"></i>\";s:3:\"url\";s:47:\"./index.php?c=platform&a=reply&do=post&m=images\";}}i:4;a:5:{s:2:\"id\";s:1:\"7\";s:5:\"title\";s:12:\"语音回复\";s:3:\"url\";s:38:\"./index.php?c=platform&a=reply&m=voice\";s:15:\"permission_name\";s:20:\"platform_reply_voice\";s:6:\"append\";a:2:{s:5:\"title\";s:26:\"<i class=\"fa fa-plus\"></i>\";s:3:\"url\";s:46:\"./index.php?c=platform&a=reply&do=post&m=voice\";}}i:5;a:5:{s:2:\"id\";s:1:\"8\";s:5:\"title\";s:12:\"视频回复\";s:3:\"url\";s:38:\"./index.php?c=platform&a=reply&m=video\";s:15:\"permission_name\";s:20:\"platform_reply_video\";s:6:\"append\";a:2:{s:5:\"title\";s:26:\"<i class=\"fa fa-plus\"></i>\";s:3:\"url\";s:46:\"./index.php?c=platform&a=reply&do=post&m=video\";}}i:6;a:5:{s:2:\"id\";s:1:\"9\";s:5:\"title\";s:18:\"微信卡券回复\";s:3:\"url\";s:39:\"./index.php?c=platform&a=reply&m=wxcard\";s:15:\"permission_name\";s:21:\"platform_reply_wxcard\";s:6:\"append\";a:2:{s:5:\"title\";s:26:\"<i class=\"fa fa-plus\"></i>\";s:3:\"url\";s:47:\"./index.php?c=platform&a=reply&do=post&m=wxcard\";}}i:7;a:5:{s:2:\"id\";s:2:\"10\";s:5:\"title\";s:21:\"自定义接口回复\";s:3:\"url\";s:40:\"./index.php?c=platform&a=reply&m=userapi\";s:15:\"permission_name\";s:22:\"platform_reply_userapi\";s:6:\"append\";a:2:{s:5:\"title\";s:26:\"<i class=\"fa fa-plus\"></i>\";s:3:\"url\";s:48:\"./index.php?c=platform&a=reply&do=post&m=userapi\";}}i:8;a:4:{s:2:\"id\";s:2:\"11\";s:5:\"title\";s:12:\"系统回复\";s:3:\"url\";s:44:\"./index.php?c=platform&a=special&do=display&\";s:15:\"permission_name\";s:21:\"platform_reply_system\";}}}i:1;a:2:{s:5:\"title\";s:12:\"高级功能\";s:5:\"items\";a:6:{i:0;a:4:{s:2:\"id\";s:2:\"13\";s:5:\"title\";s:18:\"常用服务接入\";s:3:\"url\";s:43:\"./index.php?c=platform&a=service&do=switch&\";s:15:\"permission_name\";s:16:\"platform_service\";}i:1;a:4:{s:2:\"id\";s:2:\"14\";s:5:\"title\";s:15:\"自定义菜单\";s:3:\"url\";s:30:\"./index.php?c=platform&a=menu&\";s:15:\"permission_name\";s:13:\"platform_menu\";}i:2;a:4:{s:2:\"id\";s:2:\"15\";s:5:\"title\";s:18:\"特殊消息回复\";s:3:\"url\";s:44:\"./index.php?c=platform&a=special&do=message&\";s:15:\"permission_name\";s:16:\"platform_special\";}i:3;a:4:{s:2:\"id\";s:2:\"16\";s:5:\"title\";s:15:\"二维码管理\";s:3:\"url\";s:28:\"./index.php?c=platform&a=qr&\";s:15:\"permission_name\";s:11:\"platform_qr\";}i:4;a:4:{s:2:\"id\";s:2:\"17\";s:5:\"title\";s:15:\"多客服接入\";s:3:\"url\";s:39:\"./index.php?c=platform&a=reply&m=custom\";s:15:\"permission_name\";s:21:\"platform_reply_custom\";}i:5;a:4:{s:2:\"id\";s:2:\"18\";s:5:\"title\";s:18:\"长链接二维码\";s:3:\"url\";s:32:\"./index.php?c=platform&a=url2qr&\";s:15:\"permission_name\";s:15:\"platform_url2qr\";}}}i:2;a:2:{s:5:\"title\";s:12:\"数据统计\";s:5:\"items\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"20\";s:5:\"title\";s:12:\"聊天记录\";s:3:\"url\";s:41:\"./index.php?c=platform&a=stat&do=history&\";s:15:\"permission_name\";s:21:\"platform_stat_history\";}i:1;a:4:{s:2:\"id\";s:2:\"21\";s:5:\"title\";s:24:\"回复规则使用情况\";s:3:\"url\";s:38:\"./index.php?c=platform&a=stat&do=rule&\";s:15:\"permission_name\";s:18:\"platform_stat_rule\";}i:2;a:4:{s:2:\"id\";s:2:\"22\";s:5:\"title\";s:21:\"关键字命中情况\";s:3:\"url\";s:41:\"./index.php?c=platform&a=stat&do=keyword&\";s:15:\"permission_name\";s:21:\"platform_stat_keyword\";}i:3;a:4:{s:2:\"id\";s:2:\"23\";s:5:\"title\";s:6:\"参数\";s:3:\"url\";s:41:\"./index.php?c=platform&a=stat&do=setting&\";s:15:\"permission_name\";s:21:\"platform_stat_setting\";}}}}s:4:\"site\";a:1:{i:0;a:2:{s:5:\"title\";s:12:\"功能组件\";s:5:\"items\";a:1:{i:0;a:4:{s:2:\"id\";s:2:\"36\";s:5:\"title\";s:12:\"文章编写\";s:3:\"url\";s:29:\"./index.php?c=site&a=article&\";s:15:\"permission_name\";s:12:\"site_article\";}}}}s:8:\"hospital\";a:2:{i:0;a:2:{s:5:\"title\";s:12:\"医院管理\";s:5:\"items\";a:7:{i:0;a:5:{s:2:\"id\";s:2:\"93\";s:5:\"title\";s:12:\"医生列表\";s:3:\"url\";s:39:\"./index.php?c=hospital&a=doctor&do=list\";s:15:\"permission_name\";s:5:\"list1\";s:6:\"append\";a:2:{s:5:\"title\";s:26:\"<i class=\"fa fa-plus\"></i>\";s:3:\"url\";s:38:\"./index.php?c=hospital&a=doctor&do=add\";}}i:1;a:4:{s:2:\"id\";s:2:\"96\";s:5:\"title\";s:12:\"预约挂号\";s:3:\"url\";s:43:\"./index.php?c=hospital&a=appintment&do=list\";s:15:\"permission_name\";s:4:\"list\";}i:2;a:4:{s:2:\"id\";s:2:\"99\";s:5:\"title\";s:12:\"评价管理\";s:3:\"url\";s:41:\"./index.php?c=hospital&a=evaluate&do=list\";s:15:\"permission_name\";s:4:\"list\";}i:3;a:4:{s:2:\"id\";s:3:\"103\";s:5:\"title\";s:24:\"医院简介显示管理\";s:3:\"url\";s:38:\"./index.php?c=hospital&a=brief&do=list\";s:15:\"permission_name\";s:4:\"list\";}i:4;a:4:{s:2:\"id\";s:3:\"104\";s:5:\"title\";s:18:\"出诊信息管理\";s:3:\"url\";s:39:\"./index.php?c=hospital&a=visits&do=list\";s:15:\"permission_name\";s:4:\"list\";}i:5;a:4:{s:2:\"id\";s:3:\"106\";s:5:\"title\";s:12:\"问答管理\";s:3:\"url\";s:39:\"./index.php?c=hospital&a=answer&do=list\";s:15:\"permission_name\";s:4:\"list\";}i:6;a:5:{s:2:\"id\";s:3:\"107\";s:5:\"title\";s:12:\"交通信息\";s:3:\"url\";s:36:\"./index.php?c=hospital&a=map&do=list\";s:15:\"permission_name\";s:4:\"list\";s:6:\"append\";a:2:{s:5:\"title\";s:26:\"<i class=\"fa fa-plus\"></i>\";s:3:\"url\";s:33:\"index.php?c=hospital&a=map&do=add\";}}}}i:1;a:2:{s:5:\"title\";s:12:\"档案管理\";s:5:\"items\";a:2:{i:0;a:4:{s:2:\"id\";s:3:\"101\";s:5:\"title\";s:12:\"档案管理\";s:3:\"url\";s:43:\"./index.php?c=hospital&a=management&do=list\";s:15:\"permission_name\";s:4:\"list\";}i:1;a:4:{s:2:\"id\";s:3:\"108\";s:5:\"title\";s:18:\"档案类型管理\";s:3:\"url\";s:48:\"./index.php?c=hospital&a=management_type&do=list\";s:15:\"permission_name\";s:4:\"list\";}}}}}'),('uniaccount:2','a:28:{s:4:\"acid\";s:1:\"2\";s:7:\"uniacid\";s:1:\"2\";s:5:\"token\";s:32:\"sK4b768kV7zz66kHvW0FWVQBG0g4B6fg\";s:12:\"access_token\";s:0:\"\";s:14:\"encodingaeskey\";s:43:\"V4648p5Pk4B6hy94gG5hBn5zZ6854KKPA611YV495N5\";s:5:\"level\";s:1:\"4\";s:4:\"name\";s:27:\"公主岭市妇幼保健院\";s:7:\"account\";s:15:\"gh_e588da7749e4\";s:8:\"original\";s:15:\"gh_e588da7749e4\";s:9:\"signature\";s:0:\"\";s:7:\"country\";s:0:\"\";s:8:\"province\";s:0:\"\";s:4:\"city\";s:0:\"\";s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";s:10:\"lastupdate\";s:1:\"0\";s:3:\"key\";s:18:\"wx2a109d5b3c890d4a\";s:6:\"secret\";s:32:\"b188aee7dd3648dc39ebb7263e82e81d\";s:7:\"styleid\";s:1:\"0\";s:12:\"subscribeurl\";s:0:\"\";s:18:\"auth_refresh_token\";s:0:\"\";s:12:\"default_acid\";s:1:\"2\";s:4:\"type\";s:1:\"1\";s:3:\"uid\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:6:\"groups\";a:1:{i:2;a:5:{s:7:\"groupid\";s:1:\"2\";s:7:\"uniacid\";s:1:\"2\";s:5:\"title\";s:15:\"默认会员组\";s:6:\"credit\";s:1:\"0\";s:9:\"isdefault\";s:1:\"1\";}}s:10:\"grouplevel\";s:1:\"0\";}'),('unimodules:2:','a:13:{s:5:\"basic\";a:19:{s:3:\"mid\";s:1:\"1\";s:4:\"name\";s:5:\"basic\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本文字回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"和您进行简单对话\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:4:\"news\";a:19:{s:3:\"mid\";s:1:\"2\";s:4:\"name\";s:4:\"news\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"基本混合图文回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:33:\"为你提供生动的图文资讯\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"music\";a:19:{s:3:\"mid\";s:1:\"3\";s:4:\"name\";s:5:\"music\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本音乐回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:39:\"提供语音、音乐等音频类回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:7:\"userapi\";a:19:{s:3:\"mid\";s:1:\"4\";s:4:\"name\";s:7:\"userapi\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:21:\"自定义接口回复\";s:7:\"version\";s:3:\"1.1\";s:7:\"ability\";s:33:\"更方便的第三方接口设置\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:6:\"config\";a:6:{i:1;b:1;i:2;b:1;i:3;b:1;i:4;b:1;i:5;b:1;i:6;b:1;}s:7:\"enabled\";i:1;s:9:\"isdisplay\";i:1;}s:8:\"recharge\";a:19:{s:3:\"mid\";s:1:\"5\";s:4:\"name\";s:8:\"recharge\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"会员中心充值模块\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"提供会员充值功能\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:6:\"custom\";a:19:{s:3:\"mid\";s:1:\"6\";s:4:\"name\";s:6:\"custom\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:15:\"多客服转接\";s:7:\"version\";s:5:\"1.0.0\";s:7:\"ability\";s:36:\"用来接入腾讯的多客服系统\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:17:\"http://bbs.we7.cc\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:6:{i:0;s:5:\"image\";i:1;s:5:\"voice\";i:2;s:5:\"video\";i:3;s:8:\"location\";i:4;s:4:\"link\";i:5;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:6:\"images\";a:19:{s:3:\"mid\";s:1:\"7\";s:4:\"name\";s:6:\"images\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本图片回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"video\";a:19:{s:3:\"mid\";s:1:\"8\";s:4:\"name\";s:5:\"video\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本视频回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"voice\";a:19:{s:3:\"mid\";s:1:\"9\";s:4:\"name\";s:5:\"voice\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本语音回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供语音回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"chats\";a:19:{s:3:\"mid\";s:2:\"10\";s:4:\"name\";s:5:\"chats\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"发送客服消息\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:77:\"公众号可以在粉丝最后发送消息的48小时内无限制发送消息\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:6:\"wxcard\";a:19:{s:3:\"mid\";s:2:\"11\";s:4:\"name\";s:6:\"wxcard\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"微信卡券回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"微信卡券回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:9:\"paycenter\";a:19:{s:3:\"mid\";s:2:\"12\";s:4:\"name\";s:9:\"paycenter\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:9:\"收银台\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:9:\"收银台\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:4:\"core\";a:5:{s:5:\"title\";s:24:\"系统事件处理模块\";s:4:\"name\";s:4:\"core\";s:8:\"issystem\";i:1;s:7:\"enabled\";i:1;s:9:\"isdisplay\";i:0;}}'),('uniaccount:0','a:6:{s:4:\"type\";b:0;s:3:\"uid\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:6:\"groups\";a:0:{}s:10:\"grouplevel\";b:0;}'),('unisetting:0','b:0;');

/*Table structure for table `ims_core_cron` */

DROP TABLE IF EXISTS `ims_core_cron`;

CREATE TABLE `ims_core_cron` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cloudid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `lastruntime` int(10) unsigned NOT NULL,
  `nextruntime` int(10) unsigned NOT NULL,
  `weekday` tinyint(3) NOT NULL,
  `day` tinyint(3) NOT NULL,
  `hour` tinyint(3) NOT NULL,
  `minute` varchar(255) NOT NULL,
  `extra` varchar(5000) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `createtime` (`createtime`),
  KEY `nextruntime` (`nextruntime`),
  KEY `uniacid` (`uniacid`),
  KEY `cloudid` (`cloudid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_core_cron` */

/*Table structure for table `ims_core_cron_record` */

DROP TABLE IF EXISTS `ims_core_cron_record`;

CREATE TABLE `ims_core_cron_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  `note` varchar(500) NOT NULL,
  `tag` varchar(5000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `tid` (`tid`),
  KEY `module` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_core_cron_record` */

/*Table structure for table `ims_core_menu` */

DROP TABLE IF EXISTS `ims_core_menu`;

CREATE TABLE `ims_core_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL,
  `title` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(60) NOT NULL,
  `append_title` varchar(30) NOT NULL,
  `append_url` varchar(255) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_system` tinyint(3) unsigned NOT NULL,
  `permission_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

/*Data for the table `ims_core_menu` */

insert  into `ims_core_menu`(`id`,`pid`,`title`,`name`,`url`,`append_title`,`append_url`,`displayorder`,`type`,`is_display`,`is_system`,`permission_name`) values (1,0,'基础设置','platform','','fa fa-cog','',0,'url',1,1,''),(2,1,'基本功能','platform','','','',0,'url',1,1,'platform_basic_function'),(3,2,'文字回复','platform','./index.php?c=platform&a=reply&m=basic','fa fa-plus','./index.php?c=platform&a=reply&do=post&m=basic',0,'url',1,1,'platform_reply_basic'),(4,2,'图文回复','platform','./index.php?c=platform&a=reply&m=news','fa fa-plus','./index.php?c=platform&a=reply&do=post&m=news',0,'url',1,1,'platform_reply_news'),(5,2,'音乐回复','platform','./index.php?c=platform&a=reply&m=music','fa fa-plus','./index.php?c=platform&a=reply&do=post&m=music',0,'url',1,1,'platform_reply_music'),(6,2,'图片回复','platform','./index.php?c=platform&a=reply&m=images','fa fa-plus','./index.php?c=platform&a=reply&do=post&m=images',0,'url',1,1,'platform_reply_images'),(7,2,'语音回复','platform','./index.php?c=platform&a=reply&m=voice','fa fa-plus','./index.php?c=platform&a=reply&do=post&m=voice',0,'url',1,1,'platform_reply_voice'),(8,2,'视频回复','platform','./index.php?c=platform&a=reply&m=video','fa fa-plus','./index.php?c=platform&a=reply&do=post&m=video',0,'url',1,1,'platform_reply_video'),(9,2,'微信卡券回复','platform','./index.php?c=platform&a=reply&m=wxcard','fa fa-plus','./index.php?c=platform&a=reply&do=post&m=wxcard',0,'url',1,1,'platform_reply_wxcard'),(10,2,'自定义接口回复','platform','./index.php?c=platform&a=reply&m=userapi','fa fa-plus','./index.php?c=platform&a=reply&do=post&m=userapi',0,'url',1,1,'platform_reply_userapi'),(11,2,'系统回复','platform','./index.php?c=platform&a=special&do=display&','','',0,'url',1,1,'platform_reply_system'),(12,1,'高级功能','platform','','','',0,'url',1,1,'platform_high_function'),(13,12,'常用服务接入','platform','./index.php?c=platform&a=service&do=switch&','','',0,'url',1,1,'platform_service'),(14,12,'自定义菜单','platform','./index.php?c=platform&a=menu&','','',0,'url',1,1,'platform_menu'),(15,12,'特殊消息回复','platform','./index.php?c=platform&a=special&do=message&','','',0,'url',1,1,'platform_special'),(16,12,'二维码管理','platform','./index.php?c=platform&a=qr&','','',0,'url',1,1,'platform_qr'),(17,12,'多客服接入','platform','./index.php?c=platform&a=reply&m=custom','','',0,'url',1,1,'platform_reply_custom'),(18,12,'长链接二维码','platform','./index.php?c=platform&a=url2qr&','','',0,'url',1,1,'platform_url2qr'),(19,1,'数据统计','platform','','','',0,'url',1,1,'platform_stat'),(20,19,'聊天记录','platform','./index.php?c=platform&a=stat&do=history&','','',0,'url',1,1,'platform_stat_history'),(21,19,'回复规则使用情况','platform','./index.php?c=platform&a=stat&do=rule&','','',0,'url',1,1,'platform_stat_rule'),(22,19,'关键字命中情况','platform','./index.php?c=platform&a=stat&do=keyword&','','',0,'url',1,1,'platform_stat_keyword'),(23,19,'参数','platform','./index.php?c=platform&a=stat&do=setting&','','',0,'url',1,1,'platform_stat_setting'),(24,0,'就医指南','site','','fa fa-life-bouy','',0,'url',1,1,''),(25,24,'微站管理','site','','','',0,'url',0,1,'site_manage'),(26,25,'站点管理','site','./index.php?c=site&a=multi&do=display&','fa fa-plus','./index.php?c=site&a=multi&do=post&',0,'url',0,1,'site_multi_display'),(27,25,'站点添加/编辑','site','','','',0,'permission',0,1,'site_multi_post'),(28,25,'站点删除','site','','','',0,'permission',0,1,'site_multi_del'),(29,25,'模板管理','site','./index.php?c=site&a=style&do=template&','','',0,'url',1,1,'site_style_template'),(30,25,'模块模板扩展','site','./index.php?c=site&a=style&do=module&','','',0,'url',0,1,'site_style_module'),(31,24,'特殊页面管理','site','','','',0,'url',0,1,'site_special_page'),(32,31,'会员中心','site','./index.php?c=site&a=editor&do=uc&','','',0,'url',0,1,'site_editor_uc'),(33,31,'专题页面','site','./index.php?c=site&a=editor&do=page&','fa fa-plus','./index.php?c=site&a=editor&do=design&',0,'url',0,1,'site_editor_page'),(34,24,'功能组件','site','','','',0,'url',1,1,'site_article'),(35,34,'分类设置','site','./index.php?c=site&a=category&','','',0,'url',0,1,'site_category'),(36,34,'文章编写','site','./index.php?c=site&a=article&','','',0,'url',1,1,'site_article'),(37,0,'粉丝营销','mc','','fa fa-gift','',0,'url',0,1,''),(38,37,'粉丝管理','mc','','','',0,'url',1,1,'mc_fans_manage'),(39,38,'粉丝分组','mc','./index.php?c=mc&a=fangroup&','','',0,'url',1,1,'mc_fangroup'),(40,38,'粉丝','mc','./index.php?c=mc&a=fans&','','',0,'url',1,1,'mc_fans'),(41,37,'会员中心','mc','','','',0,'url',1,1,'mc_members_manage'),(42,41,'会员中心关键字','mc','./index.php?c=platform&a=cover&do=mc&','','',0,'url',1,1,'platform_cover_mc'),(43,41,'会员','mc','./index.php?c=mc&a=member','fa fa-plus','./index.php?c=mc&a=member&do=add',0,'url',1,1,'mc_member'),(44,41,'会员组','mc','./index.php?c=mc&a=group&','','',0,'url',1,1,'mc_group'),(45,37,'会员卡管理','mc','','','',0,'url',1,1,'mc_card_manage'),(46,45,'会员卡关键字','mc','./index.php?c=platform&a=cover&do=card&','','',0,'url',1,1,'platform_cover_card'),(47,45,'会员卡管理','mc','./index.php?c=mc&a=card&do=manage','','',0,'url',1,1,'mc_card_manage'),(48,45,'会员卡设置','mc','./index.php?c=mc&a=card&do=editor','','',0,'url',1,1,'mc_card_editor'),(49,45,'会员卡其他功能','mc','./index.php?c=mc&a=card&do=other','','',0,'url',1,1,'mc_card_other'),(50,37,'积分兑换','mc','','','',0,'url',1,1,'activity_discount_manage'),(51,50,'卡券兑换','mc','./index.php?c=activity&a=exchange&do=display&type=coupon','','',0,'url',1,1,'activity_coupon_exchange'),(52,50,'真实物品兑换','mc','./index.php?c=activity&a=exchange&do=display&type=goods','','',0,'url',1,1,'activity_goods_display'),(53,37,'微信素材&群发','mc','','','',0,'url',1,1,'material_manage'),(54,53,'素材&群发','mc','./index.php?c=material&a=display','','',0,'url',1,1,'material_display'),(55,53,'定时群发','mc','./index.php?c=material&a=mass','','',0,'url',1,1,'material_mass'),(56,37,'卡券管理','mc','','','',0,'url',1,1,'wechat_card_manage'),(57,56,'卡券列表','mc','./index.php?c=activity&a=coupon&do=display','','',0,'url',1,1,'activity_coupon_display'),(58,56,'卡券营销','mc','index.php?c=activity&a=market','','',0,'url',1,1,'activity_coupon_market'),(59,56,'卡券核销','mc','./index.php?c=activity&a=consume&do=display&status=2','','',0,'url',1,1,'activity_consume_coupon'),(60,37,'工作台','mc','','','',0,'url',1,1,'paycenter_manage'),(61,60,'门店列表','mc','./index.php?c=activity&a=store','','',0,'url',1,1,'activity_store_list'),(62,60,'店员列表','mc','./index.php?c=activity&a=clerk','','',0,'url',1,1,'activity_clerk_list'),(63,60,'微信刷卡收款','mc','./index.php?c=paycenter&a=wxmicro&do=pay','','',0,'url',1,1,'paycenter_wxmicro_pay'),(64,60,'店员操作关键字','mc','./index.php?c=platform&a=cover&do=clerk','','',0,'url',1,1,'paycenter_clerk'),(65,37,'统计中心','mc','','','',0,'url',1,1,'stat_center'),(66,65,'会员积分统计','mc','./index.php?c=stat&a=credit1','','',0,'url',1,1,'stat_credit1'),(67,65,'会员余额统计','mc','./index.php?c=stat&a=credit2','','',0,'url',1,1,'stat_credit2'),(68,65,'会员现金消费统计','mc','./index.php?c=stat&a=cash','','',0,'url',1,1,'stat_cash'),(69,65,'会员卡统计','mc','./index.php?c=stat&a=card','','',0,'url',1,1,'stat_card'),(70,65,'收银台收款统计','mc','./index.php?c=stat&a=paycenter','','',0,'url',1,1,'stat_paycenter'),(71,0,'功能选项','setting','','fa fa-umbrella','',0,'url',0,1,''),(72,71,'公众号选项','setting','','','',0,'url',1,1,'account_setting'),(73,72,'支付参数','setting','./index.php?c=profile&a=payment&','','',0,'url',1,1,'profile_payment'),(74,72,'借用 oAuth 权限','setting','./index.php?c=mc&a=passport&do=oauth&','','',0,'url',1,1,'mc_passport_oauth'),(75,72,'借用 JS 分享权限','setting','./index.php?c=profile&a=jsauth&','','',0,'url',1,1,'profile_jsauth'),(76,72,'会员字段管理','setting','./index.php?c=mc&a=fields','','',0,'url',1,1,'mc_fields'),(77,72,'微信通知设置','setting','./index.php?c=mc&a=tplnotice','','',0,'url',1,1,'mc_tplnotice'),(78,72,'工作台菜单设置','setting','./index.php?c=profile&a=deskmenu','','',0,'url',1,1,'profile_deskmenu'),(79,72,'会员扩展功能','setting','./index.php?c=mc&a=plugin','','',0,'url',1,1,'mc_plugin'),(80,71,'会员及粉丝选项','setting','','','',0,'url',1,1,'mc_setting'),(81,80,'积分设置','setting','./index.php?c=mc&a=credit&','','',0,'url',1,1,'mc_credit'),(82,80,'注册设置','setting','./index.php?c=mc&a=passport&do=passport&','','',0,'url',1,1,'mc_passport_passport'),(83,80,'粉丝同步设置','setting','./index.php?c=mc&a=passport&do=sync&','','',0,'url',1,1,'mc_passport_sync'),(84,80,'UC站点整合','setting','./index.php?c=mc&a=uc&','','',0,'url',1,1,'mc_uc'),(85,80,'邮件通知参数','setting','./index.php?c=profile&a=notify','','',0,'url',1,1,'profile_notify'),(86,71,'其他功能选项','setting','','','',0,'url',1,1,'others_setting'),(87,0,'扩展功能','ext','','fa fa-cubes','',0,'url',0,1,''),(88,87,'管理','ext','','','',0,'url',1,1,''),(89,88,'扩展功能管理','ext','./index.php?c=profile&a=module&','','',0,'url',1,1,'profile_module'),(90,0,'测试菜单','test','','fa fa-anchor','',0,'',0,0,''),(91,0,'医院管理','hospital','','fa fa-anchor','',0,'url',1,1,''),(92,91,'医院管理','hospital','','','',0,'url',1,1,''),(93,92,'医生列表','hospital','./index.php?c=hospital&a=doctor&do=list','fa fa-plus','./index.php?c=hospital&a=doctor&do=add',0,'url',1,1,'list1'),(95,91,'预约挂号管理','hospital','','','',0,'url',0,1,''),(96,92,'预约挂号','hospital','./index.php?c=hospital&a=appintment&do=list','','',0,'url',1,1,'list'),(102,91,'界面数据显示设置','hospital','','','',0,'url',0,1,''),(98,91,'评价管理','hospital','','','',0,'url',0,1,''),(99,92,'评价管理','hospital','./index.php?c=hospital&a=evaluate&do=list','','',0,'url',1,1,'list'),(100,91,'档案管理','hospital','','','',0,'url',1,1,''),(101,100,'档案管理','hospital','./index.php?c=hospital&a=management&do=list','','',0,'url',1,1,'list'),(103,92,'医院简介显示管理','hospital','./index.php?c=hospital&a=brief&do=list','','',0,'url',1,1,'list'),(104,92,'出诊信息管理','hospital','./index.php?c=hospital&a=visits&do=list','','',0,'url',1,1,'list'),(105,102,'测试','hospital','./index.php?c=hospital&a=model&do=list','','',0,'url',0,1,'list'),(106,92,'问答管理','hospital','./index.php?c=hospital&a=answer&do=list','','',0,'url',1,1,'list'),(107,92,'交通信息','hospital','./index.php?c=hospital&a=map&do=list','fa fa-plus','index.php?c=hospital&a=map&do=add',0,'url',1,1,'list'),(108,100,'档案类型管理','hospital','./index.php?c=hospital&a=management_type&do=list','','',0,'url',1,1,'list'),(109,100,'推送消息模板管理','hospital','./index.php?c=hospital&a=management_msg&do=list','fa fa-plus','index.php?c=hospital&a=management_msg&do=add',0,'url',0,1,'list');

/*Table structure for table `ims_core_paylog` */

DROP TABLE IF EXISTS `ims_core_paylog`;

CREATE TABLE `ims_core_paylog` (
  `plid` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `acid` int(10) NOT NULL,
  `openid` varchar(40) NOT NULL,
  `uniontid` varchar(64) NOT NULL,
  `tid` varchar(128) NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `module` varchar(50) NOT NULL,
  `tag` varchar(2000) NOT NULL,
  `is_usecard` tinyint(3) unsigned NOT NULL,
  `card_type` tinyint(3) unsigned NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `card_fee` decimal(10,2) unsigned NOT NULL,
  `encrypt_code` varchar(100) NOT NULL,
  PRIMARY KEY (`plid`),
  KEY `idx_openid` (`openid`),
  KEY `idx_tid` (`tid`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `uniontid` (`uniontid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_core_paylog` */

/*Table structure for table `ims_core_performance` */

DROP TABLE IF EXISTS `ims_core_performance`;

CREATE TABLE `ims_core_performance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `runtime` varchar(10) NOT NULL,
  `runurl` varchar(512) NOT NULL,
  `runsql` varchar(512) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_core_performance` */

/*Table structure for table `ims_core_queue` */

DROP TABLE IF EXISTS `ims_core_queue`;

CREATE TABLE `ims_core_queue` (
  `qid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `message` varchar(2000) NOT NULL,
  `params` varchar(1000) NOT NULL,
  `keyword` varchar(1000) NOT NULL,
  `response` varchar(2000) NOT NULL,
  `module` varchar(50) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`qid`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `module` (`module`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_core_queue` */

/*Table structure for table `ims_core_resource` */

DROP TABLE IF EXISTS `ims_core_resource`;

CREATE TABLE `ims_core_resource` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `media_id` varchar(100) NOT NULL,
  `trunk` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `acid` (`uniacid`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_core_resource` */

/*Table structure for table `ims_core_sendsms_log` */

DROP TABLE IF EXISTS `ims_core_sendsms_log`;

CREATE TABLE `ims_core_sendsms_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `result` varchar(255) NOT NULL,
  `createtime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_core_sendsms_log` */

/*Table structure for table `ims_core_sessions` */

DROP TABLE IF EXISTS `ims_core_sessions`;

CREATE TABLE `ims_core_sessions` (
  `sid` char(32) NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `data` varchar(5000) NOT NULL,
  `expiretime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_core_sessions` */

insert  into `ims_core_sessions`(`sid`,`uniacid`,`openid`,`data`,`expiretime`) values ('22400f52c8a04fff5ba8a20f83e00cc2',2,'175.17.179.117','acid|s:1:\"2\";uniacid|i:2;token|a:6:{s:4:\"AVbK\";i:1504261192;s:4:\"rB1h\";i:1504261193;s:4:\"lahK\";i:1504261233;s:4:\"S2g9\";i:1504261249;s:4:\"Br85\";i:1504261252;s:4:\"rMmX\";i:1504261252;}dest_url|s:94:\"http%3A%2F%2Ffuyou.vlsoft.cn%2Fapp%2Findex.php%3Fi%3D2%26c%3Dhospital%26a%3Dindex%26do%3Dbrief\";oauth_openid|s:28:\"ov6BEv7imCj4AbUc_tRPlZoRT3Yg\";oauth_acid|s:1:\"2\";openid|s:28:\"ov6BEv7imCj4AbUc_tRPlZoRT3Yg\";uid|s:2:\"10\";',1504264852),('fbd8c3c6ee5b71d9400469a3727b34e8',2,'117.185.27.115','acid|s:1:\"2\";uniacid|i:2;token|a:1:{s:4:\"GdpB\";i:1504261217;}dest_url|s:94:\"http%3A%2F%2Ffuyou.vlsoft.cn%2Fapp%2Findex.php%3Fi%3D2%26c%3Dhospital%26a%3Dindex%26do%3Dbrief\";',1504264817),('731d54a78e990f4de5fae298582bee70',2,'117.185.27.115','acid|s:1:\"2\";uniacid|i:2;token|a:1:{s:4:\"yYc7\";i:1504261262;}dest_url|s:118:\"http%3A%2F%2Ffuyou.vlsoft.cn%2Fapp%2Findex.php%3Fi%3D2%26c%3Dhospital%26a%3Dmanagement%26do%3Dlist%26id%3D1%26type%3D4\";',1504264862),('7e1c72a308b31fe16b7e5aed886bc1bb',2,'101.226.33.223','acid|s:1:\"2\";uniacid|i:2;token|a:1:{s:4:\"bpwP\";i:1504261701;}dest_url|s:95:\"http%3A%2F%2Ffuyou.vlsoft.cn%2Fapp%2Findex.php%3Fi%3D2%26c%3Dhospital%26a%3Dindex%26do%3Dvisits\";',1504265301),('dce801ae5113c79e4d5a3995ecc7b4bd',2,'221.9.53.78','acid|s:1:\"2\";uniacid|i:2;token|a:6:{s:4:\"FeWO\";i:1504263608;s:4:\"u8sx\";i:1504263617;s:4:\"XNMR\";i:1504263626;s:4:\"JzTm\";i:1504263640;s:4:\"tWr9\";i:1504263641;s:4:\"IRzr\";i:1504263652;}dest_url|s:92:\"http%3A%2F%2Ffuyou.vlsoft.cn%2Fapp%2Findex.php%3Fi%3D2%26c%3Dhospital%26a%3Dindex%26do%3Dmap\";oauth_openid|s:28:\"ov6BEvxfak8ydPJQuFT_g8gCcDhA\";oauth_acid|s:1:\"2\";openid|s:28:\"ov6BEvxfak8ydPJQuFT_g8gCcDhA\";uid|s:1:\"1\";',1504267252),('9c116e0441d8cf8be0b5d66c494f37cc',2,'112.90.82.218','acid|s:1:\"2\";uniacid|i:2;token|a:1:{s:4:\"Cllc\";i:1504320182;}',1504323782),('b26fb6661e9665e2d8c7bcaef2fda3a5',2,'112.90.82.218','acid|s:1:\"2\";uniacid|i:2;token|a:1:{s:4:\"GWfk\";i:1504320182;}',1504323782),('1f42dcb6bb3986b75ef1be1a2a9c707d',2,'101.226.65.105','acid|s:1:\"2\";uniacid|i:2;token|a:2:{s:4:\"AQn2\";i:1504320213;s:4:\"o0o6\";i:1504320213;}',1504323813);

/*Table structure for table `ims_core_settings` */

DROP TABLE IF EXISTS `ims_core_settings`;

CREATE TABLE `ims_core_settings` (
  `key` varchar(200) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_core_settings` */

insert  into `ims_core_settings`(`key`,`value`) values ('copyright','a:1:{s:6:\"slides\";a:3:{i:0;s:58:\"https://img.alicdn.com/tps/TB1pfG4IFXXXXc6XXXXXXXXXXXX.jpg\";i:1;s:58:\"https://img.alicdn.com/tps/TB1sXGYIFXXXXc5XpXXXXXXXXXX.jpg\";i:2;s:58:\"https://img.alicdn.com/tps/TB1h9xxIFXXXXbKXXXXXXXXXXXX.jpg\";}}'),('authmode','i:1;'),('close','a:2:{s:6:\"status\";s:1:\"0\";s:6:\"reason\";s:0:\"\";}'),('register','a:4:{s:4:\"open\";i:1;s:6:\"verify\";i:0;s:4:\"code\";i:1;s:7:\"groupid\";i:1;}'),('basic','a:1:{s:8:\"template\";s:7:\"default\";}'),('platform','a:5:{s:5:\"token\";s:32:\"JIuD8bDZzrzRIRrabRu0dJ0cdA5irURI\";s:14:\"encodingaeskey\";s:43:\"titP0930ZdpRAZDrR1sIZPfftsp3apa1P1Xp50epg1S\";s:9:\"appsecret\";s:0:\"\";s:5:\"appid\";s:0:\"\";s:9:\"authstate\";i:1;}'),('site','a:6:{s:3:\"key\";s:5:\"99417\";s:5:\"token\";s:32:\"c29a6da90359b7dd94c6aa7a1ae97db2\";s:3:\"url\";s:22:\"http://fuyou.vlsoft.cn\";s:7:\"version\";s:3:\"1.0\";s:6:\"family\";s:1:\"v\";s:15:\"profile_perfect\";b:1;}'),('upload','a:2:{s:5:\"image\";a:4:{s:5:\"thumb\";i:0;s:5:\"width\";i:800;s:10:\"extentions\";a:4:{i:0;s:3:\"gif\";i:1;s:3:\"jpg\";i:2;s:4:\"jpeg\";i:3;s:3:\"png\";}s:5:\"limit\";i:5000;}s:5:\"audio\";a:2:{s:10:\"extentions\";a:1:{i:0;s:3:\"mp3\";}s:5:\"limit\";i:5000;}}');

/*Table structure for table `ims_coupon` */

DROP TABLE IF EXISTS `ims_coupon`;

CREATE TABLE `ims_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `type` varchar(15) NOT NULL,
  `logo_url` varchar(150) NOT NULL,
  `code_type` tinyint(3) unsigned NOT NULL,
  `brand_name` varchar(15) NOT NULL,
  `title` varchar(15) NOT NULL,
  `sub_title` varchar(20) NOT NULL,
  `color` varchar(15) NOT NULL,
  `notice` varchar(15) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `date_info` varchar(200) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `use_custom_code` tinyint(3) NOT NULL,
  `bind_openid` tinyint(3) unsigned NOT NULL,
  `can_share` tinyint(3) unsigned NOT NULL,
  `can_give_friend` tinyint(3) unsigned NOT NULL,
  `get_limit` tinyint(3) unsigned NOT NULL,
  `service_phone` varchar(20) NOT NULL,
  `extra` varchar(1000) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_selfconsume` tinyint(3) unsigned NOT NULL,
  `promotion_url_name` varchar(10) NOT NULL,
  `promotion_url` varchar(100) NOT NULL,
  `promotion_url_sub_title` varchar(10) NOT NULL,
  `source` tinyint(3) unsigned NOT NULL,
  `dosage` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_coupon` */

/*Table structure for table `ims_coupon_activity` */

DROP TABLE IF EXISTS `ims_coupon_activity`;

CREATE TABLE `ims_coupon_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `msg_id` int(10) NOT NULL,
  `status` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` int(3) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `coupons` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `members` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_coupon_activity` */

/*Table structure for table `ims_coupon_groups` */

DROP TABLE IF EXISTS `ims_coupon_groups`;

CREATE TABLE `ims_coupon_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `couponid` varchar(255) NOT NULL,
  `groupid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_coupon_groups` */

/*Table structure for table `ims_coupon_location` */

DROP TABLE IF EXISTS `ims_coupon_location`;

CREATE TABLE `ims_coupon_location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `sid` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `category` varchar(255) NOT NULL,
  `province` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `district` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `photo_list` varchar(10000) NOT NULL,
  `avg_price` int(10) unsigned NOT NULL,
  `open_time` varchar(50) NOT NULL,
  `recommend` varchar(255) NOT NULL,
  `special` varchar(255) NOT NULL,
  `introduction` varchar(255) NOT NULL,
  `offset_type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_coupon_location` */

/*Table structure for table `ims_coupon_modules` */

DROP TABLE IF EXISTS `ims_coupon_modules`;

CREATE TABLE `ims_coupon_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `couponid` int(10) unsigned NOT NULL,
  `module` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `couponid` (`couponid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_coupon_modules` */

/*Table structure for table `ims_coupon_record` */

DROP TABLE IF EXISTS `ims_coupon_record`;

CREATE TABLE `ims_coupon_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `friend_openid` varchar(50) NOT NULL,
  `givebyfriend` tinyint(3) unsigned NOT NULL,
  `code` varchar(50) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  `usetime` int(10) unsigned NOT NULL,
  `status` tinyint(3) NOT NULL,
  `clerk_name` varchar(15) NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `couponid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `grantmodule` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `card_id` (`card_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_coupon_record` */

/*Table structure for table `ims_coupon_store` */

DROP TABLE IF EXISTS `ims_coupon_store`;

CREATE TABLE `ims_coupon_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `couponid` varchar(255) NOT NULL,
  `storeid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `couponid` (`couponid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_coupon_store` */

/*Table structure for table `ims_cover_reply` */

DROP TABLE IF EXISTS `ims_cover_reply`;

CREATE TABLE `ims_cover_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `module` varchar(30) NOT NULL,
  `do` varchar(30) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `ims_cover_reply` */

insert  into `ims_cover_reply`(`id`,`uniacid`,`multiid`,`rid`,`module`,`do`,`title`,`description`,`thumb`,`url`) values (1,1,0,7,'mc','','进入个人中心','','','./index.php?c=mc&a=home&i=1'),(2,1,1,8,'site','','进入首页','','','./index.php?c=home&i=1&t=1'),(3,2,3,9,'site','','公主岭市妇幼保健院','','','./index.php?c=home&i=2&t=3'),(4,2,4,10,'site','','医院简介','','','./index.php?c=home&i=2&t=4');

/*Table structure for table `ims_custom_reply` */

DROP TABLE IF EXISTS `ims_custom_reply`;

CREATE TABLE `ims_custom_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `start1` int(10) NOT NULL,
  `end1` int(10) NOT NULL,
  `start2` int(10) NOT NULL,
  `end2` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `ims_custom_reply` */

insert  into `ims_custom_reply`(`id`,`rid`,`start1`,`end1`,`start2`,`end2`) values (1,17,0,18,19,24);

/*Table structure for table `ims_doctor` */

DROP TABLE IF EXISTS `ims_doctor`;

CREATE TABLE `ims_doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(225) DEFAULT NULL,
  `name` varchar(225) DEFAULT NULL,
  `intro` varchar(2295) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `img_url` varchar(128) DEFAULT NULL COMMENT '图片路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `ims_doctor` */

insert  into `ims_doctor`(`id`,`title`,`name`,`intro`,`phone`,`section_id`,`level`,`img_url`) values (1,NULL,'顾健青2','我是顾健青','123122141241',1,1,'public/uploads/doctor_img20170831/2017083111402359a78527a8f5a.jpg'),(2,NULL,'李丽莎','我是李丽莎','17843150577',1,1,'public/uploads/doctor_img20170821/20170821085153599a2ea93e15f.jpg'),(3,NULL,'张医生','凉拌adsadada','13512313111',4,1,'public/uploads/doctor_img20170821/20170821085204599a2eb4e26b3.jpg'),(4,NULL,'支宇翔','我是支宇翔','13546476666',1,2,'public/uploads/doctor_img20170821/20170821085217599a2ec1de0fc.jpg'),(6,NULL,'关康','我是关康','13584764744',1,2,'public/uploads/doctor_img20170821/20170821085247599a2edf0f382.jpg'),(7,NULL,'唐瑞','我是唐瑞','17843150577',1,3,'public/uploads/doctor_img20170821/20170821085308599a2ef4521c8.jpg'),(8,NULL,'崔乐乐','我是崔乐乐','17854567897',1,3,'public/uploads/doctor_img20170821/20170821085321599a2f01c6f9f.jpg'),(9,NULL,'王医生','我是王医生','13584764744',2,1,'public/uploads/doctor_img20170821/20170821085033599a2e59eaf73.jpg'),(10,NULL,'张医生','我是张医生','13645678912',2,2,'public/uploads/doctor_img20170821/20170821085047599a2e67c533a.jpg'),(11,NULL,'李医生','我是李医生','17854567897',2,3,'public/uploads/doctor_img20170821/20170821085100599a2e74b73e0.jpg'),(12,NULL,'张医生','我是张医生','17843150577',2,3,'public/uploads/doctor_img20170821/20170821085117599a2e859b38b.jpg'),(13,NULL,'dancheng','我是dancheng','13546477777',1,1,'public/uploads/doctor_img20170821/20170821085129599a2e91727fd.jpg'),(14,NULL,'dancheng','我是dancheng','13546477777',1,1,'public/uploads/doctor_img20170819/201708191144015997b401459bf.png'),(16,NULL,'dasdda','我是dancheng','13584764744',1,1,'public/uploads/doctor_img20170821/20170821085419599a2f3b928dc.jpg'),(29,NULL,'dancheng1','我是dancheng','17843150577',6,3,'public/uploads/doctor_img20170821/20170821084903599a2dff1f047.jpg'),(30,NULL,'dancheng','hah1','13543646738',4,1,'public/uploads/doctor_img20170821/20170821125326599a674649066.png'),(31,NULL,'1232','dssa','13512313111',3,3,'public/uploads/doctor_img20170821/20170821130119599a691f23bc6.png'),(32,NULL,'dancheng1','我是dancheng','13512313111',3,1,'public\\uploads\\doctor_img20170829/2017082915583559a51eabb6e9f.png'),(33,NULL,'sdsas','dasdasda','13512313111',1,1,'public/uploads/doctor_img20170821/20170821135153599a74f9645de.png'),(34,NULL,'dasd','adsad','13512313111',3,1,NULL),(35,NULL,'dasda','dsadas','13512313111',1,1,'public\\uploads\\doctor_img20170829/2017082915555859a51e0ee5702.png'),(36,NULL,'sadasd','','13512313111',1,1,NULL);

/*Table structure for table `ims_doctor_answer` */

DROP TABLE IF EXISTS `ims_doctor_answer`;

CREATE TABLE `ims_doctor_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionId` int(11) DEFAULT NULL,
  `ansuer` varchar(1533) DEFAULT NULL,
  `wordkey` varchar(765) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `ims_doctor_answer` */

insert  into `ims_doctor_answer`(`id`,`questionId`,`ansuer`,`wordkey`) values (1,2,'gffdssfggdsfdasdasd',NULL),(2,3,'凉拌',NULL),(3,4,'分为可交付货物了空间分类时代峻峰拉斯科解放路；看电视减肥啦；快速开机',NULL),(4,5,'凉拌',NULL),(5,6,'凉拌',NULL),(6,9,'dasdasd',NULL),(7,10,'dasdasdasdasda',NULL),(8,1,'sdasda',NULL);

/*Table structure for table `ims_evaluate` */

DROP TABLE IF EXISTS `ims_evaluate`;

CREATE TABLE `ims_evaluate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `doctorId` int(11) DEFAULT NULL COMMENT '医生id',
  `scorce` int(11) DEFAULT '0' COMMENT '评价分数',
  `evaluate_note` varchar(255) DEFAULT NULL COMMENT '评语',
  `evaluate_date` int(11) DEFAULT NULL COMMENT '评价时间',
  `evaluate_user_id` int(11) DEFAULT NULL COMMENT '评价人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

/*Data for the table `ims_evaluate` */

insert  into `ims_evaluate`(`id`,`doctorId`,`scorce`,`evaluate_note`,`evaluate_date`,`evaluate_user_id`) values (23,2,20,'xhdhhjd:s',1503297131,13),(27,1,20,'euier',1503297476,13),(28,2,80,'狗狗',1503297966,6),(30,2,80,'轰隆隆',1503457299,6),(31,2,100,'公里嗯',1503457307,6),(32,2,40,'通过沃尔夫发你空间的技能',1503457840,0),(34,1,60,'测试13.58',1503554307,0),(35,2,60,'jrfgj',1503556026,0),(36,1,80,'好 四颗星',1503556933,6),(37,2,100,'111111',1503575199,1),(38,1,60,'你说了uov',1504016658,1),(39,1,100,'在',1504072161,0),(40,1,100,'',1504072170,0),(41,1,100,'',1504072171,0),(42,1,0,'@手机625¥26¥@～》就是F共同呼吸）将F《',1504072349,0),(43,1,0,'@手机625¥26¥@～》就是F共同呼吸）将F《',1504072362,0),(44,2,100,'我的评价',1504072382,0),(45,2,100,'我的评价',1504072442,0),(46,1,0,'@手机625¥26¥@～》就是F共同呼吸）将F《',1504072446,0),(47,1,100,'cgtty',1504160133,13),(48,1,100,'',1504161506,14),(49,1,100,'',1504161524,14);

/*Table structure for table `ims_hospital_intro` */

DROP TABLE IF EXISTS `ims_hospital_intro`;

CREATE TABLE `ims_hospital_intro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(2295) DEFAULT NULL,
  `address` varchar(2295) DEFAULT NULL,
  `traffic` varchar(2295) DEFAULT NULL,
  `introduce` varchar(2295) DEFAULT NULL,
  `phone` varchar(2295) DEFAULT NULL,
  `updatetime` varchar(2295) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `ims_hospital_intro` */

insert  into `ims_hospital_intro`(`id`,`name`,`address`,`traffic`,`introduce`,`phone`,`updatetime`) values (2,'公主岭人民医院','吉林省公主岭市高新技术开发区公主东大街与枫叶路交汇1120号','乘5路、10路、12路、13路公交车到公主岭人民医院站下车','榆林市第一医院暨延安大学第二附属医院、西安交通大学医学部非直属附属医院、陕西中医学院教学医院，前身为1951年创建于宝鸡的陕西省第二康复医院；1970年为支援陕北老区建设，整体迁址绥德；1989年通过国家教委验收，成为延安大学第二附属医院；1995年通过卫生部验收，成为陕北地区第一所三级甲等综合医院；2010年、2015年两度顺利通过等级医院复审；2016年建成西安交通大学医学部非直属附属医院、陕西中医学院教学医院。作为陕北地区医疗技术中心和人才培养基地，我院一直承担着陕晋宁蒙接壤地区危急重症抢救和技术指','0431-87988072','123444');

/*Table structure for table `ims_images_reply` */

DROP TABLE IF EXISTS `ims_images_reply`;

CREATE TABLE `ims_images_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_images_reply` */

/*Table structure for table `ims_map` */

DROP TABLE IF EXISTS `ims_map`;

CREATE TABLE `ims_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `precision` varchar(127) DEFAULT NULL COMMENT '精度',
  `dimension` varchar(127) DEFAULT NULL COMMENT '维度',
  `cn_name` varchar(255) DEFAULT NULL COMMENT '中文名字',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `ims_map` */

insert  into `ims_map`(`id`,`precision`,`dimension`,`cn_name`,`name`) values (1,'124.831422','43.500294','公主岭市妇幼保健院','公主111'),(2,'124.831422','43.500294','公主岭市妇幼保健院1','公主岭市'),(3,'124.831422','43.500294','公主岭市妇幼保健院2','公主岭市妇幼保健院2'),(4,'124.831422','43.500294','公主岭市妇幼保健院3','公主岭市妇幼保健院3'),(6,'123.12','132.3','大三大四的','dasd');

/*Table structure for table `ims_mc_card` */

DROP TABLE IF EXISTS `ims_mc_card`;

CREATE TABLE `ims_mc_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `color` varchar(255) NOT NULL,
  `background` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `format_type` tinyint(3) unsigned NOT NULL,
  `format` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `fields` varchar(1000) NOT NULL,
  `snpos` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `business` text NOT NULL,
  `discount_type` tinyint(3) unsigned NOT NULL,
  `discount` varchar(3000) NOT NULL,
  `grant` varchar(3000) NOT NULL,
  `grant_rate` varchar(20) NOT NULL,
  `offset_rate` int(10) unsigned NOT NULL,
  `offset_max` int(10) NOT NULL,
  `nums_status` tinyint(3) unsigned NOT NULL,
  `nums_text` varchar(15) NOT NULL,
  `nums` varchar(1000) NOT NULL,
  `times_status` tinyint(3) unsigned NOT NULL,
  `times_text` varchar(15) NOT NULL,
  `times` varchar(1000) NOT NULL,
  `params` longtext NOT NULL,
  `html` longtext NOT NULL,
  `recommend_status` tinyint(3) unsigned NOT NULL,
  `sign_status` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `ims_mc_card` */

insert  into `ims_mc_card`(`id`,`uniacid`,`title`,`color`,`background`,`logo`,`format_type`,`format`,`description`,`fields`,`snpos`,`status`,`business`,`discount_type`,`discount`,`grant`,`grant_rate`,`offset_rate`,`offset_max`,`nums_status`,`nums_text`,`nums`,`times_status`,`times_text`,`times`,`params`,`html`,`recommend_status`,`sign_status`) values (1,2,'我的会员卡','','','',1,'','','a:2:{i:0;a:3:{s:5:\"title\";s:6:\"姓名\";s:7:\"require\";i:1;s:4:\"bind\";s:8:\"realname\";}i:1;a:3:{s:5:\"title\";s:6:\"手机\";s:7:\"require\";i:1;s:4:\"bind\";s:6:\"mobile\";}}',0,1,'',0,'','','',0,0,0,'','',0,'','','','',0,0);

/*Table structure for table `ims_mc_card_care` */

DROP TABLE IF EXISTS `ims_mc_card_care`;

CREATE TABLE `ims_mc_card_care` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `groupid` int(10) unsigned NOT NULL,
  `credit1` int(10) unsigned NOT NULL,
  `credit2` int(10) unsigned NOT NULL,
  `couponid` int(10) unsigned NOT NULL,
  `granttime` int(10) unsigned NOT NULL,
  `days` int(10) unsigned NOT NULL,
  `time` tinyint(3) unsigned NOT NULL,
  `show_in_card` tinyint(3) unsigned NOT NULL,
  `content` varchar(1000) NOT NULL,
  `sms_notice` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_mc_card_care` */

/*Table structure for table `ims_mc_card_credit_set` */

DROP TABLE IF EXISTS `ims_mc_card_credit_set`;

CREATE TABLE `ims_mc_card_credit_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `sign` varchar(1000) NOT NULL,
  `share` varchar(500) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_mc_card_credit_set` */

/*Table structure for table `ims_mc_card_members` */

DROP TABLE IF EXISTS `ims_mc_card_members`;

CREATE TABLE `ims_mc_card_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) DEFAULT NULL,
  `openid` varchar(50) NOT NULL,
  `cid` int(10) NOT NULL,
  `cardsn` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `nums` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_mc_card_members` */

/*Table structure for table `ims_mc_card_notices` */

DROP TABLE IF EXISTS `ims_mc_card_notices`;

CREATE TABLE `ims_mc_card_notices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `groupid` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_mc_card_notices` */

/*Table structure for table `ims_mc_card_notices_unread` */

DROP TABLE IF EXISTS `ims_mc_card_notices_unread`;

CREATE TABLE `ims_mc_card_notices_unread` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `notice_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `is_new` tinyint(3) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`),
  KEY `notice_id` (`notice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_mc_card_notices_unread` */

/*Table structure for table `ims_mc_card_recommend` */

DROP TABLE IF EXISTS `ims_mc_card_recommend`;

CREATE TABLE `ims_mc_card_recommend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_mc_card_recommend` */

/*Table structure for table `ims_mc_card_record` */

DROP TABLE IF EXISTS `ims_mc_card_record`;

CREATE TABLE `ims_mc_card_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  `model` tinyint(3) unsigned NOT NULL,
  `fee` decimal(10,2) unsigned NOT NULL,
  `tag` varchar(10) NOT NULL,
  `note` varchar(255) NOT NULL,
  `remark` varchar(200) NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`),
  KEY `addtime` (`addtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_mc_card_record` */

/*Table structure for table `ims_mc_card_sign_record` */

DROP TABLE IF EXISTS `ims_mc_card_sign_record`;

CREATE TABLE `ims_mc_card_sign_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `credit` int(10) unsigned NOT NULL,
  `is_grant` tinyint(3) unsigned NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_mc_card_sign_record` */

/*Table structure for table `ims_mc_cash_record` */

DROP TABLE IF EXISTS `ims_mc_cash_record`;

CREATE TABLE `ims_mc_cash_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `fee` decimal(10,2) unsigned NOT NULL,
  `final_fee` decimal(10,2) unsigned NOT NULL,
  `credit1` int(10) unsigned NOT NULL,
  `credit1_fee` decimal(10,2) unsigned NOT NULL,
  `credit2` decimal(10,2) unsigned NOT NULL,
  `cash` decimal(10,2) unsigned NOT NULL,
  `return_cash` decimal(10,2) unsigned NOT NULL,
  `final_cash` decimal(10,2) unsigned NOT NULL,
  `remark` varchar(255) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_mc_cash_record` */

/*Table structure for table `ims_mc_chats_record` */

DROP TABLE IF EXISTS `ims_mc_chats_record`;

CREATE TABLE `ims_mc_chats_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `flag` tinyint(3) unsigned NOT NULL,
  `openid` varchar(32) NOT NULL,
  `msgtype` varchar(15) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `openid` (`openid`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_mc_chats_record` */

/*Table structure for table `ims_mc_credits_recharge` */

DROP TABLE IF EXISTS `ims_mc_credits_recharge`;

CREATE TABLE `ims_mc_credits_recharge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `tid` varchar(64) NOT NULL,
  `transid` varchar(30) NOT NULL,
  `fee` varchar(10) NOT NULL,
  `type` varchar(15) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `backtype` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid_uid` (`uniacid`,`uid`),
  KEY `idx_tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_mc_credits_recharge` */

/*Table structure for table `ims_mc_credits_record` */

DROP TABLE IF EXISTS `ims_mc_credits_record`;

CREATE TABLE `ims_mc_credits_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `uniacid` int(11) NOT NULL,
  `credittype` varchar(10) NOT NULL,
  `num` decimal(10,2) NOT NULL,
  `operator` int(10) unsigned NOT NULL,
  `module` varchar(30) NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `remark` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_mc_credits_record` */

/*Table structure for table `ims_mc_fans_groups` */

DROP TABLE IF EXISTS `ims_mc_fans_groups`;

CREATE TABLE `ims_mc_fans_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `groups` varchar(10000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `ims_mc_fans_groups` */

insert  into `ims_mc_fans_groups`(`id`,`uniacid`,`acid`,`groups`) values (1,2,2,'a:1:{i:2;a:3:{s:2:\"id\";i:2;s:4:\"name\";s:9:\"星标组\";s:5:\"count\";i:0;}}');

/*Table structure for table `ims_mc_fans_tag_mapping` */

DROP TABLE IF EXISTS `ims_mc_fans_tag_mapping`;

CREATE TABLE `ims_mc_fans_tag_mapping` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fanid` int(11) unsigned NOT NULL,
  `tagid` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mapping` (`fanid`,`tagid`),
  KEY `fanid_index` (`fanid`),
  KEY `tagid_index` (`tagid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_mc_fans_tag_mapping` */

/*Table structure for table `ims_mc_groups` */

DROP TABLE IF EXISTS `ims_mc_groups`;

CREATE TABLE `ims_mc_groups` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `credit` int(10) unsigned NOT NULL,
  `isdefault` tinyint(4) NOT NULL,
  PRIMARY KEY (`groupid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `ims_mc_groups` */

insert  into `ims_mc_groups`(`groupid`,`uniacid`,`title`,`credit`,`isdefault`) values (1,1,'默认会员组',0,1),(2,2,'默认会员组',0,1);

/*Table structure for table `ims_mc_handsel` */

DROP TABLE IF EXISTS `ims_mc_handsel`;

CREATE TABLE `ims_mc_handsel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `touid` int(10) unsigned NOT NULL,
  `fromuid` varchar(32) NOT NULL,
  `module` varchar(30) NOT NULL,
  `sign` varchar(100) NOT NULL,
  `action` varchar(20) NOT NULL,
  `credit_value` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`touid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_mc_handsel` */

/*Table structure for table `ims_mc_mapping_fans` */

DROP TABLE IF EXISTS `ims_mc_mapping_fans`;

CREATE TABLE `ims_mc_mapping_fans` (
  `fanid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `groupid` varchar(30) NOT NULL,
  `salt` char(8) NOT NULL,
  `follow` tinyint(1) unsigned NOT NULL,
  `followtime` int(10) unsigned NOT NULL,
  `unfollowtime` int(10) unsigned NOT NULL,
  `tag` varchar(1000) NOT NULL,
  `updatetime` int(10) unsigned DEFAULT NULL,
  `unionid` varchar(64) NOT NULL,
  PRIMARY KEY (`fanid`),
  UNIQUE KEY `openid` (`openid`),
  KEY `acid` (`acid`),
  KEY `uniacid` (`uniacid`),
  KEY `nickname` (`nickname`),
  KEY `updatetime` (`updatetime`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `ims_mc_mapping_fans` */

insert  into `ims_mc_mapping_fans`(`fanid`,`acid`,`uniacid`,`uid`,`openid`,`nickname`,`groupid`,`salt`,`follow`,`followtime`,`unfollowtime`,`tag`,`updatetime`,`unionid`) values (1,2,2,1,'ov6BEvxfak8ydPJQuFT_g8gCcDhA','','','viII4lJj',1,1502066865,0,'YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib3Y2QkV2eGZhazh5ZFBKUXVGVF9nOGdDY0RoQSI7czo4OiJuaWNrbmFtZSI7czoxNzoi8J+Um+iHtOm4o+S/ivCfkosiO3M6Mzoic2V4IjtpOjE7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IumVv+aYpSI7czo4OiJwcm92aW5jZSI7czo2OiLlkInmnpciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTMxOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2YzVkxXenpMRTJpY0U3eGU0UHprc1hkZWxHaG9ONlpiV0YwaWFJSDZZTzIwTVN5aWJPZ2NWaElhMUhVcDRBVzVkdVowWTlldkFmTWljdFIwaWNkR3N1ZTE1RDhmYmpkSlpHa0wxLzEzMiI7czoxNDoic3Vic2NyaWJlX3RpbWUiO2k6MTUwMjA2Njg2NTtzOjY6InJlbWFyayI7czowOiIiO3M6NzoiZ3JvdXBpZCI7aTowO3M6MTA6InRhZ2lkX2xpc3QiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9mM1ZMV3p6TEUyaWNFN3hlNFB6a3NYZGVsR2hvTjZaYldGMGlhSUg2WU8yME1TeWliT2djVmhJYTFIVXA0QVc1ZHVaMFk5ZXZBZk1pY3RSMGljZEdzdWUxNUQ4ZmJqZEpaR2tMMS8xMzIiO30=',1502261568,''),(12,2,2,0,'ov6BEv_PNzAM_lbHRbAd34KjDKBE','百熙','','ATHk9nbH',1,1502070512,0,'YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib3Y2QkV2X1BOekFNX2xiSFJiQWQzNEtqREtCRSI7czo4OiJuaWNrbmFtZSI7czo2OiLnmb7nhpkiO3M6Mzoic2V4IjtpOjE7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IumVv+aYpSI7czo4OiJwcm92aW5jZSI7czo2OiLlkInmnpciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTIyOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL1BpYWp4U3FCUmFFSThRYzB1a2ljRWlhOWR6bDZiWmY3TlV3c3dyWG5LZEFpYmNjY1ZEN1NISjFIZkRTcmlheExpY0g5NXJIaHFNWFUxcmRBbDFUdnhqcnpGNnlnLzEzMiI7czoxNDoic3Vic2NyaWJlX3RpbWUiO2k6MTUwMjA3MDUxMjtzOjY6InJlbWFyayI7czowOiIiO3M6NzoiZ3JvdXBpZCI7aTowO3M6MTA6InRhZ2lkX2xpc3QiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEyMjoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9QaWFqeFNxQlJhRUk4UWMwdWtpY0VpYTlkemw2YlpmN05Vd3N3clhuS2RBaWJjY2NWRDdTSEoxSGZEU3JpYXhMaWNIOTVySGhxTVhVMXJkQWwxVHZ4anJ6RjZ5Zy8xMzIiO30=',1502931006,''),(3,2,2,3,'fromUser','','','pnTAUstD',1,1502326369,0,'',NULL,''),(4,2,2,13,'ov6BEvy3Yf8feKTr6VrmH3XjSutA','','','gHhj56eB',1,1502326046,0,'YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib3Y2QkV2eTNZZjhmZUtUcjZWcm1IM1hqU3V0QSI7czo4OiJuaWNrbmFtZSI7czozOiLugLUiO3M6Mzoic2V4IjtpOjE7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IueZveWfjiI7czo4OiJwcm92aW5jZSI7czo2OiLlkInmnpciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTMyOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL0pWREVDbk5qZWRFc0VKZ0VuSVlia2YyaWNBZ1ZGdHdCUEx6aWJHbDg0VXZUd2xkZ1dWMzRtUFRnOFppYUY0dWN5UHVxa01XSnlDTzJLem1zNEVsaWFpYjV6enJZUlUwRkxMaWN5VS8xMzIiO3M6MTQ6InN1YnNjcmliZV90aW1lIjtpOjE1MDIzMjYwNDY7czo2OiJyZW1hcmsiO3M6MDoiIjtzOjc6Imdyb3VwaWQiO2k6MDtzOjEwOiJ0YWdpZF9saXN0IjthOjA6e31zOjY6ImF2YXRhciI7czoxMzI6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vSlZERUNuTmplZEVzRUpnRW5JWWJrZjJpY0FnVkZ0d0JQTHppYkdsODRVdlR3bGRnV1YzNG1QVGc4WmlhRjR1Y3lQdXFrTVdKeUNPMkt6bXM0RWxpYWliNXp6cllSVTBGTExpY3lVLzEzMiI7fQ==',1502326616,''),(5,2,2,5,'ov6BEvwHzm8_yNmPuEsWTkYlHh_c','','','Fm8WgcM8',1,1502450104,0,'YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib3Y2QkV2d0h6bThfeU5tUHVFc1dUa1lsSGhfYyI7czo4OiJuaWNrbmFtZSI7czoxMjoi8J+Yi/CfmIvwn5iLIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLlm5vlubMiO3M6ODoicHJvdmluY2UiO3M6Njoi5ZCJ5p6XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzNToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9WQ0ZPaFc3TEFkSHphY01qZnBpYThzOHhxYXpQcWlhbjZZaWE1VFJpYWRraGNxaWJIVndpYkxYQUdHR0o1TGxBTjNBd0cxaGljcXZpYWliQlpoQXlGVVpLUWtiTDZaQVJiaGIzWmw3d24vMTMyIjtzOjE0OiJzdWJzY3JpYmVfdGltZSI7aToxNTAyNDUwMTA0O3M6NjoicmVtYXJrIjtzOjA6IiI7czo3OiJncm91cGlkIjtpOjA7czoxMDoidGFnaWRfbGlzdCI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTM1OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL1ZDRk9oVzdMQWRIemFjTWpmcGlhOHM4eHFhelBxaWFuNllpYTVUUmlhZGtoY3FpYkhWd2liTFhBR0dHSjVMbEFOM0F3RzFoaWNxdmlhaWJCWmhBeUZVWktRa2JMNlpBUmJoYjNabDd3bi8xMzIiO30=',1502518793,''),(6,2,2,6,'ov6BEv-YIinvFEHgDBdmRFnVOXH4','曲小冷','','g2PEpSgp',1,1502690421,0,'YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib3Y2QkV2LVlJaW52RkVIZ0RCZG1SRm5WT1hINCI7czo4OiJuaWNrbmFtZSI7czo5OiLmm7LlsI/lhrciO3M6Mzoic2V4IjtpOjI7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IumVv+aYpSI7czo4OiJwcm92aW5jZSI7czo2OiLlkInmnpciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTQ1OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL1EzYXVIZ3p3ek02U2hQTnlpYkZWdGZoU2hENEVacGliOGlhRXA5Y2lhb3N1U1lsR2lja1BSZlNpYU5pY29lZTlKSHRBOUhsUlg2Q1hnWkxBVWFBbmFFQUJ3NWpmbWliMUFUeVIxSEpyeElzMTVlNlhzMzQvMTMyIjtzOjE0OiJzdWJzY3JpYmVfdGltZSI7aToxNTAyNjkwNDIxO3M6NjoicmVtYXJrIjtzOjA6IiI7czo3OiJncm91cGlkIjtpOjA7czoxMDoidGFnaWRfbGlzdCI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTQ1OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL1EzYXVIZ3p3ek02U2hQTnlpYkZWdGZoU2hENEVacGliOGlhRXA5Y2lhb3N1U1lsR2lja1BSZlNpYU5pY29lZTlKSHRBOUhsUlg2Q1hnWkxBVWFBbmFFQUJ3NWpmbWliMUFUeVIxSEpyeElzMTVlNlhzMzQvMTMyIjt9',1502690431,''),(7,2,2,7,'ov6BEvyTsS7HvbzD_NAfY0_vBQ1w','gidviper','','vZh4gAPq',1,1502678960,0,'YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib3Y2QkV2eVRzUzdIdmJ6RF9OQWZZMF92QlExdyI7czo4OiJuaWNrbmFtZSI7czo4OiJnaWR2aXBlciI7czozOiJzZXgiO2k6MTtzOjg6Imxhbmd1YWdlIjtzOjU6InpoX0NOIjtzOjQ6ImNpdHkiO3M6Njoi6ZW/5pilIjtzOjg6InByb3ZpbmNlIjtzOjY6IuWQieaelyI7czo3OiJjb3VudHJ5IjtzOjY6IuS4reWbvSI7czoxMDoiaGVhZGltZ3VybCI7czoxMzM6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vVkNGT2hXN0xBZEZkaWJWbGNDeHNNaEw0aWNrN21ZOUc4M0tzOUt4RTNDTGxXbFNpYUpmNUZwQmRJQVg5SmlhM05lamljdm5pY3lTNUt1dm9rek9LV3hWNGliOVBEZW54WFhPVm5xRi8xMzIiO3M6MTQ6InN1YnNjcmliZV90aW1lIjtpOjE1MDI2Nzg5NjA7czo2OiJyZW1hcmsiO3M6MDoiIjtzOjc6Imdyb3VwaWQiO2k6MDtzOjEwOiJ0YWdpZF9saXN0IjthOjA6e31zOjY6ImF2YXRhciI7czoxMzM6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vVkNGT2hXN0xBZEZkaWJWbGNDeHNNaEw0aWNrN21ZOUc4M0tzOUt4RTNDTGxXbFNpYUpmNUZwQmRJQVg5SmlhM05lamljdm5pY3lTNUt1dm9rek9LV3hWNGliOVBEZW54WFhPVm5xRi8xMzIiO30=',1502698512,''),(8,2,2,8,'ov6BEv48HdjvgUKM6vyDV2ZQitEE','·。吐泡泡的小鱼','','JC5D525u',1,1502678898,0,'YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib3Y2QkV2NDhIZGp2Z1VLTTZ2eURWMlpRaXRFRSI7czo4OiJuaWNrbmFtZSI7czoyMzoiwrfjgILlkJDms6Hms6HnmoTlsI/psbwiO3M6Mzoic2V4IjtpOjI7czo4OiJsYW5ndWFnZSI7czoyOiJqYSI7czo0OiJjaXR5IjtzOjA6IiI7czo4OiJwcm92aW5jZSI7czowOiIiO3M6NzoiY291bnRyeSI7czoxMjoi5ZOl5Lym5q+U5LqaIjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9WQ0ZPaFc3TEFkSHphY01qZnBpYThzd3IyczhtNGlhVk51TVZaRmdVakNtaWJjUTVpYlZNVVZwWXRzYkdQcDZpYW5IV2liSW02dVppYjl4RUVuYlJINGp2NnhuSUNEanBiWGR6UnFyLzEzMiI7czoxNDoic3Vic2NyaWJlX3RpbWUiO2k6MTUwMjY3ODg5ODtzOjY6InJlbWFyayI7czowOiIiO3M6NzoiZ3JvdXBpZCI7aTowO3M6MTA6InRhZ2lkX2xpc3QiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9WQ0ZPaFc3TEFkSHphY01qZnBpYThzd3IyczhtNGlhVk51TVZaRmdVakNtaWJjUTVpYlZNVVZwWXRzYkdQcDZpYW5IV2liSW02dVppYjl4RUVuYlJINGp2NnhuSUNEanBiWGR6UnFyLzEzMiI7fQ==',1502698520,''),(9,2,2,9,'ov6BEv83nhteAxi9qTDewcywlfvY','卖花何胖胖～','','dVHvtHS8',1,1502698630,0,'YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib3Y2QkV2ODNuaHRlQXhpOXFURGV3Y3l3bGZ2WSI7czo4OiJuaWNrbmFtZSI7czoxODoi5Y2W6Iqx5L2V6IOW6IOW772eIjtzOjM6InNleCI7aToyO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czowOiIiO3M6ODoicHJvdmluY2UiO3M6MDoiIjtzOjc6ImNvdW50cnkiO3M6MDoiIjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEyODoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9lbFM5MEpzcmQySExZb3lQb1lBVU92eFdJdmV4dW82ZHNYOU0xaHhvbmZVck1sTGhEWDM2aWJRQmh4QlFXc2ljNEI0RXlIRUNWalFVMENsZXhzZ1RDQldBZW04R0FySlNkWC8xMzIiO3M6MTQ6InN1YnNjcmliZV90aW1lIjtpOjE1MDI2OTg2MzA7czo2OiJyZW1hcmsiO3M6MDoiIjtzOjc6Imdyb3VwaWQiO2k6MDtzOjEwOiJ0YWdpZF9saXN0IjthOjA6e31zOjY6ImF2YXRhciI7czoxMjg6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vZWxTOTBKc3JkMkhMWW95UG9ZQVVPdnhXSXZleHVvNmRzWDlNMWh4b25mVXJNbExoRFgzNmliUUJoeEJRV3NpYzRCNEV5SEVDVmpRVTBDbGV4c2dUQ0JXQWVtOEdBckpTZFgvMTMyIjt9',1502698637,''),(10,2,2,10,'ov6BEv7imCj4AbUc_tRPlZoRT3Yg','','','nw00Wi1D',1,1502699094,0,'YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib3Y2QkV2N2ltQ2o0QWJVY190UlBsWm9SVDNZZyI7czo4OiJuaWNrbmFtZSI7czoyODoi8J+miuWHpOS5neC4hOC4tOC4lOC4luC4tuC4hyI7czozOiJzZXgiO2k6MjtzOjg6Imxhbmd1YWdlIjtzOjU6InpoX0NOIjtzOjQ6ImNpdHkiO3M6Njoi6ZW/5pilIjtzOjg6InByb3ZpbmNlIjtzOjY6IuWQieaelyI7czo3OiJjb3VudHJ5IjtzOjY6IuS4reWbvSI7czoxMDoiaGVhZGltZ3VybCI7czoxMzA6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vVkNGT2hXN0xBZEZkaWJWbGNDeHNNaEJLdTJZWmtRS2JxdXFYN0xyb2hVbEplWlVpY0JDaWNObnpaSXpDbnlPdXpFcWRHVGh6aWJKQWxLSjVHbHhDU2dNeTRTRXZsUDBIQU5ITS8xMzIiO3M6MTQ6InN1YnNjcmliZV90aW1lIjtpOjE1MDI2OTkwOTQ7czo2OiJyZW1hcmsiO3M6MDoiIjtzOjc6Imdyb3VwaWQiO2k6MDtzOjEwOiJ0YWdpZF9saXN0IjthOjA6e31zOjY6ImF2YXRhciI7czoxMzA6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vVkNGT2hXN0xBZEZkaWJWbGNDeHNNaEJLdTJZWmtRS2JxdXFYN0xyb2hVbEplWlVpY0JDaWNObnpaSXpDbnlPdXpFcWRHVGh6aWJKQWxLSjVHbHhDU2dNeTRTRXZsUDBIQU5ITS8xMzIiO30=',1502699122,''),(11,2,2,11,'ov6BEv9GBxHd9_9V9xsXO-l2FIkg','chengcong','','LUswF6zN',1,1502707060,0,'YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib3Y2QkV2OUdCeEhkOV85Vjl4c1hPLWwyRklrZyI7czo4OiJuaWNrbmFtZSI7czo5OiJjaGVuZ2NvbmciO3M6Mzoic2V4IjtpOjE7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IumVv+aYpSI7czo4OiJwcm92aW5jZSI7czo2OiLlkInmnpciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTM0OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2YzVkxXenpMRTJpYllJeVBEc2xnRE1PYlFsdUNjNjNmNkp4TnhnRkt3OWt1cWlhaWN0bUo4SjlPbzVteEhpYVlpYmF5aWNpYjVSbHZPZlh0MTVOc2RpYWpmSUQwSzlKNGRRT3Z5Q0VOLzEzMiI7czoxNDoic3Vic2NyaWJlX3RpbWUiO2k6MTUwMjcwNzA2MDtzOjY6InJlbWFyayI7czowOiIiO3M6NzoiZ3JvdXBpZCI7aTowO3M6MTA6InRhZ2lkX2xpc3QiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzNDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9mM1ZMV3p6TEUyaWJZSXlQRHNsZ0RNT2JRbHVDYzYzZjZKeE54Z0ZLdzlrdXFpYWljdG1KOEo5T281bXhIaWFZaWJheWljaWI1Umx2T2ZYdDE1TnNkaWFqZklEMEs5SjRkUU92eUNFTi8xMzIiO30=',1502707065,''),(13,2,2,0,'ov6BEv6CLIE9rcUVggw2bvkanwOs','梓屹','','TqdjRD4D',1,1503042198,0,'YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib3Y2QkV2NkNMSUU5cmNVVmdndzJidmthbndPcyI7czo4OiJuaWNrbmFtZSI7czo2OiLmopPlsbkiO3M6Mzoic2V4IjtpOjE7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjA6IiI7czo4OiJwcm92aW5jZSI7czo2OiLlkInmnpciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTQwOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL1EzYXVIZ3p3ek03dmt4bkt1c3lpYW5Ldk5vTThZRVlQMUlIQ29oOHlSRmljNkZrellpY2ZKNDMybVJqSTQyYmV3N2RkeUtPYlhyNGpKMGZET1hRV0NaNlk1N2tNSHF4ZWxnYTJnemdtYWVBdXFvLzEzMiI7czoxNDoic3Vic2NyaWJlX3RpbWUiO2k6MTUwMzA0MjE5ODtzOjY6InJlbWFyayI7czowOiIiO3M6NzoiZ3JvdXBpZCI7aTowO3M6MTA6InRhZ2lkX2xpc3QiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjE0MDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9RM2F1SGd6d3pNN3ZreG5LdXN5aWFuS3ZOb004WUVZUDFJSENvaDh5UkZpYzZGa3pZaWNmSjQzMm1Sakk0MmJldzdkZHlLT2JYcjRqSjBmRE9YUVdDWjZZNTdrTUhxeGVsZ2EyZ3pnbWFlQXVxby8xMzIiO30=',1503042204,''),(14,2,2,0,'ov6BEv6oHIAWluHYon2FZdKNHN-s','ヾ请ぺ叫我宝哥い ','','WHMcq0hq',1,1503392816,0,'YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib3Y2QkV2Nm9ISUFXbHVIWW9uMkZaZEtOSE4tcyI7czo4OiJuaWNrbmFtZSI7czoyODoi44O+6K+344G65Y+r5oiR5a6d5ZOl44GEIO6MryI7czozOiJzZXgiO2k6MjtzOjg6Imxhbmd1YWdlIjtzOjU6InpoX0NOIjtzOjQ6ImNpdHkiO3M6Njoi5Zub5bmzIjtzOjg6InByb3ZpbmNlIjtzOjY6IuWQieaelyI7czo3OiJjb3VudHJ5IjtzOjY6IuS4reWbvSI7czoxMDoiaGVhZGltZ3VybCI7czoxMzI6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vVkNGT2hXN0xBZEZkaWJWbGNDeHNNaE5YUDNIOGliRGJ6UVEwaWJvbG1EM0NnS2liZEtWaWJzSmt2T0NWak5ZeUhDWE5NTTlLQWRmaWFaRnZScXZLUVc1RGZOR21MREJHRkJ1TVc2LzEzMiI7czoxNDoic3Vic2NyaWJlX3RpbWUiO2k6MTUwMzM5MjgxNjtzOjY6InJlbWFyayI7czowOiIiO3M6NzoiZ3JvdXBpZCI7aTowO3M6MTA6InRhZ2lkX2xpc3QiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMjoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9WQ0ZPaFc3TEFkRmRpYlZsY0N4c01oTlhQM0g4aWJEYnpRUTBpYm9sbUQzQ2dLaWJkS1ZpYnNKa3ZPQ1ZqTll5SENYTk1NOUtBZGZpYVpGdlJxdktRVzVEZk5HbUxEQkdGQnVNVzYvMTMyIjt9',1503392852,''),(15,2,2,0,'ov6BEv368GCarNY3LOEF0B4xzGIA','','','Z2P1hhOq',1,1503479491,0,'YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib3Y2QkV2MzY4R0Nhck5ZM0xPRUYwQjR4ekdJQSI7czo4OiJuaWNrbmFtZSI7czoxOToi8J+QsvCfkLLpvo3wn5Cy8J+QsiI7czozOiJzZXgiO2k6MTtzOjg6Imxhbmd1YWdlIjtzOjU6InpoX0NOIjtzOjQ6ImNpdHkiO3M6Njoi5Zub5bmzIjtzOjg6InByb3ZpbmNlIjtzOjY6IuWQieaelyI7czo3OiJjb3VudHJ5IjtzOjY6IuS4reWbvSI7czoxMDoiaGVhZGltZ3VybCI7czoxMjY6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vRkMxSVRqQVBleVpWRXJNTndMMDltdGhxY1RmVGhtNW5UMmZVWjlISTJmRUZ4TzhUcTZwMUttSlFDMnJCeER3cHNsMmZyelhSeUtnY3ZVSnVMQkZmUHhCNGNjbUFYN3N6LzEzMiI7czoxNDoic3Vic2NyaWJlX3RpbWUiO2k6MTUwMzQ3OTQ5MTtzOjY6InJlbWFyayI7czowOiIiO3M6NzoiZ3JvdXBpZCI7aTowO3M6MTA6InRhZ2lkX2xpc3QiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEyNjoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9GQzFJVGpBUGV5WlZFck1Od0wwOW10aHFjVGZUaG01blQyZlVaOUhJMmZFRnhPOFRxNnAxS21KUUMyckJ4RHdwc2wyZnJ6WFJ5S2djdlVKdUxCRmZQeEI0Y2NtQVg3c3ovMTMyIjt9',1503480746,''),(16,2,2,14,'ov6BEvyz6Hd4kw6q-QeL9PR7Tl6o','TSWH','','JC7RCtZ6',1,1503555492,0,'YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib3Y2QkV2eXo2SGQ0a3c2cS1RZUw5UFI3VGw2byI7czo4OiJuaWNrbmFtZSI7czo0OiJUU1dIIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mmKUiO3M6ODoicHJvdmluY2UiO3M6Njoi5ZCJ5p6XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9lbFM5MEpzcmQyRmlhc0g1TzQyeDJuOFBjdjRtTThyT0szaWNwZksyNGtJNWoyVElUbUw5Vng3WXdqaGRkQmx4aWFvaWJWRm83SU9VZWV4ZlZmeTVLMjFBOFJORjFXQ1lGNDNZLzEzMiI7czoxNDoic3Vic2NyaWJlX3RpbWUiO2k6MTUwMzU1NTQ5MjtzOjY6InJlbWFyayI7czowOiIiO3M6NzoiZ3JvdXBpZCI7aTowO3M6MTA6InRhZ2lkX2xpc3QiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9lbFM5MEpzcmQyRmlhc0g1TzQyeDJuOFBjdjRtTThyT0szaWNwZksyNGtJNWoyVElUbUw5Vng3WXdqaGRkQmx4aWFvaWJWRm83SU9VZWV4ZlZmeTVLMjFBOFJORjFXQ1lGNDNZLzEzMiI7fQ==',1503555516,''),(17,2,2,0,'ov6BEv6Vgse0_v_R6kF_ClKseZes','阿痴','','r44wEmD4',1,1503563364,0,'YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib3Y2QkV2NlZnc2UwX3ZfUjZrRl9DbEtzZVplcyI7czo4OiJuaWNrbmFtZSI7czo2OiLpmL/nl7QiO3M6Mzoic2V4IjtpOjE7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IumVv+aYpSI7czo4OiJwcm92aW5jZSI7czo2OiLlkInmnpciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTI3OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL01oOUVMVEdPT252eHd2STFCNzJEVFVja1dJSTBickRGTnJMZ25mWmJnUk5LTVVScE1EY1pKVXJNVW5CSEM0NzFLMTVyTVVIR0V2N0pVa0FSTjZQN0plN3pIMWVleFlIaWIvMTMyIjtzOjE0OiJzdWJzY3JpYmVfdGltZSI7aToxNTAzNTYzMzY0O3M6NjoicmVtYXJrIjtzOjA6IiI7czo3OiJncm91cGlkIjtpOjA7czoxMDoidGFnaWRfbGlzdCI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTI3OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL01oOUVMVEdPT252eHd2STFCNzJEVFVja1dJSTBickRGTnJMZ25mWmJnUk5LTVVScE1EY1pKVXJNVW5CSEM0NzFLMTVyTVVIR0V2N0pVa0FSTjZQN0plN3pIMWVleFlIaWIvMTMyIjt9',1503563370,''),(18,2,2,0,'ov6BEvw7n0pp5auJnpnaVHmMF53Y','天','','i1661je0',1,1503568564,0,'YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib3Y2QkV2dzduMHBwNWF1Sm5wbmFWSG1NRjUzWSI7czo4OiJuaWNrbmFtZSI7czozOiLlpKkiO3M6Mzoic2V4IjtpOjE7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IumVv+aYpSI7czo4OiJwcm92aW5jZSI7czo2OiLlkInmnpciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTMwOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2VsUzkwSnNyZDJITFlveVBvWUFVT2lhWjJjYkc0bXd3aWJmTTRzdVFGaWFMa3djSXdxTmZXaHNTM21XVG9pY0VwR216QnVEMzdTdXp0VnBSdEY5d2VIdU50SDJqUXBBSUhMeVkvMTMyIjtzOjE0OiJzdWJzY3JpYmVfdGltZSI7aToxNTAzNTY4NTY0O3M6NjoicmVtYXJrIjtzOjA6IiI7czo3OiJncm91cGlkIjtpOjA7czoxMDoidGFnaWRfbGlzdCI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTMwOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2VsUzkwSnNyZDJITFlveVBvWUFVT2lhWjJjYkc0bXd3aWJmTTRzdVFGaWFMa3djSXdxTmZXaHNTM21XVG9pY0VwR216QnVEMzdTdXp0VnBSdEY5d2VIdU50SDJqUXBBSUhMeVkvMTMyIjt9',1503568571,''),(19,2,2,0,'ov6BEv7Mna9hE_5nbWPt4D0f8ttk','煦','','fCrCq44D',1,1503582415,0,'YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib3Y2QkV2N01uYTloRV81bmJXUHQ0RDBmOHR0ayI7czo4OiJuaWNrbmFtZSI7czozOiLnhaYiO3M6Mzoic2V4IjtpOjI7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IumVv+aYpSI7czo4OiJwcm92aW5jZSI7czo2OiLlkInmnpciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTMxOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2VsUzkwSnNyZDJITFlveVBvWUFVT2pyOWFhak1qN3RpY1VvMllvaWNIU0E0Tm9DSTJYcE1mWWlhdk1ZSFRyMFNoNDhiMTc2QzhPQkNmOUxFbWFjelRMcTBzMkdpY3JpY3hHeVFZLzEzMiI7czoxNDoic3Vic2NyaWJlX3RpbWUiO2k6MTUwMzU4MjQxNTtzOjY6InJlbWFyayI7czowOiIiO3M6NzoiZ3JvdXBpZCI7aTowO3M6MTA6InRhZ2lkX2xpc3QiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9lbFM5MEpzcmQySExZb3lQb1lBVU9qcjlhYWpNajd0aWNVbzJZb2ljSFNBNE5vQ0kyWHBNZllpYXZNWUhUcjBTaDQ4YjE3NkM4T0JDZjlMRW1hY3pUTHEwczJHaWNyaWN4R3lRWS8xMzIiO30=',1503582424,''),(20,2,2,0,'ov6BEv7dCcjWfWqiFiThzQQWotzM','Miss^*^Ha','','e3SSms6M',1,1503621926,0,'YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib3Y2QkV2N2RDY2pXZldxaUZpVGh6UVFXb3R6TSI7czo4OiJuaWNrbmFtZSI7czo5OiJNaXNzXipeSGEiO3M6Mzoic2V4IjtpOjI7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IumAmuWMliI7czo4OiJwcm92aW5jZSI7czo2OiLlkInmnpciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTIwOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2FqTlZkcUhaTExDRVdpYUNuWmw3aWIxQm9RQXpGNWNSM2dpYzcwQzdsTVg2ZGlha1E4TzJJejd5QW5CNGdFWTN2cFJyUENvMldlTndoMHg2Mjl3Z2hFTGNuUS8xMzIiO3M6MTQ6InN1YnNjcmliZV90aW1lIjtpOjE1MDM2MjE5MjY7czo2OiJyZW1hcmsiO3M6MDoiIjtzOjc6Imdyb3VwaWQiO2k6MDtzOjEwOiJ0YWdpZF9saXN0IjthOjA6e31zOjY6ImF2YXRhciI7czoxMjA6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vYWpOVmRxSFpMTENFV2lhQ25abDdpYjFCb1FBekY1Y1IzZ2ljNzBDN2xNWDZkaWFrUThPMkl6N3lBbkI0Z0VZM3ZwUnJQQ28yV2VOd2gweDYyOXdnaEVMY25RLzEzMiI7fQ==',1503621934,''),(21,2,2,0,'ov6BEv5UQ1QSXHXBMZklTVCM3yZs','榴莲口香糖','','Pwj64YK4',1,1503626886,0,'YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib3Y2QkV2NVVRMVFTWEhYQk1aa2xUVkNNM3lacyI7czo4OiJuaWNrbmFtZSI7czoxNToi5qa06I6y5Y+j6aaZ57OWIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLlm5vlubMiO3M6ODoicHJvdmluY2UiO3M6Njoi5ZCJ5p6XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjExNjoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9hak5WZHFIWkxMQTRQZjIxYm5Xc3VRcGRQTFpVWXN3cXV6RTFXOHpxVUZ4WVF4SUhEUUNWWDlZMTl0VnJ6UVdDUEF0ZkRDVFBkZEVGVUd4Z2UxRnY5QS8xMzIiO3M6MTQ6InN1YnNjcmliZV90aW1lIjtpOjE1MDM2MjY4ODY7czo2OiJyZW1hcmsiO3M6MDoiIjtzOjc6Imdyb3VwaWQiO2k6MDtzOjEwOiJ0YWdpZF9saXN0IjthOjA6e31zOjY6ImF2YXRhciI7czoxMTY6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vYWpOVmRxSFpMTEE0UGYyMWJuV3N1UXBkUExaVVlzd3F1ekUxVzh6cVVGeFlReElIRFFDVlg5WTE5dFZyelFXQ1BBdGZEQ1RQZGRFRlVHeGdlMUZ2OUEvMTMyIjt9',1503626920,''),(22,2,2,0,'ov6BEv7LUy2s68PKQWTu6rmrCCU8','小可爱','','VYad4PPj',1,1503662100,0,'YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib3Y2QkV2N0xVeTJzNjhQS1FXVHU2cm1yQ0NVOCI7czo4OiJuaWNrbmFtZSI7czo5OiLlsI/lj6/niLEiO3M6Mzoic2V4IjtpOjI7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IuWbm+W5syI7czo4OiJwcm92aW5jZSI7czo2OiLlkInmnpciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTI4OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL1ZDRk9oVzdMQWRGZGliVmxjQ3hzTWhLbEQwSkN1aldLczBXNXV4cnY5cDY3ckxyWFBpYmR1ZWRRckE1d3VXNzRSMlBHWjFyRkdEVFRXRHBqWjlsQlhvQWN4TmZ4bDhwbmVELzEzMiI7czoxNDoic3Vic2NyaWJlX3RpbWUiO2k6MTUwMzY2MjEwMDtzOjY6InJlbWFyayI7czowOiIiO3M6NzoiZ3JvdXBpZCI7aTowO3M6MTA6InRhZ2lkX2xpc3QiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEyODoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9WQ0ZPaFc3TEFkRmRpYlZsY0N4c01oS2xEMEpDdWpXS3MwVzV1eHJ2OXA2N3JMclhQaWJkdWVkUXJBNXd1Vzc0UjJQR1oxckZHRFRUV0Rwalo5bEJYb0FjeE5meGw4cG5lRC8xMzIiO30=',1503662106,''),(23,2,2,0,'ov6BEv8pRZCnfD2WU5ev6AV29M4g','107组义工春艳 当智','','VWxl8Wxf',1,1503700341,0,'YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib3Y2QkV2OHBSWkNuZkQyV1U1ZXY2QVYyOU00ZyI7czo4OiJuaWNrbmFtZSI7czozMToiMTA357uE5LmJ5bel7oCi5pil6ImzIO6QneW9k+aZuiI7czozOiJzZXgiO2k6MjtzOjg6Imxhbmd1YWdlIjtzOjU6InpoX0NOIjtzOjQ6ImNpdHkiO3M6Njoi5Zub5bmzIjtzOjg6InByb3ZpbmNlIjtzOjY6IuWQieaelyI7czo3OiJjb3VudHJ5IjtzOjY6IuS4reWbvSI7czoxMDoiaGVhZGltZ3VybCI7czoxMjE6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vUTNhdUhnend6TTdHc2tBRERMYnY0Q1JQQnE2WTI1OGlheFloU2NPZjQ2RnNpYkIwUDdhcDJqVk1UeWhUYlF2RGJNNEx3RkRpY29TMWljNUFwMmN4a1FQT2liUS8xMzIiO3M6MTQ6InN1YnNjcmliZV90aW1lIjtpOjE1MDM3MDAzNDE7czo2OiJyZW1hcmsiO3M6MDoiIjtzOjc6Imdyb3VwaWQiO2k6MDtzOjEwOiJ0YWdpZF9saXN0IjthOjA6e31zOjY6ImF2YXRhciI7czoxMjE6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vUTNhdUhnend6TTdHc2tBRERMYnY0Q1JQQnE2WTI1OGlheFloU2NPZjQ2RnNpYkIwUDdhcDJqVk1UeWhUYlF2RGJNNEx3RkRpY29TMWljNUFwMmN4a1FQT2liUS8xMzIiO30=',1503700442,''),(24,2,2,0,'ov6BEv77-KFLon2l1eGR1u5ZbRI4','莞尔','','cVh3oUw4',1,1504043306,0,'YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib3Y2QkV2NzctS0ZMb24ybDFlR1IxdTVaYlJJNCI7czo4OiJuaWNrbmFtZSI7czo2OiLojp7lsJQiO3M6Mzoic2V4IjtpOjE7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IuWbm+W5syI7czo4OiJwcm92aW5jZSI7czo2OiLlkInmnpciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTI5OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL0pWREVDbk5qZWRFc0VKZ0VuSVlia1FOYXVuVndKd1psb3pyMVc2cUM2OTl0MEdoZmhSRnZ2d2lhNnkwVnJ0NUlNZTJQQndhRjQ0bFQ3enNPYW8waEc0aWNxckdHRDVKbGliNy8xMzIiO3M6MTQ6InN1YnNjcmliZV90aW1lIjtpOjE1MDQwNDMzMDY7czo2OiJyZW1hcmsiO3M6MDoiIjtzOjc6Imdyb3VwaWQiO2k6MDtzOjEwOiJ0YWdpZF9saXN0IjthOjA6e31zOjY6ImF2YXRhciI7czoxMjk6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vSlZERUNuTmplZEVzRUpnRW5JWWJrUU5hdW5Wd0p3WmxvenIxVzZxQzY5OXQwR2hmaFJGdnZ3aWE2eTBWcnQ1SU1lMlBCd2FGNDRsVDd6c09hbzBoRzRpY3FyR0dENUpsaWI3LzEzMiI7fQ==',1504043650,'');

/*Table structure for table `ims_mc_mapping_ucenter` */

DROP TABLE IF EXISTS `ims_mc_mapping_ucenter`;

CREATE TABLE `ims_mc_mapping_ucenter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `centeruid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_mc_mapping_ucenter` */

/*Table structure for table `ims_mc_mass_record` */

DROP TABLE IF EXISTS `ims_mc_mass_record`;

CREATE TABLE `ims_mc_mass_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `groupname` varchar(50) NOT NULL,
  `fansnum` int(10) unsigned NOT NULL,
  `msgtype` varchar(10) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `group` int(10) NOT NULL,
  `attach_id` int(10) unsigned NOT NULL,
  `media_id` varchar(100) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `cron_id` int(10) unsigned NOT NULL,
  `sendtime` int(10) unsigned NOT NULL,
  `finalsendtime` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_mc_mass_record` */

/*Table structure for table `ims_mc_member_address` */

DROP TABLE IF EXISTS `ims_mc_member_address`;

CREATE TABLE `ims_mc_member_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(50) unsigned NOT NULL,
  `username` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `province` varchar(32) NOT NULL,
  `city` varchar(32) NOT NULL,
  `district` varchar(32) NOT NULL,
  `address` varchar(512) NOT NULL,
  `isdefault` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uinacid` (`uniacid`),
  KEY `idx_uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_mc_member_address` */

/*Table structure for table `ims_mc_member_fields` */

DROP TABLE IF EXISTS `ims_mc_member_fields`;

CREATE TABLE `ims_mc_member_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `fieldid` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `displayorder` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_fieldid` (`fieldid`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `ims_mc_member_fields` */

insert  into `ims_mc_member_fields`(`id`,`uniacid`,`fieldid`,`title`,`available`,`displayorder`) values (1,2,1,'真实姓名',1,0),(2,2,2,'昵称',1,1),(3,2,3,'头像',1,1),(4,2,4,'QQ号',1,0),(5,2,5,'手机号码',1,0),(6,2,6,'VIP级别',1,0),(7,2,7,'性别',1,0),(8,2,8,'出生生日',1,0),(9,2,9,'星座',1,0),(10,2,10,'生肖',1,0),(11,2,11,'固定电话',1,0),(12,2,12,'证件号码',1,0),(13,2,13,'学号',1,0),(14,2,14,'班级',1,0),(15,2,15,'邮寄地址',1,0),(16,2,16,'邮编',1,0),(17,2,17,'国籍',1,0),(18,2,18,'居住地址',1,0),(19,2,19,'毕业学校',1,0),(20,2,20,'公司',1,0),(21,2,21,'学历',1,0),(22,2,22,'职业',1,0),(23,2,23,'职位',1,0),(24,2,24,'年收入',1,0),(25,2,25,'情感状态',1,0),(26,2,26,' 交友目的',1,0),(27,2,27,'血型',1,0),(28,2,28,'身高',1,0),(29,2,29,'体重',1,0),(30,2,30,'支付宝帐号',1,0),(31,2,31,'MSN',1,0),(32,2,32,'电子邮箱',1,0),(33,2,33,'阿里旺旺',1,0),(34,2,34,'主页',1,0),(35,2,35,'自我介绍',1,0),(36,2,36,'兴趣爱好',1,0);

/*Table structure for table `ims_mc_members` */

DROP TABLE IF EXISTS `ims_mc_members`;

CREATE TABLE `ims_mc_members` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `salt` varchar(8) NOT NULL,
  `groupid` int(11) NOT NULL,
  `credit1` decimal(10,2) unsigned NOT NULL,
  `credit2` decimal(10,2) unsigned NOT NULL,
  `credit3` decimal(10,2) unsigned NOT NULL,
  `credit4` decimal(10,2) unsigned NOT NULL,
  `credit5` decimal(10,2) unsigned NOT NULL,
  `credit6` decimal(10,2) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `realname` varchar(10) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `vip` tinyint(3) unsigned NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthyear` smallint(6) unsigned NOT NULL,
  `birthmonth` tinyint(3) unsigned NOT NULL,
  `birthday` tinyint(3) unsigned NOT NULL,
  `constellation` varchar(10) NOT NULL,
  `zodiac` varchar(5) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `idcard` varchar(30) NOT NULL,
  `studentid` varchar(50) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `resideprovince` varchar(30) NOT NULL,
  `residecity` varchar(30) NOT NULL,
  `residedist` varchar(30) NOT NULL,
  `graduateschool` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `education` varchar(10) NOT NULL,
  `occupation` varchar(30) NOT NULL,
  `position` varchar(30) NOT NULL,
  `revenue` varchar(10) NOT NULL,
  `affectivestatus` varchar(30) NOT NULL,
  `lookingfor` varchar(255) NOT NULL,
  `bloodtype` varchar(5) NOT NULL,
  `height` varchar(5) NOT NULL,
  `weight` varchar(5) NOT NULL,
  `alipay` varchar(30) NOT NULL,
  `msn` varchar(30) NOT NULL,
  `taobao` varchar(30) NOT NULL,
  `site` varchar(30) NOT NULL,
  `bio` text NOT NULL,
  `interest` text NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `groupid` (`groupid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `ims_mc_members` */

insert  into `ims_mc_members`(`uid`,`uniacid`,`mobile`,`email`,`password`,`salt`,`groupid`,`credit1`,`credit2`,`credit3`,`credit4`,`credit5`,`credit6`,`createtime`,`realname`,`nickname`,`avatar`,`qq`,`vip`,`gender`,`birthyear`,`birthmonth`,`birthday`,`constellation`,`zodiac`,`telephone`,`idcard`,`studentid`,`grade`,`address`,`zipcode`,`nationality`,`resideprovince`,`residecity`,`residedist`,`graduateschool`,`company`,`education`,`occupation`,`position`,`revenue`,`affectivestatus`,`lookingfor`,`bloodtype`,`height`,`weight`,`alipay`,`msn`,`taobao`,`site`,`bio`,`interest`) values (1,2,'','194603b4a63cd745b3b413022668b97e@we7.cc','2617608a200af932d7f362542dbcc1d2','UyMCZGHh',2,'0.00','0.00','0.00','0.00','0.00','0.00',1503575262,'','qqq','http://wx.qlogo.cn/mmopen/f3VLWzzLE2icE7xe4PzksXdelGhoN6ZbWF0iaIH6YO20MSyibOgcVhIa1HUp4AW5duZ0Y9evAfMictR0icdGsue15D8fbjdJZGkL1/132','',0,1,0,0,0,'','','','','','','','','中国','吉林省','长春市','','','','','','','','','','','','','','','','','',''),(12,2,'18604441933','','1c567d52ac69479f8b10b7bd22c9aab0','mv6v9cHk',2,'0.00','0.00','0.00','0.00','0.00','0.00',1502950134,'长春','百熙','http://wx.qlogo.cn/mmopen/PiajxSqBRaEI8Qc0ukicEia9dzl6bZf7NUwswrXnKdAibcccVD7SHJ1HfDSriaxLicH95rHhqMXU1rdAl1TvxjrzF6yg/132132','',0,1,1960,8,17,'','','','','','','','','中国','北京','北京市','东城区','','','','','','','','','','','','','','','','',''),(3,2,'','512bd40d345a0fae6694bb97d7cb12c2@we7.cc','b3f7f7c03a770f65111c29d22223db2a','kn04iTiI',2,'0.00','0.00','0.00','0.00','0.00','0.00',1502326369,'','','http://wx.qlogo.cn/mmopen/VCFOhW7LAdHzacMjfpia8s8xqazPqian6Yia5TRiadkhcqibHVwibLXAGGGJ5LlAN3AwG1hicqviaibBZhAyFUZKQkbL6ZARbhb3Zl7wn/132','',0,0,0,0,0,'','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(13,2,'17843150577','','e50a8920b23fc1b5b0bae9b71e89f9e7','cB5GK3Kt',2,'0.00','0.00','0.00','0.00','0.00','0.00',1503285797,'dancheng','','http://wx.qlogo.cn/mmopen/VCFOhW7LAdHzacMjfpia8s8xqazPqian6Yia5TRiadkhcqibHVwibLXAGGGJ5LlAN3AwG1hicqviaibBZhAyFUZKQkbL6ZARbhb3Zl7wn/132','',0,1,0,0,0,'','','','','','','','','中国','吉林省','白城市','','','','','','','','','','','','','','','','','',''),(5,2,'','adc9969806ff5a39871efa218019fe9d@we7.cc','2617608a200af932d7f362542dbcc1d2','L0TBZ0Hk',2,'0.00','0.00','0.00','0.00','0.00','0.00',1502518793,'','','http://wx.qlogo.cn/mmopen/VCFOhW7LAdHzacMjfpia8s8xqazPqian6Yia5TRiadkhcqibHVwibLXAGGGJ5LlAN3AwG1hicqviaibBZhAyFUZKQkbL6ZARbhb3Zl7wn/132','',0,1,0,0,0,'','','','','','','','','中国','吉林省','四平市','','','','','','','','','','','','','','','','','',''),(6,2,'','3dac3657fc67167c45ed01547db22f67@we7.cc','2617608a200af932d7f362542dbcc1d2','TOCsCSQR',2,'0.00','0.00','0.00','0.00','0.00','0.00',1502690431,'','曲小冷','http://wx.qlogo.cn/mmopen/Q3auHgzwzM6ShPNyibFVtfhShD4EZpib8iaEp9ciaosuSYlGickPRfSiaNicoee9JHtA9HlRX6CXgZLAUaAnaEABw5jfmib1ATyR1HJrxIs15e6Xs34/132','',0,2,0,0,0,'','','','','','','','','中国','吉林省','长春市','','','','','','','','','','','','','','','','','',''),(7,2,'','6e444425f2a3f4851f9d3f04dd26c989@we7.cc','2617608a200af932d7f362542dbcc1d2','gJ5pWWAA',2,'0.00','0.00','0.00','0.00','0.00','0.00',1502698512,'','gidviper','http://wx.qlogo.cn/mmopen/VCFOhW7LAdFdibVlcCxsMhL4ick7mY9G83Ks9KxE3CLlWlSiaJf5FpBdIAX9Jia3NejicvnicyS5KuvokzOKWxV4ib9PDenxXXOVnqF/132','',0,1,0,0,0,'','','','','','','','','中国','吉林省','长春市','','','','','','','','','','','','','','','','','',''),(8,2,'','d33c4d89a55633b497fa8c9bbc9aba09@we7.cc','2617608a200af932d7f362542dbcc1d2','H1N4RpN9',2,'0.00','0.00','0.00','0.00','0.00','0.00',1502698520,'','·。吐泡泡的小鱼','http://wx.qlogo.cn/mmopen/VCFOhW7LAdHzacMjfpia8swr2s8m4iaVNuMVZFgUjCmibcQ5ibVMUVpYtsbGPp6ianHWibIm6uZib9xEEnbRH4jv6xnICDjpbXdzRqr/132','',0,2,0,0,0,'','','','','','','','','哥伦比亚','省','市','','','','','','','','','','','','','','','','','',''),(9,2,'','8a9453f9278815b3d38c1d1667a1d11e@we7.cc','2617608a200af932d7f362542dbcc1d2','M411hh3H',2,'0.00','0.00','0.00','0.00','0.00','0.00',1502698637,'','卖花何胖胖～','http://wx.qlogo.cn/mmopen/elS90Jsrd2HLYoyPoYAUOvxWIvexuo6dsX9M1hxonfUrMlLhDX36ibQBhxBQWsic4B4EyHECVjQU0ClexsgTCBWAem8GArJSdX/132','',0,2,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','',''),(10,2,'','7c32f7cc35db128c71d2ec1fb32da4fa@we7.cc','2617608a200af932d7f362542dbcc1d2','KqG92F2i',2,'0.00','0.00','0.00','0.00','0.00','0.00',1502699122,'','','http://wx.qlogo.cn/mmopen/VCFOhW7LAdFdibVlcCxsMhBKu2YZkQKbquqX7LrohUlJeZUicBCicNnzZIzCnyOuzEqdGThzibJAlKJ5GlxCSgMy4SEvlP0HANHM/132','',0,2,0,0,0,'','','','','','','','','中国','吉林省','长春市','','','','','','','','','','','','','','','','','',''),(11,2,'','6386f21e2a04f8208b000cf53460600e@we7.cc','2617608a200af932d7f362542dbcc1d2','Frz0Pk6N',2,'0.00','0.00','0.00','0.00','0.00','0.00',1502707065,'','chengcong','http://wx.qlogo.cn/mmopen/f3VLWzzLE2ibYIyPDslgDMObQluCc63f6JxNxgFKw9kuqiaictmJ8J9Oo5mxHiaYibayicib5RlvOfXt15NsdiajfID0K9J4dQOvyCEN/132','',0,1,0,0,0,'','','','','','','','','中国','吉林省','长春市','','','','','','','','','','','','','','','','','',''),(14,2,'13159746106','','66957074c543cfb9c0a3654d50bfaabf','bSFoeFrE',2,'0.00','0.00','0.00','0.00','0.00','0.00',1504160714,'','TSWH','132','',0,1,0,0,0,'','','','','','','','','中国','吉林省','长春市','','','','','','','','','','','','','','','','','','');

/*Table structure for table `ims_mc_oauth_fans` */

DROP TABLE IF EXISTS `ims_mc_oauth_fans`;

CREATE TABLE `ims_mc_oauth_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oauth_openid` varchar(50) NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_oauthopenid_acid` (`oauth_openid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_mc_oauth_fans` */

/*Table structure for table `ims_menu_event` */

DROP TABLE IF EXISTS `ims_menu_event`;

CREATE TABLE `ims_menu_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `keyword` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `picmd5` varchar(32) NOT NULL,
  `openid` varchar(128) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `picmd5` (`picmd5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_menu_event` */

/*Table structure for table `ims_mobilenumber` */

DROP TABLE IF EXISTS `ims_mobilenumber`;

CREATE TABLE `ims_mobilenumber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  `dateline` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_mobilenumber` */

/*Table structure for table `ims_modules` */

DROP TABLE IF EXISTS `ims_modules`;

CREATE TABLE `ims_modules` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `version` varchar(10) NOT NULL,
  `ability` varchar(500) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `author` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `settings` tinyint(1) NOT NULL,
  `subscribes` varchar(500) NOT NULL,
  `handles` varchar(500) NOT NULL,
  `isrulefields` tinyint(1) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL,
  `target` int(10) unsigned NOT NULL,
  `iscard` tinyint(3) unsigned NOT NULL,
  `permissions` varchar(5000) NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `idx_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `ims_modules` */

insert  into `ims_modules`(`mid`,`name`,`type`,`title`,`version`,`ability`,`description`,`author`,`url`,`settings`,`subscribes`,`handles`,`isrulefields`,`issystem`,`target`,`iscard`,`permissions`) values (1,'basic','system','基本文字回复','1.0','和您进行简单对话','一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的回复内容.','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,''),(2,'news','system','基本混合图文回复','1.0','为你提供生动的图文资讯','一问一答得简单对话, 但是回复内容包括图片文字等更生动的媒体内容. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的图文回复内容.','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,''),(3,'music','system','基本音乐回复','1.0','提供语音、音乐等音频类回复','在回复规则中可选择具有语音、音乐等音频类的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝，实现一问一答得简单对话。','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,''),(4,'userapi','system','自定义接口回复','1.1','更方便的第三方接口设置','自定义接口又称第三方接口，可以让开发者更方便的接入微擎系统，高效的与微信公众平台进行对接整合。','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,''),(5,'recharge','system','会员中心充值模块','1.0','提供会员充值功能','','WeEngine Team','http://www.we7.cc/',0,'','',0,1,0,0,''),(6,'custom','system','多客服转接','1.0.0','用来接入腾讯的多客服系统','','WeEngine Team','http://bbs.we7.cc',0,'a:0:{}','a:6:{i:0;s:5:\"image\";i:1;s:5:\"voice\";i:2;s:5:\"video\";i:3;s:8:\"location\";i:4;s:4:\"link\";i:5;s:4:\"text\";}',1,1,0,0,''),(7,'images','system','基本图片回复','1.0','提供图片回复','在回复规则中可选择具有图片的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝图片。','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,''),(8,'video','system','基本视频回复','1.0','提供图片回复','在回复规则中可选择具有视频的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝视频。','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,''),(9,'voice','system','基本语音回复','1.0','提供语音回复','在回复规则中可选择具有语音的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝语音。','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,''),(10,'chats','system','发送客服消息','1.0','公众号可以在粉丝最后发送消息的48小时内无限制发送消息','','WeEngine Team','http://www.we7.cc/',0,'','',0,1,0,0,''),(11,'wxcard','system','微信卡券回复','1.0','微信卡券回复','微信卡券回复','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,''),(12,'paycenter','system','收银台','1.0','收银台','收银台','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,'');

/*Table structure for table `ims_modules_bindings` */

DROP TABLE IF EXISTS `ims_modules_bindings`;

CREATE TABLE `ims_modules_bindings` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(30) NOT NULL,
  `entry` varchar(10) NOT NULL,
  `call` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `do` varchar(30) NOT NULL,
  `state` varchar(200) NOT NULL,
  `direct` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `displayorder` tinyint(255) unsigned NOT NULL,
  PRIMARY KEY (`eid`),
  KEY `idx_module` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_modules_bindings` */

/*Table structure for table `ims_modules_recycle` */

DROP TABLE IF EXISTS `ims_modules_recycle`;

CREATE TABLE `ims_modules_recycle` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `modulename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `modulename` (`modulename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_modules_recycle` */

/*Table structure for table `ims_music_reply` */

DROP TABLE IF EXISTS `ims_music_reply`;

CREATE TABLE `ims_music_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `url` varchar(300) NOT NULL,
  `hqurl` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_music_reply` */

/*Table structure for table `ims_news_reply` */

DROP TABLE IF EXISTS `ims_news_reply`;

CREATE TABLE `ims_news_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `parent_id` int(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `url` varchar(255) NOT NULL,
  `displayorder` int(10) NOT NULL,
  `incontent` tinyint(1) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `ims_news_reply` */

insert  into `ims_news_reply`(`id`,`rid`,`parent_id`,`title`,`author`,`description`,`thumb`,`content`,`url`,`displayorder`,`incontent`,`createtime`) values (1,11,0,'医院简介','','医院简介','','','./index.php?i=2&c=site&a=site&do=detail&id=1',0,0,0),(2,12,0,'文化精神','','文化精神','','','./index.php?i=2&c=site&a=site&do=detail&id=2',0,0,0),(3,13,0,'交通信息','','交通信息','','','./index.php?i=2&c=site&a=site&do=detail&id=3',0,0,0),(4,14,0,'医学资料医学资料','','','','','./index.php?i=2&c=site&a=site&do=detail&id=4',0,0,0),(5,15,0,'就医百科就医百科','','','','','./index.php?i=2&c=site&a=site&do=detail&id=5',0,0,0),(6,18,0,'就医百科1','','','','','./index.php?i=2&c=site&a=site&do=detail&id=6',0,0,0),(7,19,0,'就医百科2','','','','','./index.php?i=2&c=site&a=site&do=detail&id=7',0,0,0),(8,20,0,'就医百科3','','','','','./index.php?i=2&c=site&a=site&do=detail&id=8',0,0,0),(9,21,0,'就医百科4','','','','','./index.php?i=2&c=site&a=site&do=detail&id=9',0,0,0),(10,22,0,'就医百科5','','','','','./index.php?i=2&c=site&a=site&do=detail&id=10',0,0,0),(11,23,0,'医学资料1','','','','','./index.php?i=2&c=site&a=site&do=detail&id=11',0,0,0),(12,24,0,'医学资料2','','','','','./index.php?i=2&c=site&a=site&do=detail&id=12',0,0,0),(13,25,0,'医学资料3','','','','','./index.php?i=2&c=site&a=site&do=detail&id=13',0,0,0),(14,26,0,'医学资料4','','','','','./index.php?i=2&c=site&a=site&do=detail&id=14',0,0,0),(15,27,0,'医学资料5','','','','','./index.php?i=2&c=site&a=site&do=detail&id=15',0,0,0),(16,28,0,'就医百科6','','','','','./index.php?i=2&c=site&a=site&do=detail&id=16',0,0,0),(17,29,0,'就医百科7','','','','','./index.php?i=2&c=site&a=site&do=detail&id=17',0,0,0),(18,30,0,'就医百科8','','','','','./index.php?i=2&c=site&a=site&do=detail&id=18',0,0,0),(19,31,0,'就医百科9','','','','','./index.php?i=2&c=site&a=site&do=detail&id=19',0,0,0),(20,32,0,'就医百科10','','','','','./index.php?i=2&c=site&a=site&do=detail&id=20',0,0,0),(21,33,0,'就医百科11','','','','','./index.php?i=2&c=site&a=site&do=detail&id=21',0,0,0);

/*Table structure for table `ims_paycenter_order` */

DROP TABLE IF EXISTS `ims_paycenter_order`;

CREATE TABLE `ims_paycenter_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `uniontid` varchar(40) NOT NULL,
  `transaction_id` varchar(40) NOT NULL,
  `type` varchar(10) NOT NULL,
  `trade_type` varchar(10) NOT NULL,
  `body` varchar(255) NOT NULL,
  `fee` varchar(15) NOT NULL,
  `final_fee` decimal(10,2) unsigned NOT NULL,
  `credit1` int(10) unsigned NOT NULL,
  `credit1_fee` decimal(10,2) unsigned NOT NULL,
  `credit2` decimal(10,2) unsigned NOT NULL,
  `cash` decimal(10,2) unsigned NOT NULL,
  `remark` varchar(255) NOT NULL,
  `auth_code` varchar(30) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `follow` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `credit_status` tinyint(3) unsigned NOT NULL,
  `paytime` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_paycenter_order` */

/*Table structure for table `ims_profile_fields` */

DROP TABLE IF EXISTS `ims_profile_fields`;

CREATE TABLE `ims_profile_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `displayorder` smallint(6) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `unchangeable` tinyint(1) NOT NULL,
  `showinregister` tinyint(1) NOT NULL,
  `field_length` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `ims_profile_fields` */

insert  into `ims_profile_fields`(`id`,`field`,`available`,`title`,`description`,`displayorder`,`required`,`unchangeable`,`showinregister`,`field_length`) values (1,'realname',1,'真实姓名','',0,1,1,1,0),(2,'nickname',1,'昵称','',1,1,0,1,0),(3,'avatar',1,'头像','',1,0,0,0,0),(4,'qq',1,'QQ号','',0,0,0,1,0),(5,'mobile',1,'手机号码','',0,0,0,0,0),(6,'vip',1,'VIP级别','',0,0,0,0,0),(7,'gender',1,'性别','',0,0,0,0,0),(8,'birthyear',1,'出生生日','',0,0,0,0,0),(9,'constellation',1,'星座','',0,0,0,0,0),(10,'zodiac',1,'生肖','',0,0,0,0,0),(11,'telephone',1,'固定电话','',0,0,0,0,0),(12,'idcard',1,'证件号码','',0,0,0,0,0),(13,'studentid',1,'学号','',0,0,0,0,0),(14,'grade',1,'班级','',0,0,0,0,0),(15,'address',1,'邮寄地址','',0,0,0,0,0),(16,'zipcode',1,'邮编','',0,0,0,0,0),(17,'nationality',1,'国籍','',0,0,0,0,0),(18,'resideprovince',1,'居住地址','',0,0,0,0,0),(19,'graduateschool',1,'毕业学校','',0,0,0,0,0),(20,'company',1,'公司','',0,0,0,0,0),(21,'education',1,'学历','',0,0,0,0,0),(22,'occupation',1,'职业','',0,0,0,0,0),(23,'position',1,'职位','',0,0,0,0,0),(24,'revenue',1,'年收入','',0,0,0,0,0),(25,'affectivestatus',1,'情感状态','',0,0,0,0,0),(26,'lookingfor',1,' 交友目的','',0,0,0,0,0),(27,'bloodtype',1,'血型','',0,0,0,0,0),(28,'height',1,'身高','',0,0,0,0,0),(29,'weight',1,'体重','',0,0,0,0,0),(30,'alipay',1,'支付宝帐号','',0,0,0,0,0),(31,'msn',1,'MSN','',0,0,0,0,0),(32,'email',1,'电子邮箱','',0,0,0,0,0),(33,'taobao',1,'阿里旺旺','',0,0,0,0,0),(34,'site',1,'主页','',0,0,0,0,0),(35,'bio',1,'自我介绍','',0,0,0,0,0),(36,'interest',1,'兴趣爱好','',0,0,0,0,0);

/*Table structure for table `ims_qrcode` */

DROP TABLE IF EXISTS `ims_qrcode`;

CREATE TABLE `ims_qrcode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `extra` int(10) unsigned NOT NULL,
  `qrcid` bigint(20) NOT NULL,
  `scene_str` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `model` tinyint(1) unsigned NOT NULL,
  `ticket` varchar(250) NOT NULL,
  `url` varchar(256) NOT NULL,
  `expire` int(10) unsigned NOT NULL,
  `subnum` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_qrcid` (`qrcid`),
  KEY `uniacid` (`uniacid`),
  KEY `ticket` (`ticket`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `ims_qrcode` */

insert  into `ims_qrcode`(`id`,`uniacid`,`acid`,`type`,`extra`,`qrcid`,`scene_str`,`name`,`keyword`,`model`,`ticket`,`url`,`expire`,`subnum`,`createtime`,`status`) values (1,2,2,'scene',0,100001,'',' 二维码',' 二维码',1,'gQG38DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyV2hLZkU1X3c5NF8xSWNZVjFwMW4AAgQMb5JZAwQAjScA','http://weixin.qq.com/q/02WhKfE5_w94_1IcYV1p1n',2592000,0,1502768908,1);

/*Table structure for table `ims_qrcode_stat` */

DROP TABLE IF EXISTS `ims_qrcode_stat`;

CREATE TABLE `ims_qrcode_stat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `qid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `qrcid` bigint(20) unsigned NOT NULL,
  `scene_str` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_qrcode_stat` */

/*Table structure for table `ims_reserve_registration` */

DROP TABLE IF EXISTS `ims_reserve_registration`;

CREATE TABLE `ims_reserve_registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(765) DEFAULT NULL,
  `phone` varchar(765) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `order_doctorId` int(11) DEFAULT NULL,
  `order_date` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `ims_reserve_registration` */

insert  into `ims_reserve_registration`(`id`,`name`,`phone`,`userId`,`order_doctorId`,`order_date`) values (10,'给你','是',1,1,'08-18'),(19,'曲莹','11111111111',2,1,'08-24'),(20,'让我','11111111111',2,1,'08-24'),(21,'让我','11111111111',3,1,'08-24'),(26,'甲方','14798154829',13,2,'08-24'),(27,'后面','13543646837',13,1,'08-28'),(28,'婆婆嘴','13574649431',13,1,'08-28'),(29,'我','13911223344',1,1,'08-28'),(30,'测试','13155255565',0,2,'09-01'),(31,'测试','1555246488',0,2,'09-01'),(32,'测试','13164918491',0,2,'09-01');

/*Table structure for table `ims_rule` */

DROP TABLE IF EXISTS `ims_rule`;

CREATE TABLE `ims_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `displayorder` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `ims_rule` */

insert  into `ims_rule`(`id`,`uniacid`,`name`,`module`,`displayorder`,`status`) values (1,0,'城市天气','userapi',255,1),(2,0,'百度百科','userapi',255,1),(3,0,'即时翻译','userapi',255,1),(4,0,'今日老黄历','userapi',255,1),(5,0,'看新闻','userapi',255,1),(6,0,'快递查询','userapi',255,1),(7,1,'个人中心入口设置','cover',0,1),(8,1,'微擎团队入口设置','cover',0,1),(9,2,'公主岭市妇幼保健院','cover',0,1),(10,2,'医院简介','cover',0,1),(11,2,'文章：医院简介 触发规则','news',0,1),(12,2,'文章：文化精神 触发规则','news',0,1),(13,2,'文章：交通信息 触发规则','news',0,1),(14,2,'文章：医学资料医学资料 触发规则','news',0,1),(15,2,'文章：就医百科就医百科 触发规则','news',0,1),(16,2,'111','basic',0,1),(17,2,'呜呜呜呜无无无','custom',0,1),(18,2,'文章：就医百科1 触发规则','news',0,1),(19,2,'文章：就医百科2 触发规则','news',0,1),(20,2,'文章：就医百科3 触发规则','news',0,1),(21,2,'文章：就医百科4 触发规则','news',0,1),(22,2,'文章：就医百科5 触发规则','news',0,1),(23,2,'文章：医学资料1 触发规则','news',0,1),(24,2,'文章：医学资料2 触发规则','news',0,1),(25,2,'文章：医学资料3 触发规则','news',0,1),(26,2,'文章：医学资料4 触发规则','news',0,1),(27,2,'文章：医学资料5 触发规则','news',0,1),(28,2,'文章：就医百科6 触发规则','news',0,1),(29,2,'文章：就医百科7 触发规则','news',0,1),(30,2,'文章：就医百科8 触发规则','news',0,1),(31,2,'文章：就医百科9 触发规则','news',0,1),(32,2,'文章：就医百科10 触发规则','news',0,1),(33,2,'文章：就医百科11 触发规则','news',0,1);

/*Table structure for table `ims_rule_keyword` */

DROP TABLE IF EXISTS `ims_rule_keyword`;

CREATE TABLE `ims_rule_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `content` varchar(255) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_content` (`content`),
  KEY `idx_rid` (`rid`),
  KEY `idx_uniacid_type_content` (`uniacid`,`type`,`content`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

/*Data for the table `ims_rule_keyword` */

insert  into `ims_rule_keyword`(`id`,`rid`,`uniacid`,`module`,`content`,`type`,`displayorder`,`status`) values (1,1,0,'userapi','^.+天气$',3,255,1),(2,2,0,'userapi','^百科.+$',3,255,1),(3,2,0,'userapi','^定义.+$',3,255,1),(4,3,0,'userapi','^@.+$',3,255,1),(5,4,0,'userapi','日历',1,255,1),(6,4,0,'userapi','万年历',1,255,1),(7,4,0,'userapi','黄历',1,255,1),(8,4,0,'userapi','几号',1,255,1),(9,5,0,'userapi','新闻',1,255,1),(10,6,0,'userapi','^(申通|圆通|中通|汇通|韵达|顺丰|EMS) *[a-z0-9]{1,}$',3,255,1),(11,7,1,'cover','个人中心',1,0,1),(12,8,1,'cover','首页',1,0,1),(13,9,2,'cover','简介',1,0,1),(14,10,2,'cover','医院简介',1,0,1),(15,11,2,'news','医院简介',1,1,1),(16,12,2,'news','文化精神',1,1,1),(17,13,2,'news','交通信息',1,1,1),(18,14,2,'news','医学资料',1,1,1),(19,15,2,'news','就医百科',1,1,1),(21,16,2,'basic','111',1,0,1),(22,17,2,'custom','www',1,0,1),(23,18,2,'news','就医百科1',1,1,1),(24,19,2,'news','就医百科2',1,1,1),(25,20,2,'news','就医百科3',1,1,1),(26,21,2,'news','就医百科4',1,1,1),(27,22,2,'news','就医百科5',1,1,1),(28,23,2,'news','医学资料1',1,1,1),(29,24,2,'news','医学资料2',1,1,1),(30,25,2,'news','医学资料3',1,1,1),(31,26,2,'news','医学资料4',1,1,1),(32,27,2,'news','医学资料5',1,1,1),(33,28,2,'news','就医百科6',1,1,1),(34,29,2,'news','就医百科7',1,1,1),(35,30,2,'news','就医百科8',1,1,1),(36,31,2,'news','就医百科9',1,1,1),(37,32,2,'news','就医百科10',1,1,1),(38,33,2,'news','就医百科11',1,1,1);

/*Table structure for table `ims_section_office` */

DROP TABLE IF EXISTS `ims_section_office`;

CREATE TABLE `ims_section_office` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(2295) DEFAULT NULL,
  `intro` varchar(2295) DEFAULT NULL,
  `addr` varchar(2295) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `ims_section_office` */

insert  into `ims_section_office`(`id`,`name`,`intro`,`addr`) values (1,'心血管内科',NULL,'门诊6层神经内科诊区01诊室'),(2,'呼吸内科',NULL,'门诊6层神经内科诊区01诊室'),(3,'神经外科',NULL,'门诊6层神经内科诊区01诊室'),(4,'妇产科',NULL,'门诊6层神经内科诊区01诊室'),(5,'眼科',NULL,'门诊6层神经内科诊区01诊室'),(6,'口腔科',NULL,'门诊6层神经内科诊区01诊室');

/*Table structure for table `ims_site_article` */

DROP TABLE IF EXISTS `ims_site_article`;

CREATE TABLE `ims_site_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `iscommend` tinyint(1) NOT NULL,
  `ishot` tinyint(1) unsigned NOT NULL,
  `pcate` int(10) unsigned NOT NULL,
  `ccate` int(10) unsigned NOT NULL,
  `template` varchar(300) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `incontent` tinyint(1) NOT NULL,
  `source` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL,
  `displayorder` int(10) unsigned NOT NULL,
  `linkurl` varchar(500) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `credit` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_iscommend` (`iscommend`),
  KEY `idx_ishot` (`ishot`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `ims_site_article` */

insert  into `ims_site_article`(`id`,`uniacid`,`rid`,`kid`,`iscommend`,`ishot`,`pcate`,`ccate`,`template`,`title`,`description`,`content`,`thumb`,`incontent`,`source`,`author`,`displayorder`,`linkurl`,`createtime`,`click`,`type`,`credit`) values (1,2,11,0,0,0,0,0,'','医院简介','医院简介','<p><span style=\"font-size: medium; font-family: 宋体; line-height: 150%;\">医院现有职工1860多人，卫生技术人员占比90%以上。副高以上（含副高）职称268人，博士61人，硕士生导师26人，博士生导师11人。任职全国、全省学术机构专业委员会主委、副主委职务达160多人次，逐步形成了一支知识化、年轻化、专业化的高素质人力资源团队。2015年门、急诊量2013544人次，同比增长8.89%；住院量51638人次，同比增长2.55%；住院手术15680例，同比增长6.59%；分娩量12406例，同比增长10.82%。平均住院日6.72天，病床使用率86.81%。医院正积极适应发展新常态，紧抓发展机遇，从建筑装备硬件设施、技术人才软件环境、高精尖核心技术研发等方面打造全国一流省级妇幼保健院、省级儿童医院、省级妇产医院。</span></p><p><span style=\"font-size: medium; font-family: 宋体; line-height: 150%;\">&nbsp;&nbsp;&nbsp;&nbsp;近年来，医院先后荣获“全国卫生系统先进集体”、“全国妇幼卫生系统先进集体”、“广东省文明单位”、“广东省百家文明医院”、“广东省卫生系统行业作风建设先进集体”、“广东省妇幼卫生先进集体”、“广东省白求恩式先进集体”、“广东省文明窗口单位”、“广东省人民群众满意单位”、“广东省爱护儿童先进集体”、“广东省抗击非典嘉奖集体”、“全国维护妇女儿童权益先进集体”、“国信办政务新媒体优秀公众账号”、“国家卫计委妇幼健康服务先进集体”等荣誉称号，荣膺全国省级妇幼保健院综合实力前三名。</span></p><p><br/></p>','',0,'','',1,'',1502328295,19,'','a:4:{s:6:\"status\";i:0;s:5:\"limit\";i:0;s:5:\"share\";i:0;s:5:\"click\";i:0;}'),(2,2,12,0,0,0,0,0,'','文化精神','文化精神','<p>文化精神文化精神文化精神</p>','',0,'','',2,'',1502328988,59,'','a:4:{s:6:\"status\";i:0;s:5:\"limit\";i:0;s:5:\"share\";i:0;s:5:\"click\";i:0;}'),(3,2,13,0,0,0,0,0,'','交通信息','交通信息','<p>交通信息交通信息交通信息</p>','',0,'','',3,'',1502329021,20,'','a:4:{s:6:\"status\";i:0;s:5:\"limit\";i:0;s:5:\"share\";i:0;s:5:\"click\";i:0;}'),(4,2,14,0,0,0,1,0,'','医学资料医学资料','','','',0,'','',0,'',1502706354,13,'','a:4:{s:6:\"status\";i:0;s:5:\"limit\";i:0;s:5:\"share\";i:0;s:5:\"click\";i:0;}'),(5,2,15,0,0,0,2,0,'','就医百科就医百科','','','',0,'','',4,'',1502706412,9,'','a:4:{s:6:\"status\";i:0;s:5:\"limit\";i:0;s:5:\"share\";i:0;s:5:\"click\";i:0;}'),(6,2,18,0,0,0,2,0,'','就医百科1','','','',0,'','',0,'',1502864349,5,'','a:4:{s:6:\"status\";i:0;s:5:\"limit\";i:0;s:5:\"share\";i:0;s:5:\"click\";i:0;}'),(7,2,19,0,0,0,2,0,'','就医百科2','','','',0,'','',0,'',1502864462,1,'','a:4:{s:6:\"status\";i:0;s:5:\"limit\";i:0;s:5:\"share\";i:0;s:5:\"click\";i:0;}'),(8,2,20,0,0,0,2,0,'','就医百科3','','','',0,'','',0,'',1502864477,1,'','a:4:{s:6:\"status\";i:0;s:5:\"limit\";i:0;s:5:\"share\";i:0;s:5:\"click\";i:0;}'),(9,2,21,0,0,0,2,0,'','就医百科4','','','',0,'','',0,'',1502864500,0,'','a:4:{s:6:\"status\";i:0;s:5:\"limit\";i:0;s:5:\"share\";i:0;s:5:\"click\";i:0;}'),(10,2,22,0,0,0,2,0,'','就医百科5','','','',0,'','',0,'',1502864558,0,'','a:4:{s:6:\"status\";i:0;s:5:\"limit\";i:0;s:5:\"share\";i:0;s:5:\"click\";i:0;}'),(11,2,23,0,0,0,1,0,'','医学资料1','','','',0,'','',0,'',1502864577,7,'','a:4:{s:6:\"status\";i:0;s:5:\"limit\";i:0;s:5:\"share\";i:0;s:5:\"click\";i:0;}'),(12,2,24,0,0,0,1,0,'','医学资料2','','','',0,'','',0,'',1502864594,1,'','a:4:{s:6:\"status\";i:0;s:5:\"limit\";i:0;s:5:\"share\";i:0;s:5:\"click\";i:0;}'),(13,2,25,0,0,0,1,0,'','医学资料3','','','',0,'','',0,'',1502864618,3,'','a:4:{s:6:\"status\";i:0;s:5:\"limit\";i:0;s:5:\"share\";i:0;s:5:\"click\";i:0;}'),(14,2,26,0,0,0,1,0,'','医学资料4','','','',0,'','',0,'',1502864635,1,'','a:4:{s:6:\"status\";i:0;s:5:\"limit\";i:0;s:5:\"share\";i:0;s:5:\"click\";i:0;}'),(15,2,27,0,0,0,1,0,'','医学资料5','','','',0,'','',0,'',1502864653,1,'','a:4:{s:6:\"status\";i:0;s:5:\"limit\";i:0;s:5:\"share\";i:0;s:5:\"click\";i:0;}'),(16,2,28,0,0,0,2,0,'','就医百科6','','','',0,'','',0,'',1503301750,0,'','a:4:{s:6:\"status\";i:0;s:5:\"limit\";i:0;s:5:\"share\";i:0;s:5:\"click\";i:0;}'),(17,2,29,0,0,0,2,0,'','就医百科7','','','',0,'','',0,'',1503301769,0,'','a:4:{s:6:\"status\";i:0;s:5:\"limit\";i:0;s:5:\"share\";i:0;s:5:\"click\";i:0;}'),(18,2,30,0,0,0,2,0,'','就医百科8','','','',0,'','',0,'',1503301786,0,'','a:4:{s:6:\"status\";i:0;s:5:\"limit\";i:0;s:5:\"share\";i:0;s:5:\"click\";i:0;}'),(19,2,31,0,0,0,2,0,'','就医百科9','','','',0,'','',0,'',1503301804,0,'','a:4:{s:6:\"status\";i:0;s:5:\"limit\";i:0;s:5:\"share\";i:0;s:5:\"click\";i:0;}'),(20,2,32,0,0,0,2,0,'','就医百科10','','','',0,'','',0,'',1503301821,0,'','a:4:{s:6:\"status\";i:0;s:5:\"limit\";i:0;s:5:\"share\";i:0;s:5:\"click\";i:0;}'),(21,2,33,0,0,0,2,0,'','就医百科11','','','',0,'','',0,'',1503301841,0,'','a:4:{s:6:\"status\";i:0;s:5:\"limit\";i:0;s:5:\"share\";i:0;s:5:\"click\";i:0;}');

/*Table structure for table `ims_site_category` */

DROP TABLE IF EXISTS `ims_site_category`;

CREATE TABLE `ims_site_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `nid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `parentid` int(10) unsigned NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  `icon` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `linkurl` varchar(500) NOT NULL,
  `ishomepage` tinyint(1) NOT NULL,
  `icontype` tinyint(1) unsigned NOT NULL,
  `css` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `ims_site_category` */

insert  into `ims_site_category`(`id`,`uniacid`,`nid`,`name`,`parentid`,`displayorder`,`enabled`,`icon`,`description`,`styleid`,`linkurl`,`ishomepage`,`icontype`,`css`) values (1,2,0,'医学资料',0,0,1,'','医学资料',0,'',0,1,'a:1:{s:4:\"icon\";a:4:{s:9:\"font-size\";s:2:\"35\";s:5:\"color\";s:0:\"\";s:5:\"width\";s:2:\"35\";s:4:\"icon\";s:19:\"fa fa-external-link\";}}'),(2,2,0,'就医百科',0,0,1,'','就医百科',0,'',0,1,'a:1:{s:4:\"icon\";a:4:{s:9:\"font-size\";s:2:\"35\";s:5:\"color\";s:0:\"\";s:5:\"width\";s:2:\"35\";s:4:\"icon\";s:19:\"fa fa-external-link\";}}');

/*Table structure for table `ims_site_multi` */

DROP TABLE IF EXISTS `ims_site_multi`;

CREATE TABLE `ims_site_multi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `site_info` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `bindhost` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `bindhost` (`bindhost`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `ims_site_multi` */

insert  into `ims_site_multi`(`id`,`uniacid`,`title`,`styleid`,`site_info`,`status`,`bindhost`) values (1,1,'微擎团队',1,'',1,''),(2,2,'公主岭市妇幼保健院',2,'',0,''),(3,2,'公主岭市妇幼保健院',2,'a:4:{s:5:\"thumb\";s:0:\"\";s:7:\"keyword\";s:6:\"简介\";s:11:\"description\";s:0:\"\";s:6:\"footer\";s:0:\"\";}',1,''),(4,2,'医院简介',2,'a:4:{s:5:\"thumb\";s:0:\"\";s:7:\"keyword\";s:12:\"医院简介\";s:11:\"description\";s:0:\"\";s:6:\"footer\";s:0:\"\";}',1,'');

/*Table structure for table `ims_site_nav` */

DROP TABLE IF EXISTS `ims_site_nav`;

CREATE TABLE `ims_site_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `section` tinyint(4) NOT NULL,
  `module` varchar(50) NOT NULL,
  `displayorder` smallint(5) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `position` tinyint(4) NOT NULL,
  `url` varchar(255) NOT NULL,
  `icon` varchar(500) NOT NULL,
  `css` varchar(1000) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `categoryid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `multiid` (`multiid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_site_nav` */

/*Table structure for table `ims_site_page` */

DROP TABLE IF EXISTS `ims_site_page`;

CREATE TABLE `ims_site_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `params` longtext NOT NULL,
  `html` longtext NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `goodnum` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `multiid` (`multiid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `ims_site_page` */

insert  into `ims_site_page`(`id`,`uniacid`,`multiid`,`title`,`description`,`params`,`html`,`type`,`status`,`createtime`,`goodnum`) values (1,1,0,'快捷菜单','','{\"navStyle\":\"2\",\"bgColor\":\"#f4f4f4\",\"menus\":[{\"title\":\"\\u4f1a\\u5458\\u5361\",\"url\":\".\\/index.php?c=mc&a=bond&do=card&i=1\",\"submenus\":[],\"icon\":{\"name\":\"fa fa-credit-card\",\"color\":\"#969696\"},\"image\":\"\",\"hoverimage\":\"\",\"hovericon\":[]},{\"title\":\"\\u5151\\u6362\",\"url\":\".\\/index.php?c=activity&a=coupon&do=display&&i=1\",\"submenus\":[],\"icon\":{\"name\":\"fa fa-money\",\"color\":\"#969696\"},\"image\":\"\",\"hoverimage\":\"\",\"hovericon\":[]},{\"title\":\"\\u4ed8\\u6b3e\",\"url\":\"\\\" data-target=\\\"#scan\\\" data-toggle=\\\"modal\\\" href=\\\"javascript:void();\",\"submenus\":[],\"icon\":{\"name\":\"fa fa-qrcode\",\"color\":\"#969696\"},\"image\":\"\",\"hoverimage\":\"\",\"hovericon\":\"\"},{\"title\":\"\\u4e2a\\u4eba\\u4e2d\\u5fc3\",\"url\":\".\\/index.php?i=1&c=mc&\",\"submenus\":[],\"icon\":{\"name\":\"fa fa-user\",\"color\":\"#969696\"},\"image\":\"\",\"hoverimage\":\"\",\"hovericon\":[]}],\"extend\":[],\"position\":{\"homepage\":true,\"usercenter\":true,\"page\":true,\"article\":true},\"ignoreModules\":[]}','<div style=\"background-color: rgb(244, 244, 244);\" class=\"js-quickmenu nav-menu-app has-nav-0  has-nav-4\"   ><ul class=\"nav-group clearfix\"><li class=\"nav-group-item \" ><a href=\"./index.php?c=mc&a=bond&do=card&i=1\" style=\"background-position: center 2px;\" ><i style=\"color: rgb(150, 150, 150);\"  class=\"fa fa-credit-card\"  js-onclass-name=\"\" js-onclass-color=\"\" ></i><span style=\"color: rgb(150, 150, 150);\" class=\"\"  js-onclass-color=\"\">会员卡</span></a></li><li class=\"nav-group-item \" ><a href=\"./index.php?c=activity&a=coupon&do=display&&i=1\" style=\"background-position: center 2px;\" ><i style=\"color: rgb(150, 150, 150);\"  class=\"fa fa-money\"  js-onclass-name=\"\" js-onclass-color=\"\" ></i><span style=\"color: rgb(150, 150, 150);\" class=\"\"  js-onclass-color=\"\">兑换</span></a></li><li class=\"nav-group-item \" ><a href=\"\" data-target=\"#scan\" data-toggle=\"modal\" href=\"javascript:void();\" style=\"background-position: center 2px;\" ><i style=\"color: rgb(150, 150, 150);\"  class=\"fa fa-qrcode\"  js-onclass-name=\"\" js-onclass-color=\"\" ></i><span style=\"color: rgb(150, 150, 150);\" class=\"\"  js-onclass-color=\"\">付款</span></a></li><li class=\"nav-group-item \" ><a href=\"./index.php?i=1&c=mc&\" style=\"background-position: center 2px;\" ><i style=\"color: rgb(150, 150, 150);\"  class=\"fa fa-user\"  js-onclass-name=\"\" js-onclass-color=\"\" ></i><span style=\"color: rgb(150, 150, 150);\" class=\"\"  js-onclass-color=\"\">个人中心</span></a></li></ul></div>',4,1,1440242655,0);

/*Table structure for table `ims_site_slide` */

DROP TABLE IF EXISTS `ims_site_slide`;

CREATE TABLE `ims_site_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `displayorder` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `multiid` (`multiid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_site_slide` */

/*Table structure for table `ims_site_styles` */

DROP TABLE IF EXISTS `ims_site_styles`;

CREATE TABLE `ims_site_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `templateid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `ims_site_styles` */

insert  into `ims_site_styles`(`id`,`uniacid`,`templateid`,`name`) values (1,1,1,'微站默认模板_gC5C'),(2,2,1,'微站默认模板_u9fs');

/*Table structure for table `ims_site_styles_vars` */

DROP TABLE IF EXISTS `ims_site_styles_vars`;

CREATE TABLE `ims_site_styles_vars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `templateid` int(10) unsigned NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `variable` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_site_styles_vars` */

/*Table structure for table `ims_site_templates` */

DROP TABLE IF EXISTS `ims_site_templates`;

CREATE TABLE `ims_site_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `version` varchar(64) NOT NULL,
  `description` varchar(500) NOT NULL,
  `author` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `sections` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `ims_site_templates` */

insert  into `ims_site_templates`(`id`,`name`,`title`,`version`,`description`,`author`,`url`,`type`,`sections`) values (1,'default','微站默认模板','','由微擎提供默认微站模板套系','微擎团队','http://we7.cc','1',0);

/*Table structure for table `ims_stat_fans` */

DROP TABLE IF EXISTS `ims_stat_fans`;

CREATE TABLE `ims_stat_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `new` int(10) unsigned NOT NULL,
  `cancel` int(10) unsigned NOT NULL,
  `cumulate` int(10) NOT NULL,
  `date` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`date`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

/*Data for the table `ims_stat_fans` */

insert  into `ims_stat_fans`(`id`,`uniacid`,`new`,`cancel`,`cumulate`,`date`) values (1,1,0,0,0,'20170808'),(2,1,0,0,0,'20170807'),(3,1,0,0,0,'20170806'),(4,1,0,0,0,'20170805'),(5,1,0,0,0,'20170804'),(6,1,0,0,0,'20170803'),(7,1,0,0,0,'20170802'),(8,2,0,0,3,'20170808'),(9,2,2,0,3,'20170807'),(10,2,0,0,1,'20170806'),(11,2,0,0,1,'20170805'),(12,2,0,0,1,'20170804'),(13,2,1,0,1,'20170803'),(14,2,0,0,0,'20170802'),(15,2,0,0,3,'20170809'),(16,2,0,0,5,'20170813'),(17,2,0,0,5,'20170812'),(18,2,1,0,5,'20170811'),(19,2,1,0,4,'20170810'),(20,2,6,0,11,'20170814'),(21,2,0,0,11,'20170815'),(22,2,2,2,11,'20170816'),(23,2,2,2,11,'20170817'),(24,2,1,0,12,'20170818'),(25,2,0,0,12,'20170820'),(26,2,0,0,12,'20170819'),(27,2,2,1,13,'20170821'),(28,2,2,0,15,'20170822'),(29,2,4,2,17,'20170823'),(30,2,5,1,21,'20170824'),(31,2,1,2,22,'20170827'),(32,2,1,2,23,'20170826'),(33,2,4,1,24,'20170825'),(34,2,0,0,22,'20170828'),(35,2,1,1,22,'20170829'),(36,2,1,1,22,'20170830'),(37,2,0,0,22,'20170831');

/*Table structure for table `ims_stat_keyword` */

DROP TABLE IF EXISTS `ims_stat_keyword`;

CREATE TABLE `ims_stat_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` varchar(10) NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `hit` int(10) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_stat_keyword` */

/*Table structure for table `ims_stat_msg_history` */

DROP TABLE IF EXISTS `ims_stat_msg_history`;

CREATE TABLE `ims_stat_msg_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `type` varchar(10) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `ims_stat_msg_history` */

insert  into `ims_stat_msg_history`(`id`,`uniacid`,`rid`,`kid`,`from_user`,`module`,`message`,`type`,`createtime`) values (1,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1502326369),(2,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1502326375),(3,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1502326377),(4,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1502326377),(5,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1502326377),(6,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:27:\"测试内容111111111111111\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1502768548),(7,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1503562900),(8,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1503562913),(9,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1503562913),(10,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1503562913),(11,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1503562913),(12,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1503562913),(13,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1503562914),(14,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1503562914),(15,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1503562914),(16,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1503562914),(17,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1503562914),(18,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1503562918),(19,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1503562918),(20,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1503562918),(21,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1503562918),(22,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1503562918),(23,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1503562918),(24,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1503562919),(25,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1503562919),(26,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1503562919),(27,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1503562919),(28,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1503562922),(29,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1503562922);

/*Table structure for table `ims_stat_rule` */

DROP TABLE IF EXISTS `ims_stat_rule`;

CREATE TABLE `ims_stat_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `hit` int(10) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`createtime`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `ims_stat_rule` */

insert  into `ims_stat_rule`(`id`,`uniacid`,`rid`,`hit`,`lastupdate`,`createtime`) values (1,2,0,1,1502326369,1502294400),(2,2,0,1,1502326375,1502294400),(3,2,0,1,1502326377,1502294400),(4,2,0,1,1502326377,1502294400),(5,2,0,1,1502326377,1502294400),(6,2,0,1,1502768548,1502726400),(7,2,0,1,1503562900,1503504000),(8,2,0,1,1503562913,1503504000),(9,2,0,1,1503562913,1503504000),(10,2,0,1,1503562913,1503504000),(11,2,0,1,1503562913,1503504000),(12,2,0,1,1503562913,1503504000),(13,2,0,1,1503562914,1503504000),(14,2,0,1,1503562914,1503504000),(15,2,0,1,1503562914,1503504000),(16,2,0,1,1503562914,1503504000),(17,2,0,1,1503562914,1503504000),(18,2,0,1,1503562918,1503504000),(19,2,0,1,1503562918,1503504000),(20,2,0,1,1503562918,1503504000),(21,2,0,1,1503562918,1503504000),(22,2,0,1,1503562918,1503504000),(23,2,0,1,1503562918,1503504000),(24,2,0,1,1503562919,1503504000),(25,2,0,1,1503562919,1503504000),(26,2,0,1,1503562919,1503504000),(27,2,0,1,1503562919,1503504000),(28,2,0,1,1503562922,1503504000),(29,2,0,1,1503562922,1503504000);

/*Table structure for table `ims_uni_account` */

DROP TABLE IF EXISTS `ims_uni_account`;

CREATE TABLE `ims_uni_account` (
  `uniacid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `default_acid` int(10) unsigned NOT NULL,
  `rank` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `ims_uni_account` */

insert  into `ims_uni_account`(`uniacid`,`groupid`,`name`,`description`,`default_acid`,`rank`) values (1,-1,'微擎团队','一个朝气蓬勃的团队',1,NULL),(2,0,'公主岭市妇幼保健院','公主岭市妇幼保健院',2,5);

/*Table structure for table `ims_uni_account_group` */

DROP TABLE IF EXISTS `ims_uni_account_group`;

CREATE TABLE `ims_uni_account_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `groupid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `ims_uni_account_group` */

insert  into `ims_uni_account_group`(`id`,`uniacid`,`groupid`) values (1,2,-1);

/*Table structure for table `ims_uni_account_menus` */

DROP TABLE IF EXISTS `ims_uni_account_menus`;

CREATE TABLE `ims_uni_account_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `menuid` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `sex` tinyint(3) unsigned NOT NULL,
  `group_id` int(10) NOT NULL,
  `client_platform_type` tinyint(3) unsigned NOT NULL,
  `area` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `isdeleted` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `menuid` (`menuid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `ims_uni_account_menus` */

insert  into `ims_uni_account_menus`(`id`,`uniacid`,`menuid`,`type`,`title`,`sex`,`group_id`,`client_platform_type`,`area`,`data`,`status`,`createtime`,`isdeleted`) values (1,2,0,2,'服务中心',0,-1,0,'','YToyOntzOjY6ImJ1dHRvbiI7YTozOntpOjA7YToyOntzOjQ6Im5hbWUiO3M6MTI6IuWMu+mZouamguWGtSI7czoxMDoic3ViX2J1dHRvbiI7YTo0OntpOjA7YTozOntzOjQ6Im5hbWUiO3M6MTI6IumAieaLqeS9jee9riI7czo0OiJ0eXBlIjtzOjQ6InZpZXciO3M6MzoidXJsIjtzOjY2OiJodHRwOi8vZnV5b3Uudmxzb2Z0LmNuL2FwcC9pbmRleC5waHA/aT0yJmM9aG9zcGl0YWwmYT1pbmRleCZkbz1tYXAiO31pOjE7YTozOntzOjQ6Im5hbWUiO3M6MTI6IuS6pOmAmuS/oeaBryI7czo0OiJ0eXBlIjtzOjQ6InZpZXciO3M6MzoidXJsIjtzOjczOiJodHRwOi8vZnV5b3Uudmxzb2Z0LmNuL2FwcC9pbmRleC5waHA/aT0yJmM9aG9zcGl0YWwmYT1pbmRleCZkbz1jaGFuZ2VfbWFwIjt9aToyO2E6Mzp7czo0OiJuYW1lIjtzOjEyOiLmlofljJbnsr7npZ4iO3M6NDoidHlwZSI7czo0OiJ2aWV3IjtzOjM6InVybCI7czo0MToiaHR0cDovL3U0Nzg2NzMyLnZpZXdlci5tYWthLmltL2svQVhRR0dBMTUiO31pOjM7YTozOntzOjQ6Im5hbWUiO3M6MTI6IuWMu+mZoueugOS7iyI7czo0OiJ0eXBlIjtzOjQ6InZpZXciO3M6MzoidXJsIjtzOjY4OiJodHRwOi8vZnV5b3Uudmxzb2Z0LmNuL2FwcC9pbmRleC5waHA/aT0yJmM9aG9zcGl0YWwmYT1pbmRleCZkbz1icmllZiI7fX19aToxO2E6Mjp7czo0OiJuYW1lIjtzOjEyOiLmnI3liqHkuK3lv4MiO3M6MTA6InN1Yl9idXR0b24iO2E6NDp7aTowO2E6Mzp7czo0OiJuYW1lIjtzOjEyOiLpooTnuqbmjILlj7ciO3M6NDoidHlwZSI7czo0OiJ2aWV3IjtzOjM6InVybCI7czo3ODoiaHR0cDovL2Z1eW91LnZsc29mdC5jbi9hcHAvaW5kZXgucGhwP2k9MiZjPWhvc3BpdGFsJmE9YXBwb2ludG1lbnQmZG89bGlzdCZpZD0wIjt9aToxO2E6Mzp7czo0OiJuYW1lIjtzOjEyOiLlh7ror4rkv6Hmga8iO3M6NDoidHlwZSI7czo0OiJ2aWV3IjtzOjM6InVybCI7czo2OToiaHR0cDovL2Z1eW91LnZsc29mdC5jbi9hcHAvaW5kZXgucGhwP2k9MiZjPWhvc3BpdGFsJmE9aW5kZXgmZG89dmlzaXRzIjt9aToyO2E6Mzp7czo0OiJuYW1lIjtzOjEyOiLlkI3ljLvlkI3luIgiO3M6NDoidHlwZSI7czo0OiJ2aWV3IjtzOjM6InVybCI7czo2OToiaHR0cDovL2Z1eW91LnZsc29mdC5jbi9hcHAvaW5kZXgucGhwP2k9MiZjPWhvc3BpdGFsJmE9aW5kZXgmZG89ZmFtb3VzIjt9aTozO2E6Mzp7czo0OiJuYW1lIjtzOjEyOiLlsLHljLvmjIfljZciO3M6NDoidHlwZSI7czo0OiJ2aWV3IjtzOjM6InVybCI7czo2ODoiaHR0cDovL2Z1eW91LnZsc29mdC5jbi9hcHAvaW5kZXgucGhwP2k9MiZjPWhvc3BpdGFsJmE9YW5zd2VyJmRvPWxpc3QiO319fWk6MjthOjI6e3M6NDoibmFtZSI7czoxMjoi5Liq5Lq65Lit5b+DIjtzOjEwOiJzdWJfYnV0dG9uIjthOjM6e2k6MDthOjM6e3M6NDoibmFtZSI7czoxMjoi6K+E5Lu3566h55CGIjtzOjQ6InR5cGUiO3M6NDoidmlldyI7czozOiJ1cmwiO3M6NzU6Imh0dHA6Ly9mdXlvdS52bHNvZnQuY24vYXBwL2luZGV4LnBocD9pPTImYz1ob3NwaXRhbCZhPWV2YWx1YXRlJmRvPWxpc3QmaWQ9MCI7fWk6MTthOjM6e3M6NDoibmFtZSI7czoxMjoi5qGj5qGI566h55CGIjtzOjQ6InR5cGUiO3M6NDoidmlldyI7czozOiJ1cmwiO3M6Nzc6Imh0dHA6Ly9mdXlvdS52bHNvZnQuY24vYXBwL2luZGV4LnBocD9pPTImYz1ob3NwaXRhbCZhPW1hbmFnZW1lbnQmZG89bGlzdCZpZD0wIjt9aToyO2E6Mzp7czo0OiJuYW1lIjtzOjEyOiLkuKrkurrkv6Hmga8iO3M6NDoidHlwZSI7czo0OiJ2aWV3IjtzOjM6InVybCI7czo0NjoiaHR0cDovL2Z1eW91LnZsc29mdC5jbi9hcHAvaW5kZXgucGhwP2k9MiZjPW1jJiI7fX19fXM6OToibWF0Y2hydWxlIjthOjE6e3M6NzoiZ3JvdXBpZCI7Tjt9fQ==',0,1503987299,1),(2,2,0,1,'服务中心',0,-1,0,'','YTozOntzOjY6ImJ1dHRvbiI7YTozOntpOjA7YToyOntzOjQ6Im5hbWUiO3M6MTI6IuWMu+mZouamguWGtSI7czoxMDoic3ViX2J1dHRvbiI7YTo0OntpOjA7YTo0OntzOjQ6InR5cGUiO3M6NDoidmlldyI7czo0OiJuYW1lIjtzOjEyOiLpgInmi6nkvY3nva4iO3M6MzoidXJsIjtzOjY2OiJodHRwOi8vZnV5b3Uudmxzb2Z0LmNuL2FwcC9pbmRleC5waHA/aT0yJmM9aG9zcGl0YWwmYT1pbmRleCZkbz1tYXAiO3M6MTA6InN1Yl9idXR0b24iO2E6MDp7fX1pOjE7YTo0OntzOjQ6InR5cGUiO3M6NDoidmlldyI7czo0OiJuYW1lIjtzOjEyOiLkuqTpgJrkv6Hmga8iO3M6MzoidXJsIjtzOjczOiJodHRwOi8vZnV5b3Uudmxzb2Z0LmNuL2FwcC9pbmRleC5waHA/aT0yJmM9aG9zcGl0YWwmYT1pbmRleCZkbz1jaGFuZ2VfbWFwIjtzOjEwOiJzdWJfYnV0dG9uIjthOjA6e319aToyO2E6NDp7czo0OiJ0eXBlIjtzOjQ6InZpZXciO3M6NDoibmFtZSI7czoxMjoi5paH5YyW57K+56WeIjtzOjM6InVybCI7czo0MToiaHR0cDovL3U0Nzg2NzMyLnZpZXdlci5tYWthLmltL2svQVhRR0dBMTUiO3M6MTA6InN1Yl9idXR0b24iO2E6MDp7fX1pOjM7YTo0OntzOjQ6InR5cGUiO3M6NDoidmlldyI7czo0OiJuYW1lIjtzOjEyOiLljLvpmaLnroDku4siO3M6MzoidXJsIjtzOjY4OiJodHRwOi8vZnV5b3Uudmxzb2Z0LmNuL2FwcC9pbmRleC5waHA/aT0yJmM9aG9zcGl0YWwmYT1pbmRleCZkbz1icmllZiI7czoxMDoic3ViX2J1dHRvbiI7YTowOnt9fX19aToxO2E6Mjp7czo0OiJuYW1lIjtzOjEyOiLmnI3liqHkuK3lv4MiO3M6MTA6InN1Yl9idXR0b24iO2E6NDp7aTowO2E6NDp7czo0OiJ0eXBlIjtzOjQ6InZpZXciO3M6NDoibmFtZSI7czoxMjoi6aKE57qm5oyC5Y+3IjtzOjM6InVybCI7czo3ODoiaHR0cDovL2Z1eW91LnZsc29mdC5jbi9hcHAvaW5kZXgucGhwP2k9MiZjPWhvc3BpdGFsJmE9YXBwb2ludG1lbnQmZG89bGlzdCZpZD0wIjtzOjEwOiJzdWJfYnV0dG9uIjthOjA6e319aToxO2E6NDp7czo0OiJ0eXBlIjtzOjQ6InZpZXciO3M6NDoibmFtZSI7czoxMjoi5Ye66K+K5L+h5oGvIjtzOjM6InVybCI7czo2OToiaHR0cDovL2Z1eW91LnZsc29mdC5jbi9hcHAvaW5kZXgucGhwP2k9MiZjPWhvc3BpdGFsJmE9aW5kZXgmZG89dmlzaXRzIjtzOjEwOiJzdWJfYnV0dG9uIjthOjA6e319aToyO2E6NDp7czo0OiJ0eXBlIjtzOjQ6InZpZXciO3M6NDoibmFtZSI7czoxMjoi5ZCN5Yy75ZCN5biIIjtzOjM6InVybCI7czo2OToiaHR0cDovL2Z1eW91LnZsc29mdC5jbi9hcHAvaW5kZXgucGhwP2k9MiZjPWhvc3BpdGFsJmE9aW5kZXgmZG89ZmFtb3VzIjtzOjEwOiJzdWJfYnV0dG9uIjthOjA6e319aTozO2E6NDp7czo0OiJ0eXBlIjtzOjQ6InZpZXciO3M6NDoibmFtZSI7czoxMjoi5bCx5Yy75oyH5Y2XIjtzOjM6InVybCI7czo2ODoiaHR0cDovL2Z1eW91LnZsc29mdC5jbi9hcHAvaW5kZXgucGhwP2k9MiZjPWhvc3BpdGFsJmE9YW5zd2VyJmRvPWxpc3QiO3M6MTA6InN1Yl9idXR0b24iO2E6MDp7fX19fWk6MjthOjI6e3M6NDoibmFtZSI7czoxMjoi5Liq5Lq65Lit5b+DIjtzOjEwOiJzdWJfYnV0dG9uIjthOjM6e2k6MDthOjQ6e3M6NDoidHlwZSI7czo0OiJ2aWV3IjtzOjQ6Im5hbWUiO3M6MTI6IuivhOS7t+euoeeQhiI7czozOiJ1cmwiO3M6NzU6Imh0dHA6Ly9mdXlvdS52bHNvZnQuY24vYXBwL2luZGV4LnBocD9pPTImYz1ob3NwaXRhbCZhPWV2YWx1YXRlJmRvPWxpc3QmaWQ9MCI7czoxMDoic3ViX2J1dHRvbiI7YTowOnt9fWk6MTthOjQ6e3M6NDoidHlwZSI7czo0OiJ2aWV3IjtzOjQ6Im5hbWUiO3M6MTI6Iuaho+ahiOeuoeeQhiI7czozOiJ1cmwiO3M6Nzc6Imh0dHA6Ly9mdXlvdS52bHNvZnQuY24vYXBwL2luZGV4LnBocD9pPTImYz1ob3NwaXRhbCZhPW1hbmFnZW1lbnQmZG89bGlzdCZpZD0wIjtzOjEwOiJzdWJfYnV0dG9uIjthOjA6e319aToyO2E6NDp7czo0OiJ0eXBlIjtzOjQ6InZpZXciO3M6NDoibmFtZSI7czoxMjoi5Liq5Lq65L+h5oGvIjtzOjM6InVybCI7czo0NjoiaHR0cDovL2Z1eW91LnZsc29mdC5jbi9hcHAvaW5kZXgucGhwP2k9MiZjPW1jJiI7czoxMDoic3ViX2J1dHRvbiI7YTowOnt9fX19fXM6NDoidHlwZSI7aToxO3M6OToibWF0Y2hydWxlIjthOjA6e319',1,1503987299,0);

/*Table structure for table `ims_uni_account_modules` */

DROP TABLE IF EXISTS `ims_uni_account_modules`;

CREATE TABLE `ims_uni_account_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  `settings` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_module` (`module`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `ims_uni_account_modules` */

insert  into `ims_uni_account_modules`(`id`,`uniacid`,`module`,`enabled`,`settings`) values (1,1,'basic',1,''),(2,1,'news',1,''),(3,1,'music',1,''),(4,1,'userapi',1,''),(5,1,'recharge',1,''),(6,2,'userapi',1,'a:6:{i:1;b:1;i:2;b:1;i:3;b:1;i:4;b:1;i:5;b:1;i:6;b:1;}');

/*Table structure for table `ims_uni_account_users` */

DROP TABLE IF EXISTS `ims_uni_account_users`;

CREATE TABLE `ims_uni_account_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `role` varchar(255) NOT NULL,
  `rank` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_memberid` (`uid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_uni_account_users` */

/*Table structure for table `ims_uni_group` */

DROP TABLE IF EXISTS `ims_uni_group`;

CREATE TABLE `ims_uni_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `modules` varchar(15000) NOT NULL,
  `templates` varchar(5000) NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `ims_uni_group` */

insert  into `ims_uni_group`(`id`,`name`,`modules`,`templates`,`uniacid`) values (1,'体验套餐服务','N;','N;',0);

/*Table structure for table `ims_uni_settings` */

DROP TABLE IF EXISTS `ims_uni_settings`;

CREATE TABLE `ims_uni_settings` (
  `uniacid` int(10) unsigned NOT NULL,
  `passport` varchar(200) NOT NULL,
  `oauth` varchar(100) NOT NULL,
  `jsauth_acid` int(10) unsigned NOT NULL,
  `uc` varchar(500) NOT NULL,
  `notify` varchar(2000) NOT NULL,
  `creditnames` varchar(500) NOT NULL,
  `creditbehaviors` varchar(500) NOT NULL,
  `welcome` varchar(60) NOT NULL,
  `default` varchar(60) NOT NULL,
  `default_message` varchar(2000) NOT NULL,
  `shortcuts` varchar(5000) NOT NULL,
  `payment` varchar(2000) NOT NULL,
  `stat` varchar(300) NOT NULL,
  `default_site` int(10) unsigned DEFAULT NULL,
  `sync` tinyint(3) unsigned NOT NULL,
  `recharge` varchar(500) NOT NULL,
  `tplnotice` varchar(1000) NOT NULL,
  `grouplevel` tinyint(3) unsigned NOT NULL,
  `mcplugin` varchar(500) NOT NULL,
  `exchange_enable` tinyint(3) unsigned NOT NULL,
  `coupon_type` tinyint(3) unsigned NOT NULL,
  `menuset` text NOT NULL,
  PRIMARY KEY (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_uni_settings` */

insert  into `ims_uni_settings`(`uniacid`,`passport`,`oauth`,`jsauth_acid`,`uc`,`notify`,`creditnames`,`creditbehaviors`,`welcome`,`default`,`default_message`,`shortcuts`,`payment`,`stat`,`default_site`,`sync`,`recharge`,`tplnotice`,`grouplevel`,`mcplugin`,`exchange_enable`,`coupon_type`,`menuset`) values (1,'a:3:{s:8:\"focusreg\";i:0;s:4:\"item\";s:5:\"email\";s:4:\"type\";s:8:\"password\";}','a:2:{s:6:\"status\";s:1:\"0\";s:7:\"account\";s:1:\"0\";}',0,'a:1:{s:6:\"status\";i:0;}','a:1:{s:3:\"sms\";a:2:{s:7:\"balance\";i:0;s:9:\"signature\";s:0:\"\";}}','a:5:{s:7:\"credit1\";a:2:{s:5:\"title\";s:6:\"积分\";s:7:\"enabled\";i:1;}s:7:\"credit2\";a:2:{s:5:\"title\";s:6:\"余额\";s:7:\"enabled\";i:1;}s:7:\"credit3\";a:2:{s:5:\"title\";s:0:\"\";s:7:\"enabled\";i:0;}s:7:\"credit4\";a:2:{s:5:\"title\";s:0:\"\";s:7:\"enabled\";i:0;}s:7:\"credit5\";a:2:{s:5:\"title\";s:0:\"\";s:7:\"enabled\";i:0;}}','a:2:{s:8:\"activity\";s:7:\"credit1\";s:8:\"currency\";s:7:\"credit2\";}','','','','','a:4:{s:6:\"credit\";a:1:{s:6:\"switch\";b:0;}s:6:\"alipay\";a:4:{s:6:\"switch\";b:0;s:7:\"account\";s:0:\"\";s:7:\"partner\";s:0:\"\";s:6:\"secret\";s:0:\"\";}s:6:\"wechat\";a:5:{s:6:\"switch\";b:0;s:7:\"account\";b:0;s:7:\"signkey\";s:0:\"\";s:7:\"partner\";s:0:\"\";s:3:\"key\";s:0:\"\";}s:8:\"delivery\";a:1:{s:6:\"switch\";b:0;}}','',1,0,'','',0,'',0,0,''),(2,'a:4:{s:8:\"focusreg\";i:1;s:4:\"item\";s:6:\"mobile\";s:4:\"type\";s:8:\"password\";s:5:\"audit\";i:0;}','a:2:{s:7:\"account\";s:1:\"2\";s:4:\"host\";s:0:\"\";}',0,'','','a:2:{s:7:\"credit1\";a:2:{s:5:\"title\";s:6:\"积分\";s:7:\"enabled\";i:1;}s:7:\"credit2\";a:2:{s:5:\"title\";s:6:\"余额\";s:7:\"enabled\";i:1;}}','a:2:{s:8:\"activity\";s:7:\"credit1\";s:8:\"currency\";s:7:\"credit2\";}','','','a:3:{s:5:\"image\";a:3:{s:4:\"type\";s:7:\"keyword\";s:6:\"module\";s:0:\"\";s:7:\"keyword\";s:6:\"tupian\";}s:8:\"location\";a:3:{s:4:\"type\";s:7:\"keyword\";s:6:\"module\";s:0:\"\";s:7:\"keyword\";s:6:\"weizhi\";}s:5:\"trace\";a:3:{s:4:\"type\";s:7:\"keyword\";s:6:\"module\";s:0:\"\";s:7:\"keyword\";s:6:\"weizhi\";}}','','','a:3:{s:11:\"msg_history\";i:1;s:10:\"msg_maxday\";i:30;s:9:\"use_ratio\";i:1;}',2,0,'','',0,'',0,0,'');

/*Table structure for table `ims_uni_verifycode` */

DROP TABLE IF EXISTS `ims_uni_verifycode`;

CREATE TABLE `ims_uni_verifycode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `receiver` varchar(50) NOT NULL,
  `verifycode` varchar(6) NOT NULL,
  `total` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_uni_verifycode` */

/*Table structure for table `ims_user_qustion` */

DROP TABLE IF EXISTS `ims_user_qustion`;

CREATE TABLE `ims_user_qustion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(381) DEFAULT NULL,
  `question` varchar(1533) DEFAULT NULL,
  `isAnswered` int(11) DEFAULT '0',
  `updateCount` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `ims_user_qustion` */

insert  into `ims_user_qustion`(`id`,`title`,`question`,`isAnswered`,`updateCount`) values (1,'耳朵疼怎么办1','耳朵真的很疼',1,2),(2,'耳朵疼怎么办','耳朵真的很疼',1,4),(3,'耳朵疼怎么办','耳朵真的很疼',1,0),(4,'耳朵疼怎么办','耳朵真的很疼',1,0),(5,'耳朵疼怎么办','耳朵真的很疼',1,0),(6,'耳朵疼怎么办','耳朵真的很疼',1,0),(9,'手机情况','去搜会懂给你们',1,4),(10,'iOS哦','挺快陪我',1,1),(11,'刚刚好','g g g g',0,0),(12,'行吧','pls哦在',0,0),(13,'松丸','好哦怕咯做最',0,0),(14,'工地','好咯破',0,0),(15,'1111','w w w w',0,0),(16,'这个问题怎么办','',0,0),(17,'blatant','fall哦哦哦',0,0),(18,'good','fjfyvu',0,0),(19,'qqq','w w w',0,0);

/*Table structure for table `ims_userapi_cache` */

DROP TABLE IF EXISTS `ims_userapi_cache`;

CREATE TABLE `ims_userapi_cache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(32) NOT NULL,
  `content` text NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_userapi_cache` */

/*Table structure for table `ims_userapi_reply` */

DROP TABLE IF EXISTS `ims_userapi_reply`;

CREATE TABLE `ims_userapi_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `description` varchar(300) NOT NULL,
  `apiurl` varchar(300) NOT NULL,
  `token` varchar(32) NOT NULL,
  `default_text` varchar(100) NOT NULL,
  `cachetime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `ims_userapi_reply` */

insert  into `ims_userapi_reply`(`id`,`rid`,`description`,`apiurl`,`token`,`default_text`,`cachetime`) values (1,1,'\"城市名+天气\", 如: \"北京天气\"','weather.php','','',0),(2,2,'\"百科+查询内容\" 或 \"定义+查询内容\", 如: \"百科姚明\", \"定义自行车\"','baike.php','','',0),(3,3,'\"@查询内容(中文或英文)\"','translate.php','','',0),(4,4,'\"日历\", \"万年历\", \"黄历\"或\"几号\"','calendar.php','','',0),(5,5,'\"新闻\"','news.php','','',0),(6,6,'\"快递+单号\", 如: \"申通1200041125\"','express.php','','',0);

/*Table structure for table `ims_users` */

DROP TABLE IF EXISTS `ims_users`;

CREATE TABLE `ims_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` int(10) unsigned NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `joindate` int(10) unsigned NOT NULL,
  `joinip` varchar(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL,
  `lastip` varchar(15) NOT NULL,
  `remark` varchar(500) NOT NULL,
  `starttime` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `ims_users` */

insert  into `ims_users`(`uid`,`groupid`,`username`,`password`,`salt`,`type`,`status`,`joindate`,`joinip`,`lastvisit`,`lastip`,`remark`,`starttime`,`endtime`) values (1,0,'admin','f2d26695481f57a4c46b2be25f0bfdaf62d1d6ad','a5f75916',0,0,1502260665,'',1504254350,'139.212.140.226','',0,0);

/*Table structure for table `ims_users_failed_login` */

DROP TABLE IF EXISTS `ims_users_failed_login`;

CREATE TABLE `ims_users_failed_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL,
  `username` varchar(32) NOT NULL,
  `count` tinyint(1) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip_username` (`ip`,`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `ims_users_failed_login` */

/*Table structure for table `ims_users_group` */

DROP TABLE IF EXISTS `ims_users_group`;

CREATE TABLE `ims_users_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `package` varchar(5000) NOT NULL,
  `maxaccount` int(10) unsigned NOT NULL,
  `maxsubaccount` int(10) unsigned NOT NULL,
  `timelimit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `ims_users_group` */

insert  into `ims_users_group`(`id`,`name`,`package`,`maxaccount`,`maxsubaccount`,`timelimit`) values (1,'体验用户组','a:1:{i:0;i:1;}',1,1,0),(2,'白金用户组','a:1:{i:0;i:1;}',2,2,0),(3,'黄金用户组','a:1:{i:0;i:1;}',3,3,0);

/*Table structure for table `ims_users_invitation` */

DROP TABLE IF EXISTS `ims_users_invitation`;

CREATE TABLE `ims_users_invitation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `fromuid` int(10) unsigned NOT NULL,
  `inviteuid` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_users_invitation` */

/*Table structure for table `ims_users_permission` */

DROP TABLE IF EXISTS `ims_users_permission`;

CREATE TABLE `ims_users_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `type` varchar(30) NOT NULL,
  `permission` varchar(10000) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_users_permission` */

/*Table structure for table `ims_users_profile` */

DROP TABLE IF EXISTS `ims_users_profile`;

CREATE TABLE `ims_users_profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `realname` varchar(10) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `fakeid` varchar(30) NOT NULL,
  `vip` tinyint(3) unsigned NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthyear` smallint(6) unsigned NOT NULL,
  `birthmonth` tinyint(3) unsigned NOT NULL,
  `birthday` tinyint(3) unsigned NOT NULL,
  `constellation` varchar(10) NOT NULL,
  `zodiac` varchar(5) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `idcard` varchar(30) NOT NULL,
  `studentid` varchar(50) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `resideprovince` varchar(30) NOT NULL,
  `residecity` varchar(30) NOT NULL,
  `residedist` varchar(30) NOT NULL,
  `graduateschool` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `education` varchar(10) NOT NULL,
  `occupation` varchar(30) NOT NULL,
  `position` varchar(30) NOT NULL,
  `revenue` varchar(10) NOT NULL,
  `affectivestatus` varchar(30) NOT NULL,
  `lookingfor` varchar(255) NOT NULL,
  `bloodtype` varchar(5) NOT NULL,
  `height` varchar(5) NOT NULL,
  `weight` varchar(5) NOT NULL,
  `alipay` varchar(30) NOT NULL,
  `msn` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `taobao` varchar(30) NOT NULL,
  `site` varchar(30) NOT NULL,
  `bio` text NOT NULL,
  `interest` text NOT NULL,
  `workerid` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_users_profile` */

/*Table structure for table `ims_video_reply` */

DROP TABLE IF EXISTS `ims_video_reply`;

CREATE TABLE `ims_video_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_video_reply` */

/*Table structure for table `ims_visitation_info` */

DROP TABLE IF EXISTS `ims_visitation_info`;

CREATE TABLE `ims_visitation_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_date` varchar(450) DEFAULT NULL,
  `archive_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `order_level` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT '0',
  `registered` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;

/*Data for the table `ims_visitation_info` */

insert  into `ims_visitation_info`(`id`,`order_date`,`archive_id`,`doctor_id`,`order_level`,`number`,`registered`) values (13,'08-31',NULL,6,1,4,0),(14,'09-01',NULL,2,1,3,3),(17,'08-30',NULL,2,1,2,0),(70,'09-03',NULL,4,2,2,0),(93,'08-29',NULL,2,1,2,0),(94,'08-29',NULL,2,1,2,0),(95,'08-29',NULL,3,1,2,0),(96,'08-29',NULL,4,2,2,0),(97,'08-29',NULL,6,2,2,0),(98,'08-29',NULL,7,3,2,0),(99,'08-29',NULL,8,3,2,0),(100,'08-29',NULL,9,1,2,0),(101,'08-29',NULL,10,2,2,0),(102,'08-29',NULL,11,3,2,0),(103,'08-29',NULL,12,3,2,0),(104,'08-29',NULL,13,1,2,0),(105,'08-29',NULL,14,1,2,0),(106,'08-29',NULL,16,1,2,0),(107,'08-29',NULL,29,3,2,0),(108,'08-29',NULL,30,1,2,0),(109,'08-29',NULL,31,3,2,0),(110,'08-29',NULL,32,1,2,0),(111,'08-29',NULL,33,1,2,0),(112,'08-29',NULL,34,1,2,0),(113,'09-04',NULL,1,1,2,0),(114,'09-04',NULL,2,1,2,0),(115,'09-04',NULL,3,1,2,0),(116,'09-04',NULL,4,2,2,0),(117,'09-04',NULL,6,2,2,0),(118,'09-04',NULL,7,3,2,0),(119,'09-04',NULL,8,3,2,0),(120,'09-04',NULL,9,1,2,0),(121,'09-04',NULL,10,2,2,0),(122,'09-04',NULL,11,3,2,0),(123,'09-04',NULL,12,3,2,0),(124,'09-04',NULL,13,1,2,0),(125,'09-04',NULL,14,1,2,0),(126,'09-04',NULL,16,1,2,0),(127,'09-04',NULL,29,3,2,0),(128,'09-04',NULL,30,1,2,0),(129,'09-04',NULL,31,3,2,0),(130,'09-04',NULL,32,1,2,0),(131,'09-04',NULL,33,1,2,0),(132,'09-04',NULL,34,1,2,0);

/*Table structure for table `ims_voice_reply` */

DROP TABLE IF EXISTS `ims_voice_reply`;

CREATE TABLE `ims_voice_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_voice_reply` */

/*Table structure for table `ims_wechat_attachment` */

DROP TABLE IF EXISTS `ims_wechat_attachment`;

CREATE TABLE `ims_wechat_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `media_id` varchar(255) NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  `model` varchar(25) NOT NULL,
  `tag` varchar(5000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `media_id` (`media_id`),
  KEY `acid` (`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_wechat_attachment` */

/*Table structure for table `ims_wechat_news` */

DROP TABLE IF EXISTS `ims_wechat_news`;

CREATE TABLE `ims_wechat_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned DEFAULT NULL,
  `attach_id` int(10) unsigned NOT NULL,
  `thumb_media_id` varchar(60) NOT NULL,
  `thumb_url` varchar(255) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(30) NOT NULL,
  `digest` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `content_source_url` varchar(200) NOT NULL,
  `show_cover_pic` tinyint(3) unsigned NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `attach_id` (`attach_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_wechat_news` */

/*Table structure for table `ims_wxcard_reply` */

DROP TABLE IF EXISTS `ims_wxcard_reply`;

CREATE TABLE `ims_wxcard_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `cid` int(10) unsigned NOT NULL,
  `brand_name` varchar(30) NOT NULL,
  `logo_url` varchar(255) NOT NULL,
  `success` varchar(255) NOT NULL,
  `error` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ims_wxcard_reply` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
