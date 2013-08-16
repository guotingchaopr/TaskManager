/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : taskmanager

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2013-07-25 00:07:09
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_user_task`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_task`;
CREATE TABLE `t_user_task` (
  `id` int(50) unsigned NOT NULL auto_increment,
  `tid` int(50) NOT NULL COMMENT '任务id',
  `uid` int(50) NOT NULL COMMENT '用户id',
  `messageType` int(10) NOT NULL default '0' COMMENT '显示信息状态，0表示显示，-1不显示',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_task
-- ----------------------------
INSERT INTO `t_user_task` VALUES ('1', '1', '7', '-1');
INSERT INTO `t_user_task` VALUES ('2', '2', '6', '-1');
INSERT INTO `t_user_task` VALUES ('3', '2', '7', '-1');
INSERT INTO `t_user_task` VALUES ('4', '3', '8', '-1');
INSERT INTO `t_user_task` VALUES ('5', '3', '6', '-1');
INSERT INTO `t_user_task` VALUES ('6', '4', '6', '-1');
INSERT INTO `t_user_task` VALUES ('7', '4', '7', '-1');
INSERT INTO `t_user_task` VALUES ('8', '5', '8', '-1');
INSERT INTO `t_user_task` VALUES ('9', '5', '7', '-1');
INSERT INTO `t_user_task` VALUES ('10', '6', '6', '-1');
INSERT INTO `t_user_task` VALUES ('11', '6', '7', '-1');
INSERT INTO `t_user_task` VALUES ('12', '7', '8', '-1');
INSERT INTO `t_user_task` VALUES ('13', '8', '7', '-1');
INSERT INTO `t_user_task` VALUES ('14', '8', '8', '-1');
INSERT INTO `t_user_task` VALUES ('20', '8', '6', '-1');
INSERT INTO `t_user_task` VALUES ('138', '154', '8', '-1');
INSERT INTO `t_user_task` VALUES ('139', '154', '6', '-1');
INSERT INTO `t_user_task` VALUES ('140', '155', '7', '-1');
INSERT INTO `t_user_task` VALUES ('141', '156', '7', '-1');
INSERT INTO `t_user_task` VALUES ('142', '156', '6', '-1');
INSERT INTO `t_user_task` VALUES ('143', '154', '10', '-1');
INSERT INTO `t_user_task` VALUES ('144', '154', '11', '-1');
INSERT INTO `t_user_task` VALUES ('145', '155', '9', '-1');
INSERT INTO `t_user_task` VALUES ('146', '155', '6', '-1');
INSERT INTO `t_user_task` VALUES ('147', '6', '10', '-1');
INSERT INTO `t_user_task` VALUES ('148', '6', '12', '-1');
INSERT INTO `t_user_task` VALUES ('149', '157', '7', '-1');
INSERT INTO `t_user_task` VALUES ('150', '157', '12', '-1');
INSERT INTO `t_user_task` VALUES ('151', '157', '10', '-1');
