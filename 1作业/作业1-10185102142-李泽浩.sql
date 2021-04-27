/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : HW1

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 18/03/2021 19:00:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for business
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business` (
  `Customer_id` int NOT NULL,
  `Company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Credit_number` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`Company_name`),
  KEY `Customer_id` (`Customer_id`),
  CONSTRAINT `business_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business
-- ----------------------------
BEGIN;
INSERT INTO `business` VALUES (1, 'BiliBili', 2142, '1985-01-01');
COMMIT;

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
BEGIN;
INSERT INTO `customer` VALUES (1, 'PuTuo-ENCU', 'SH', 'B', 'SH', 200062);
COMMIT;

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
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `contact_number` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(20) NOT NULL,
  PRIMARY KEY (`contact_number`,`company_name`),
  KEY `company_name` (`company_name`),
  CONSTRAINT `link_ibfk_1` FOREIGN KEY (`contact_number`) REFERENCES `officer` (`Contact_number`),
  CONSTRAINT `link_ibfk_2` FOREIGN KEY (`company_name`) REFERENCES `business` (`Company_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of link
-- ----------------------------
BEGIN;
COMMIT;

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
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
