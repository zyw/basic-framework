/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.27 : Database - basicframework
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`basicframework` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `basicframework`;

/*Table structure for table `system_res` */

DROP TABLE IF EXISTS `system_res`;

CREATE TABLE `system_res` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT NULL,
  `name` varchar(111) DEFAULT NULL,
  `permission` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `sortNum` int(11) DEFAULT '1',
  `icon` varchar(100) DEFAULT NULL,
  `pids` varchar(100) DEFAULT NULL COMMENT 'TreeTable排序',
  `type` int(1) DEFAULT '2' COMMENT '1 菜单 2 按钮',
  `available` int(11) DEFAULT '1' COMMENT '1 可用 0 不可用',
  `des` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `system_res` */

insert  into `system_res`(`id`,`pid`,`name`,`permission`,`url`,`sortNum`,`icon`,`pids`,`type`,`available`,`des`) values (3,0,'仪表盘','index:view','/index',0,'fa-dashboard','0/',1,1,'仪表盘'),(4,0,'系统管理','system:*','',2,NULL,'0/',1,1,'系统管理一级菜单'),(5,4,'资源管理','res:view','/res/list',0,NULL,'0/4/',1,1,'资源管理'),(6,4,'角色管理','role:view','/role/list/1',1,NULL,'0/4/',1,1,'角色管理'),(7,4,'用户管理','user:view','/user/list/1',2,NULL,'0/4/',1,1,'用户管理'),(8,5,'资源新增','res:create','',0,NULL,'0/4/5/',2,1,'资源新增'),(9,5,'资源修改','res:update','',1,NULL,'0/4/5/',2,1,'资源修改'),(10,5,'资源删除','res:delete','',2,NULL,'0/4/5/',2,1,'资源删除'),(11,6,'角色新增','role:create','',0,'','0/4/6/',2,1,'角色新增'),(12,6,'角色修改','role:update','',1,'','0/4/6/',2,1,'角色修改'),(13,6,'角色删除','role:delete','',2,'','0/4/6/',2,1,'角色删除'),(14,7,'用户新增','user:create','',0,'','0/4/7/',2,0,'用户新增'),(15,7,'用户修改','user:update','',1,NULL,'0/4/7/',2,1,'用户修改'),(16,7,'用户删除','user:delete','',2,NULL,'0/4/7/',2,1,'用户删除'),(17,7,'用户密码修改','user:pwd:update','',3,NULL,'0/4/7/',2,1,'用户密码修改');

/*Table structure for table `system_role` */

DROP TABLE IF EXISTS `system_role`;

CREATE TABLE `system_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) DEFAULT NULL,
  `sortNum` int(11) DEFAULT '1',
  `pid` bigint(20) DEFAULT '0',
  `des` varchar(55) DEFAULT NULL,
  `available` int(11) DEFAULT '1' COMMENT '1 可用 0 不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `system_role` */

insert  into `system_role`(`id`,`name`,`sortNum`,`pid`,`des`,`available`) values (9,'admin',1,0,'超级管理员',1),(10,'超级管理员',3,0,'超级管理员',1),(15,'网站编辑',10,0,'网站编辑',1),(16,'test1',20,0,'是的方式的',0);

/*Table structure for table `system_role_res` */

DROP TABLE IF EXISTS `system_role_res`;

CREATE TABLE `system_role_res` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `res_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_SYSTEM_ROLE_RES_RES_ID` (`res_id`),
  KEY `FK_SYSTEM_ROLE_RES_ROLE_ID` (`role_id`),
  CONSTRAINT `FK_SYSTEM_ROLE_RES_RES_ID` FOREIGN KEY (`res_id`) REFERENCES `system_res` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SYSTEM_ROLE_RES_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `system_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

/*Data for the table `system_role_res` */

insert  into `system_role_res`(`id`,`res_id`,`role_id`) values (29,4,10),(30,3,10),(31,5,10),(32,6,10),(33,7,10),(34,8,10),(35,9,10),(104,4,9),(105,3,9),(106,5,9),(107,6,9),(108,7,9),(109,8,9),(110,9,9),(111,10,9),(112,11,9),(113,12,9),(114,13,9),(115,14,9),(116,15,9),(117,16,9),(118,17,9),(119,3,16),(120,4,15),(121,6,15),(122,11,15),(123,12,15),(124,13,15);

/*Table structure for table `system_user` */

DROP TABLE IF EXISTS `system_user`;

CREATE TABLE `system_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `sex` int(1) DEFAULT '1' COMMENT '1:男，0:女',
  `mobilephone` varchar(11) DEFAULT NULL COMMENT '移动电话',
  `loginCount` int(11) DEFAULT '0' COMMENT '登录次数',
  `lastLoginTime` datetime DEFAULT NULL COMMENT '最后登录时间',
  `originalPic` varchar(200) DEFAULT NULL COMMENT '头像',
  `available` int(1) DEFAULT '1' COMMENT '#1 不在线 2.封号状态 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1007 DEFAULT CHARSET=utf8;

/*Data for the table `system_user` */

insert  into `system_user`(`id`,`loginname`,`password`,`salt`,`name`,`email`,`sex`,`mobilephone`,`loginCount`,`lastLoginTime`,`originalPic`,`available`) values (1000,'zhangsan','887152dfd71fb7bfbb95c4d5ddb8d711','51dc770e65e4e2c2d5a63ba81f4110fc','张三','zhangsan@163.com',1,'',46,'2014-10-30 14:57:49','avatar1.jpg',1),(1002,'lisi','894431bb71c1776a70a98eacf7ef3257','2eaa12542970e016e9afbfb713258d37','李四','lisi@163.com',1,'12345678963',29,'2014-11-05 19:34:37','1414391284915.png',1),(1006,'wangwu','c1373439cee253ce306bce3f0c06b587','b646727c2c3581e7f8ec82327868df7a','王五','wangwu@163.com',0,'12345678963',7,'2014-10-30 10:03:58','avatar0.jpg',1);

/*Table structure for table `system_user_role` */

DROP TABLE IF EXISTS `system_user_role`;

CREATE TABLE `system_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_SYSTME_USER_ROLE_USER_ID` (`user_id`),
  KEY `FK_SYSTME_USER_ROLE_ROLE_ID` (`role_id`),
  CONSTRAINT `FK_SYSTME_USER_ROLE_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `system_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SYSTME_USER_ROLE_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `system_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `system_user_role` */

insert  into `system_user_role`(`id`,`user_id`,`role_id`) values (13,1006,16),(14,1000,15),(15,1002,9);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
