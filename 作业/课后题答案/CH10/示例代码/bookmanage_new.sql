/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : bookmanage

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-04-08 11:12:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_book
-- ----------------------------
DROP TABLE IF EXISTS `tb_book`;
CREATE TABLE `tb_book` (
  `isbn` varchar(20) NOT NULL,
  `bookname` varchar(60) NOT NULL,
  `bookauthor` varchar(60) NOT NULL,
  `booktranslator` varchar(60) DEFAULT NULL,
  `bookpublisher` varchar(60) NOT NULL,
  `publishdate` date NOT NULL,
  `bookpage` int(10) unsigned NOT NULL,
  `bookprice` decimal(7,2) NOT NULL,
  PRIMARY KEY (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_book
-- ----------------------------

-- ----------------------------
-- Table structure for tb_bookinfo
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookinfo`;
CREATE TABLE `tb_bookinfo` (
  `bookcode` varchar(20) NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `status` varchar(5) NOT NULL,
  PRIMARY KEY (`bookcode`),
  KEY `bookinfo_isbn_fk` (`isbn`),
  CONSTRAINT `bookinfo_isbn_fk` FOREIGN KEY (`isbn`) REFERENCES `tb_book` (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_bookinfo
-- ----------------------------

-- ----------------------------
-- Table structure for tb_booklend
-- ----------------------------
DROP TABLE IF EXISTS `tb_booklend`;
CREATE TABLE `tb_booklend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bookcode` varchar(20) NOT NULL,
  `readerid` varchar(10) NOT NULL,
  `borrowdate` date NOT NULL,
  `duedate` date NOT NULL,
  `returndate` date DEFAULT NULL,
  `overdueday` int(10) unsigned DEFAULT NULL,
  `fine` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booklend_bookcode_fk` (`bookcode`),
  KEY `booklend_readerid_fk` (`readerid`),
  CONSTRAINT `booklend_bookcode_fk` FOREIGN KEY (`bookcode`) REFERENCES `tb_bookinfo` (`bookcode`),
  CONSTRAINT `booklend_readerid_fk` FOREIGN KEY (`readerid`) REFERENCES `tb_reader` (`readerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_booklend
-- ----------------------------

-- ----------------------------
-- Table structure for tb_manager
-- ----------------------------
DROP TABLE IF EXISTS `tb_manager`;
CREATE TABLE `tb_manager` (
  `manageid` varchar(20) NOT NULL,
  `managepwd` varchar(10) NOT NULL,
  PRIMARY KEY (`manageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_manager
-- ----------------------------
INSERT INTO `tb_manager` VALUES ('administrator', '12345678');

-- ----------------------------
-- Table structure for tb_reader
-- ----------------------------
DROP TABLE IF EXISTS `tb_reader`;
CREATE TABLE `tb_reader` (
  `readerid` varchar(10) NOT NULL,
  `readerpwd` varchar(8) NOT NULL,
  `readername` varchar(30) NOT NULL,
  `readergender` varchar(2) NOT NULL,
  `readerunit` varchar(50) NOT NULL,
  `readertel` varchar(20) DEFAULT NULL,
  `readerstart` date NOT NULL,
  `readerend` date NOT NULL,
  `readertype` varchar(5) NOT NULL,
  PRIMARY KEY (`readerid`),
  KEY `reader_type_fk` (`readertype`),
  CONSTRAINT `reader_type_fk` FOREIGN KEY (`readertype`) REFERENCES `tb_readertype` (`readertype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_reader
-- ----------------------------
INSERT INTO `tb_reader` VALUES ('2001340008', '87654321', '丁小峰', '男', '计算机', '18712347861', '2001-03-05', '2036-04-19', '03');
INSERT INTO `tb_reader` VALUES ('2015010001', '12312312', '刘国平', '男', '外国语', '13876541234', '2015-09-01', '2019-09-01', '01');
INSERT INTO `tb_reader` VALUES ('2015120002', '12345678', '赵一宁', '女', '古生物', '13967823414', '2015-09-01', '2018-08-01', '02');

-- ----------------------------
-- Table structure for tb_readertype
-- ----------------------------
DROP TABLE IF EXISTS `tb_readertype`;
CREATE TABLE `tb_readertype` (
  `readertype` varchar(5) NOT NULL,
  `bookamount` int(10) unsigned NOT NULL,
  `bookdays` int(10) unsigned NOT NULL,
  `dayfine` decimal(5,2) NOT NULL,
  PRIMARY KEY (`readertype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_readertype
-- ----------------------------
INSERT INTO `tb_readertype` VALUES ('01', '10', '60', '0.10');
INSERT INTO `tb_readertype` VALUES ('02', '20', '90', '0.10');
INSERT INTO `tb_readertype` VALUES ('03', '30', '150', '0.20');
