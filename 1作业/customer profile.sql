/*
Navicat MySQL Data Transfer

Source Server         : test1
Source Server Version : 80022
Source Host           : localhost:3306
Source Database       : customer profile

Target Server Type    : MYSQL
Target Server Version : 80022
File Encoding         : 65001

Date: 2021-03-15 16:25:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for business
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business` (
  `Customer_id` int DEFAULT NULL,
  `Company_name` varchar(255) DEFAULT NULL,
  `Credit_number` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  KEY `Customer_id` (`Customer_id`),
  CONSTRAINT `business_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business
-- ----------------------------
INSERT INTO `business` VALUES ('1', 'BiliBili', '2142', '1985-01-01');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `Customer_id` int NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Province` varchar(255) DEFAULT NULL,
  `Customer_Type` varchar(255) DEFAULT NULL,
  `Post_code` int DEFAULT NULL,
  PRIMARY KEY (`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', 'PuTuo-ENCU', 'SH', 'B', 'SH', '200062');

-- ----------------------------
-- Table structure for individual
-- ----------------------------
DROP TABLE IF EXISTS `individual`;
CREATE TABLE `individual` (
  `ID` int DEFAULT NULL,
  `Birthday` date DEFAULT NULL,
  `Last_name` varchar(255) DEFAULT NULL,
  `First_name` varchar(255) DEFAULT NULL,
  `Customer_id` int NOT NULL,
  PRIMARY KEY (`Customer_id`),
  CONSTRAINT `individual_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of individual
-- ----------------------------

-- ----------------------------
-- Table structure for officer
-- ----------------------------
DROP TABLE IF EXISTS `officer`;
CREATE TABLE `officer` (
  `Contact_number` int NOT NULL,
  `over_date` date DEFAULT NULL,
  `Last_name` varchar(255) DEFAULT NULL,
  `Frist_name` varchar(255) DEFAULT NULL,
  `Start_date` date DEFAULT NULL,
  `Job_name` varchar(255) DEFAULT NULL,
  `Customer_number` int DEFAULT NULL,
  PRIMARY KEY (`Contact_number`),
  KEY `Customer_number` (`Customer_number`),
  CONSTRAINT `officer_ibfk_1` FOREIGN KEY (`Customer_number`) REFERENCES `customer` (`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of officer
-- ----------------------------
INSERT INTO `officer` VALUES ('1', '2020-03-15', 'zehao', 'li', '2021-03-15', 'operator', '1');
