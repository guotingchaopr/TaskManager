/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : taskmanager

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2013-07-25 00:07:17
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(20) unsigned NOT NULL auto_increment,
  `uname` varchar(255) NOT NULL,
  `upass` varchar(255) NOT NULL,
  `flag` int(11) default '1',
  `role` int(11) default '1',
  `create_time` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`,`uname`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `uname` (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('6', '郭听潮', '123', '1', '99', '2013-06-13 15:46:52');
INSERT INTO `user` VALUES ('7', '于桂琦', '123', '1', '1', '2013-06-17 15:59:41');
INSERT INTO `user` VALUES ('8', '王世伟', '123', '1', '1', '2013-06-17 17:14:21');
INSERT INTO `user` VALUES ('9', '戴晓芬', '123', '1', '1', '2013-07-09 10:32:33');
INSERT INTO `user` VALUES ('10', '王岩', '123', '1', '1', '2013-07-09 10:32:41');
INSERT INTO `user` VALUES ('11', '美分', '123', '1', '1', '2013-07-09 10:32:55');
INSERT INTO `user` VALUES ('12', '五毛', '123', '1', '1', '2013-07-09 10:33:03');
