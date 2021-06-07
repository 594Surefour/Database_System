/*
Navicat MySQL Data Transfer

Source Server         : test1
Source Server Version : 80022
Source Host           : localhost:3306
Source Database       : customer profile

Target Server Type    : MYSQL
Target Server Version : 80022
File Encoding         : 65001

Date: 2021-03-22 16:02:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for customer2
-- ----------------------------
DROP TABLE IF EXISTS `customer2`;
CREATE TABLE `customer2` (
  `Customer_id` int NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Customer_Type` char(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `Post_code` int DEFAULT NULL,
  `Credit` int DEFAULT NULL,
  `Degree` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer2
-- ----------------------------
INSERT INTO `customer2` VALUES ('1', '上海市南京西路11号1021室', '上海市', 'I', '上海市', '27027', '1200', 'J');
INSERT INTO `customer2` VALUES ('2', '上海市北京东路022号5-1880', '上海市', 'I', '上海市', '89089', '1650', 'J');
INSERT INTO `customer2` VALUES ('3', '江苏省南京市人民大道456号1-203室', '南京市', 'I', '江苏省', '3003', '2100', 'E');
INSERT INTO `customer2` VALUES ('4', '上海市中潭路100弄', '上海市', 'I', '上海市', '2002', '2625', 'E');
INSERT INTO `customer2` VALUES ('5', '浙江省杭州市江南大道19号304', '杭州市', 'I', '浙江省', '30030', '2520', 'E');
INSERT INTO `customer2` VALUES ('6', '上海市真光路962弄', '上海市', 'I', '上海市', '24023', '1980', 'J');
INSERT INTO `customer2` VALUES ('7', '上海市共富路40号', '上海市', 'I', '上海市', '18018', '1760', 'J');
INSERT INTO `customer2` VALUES ('8', '浙江省杭州市明月路303号', '杭州市', 'I', '浙江省', '30030', '2625', 'E');
INSERT INTO `customer2` VALUES ('9', '上海市同泰路56号5-44号', '上海市', 'I', '上海市', '24024', '5500', 'S');
INSERT INTO `customer2` VALUES ('10', '上海市中山北路3663号', '上海市', 'B', '上海市', '21021', '6500', 'S');
INSERT INTO `customer2` VALUES ('11', '浙江省杭州市文一西路969号', '杭州市', 'B', '浙江省', '1001', '2625', 'E');
INSERT INTO `customer2` VALUES ('12', '上海市石门一路33号', '上海市', 'B', '上海市', '21021', '1870', 'J');
INSERT INTO `customer2` VALUES ('13', '江苏省南京市诚信大道19号', '南京市', 'B', '江苏省', '12012', '2205', 'E');
