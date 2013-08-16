/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : taskmanager

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2013-07-25 00:07:00
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `task`
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` int(50) unsigned NOT NULL auto_increment,
  `taskName` varchar(255) NOT NULL COMMENT '任务名称',
  `taskInfo` varchar(255) default NULL COMMENT '任务信息',
  `creat_Time` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '任务创建时间',
  `finish_Time` datetime default NULL COMMENT '完成时间',
  `taskType` int(10) NOT NULL default '0' COMMENT '任务状态 0：未开始；  1：进行中；  2：完成；  -1：冻结。',
  `play_Time` datetime default NULL COMMENT '计划完成时间',
  `taskMaker` varchar(32) default NULL COMMENT '任务发起人',
  `rank` int(10) default '0' COMMENT '任务权重',
  `taskPercent` int(10) default '1' COMMENT '任务完成度',
  `pid` int(10) NOT NULL default '0' COMMENT '0',
  PRIMARY KEY  (`id`,`taskName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('1', '任务一', 'first', '2013-06-17 18:03:27', null, '0', '2013-06-18 17:17:42', '戴晓芬', '0', '1', '0');
INSERT INTO `task` VALUES ('2', '任务二', 'second', '2013-06-23 13:31:17', null, '0', '2013-06-19 17:18:11', '戴晓芬', '3', '1', '0');
INSERT INTO `task` VALUES ('3', '任务三', 'third', '2013-06-23 13:32:04', null, '0', '2013-06-20 17:18:48', '戴晓芬', '5', '1', '0');
INSERT INTO `task` VALUES ('4', '任务四', 'forth', '2013-06-23 21:15:04', null, '1', '2013-06-26 13:32:28', '王岩', '5', '40', '0');
INSERT INTO `task` VALUES ('5', '任务五', 'fifth', '2013-06-23 21:15:02', null, '1', '2013-06-28 13:33:21', '王岩', '2', '50', '0');
INSERT INTO `task` VALUES ('6', '任务六更新', 'sixth更新', '2013-07-14 22:12:13', null, '-1', '2013-06-29 00:00:00', '戴晓芬', '0', '30', '0');
INSERT INTO `task` VALUES ('7', '任务七', 'seventh', '2013-06-23 21:14:55', null, '-1', '2013-06-27 13:35:44', '王岩', '1', '70', '0');
INSERT INTO `task` VALUES ('8', '任务八', 'eighth', '2013-06-23 21:14:47', '2013-06-28 13:38:12', '2', '2013-06-27 13:38:03', '戴晓芬', '5', '100', '0');
INSERT INTO `task` VALUES ('9', '任务九', 'ninth', '2013-06-23 21:14:48', '2013-06-26 13:39:41', '2', '2013-06-25 13:39:47', '王岩', '2', '100', '0');
INSERT INTO `task` VALUES ('13', '任务十', 'tenth', '2013-07-01 16:15:43', null, '0', null, '戴晓芬', '2', '1', '0');
INSERT INTO `task` VALUES ('154', 'newafef453453efe', 'newfasfasfagergrwefwef', '2013-07-12 15:54:26', null, '0', '2013-07-19 00:00:00', '郭听潮', '0', '72', '0');
INSERT INTO `task` VALUES ('155', 'test好的', 'testh好的', '2013-07-12 16:20:25', null, '0', '2013-07-19 00:00:00', '郭听潮', '0', '25', '0');
INSERT INTO `task` VALUES ('156', '新任务 ', '234234', '2013-07-11 15:45:32', null, '0', '2013-07-17 00:00:00', '王岩', '4', '1', '0');
INSERT INTO `task` VALUES ('157', '信息任务', '信息任务', '2013-07-15 22:58:23', null, '0', '2013-07-15 00:00:00', '戴晓芬', '3', '1', '0');
INSERT INTO `task` VALUES ('158', '任务二1', 'second1', '2013-07-24 21:44:41', null, '0', '2013-07-25 21:44:08', '戴晓芬', '4', '1', '2');
INSERT INTO `task` VALUES ('159', '任务二2', 'second1', '2013-07-24 21:45:34', null, '0', '2013-07-26 21:45:13', '戴晓芬', '2', '1', '2');
