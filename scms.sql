/*
Navicat MySQL Data Transfer

Source Server         : 本地MySQL
Source Server Version : 50171
Source Host           : localhost:3306
Source Database       : scms

Target Server Type    : MYSQL
Target Server Version : 50171
File Encoding         : 65001

Date: 2018-02-25 14:16:53
*/

DROP DATABASE IF EXISTS `scms`;
CREATE DATABASE `scms` DEFAULT CHARACTER SET utf8;
USE scms;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for code
-- ----------------------------
DROP TABLE IF EXISTS `code`;
CREATE TABLE `code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codename` varchar(255) NOT NULL,
  `filepath` varchar(255) NOT NULL,
  `intro` varchar(255) DEFAULT NULL,
  `owner` int(11) NOT NULL,
  `addTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_code_user` (`owner`),
  CONSTRAINT `fk_code_user` FOREIGN KEY (`owner`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `role` int(11) NOT NULL DEFAULT '2',
  `registerTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Allen', '123456', '1', '2018-02-25 14:15:34');
INSERT INTO `user` VALUES ('2', 'Jack', '112233', '2', '2018-02-25 14:15:47');
INSERT INTO `user` VALUES ('3', 'Rose', '223344', '2', '2018-02-25 14:15:57');