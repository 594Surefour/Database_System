/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : bookshop

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2016-06-19 15:23:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `A_ID` int(11) NOT NULL auto_increment,
  `A_Name` varchar(20) default NULL,
  `A_Pwd` varchar(20) default NULL,
  `A_Type` varchar(10) default NULL,
  PRIMARY KEY  (`A_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin', '超级管理员');
INSERT INTO `admin` VALUES ('2', 'super', '123', '超级管理员');
INSERT INTO `admin` VALUES ('3', 'john', '456', '普通用户');
INSERT INTO `admin` VALUES ('14', 'lele1', '0610', '普通用户');

-- ----------------------------
-- Table structure for bookinfo
-- ----------------------------
DROP TABLE IF EXISTS `bookinfo`;
CREATE TABLE `bookinfo` (
  `B_ID` int(11) NOT NULL auto_increment,
  `B_Name` varchar(50) default NULL,
  `BT_ID` int(11) default NULL,
  `B_Author` varchar(20) default NULL,
  `B_ISBN` varchar(30) default NULL,
  `B_Publisher` varchar(30) default NULL,
  `B_Date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `B_MarketPrice` double default NULL,
  `B_SalePrice` double default NULL,
  `B_Quality` smallint(6) default NULL,
  `B_Sales` smallint(6) default NULL,
  PRIMARY KEY  (`B_ID`),
  KEY `BT_ID` (`BT_ID`),
  CONSTRAINT `bookinfo_ibfk_1` FOREIGN KEY (`BT_ID`) REFERENCES `booktype` (`BT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookinfo
-- ----------------------------
INSERT INTO `bookinfo` VALUES ('1', 'SQLServer2005编程基础', '4', '陈克力', '978-7-302-16618-4', '清华大学出版社', '2008-01-01 00:00:00', '34', '27', '5', '5');
INSERT INTO `bookinfo` VALUES ('2', 'SQLServer2005实例教程', '4', '刘志成', '978-7-121-05784-7', '电子工业出版社', '2008-02-01 00:00:00', '31', '50', '10', '3');
INSERT INTO `bookinfo` VALUES ('3', 'Java就业培训教程', '6', '张孝祥', '7-302-07295-7', '清华大学出版社', '2004-02-01 00:00:00', '39', '23', '3', '10');
INSERT INTO `bookinfo` VALUES ('4', 'ASP.NET2.0完全自学手册', '7', '张庆华', '978-7-111-20579-1', '机械工业出版社', '2008-02-01 00:00:00', '58', '46', '2', '6');
INSERT INTO `bookinfo` VALUES ('5', 'C#案例开发', '5', '孙维煜', '7-5084-2495-6', '中国水利水电出版社', '2005-01-01 00:00:00', '44', '26', '3', '3');
INSERT INTO `bookinfo` VALUES ('6', 'Visual C# 2005程序设计自学手册', '5', '王小科', '978-7-115-17289-1', '人民邮电出版社', '2008-02-01 00:00:00', '52', '42', '4', '4');
INSERT INTO `bookinfo` VALUES ('7', 'ASP.NET+SQLServer典型网站建设', '7', '武新华', '978-7-121-04220-1', '电子工业出版社', '2007-05-01 00:00:00', '35', '25', '2', '6');

-- ----------------------------
-- Table structure for booktype
-- ----------------------------
DROP TABLE IF EXISTS `booktype`;
CREATE TABLE `booktype` (
  `BT_ID` int(11) NOT NULL auto_increment,
  `BT_Name` varchar(20) default NULL,
  `BT_FatherID` int(11) default NULL,
  `BT_HaveChild` char(2) default NULL,
  PRIMARY KEY  (`BT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of booktype
-- ----------------------------
INSERT INTO `booktype` VALUES ('1', '计算机类', '0', '是');
INSERT INTO `booktype` VALUES ('2', '数据库', '1', '是');
INSERT INTO `booktype` VALUES ('3', '编程语言与程序设计', '1', '是');
INSERT INTO `booktype` VALUES ('4', 'SQL Server', '2', '否');
INSERT INTO `booktype` VALUES ('5', 'C#', '3', '否');
INSERT INTO `booktype` VALUES ('6', 'Java', '3', '否');
INSERT INTO `booktype` VALUES ('7', '.NET', '3', '否');

-- ----------------------------
-- Table structure for orderdetails
-- ----------------------------
DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE `orderdetails` (
  `OD_ID` int(11) NOT NULL auto_increment,
  `O_ID` int(11) default NULL,
  `B_ID` int(11) default NULL,
  `OD_Number` smallint(6) default NULL,
  `OD_Price` double default NULL,
  PRIMARY KEY  (`OD_ID`),
  KEY `O_ID` (`O_ID`),
  KEY `B_ID` (`B_ID`),
  CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`O_ID`) REFERENCES `orders` (`O_ID`),
  CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`B_ID`) REFERENCES `bookinfo` (`B_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderdetails
-- ----------------------------
INSERT INTO `orderdetails` VALUES ('1', '1', '1', '1', '27');
INSERT INTO `orderdetails` VALUES ('2', '1', '2', '1', '25');
INSERT INTO `orderdetails` VALUES ('3', '2', '4', '1', '46');
INSERT INTO `orderdetails` VALUES ('4', '2', '5', '2', '52');
INSERT INTO `orderdetails` VALUES ('5', '2', '6', '1', '42');
INSERT INTO `orderdetails` VALUES ('6', '3', '4', '1', '46');
INSERT INTO `orderdetails` VALUES ('7', '3', '7', '1', '25');
INSERT INTO `orderdetails` VALUES ('8', '4', '3', '1', '23');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `O_ID` int(11) NOT NULL auto_increment,
  `U_ID` int(11) default NULL,
  `O_Time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `O_Status` int(11) default NULL,
  `O_UserName` varchar(20) default NULL,
  `O_Address` varchar(50) default NULL,
  `O_PostCode` char(6) default NULL,
  `O_Email` varchar(50) default NULL,
  `O_TotalPrice` double default NULL,
  PRIMARY KEY  (`O_ID`),
  KEY `U_ID` (`U_ID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`U_ID`) REFERENCES `users` (`U_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '1', '2009-02-01 00:00:00', '0', '林丽', '和平大街12号', '110001', 'linli@163.com', '52');
INSERT INTO `orders` VALUES ('2', '1', '2009-02-01 00:00:00', '1', '林丽', '和平大街12号', '110001', 'linli@163.com', '140');
INSERT INTO `orders` VALUES ('3', '2', '2009-03-01 00:00:00', '0', 'lele', '陵东街8号', '110032', 'lele@sohu,com', '71');
INSERT INTO `orders` VALUES ('4', '3', '2009-02-02 00:00:00', '0', 'lijuan', 'aa', '112233', 'sss', '23');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `U_ID` int(11) NOT NULL auto_increment,
  `U_Name` varchar(20) default NULL,
  `U_Pwd` varchar(20) default NULL,
  `U_Sex` char(2) default NULL,
  `U_Phone` varchar(20) default NULL,
  PRIMARY KEY  (`U_ID`),
  UNIQUE KEY `U_Name` (`U_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'linli', '123456', '女', '13064276022');
INSERT INTO `users` VALUES ('2', 'lijuan', '123456', '女', '13940403838');
INSERT INTO `users` VALUES ('3', 'wangxy', '123456', '女', '024-25456368');
INSERT INTO `users` VALUES ('4', 'yanglw', '123456', '男', '024-83630204');
INSERT INTO `users` VALUES ('5', 'zhangyp', '654321', '男', '13848359090');
INSERT INTO `users` VALUES ('6', 'zhaohe', '123456', '男', '13345588666');
INSERT INTO `users` VALUES ('7', 'zhangh', '123456', '女', '13040506677');
