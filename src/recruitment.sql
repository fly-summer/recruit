/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : recruitment

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-09-12 11:00:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `cname` varchar(16) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `tel` varchar(16) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cname`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`cname`) REFERENCES `user` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', '1', '1', '1', null);
INSERT INTO `company` VALUES ('qweqweqew', 'qwerqwer', 'qwe', '13211111111', 'qwe');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(16) DEFAULT NULL,
  `content` varchar(512) DEFAULT NULL,
  `newsTime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '1', '1', null);

-- ----------------------------
-- Table structure for `recruit`
-- ----------------------------
DROP TABLE IF EXISTS `recruit`;
CREATE TABLE `recruit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(16) DEFAULT NULL,
  `position` varchar(16) DEFAULT NULL,
  `salsry` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `recruitTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `address` varchar(16) DEFAULT NULL,
  `degree` varchar(8) DEFAULT NULL,
  `inf` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_3` (`cname`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`cname`) REFERENCES `company` (`cname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recruit
-- ----------------------------
INSERT INTO `recruit` VALUES ('1', '1', 'java工程师', '4000', '1', '2018-09-12 09:54:59', '1', '不限', '1');
INSERT INTO `recruit` VALUES ('3', '1', '前端UI', '5000', '4', '2018-09-12 10:08:22', '2', '硕士', '2');
INSERT INTO `recruit` VALUES ('4', '1', '前端UI', '4000', '3', '2018-09-12 10:08:18', '3', '大专', '3');
INSERT INTO `recruit` VALUES ('5', '1', 'java工程师', '5000', '2', '2018-09-12 10:08:25', '杭州', '大专', null);
INSERT INTO `recruit` VALUES ('6', '1', 'php', '5000', '5', '2018-09-12 10:08:30', '郑州', '学士', null);

-- ----------------------------
-- Table structure for `request`
-- ----------------------------
DROP TABLE IF EXISTS `request`;
CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `recruitId` int(11) DEFAULT NULL,
  `cname` varchar(16) DEFAULT NULL,
  `sname` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_5` (`sname`),
  KEY `FK_Reference_6` (`recruitId`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`sname`) REFERENCES `student` (`sname`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`recruitId`) REFERENCES `recruit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of request
-- ----------------------------

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sname` varchar(16) NOT NULL,
  `name` varchar(8) DEFAULT NULL,
  `sex` varchar(4) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `tel` varchar(16) DEFAULT NULL,
  `email` varchar(24) DEFAULT NULL,
  `degree` varchar(8) DEFAULT NULL,
  `position` varchar(16) DEFAULT NULL,
  `experience` varchar(512) DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`sname`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`sname`) REFERENCES `user` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('aaaa', 'aaaa', '男', '2018-09-04', '13522222222', 'example@example.com', 'a', 'a', 'a', 'a');
INSERT INTO `student` VALUES ('qwerqwer', 'qerqwer', '男', '2018-09-10', '13211111111', 'example@example.com', 'qwer', 'qwer', 'qer', 'qewr');
INSERT INTO `student` VALUES ('qwerqwerqwer', 'qwerqwer', '男', '2018-09-28', '13211111111', 'example@example.com', 'qwer', 'qwer', 'qwer', 'qwer');
INSERT INTO `student` VALUES ('QWERTY', 'qwer', '男', '2018-09-10', '13211111111', 'example@example.com', 'q', 'q', 'q', 'q');
INSERT INTO `student` VALUES ('QWERTY12', 'QWERTY', '男', '2018-09-10', '13211111111', 'example@example.com', 'q', 'q', 'q', 'q');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userName` varchar(16) NOT NULL,
  `password` char(32) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1', '1');
INSERT INTO `user` VALUES ('aaaa', '1aaaaa', '1');
INSERT INTO `user` VALUES ('qweqweqew', 'qweqweqwe12', '2');
INSERT INTO `user` VALUES ('qwerqwer', 'qwerqwer12', '1');
INSERT INTO `user` VALUES ('qwerqwerqwer', 'qwerqwerqwer12', '1');
INSERT INTO `user` VALUES ('QWERTY', 'qwerqw12', '1');
INSERT INTO `user` VALUES ('QWERTY12', 'QWERTY12', '1');
INSERT INTO `user` VALUES ('wang', '1', '1');
INSERT INTO `user` VALUES ('wang1', '1', '1');
INSERT INTO `user` VALUES ('xiaoming', '123456', '2');
INSERT INTO `user` VALUES ('xiaoming2', '123', '1');
INSERT INTO `user` VALUES ('xiaoming3', '123', '3');
INSERT INTO `user` VALUES ('xiaoming4', '123', '2');
INSERT INTO `user` VALUES ('xiaoming5', '123', '1');
