/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : db_compounding_calculator

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-04-03 13:44:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_calculate_interest
-- ----------------------------
DROP TABLE IF EXISTS `t_calculate_interest`;
CREATE TABLE `t_calculate_interest` (
  `f_sum` double(50,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_calculate_interest
-- ----------------------------

-- ----------------------------
-- Table structure for t_calculate_reward_time
-- ----------------------------
DROP TABLE IF EXISTS `t_calculate_reward_time`;
CREATE TABLE `t_calculate_reward_time` (
  `f_sum` double(50,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_calculate_reward_time
-- ----------------------------

-- ----------------------------
-- Table structure for t_compounding
-- ----------------------------
DROP TABLE IF EXISTS `t_compounding`;
CREATE TABLE `t_compounding` (
  `f_id` int(5) NOT NULL AUTO_INCREMENT,
  `f_money` varchar(50) NOT NULL,
  `f_year` varchar(50) NOT NULL,
  `f_rate` varchar(50) NOT NULL,
  `f_sum` varchar(50) NOT NULL COMMENT '总额',
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_compounding
-- ----------------------------

-- ----------------------------
-- Table structure for t_increasing_interest_investment_quota
-- ----------------------------
DROP TABLE IF EXISTS `t_increasing_interest_investment_quota`;
CREATE TABLE `t_increasing_interest_investment_quota` (
  `f_year_sum` double(50,0) NOT NULL,
  `f_month_sum` double(50,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_increasing_interest_investment_quota
-- ----------------------------

-- ----------------------------
-- Table structure for t_matching_interest_repayment_calculator
-- ----------------------------
DROP TABLE IF EXISTS `t_matching_interest_repayment_calculator`;
CREATE TABLE `t_matching_interest_repayment_calculator` (
  `f_sum` double(50,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_matching_interest_repayment_calculator
-- ----------------------------

-- ----------------------------
-- Table structure for t_principal
-- ----------------------------
DROP TABLE IF EXISTS `t_principal`;
CREATE TABLE `t_principal` (
  `f_sum` double(50,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_principal
-- ----------------------------

-- ----------------------------
-- Table structure for t_simple_interest
-- ----------------------------
DROP TABLE IF EXISTS `t_simple_interest`;
CREATE TABLE `t_simple_interest` (
  `f_sum` double(50,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_simple_interest
-- ----------------------------
