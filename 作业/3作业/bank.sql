/*
Navicat MySQL Data Transfer

Source Server         : test1
Source Server Version : 80022
Source Host           : localhost:3306
Source Database       : bank

Target Server Type    : MYSQL
Target Server Version : 80022
File Encoding         : 65001

Date: 2021-03-29 16:33:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `ACCOUNT_ID` int NOT NULL AUTO_INCREMENT,
  `AVAIL_BALANCE` decimal(12,4) DEFAULT NULL,
  `CLOSE_DATE` date DEFAULT NULL,
  `LAST_ACTIVITY_DATE` date DEFAULT NULL,
  `OPEN_DATE` date NOT NULL,
  `STATUS` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CUST_ID` int DEFAULT NULL,
  `OPEN_BRANCH_ID` int NOT NULL,
  `OPEN_EMP_ID` int NOT NULL,
  `PRODUCT_CD` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ACCOUNT_ID`),
  KEY `account_fk_custid` (`CUST_ID`),
  KEY `account_fk_branchid` (`OPEN_BRANCH_ID`),
  KEY `account_fk_empid` (`OPEN_EMP_ID`),
  KEY `account_fk_productid` (`PRODUCT_CD`),
  CONSTRAINT `account_fk_branchid` FOREIGN KEY (`OPEN_BRANCH_ID`) REFERENCES `branch` (`BRANCH_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_fk_custid` FOREIGN KEY (`CUST_ID`) REFERENCES `customer` (`CUST_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_fk_empid` FOREIGN KEY (`OPEN_EMP_ID`) REFERENCES `employee` (`EMP_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_fk_productid` FOREIGN KEY (`PRODUCT_CD`) REFERENCES `product` (`PRODUCT_CD`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', '1057.7500', null, '2011-01-15', '2011-01-15', '正常', '1', '2', '10', 'CS');
INSERT INTO `account` VALUES ('2', '500000.0000', null, '2011-01-15', '2011-01-15', '正常', '1', '2', '10', 'RS');
INSERT INTO `account` VALUES ('3', '300000.0000', null, '2015-06-30', '2015-06-30', '正常', '1', '2', '10', 'CD');
INSERT INTO `account` VALUES ('4', '2258.0200', null, '2013-03-12', '2012-03-12', '正常', '2', '2', '10', 'CS');
INSERT INTO `account` VALUES ('5', '2000000.0000', null, '2012-03-12', '2012-03-12', '正常', '2', '2', '10', 'RS');
INSERT INTO `account` VALUES ('7', '1057.7500', null, '2014-11-23', '2013-11-23', '正常', '3', '3', '13', 'CS');
INSERT INTO `account` VALUES ('8', '650000.0000', null, '2013-12-15', '2013-12-15', '正常', '3', '3', '13', 'RS');
INSERT INTO `account` VALUES ('10', '59934.1200', null, '2014-09-12', '2014-09-12', '正常', '4', '1', '1', 'CS');
INSERT INTO `account` VALUES ('11', '650600.0000', null, '2011-01-15', '2011-01-15', '正常', '4', '1', '1', 'RS');
INSERT INTO `account` VALUES ('12', '67800.0000', null, '2015-09-30', '2015-09-30', '正常', '4', '1', '1', 'CD');
INSERT INTO `account` VALUES ('13', '340023.0000', null, '2015-01-27', '2015-01-27', '正常', '5', '4', '16', 'RS');
INSERT INTO `account` VALUES ('14', '3330000.0000', null, '2013-08-24', '2013-08-24', '正常', '6', '1', '1', 'RS');
INSERT INTO `account` VALUES ('15', '15000.0000', null, '2015-12-28', '2015-12-28', '正常', '6', '1', '1', 'MRT');
INSERT INTO `account` VALUES ('17', '5000.0000', null, '2015-01-12', '2015-01-12', '正常', '7', '2', '10', 'RS');
INSERT INTO `account` VALUES ('18', '3487.0000', null, '2012-05-23', '2012-05-23', '正常', '8', '4', '16', 'RS');
INSERT INTO `account` VALUES ('19', '15000.0000', null, '2012-05-23', '2012-05-23', '正常', '8', '4', '16', 'MRT');
INSERT INTO `account` VALUES ('21', '125.6700', null, '2014-07-30', '2014-07-30', '正常', '9', '1', '1', 'CS');
INSERT INTO `account` VALUES ('22', '9345.0000', null, '2015-10-28', '2015-10-28', '正常', '9', '1', '1', 'RS');
INSERT INTO `account` VALUES ('23', '15000.0000', null, '2015-06-30', '2015-06-30', '正常', '9', '1', '1', 'MRT');
INSERT INTO `account` VALUES ('24', '203575.0000', null, '2013-09-30', '2013-09-30', '正常', '10', '2', '16', 'BDA');
INSERT INTO `account` VALUES ('25', '503292.0000', null, '2013-10-01', '2013-10-01', '正常', '10', '2', '16', 'GDA');
INSERT INTO `account` VALUES ('27', '119345.0000', null, '2015-03-22', '2015-03-22', '正常', '11', '4', '10', 'BDA');
INSERT INTO `account` VALUES ('28', '38552.0000', null, '2019-04-02', '2014-07-30', '正常', '12', '1', '16', 'BDA');
INSERT INTO `account` VALUES ('29', '200000.0000', null, '2015-02-22', '2015-02-22', '正常', '13', '3', '13', 'SBL');

-- ----------------------------
-- Table structure for acc_transaction
-- ----------------------------
DROP TABLE IF EXISTS `acc_transaction`;
CREATE TABLE `acc_transaction` (
  `TXN_ID` bigint NOT NULL AUTO_INCREMENT,
  `AMOUNT` decimal(12,4) NOT NULL,
  `TXN_DATE` datetime NOT NULL,
  `TXN_TYPE_CD` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ACCOUNT_ID` int DEFAULT NULL,
  `EXECUTION_BRANCH_ID` int DEFAULT NULL,
  `TELLER_EMP_ID` int DEFAULT NULL,
  PRIMARY KEY (`TXN_ID`),
  KEY `acc_transaction_fk_accountid` (`ACCOUNT_ID`),
  KEY `acc_transaction_fk_branchid` (`EXECUTION_BRANCH_ID`),
  KEY `acc_transaction_fk_empid` (`TELLER_EMP_ID`),
  CONSTRAINT `acc_transaction_fk_accountid` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `account` (`ACCOUNT_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `acc_transaction_fk_branchid` FOREIGN KEY (`EXECUTION_BRANCH_ID`) REFERENCES `branch` (`BRANCH_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `acc_transaction_fk_empid` FOREIGN KEY (`TELLER_EMP_ID`) REFERENCES `employee` (`EMP_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of acc_transaction
-- ----------------------------
INSERT INTO `acc_transaction` VALUES ('1', '1057.7500', '2011-01-15 00:00:00', 'CD', '1', '2', '10');
INSERT INTO `acc_transaction` VALUES ('2', '500000.0000', '2011-01-15 00:00:00', 'CD', '2', '2', '10');
INSERT INTO `acc_transaction` VALUES ('3', '650600.0000', '2011-01-15 00:00:00', 'CD', '11', '1', '1');
INSERT INTO `acc_transaction` VALUES ('4', '2200.0000', '2012-03-12 00:00:00', 'CD', '4', '2', '10');
INSERT INTO `acc_transaction` VALUES ('5', '2000000.0000', '2012-03-12 00:00:00', 'CD', '5', '2', '10');
INSERT INTO `acc_transaction` VALUES ('6', '3487.0000', '2012-05-23 00:00:00', 'CD', '18', '4', '16');
INSERT INTO `acc_transaction` VALUES ('7', '15000.0000', '2012-05-23 00:00:00', 'LI', '19', '4', '16');
INSERT INTO `acc_transaction` VALUES ('8', '58.0200', '2013-03-12 00:00:00', 'IC', '4', '2', null);
INSERT INTO `acc_transaction` VALUES ('9', '3330000.0000', '2013-08-24 00:00:00', 'CD', '14', '1', '1');
INSERT INTO `acc_transaction` VALUES ('10', '203575.0000', '2013-09-30 00:00:00', 'CD', '24', '2', '16');
INSERT INTO `acc_transaction` VALUES ('11', '503292.0000', '2013-10-01 00:00:00', 'CD', '25', '2', '16');
INSERT INTO `acc_transaction` VALUES ('12', '57.7500', '2013-11-23 00:00:00', 'IC', '7', '3', null);
INSERT INTO `acc_transaction` VALUES ('13', '1000.0000', '2013-11-23 00:00:00', 'CD', '7', '3', '13');
INSERT INTO `acc_transaction` VALUES ('14', '650000.0000', '2013-12-15 00:00:00', 'CD', '8', '3', '13');
INSERT INTO `acc_transaction` VALUES ('15', '125.6700', '2014-07-30 00:00:00', 'CD', '21', '1', '1');
INSERT INTO `acc_transaction` VALUES ('16', '30000.0000', '2014-07-30 00:00:00', 'CD', '28', '1', '16');
INSERT INTO `acc_transaction` VALUES ('17', '59934.1200', '2014-09-12 00:00:00', 'CD', '10', '1', '1');
INSERT INTO `acc_transaction` VALUES ('18', '5000.0000', '2015-01-12 00:00:00', 'CD', '17', '2', '10');
INSERT INTO `acc_transaction` VALUES ('19', '340023.0000', '2015-01-27 00:00:00', 'CD', '13', '4', '16');
INSERT INTO `acc_transaction` VALUES ('20', '200000.0000', '2015-02-22 00:00:00', 'LI', '29', '3', null);
INSERT INTO `acc_transaction` VALUES ('21', '119345.0000', '2015-03-22 00:00:00', 'CD', '27', '4', '10');
INSERT INTO `acc_transaction` VALUES ('22', '300000.0000', '2015-06-30 00:00:00', 'CD', '3', '2', '10');
INSERT INTO `acc_transaction` VALUES ('23', '15000.0000', '2015-06-30 00:00:00', 'LI', '23', '1', null);
INSERT INTO `acc_transaction` VALUES ('24', '67800.0000', '2015-09-30 00:00:00', 'CD', '12', '1', '1');
INSERT INTO `acc_transaction` VALUES ('25', '9345.0000', '2015-10-28 00:00:00', 'CD', '22', '1', '1');
INSERT INTO `acc_transaction` VALUES ('26', '15000.0000', '2015-12-28 00:00:00', 'LI', '15', '1', null);
INSERT INTO `acc_transaction` VALUES ('27', '8552.0000', '2019-04-02 00:00:00', 'CD', '28', '1', '16');

-- ----------------------------
-- Table structure for branch
-- ----------------------------
DROP TABLE IF EXISTS `branch`;
CREATE TABLE `branch` (
  `BRANCH_ID` int NOT NULL AUTO_INCREMENT,
  `ADDRESS` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CITY` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NAME` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `PROVICIAL_REGION` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `POSTAL_CODE` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`BRANCH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of branch
-- ----------------------------
INSERT INTO `branch` VALUES ('1', '上海市银城中路168号', '上海市', '上海市总行', '上海市', '021021');
INSERT INTO `branch` VALUES ('2', '上海市复兴中路369号', '上海市', '建国支行', '上海市', '021021');
INSERT INTO `branch` VALUES ('3', '江苏省南京市北京东路22号', '南京市', '南京分行', '江苏省', '011011');
INSERT INTO `branch` VALUES ('4', '浙江省杭州市庆春路138号', '杭州市', '杭州分行', '浙江省', '111111');

-- ----------------------------
-- Table structure for business
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business` (
  `INCORP_DATE` date DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `CREDIT_CODE` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `CUST_ID` int NOT NULL,
  KEY `business_fk_custid` (`CUST_ID`),
  CONSTRAINT `business_fk_custid` FOREIGN KEY (`CUST_ID`) REFERENCES `customer` (`CUST_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of business
-- ----------------------------
INSERT INTO `business` VALUES ('1951-10-16', '华东师范大学', '12100000425006133D', '10');
INSERT INTO `business` VALUES ('1999-01-01', '阿里巴巴集团有限公司', '91330100716105852F', '11');
INSERT INTO `business` VALUES ('1984-04-16', '上海汽车集团股份有限公司', '91310000132260250X', '12');
INSERT INTO `business` VALUES ('2001-02-28', '南瑞集团有限公司', '913201911348723659', '13');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `CUST_ID` int NOT NULL AUTO_INCREMENT,
  `ADDRESS` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CITY` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CUST_TYPE_CD` varchar(1) COLLATE utf8mb4_general_ci NOT NULL,
  `PROVICIAL_REGION` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `POSTAL_CODE` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`CUST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '上海市南京西路11号1021室', '上海市', 'I', '上海市', '027027');
INSERT INTO `customer` VALUES ('2', '上海市北京东路022号5-1880', '上海市', 'I', '上海市', '089089');
INSERT INTO `customer` VALUES ('3', '江苏省南京市人民大道456号1-203室', '南京市', 'I', '江苏省', '003003');
INSERT INTO `customer` VALUES ('4', '上海市中潭路100弄', '上海市', 'I', '上海市', '002002');
INSERT INTO `customer` VALUES ('5', '浙江省杭州市江南大道19号304', '杭州市', 'I', '浙江省', '030030');
INSERT INTO `customer` VALUES ('6', '上海市真光路962弄', '上海市', 'I', '上海市', '024023');
INSERT INTO `customer` VALUES ('7', '上海市共富路40号', '上海市', 'I', '上海市', '018018');
INSERT INTO `customer` VALUES ('8', '浙江省杭州市明月路303号', '杭州市', 'I', '浙江省', '030030');
INSERT INTO `customer` VALUES ('9', '上海市同泰路56号5-44号', '上海市', 'I', '上海市', '024024');
INSERT INTO `customer` VALUES ('10', '上海市中山北路3663号', '上海市', 'B', '上海市', '021021');
INSERT INTO `customer` VALUES ('11', '浙江省杭州市文一西路969号', '杭州市', 'B', '浙江省', '001001');
INSERT INTO `customer` VALUES ('12', '上海市石门一路33号', '上海市', 'B', '上海市', '021021');
INSERT INTO `customer` VALUES ('13', '江苏省南京市诚信大道19号', '南京市', 'B', '江苏省', '012012');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `DEPT_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`DEPT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '营业部');
INSERT INTO `department` VALUES ('2', '信贷部');
INSERT INTO `department` VALUES ('3', '综合管理部');
INSERT INTO `department` VALUES ('4', '信息科技部');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `EMP_ID` int NOT NULL AUTO_INCREMENT,
  `END_DATE` date DEFAULT NULL,
  `FIRST_NAME` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `LAST_NAME` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `START_DATE` date NOT NULL,
  `TITLE` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ASSIGNED_BRANCH_ID` int DEFAULT NULL,
  `DEPT_ID` int DEFAULT NULL,
  `SUPERIOR_EMP_ID` int DEFAULT NULL,
  PRIMARY KEY (`EMP_ID`),
  KEY `employee_fk_branchid` (`ASSIGNED_BRANCH_ID`),
  KEY `employee_fk_deptid` (`DEPT_ID`),
  KEY `employee_fk_empid` (`SUPERIOR_EMP_ID`),
  CONSTRAINT `employee_fk_branchid` FOREIGN KEY (`ASSIGNED_BRANCH_ID`) REFERENCES `branch` (`BRANCH_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_fk_deptid` FOREIGN KEY (`DEPT_ID`) REFERENCES `department` (`DEPT_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_fk_empid` FOREIGN KEY (`SUPERIOR_EMP_ID`) REFERENCES `employee` (`EMP_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', null, '元源', '赵', '2001-06-22', '行长', '1', '3', null);
INSERT INTO `employee` VALUES ('2', null, '学冬', '钱', '2002-09-12', '副行长', '1', '3', '1');
INSERT INTO `employee` VALUES ('3', null, '家雨', '孙', '2000-02-09', '财务主管', '1', '3', '1');
INSERT INTO `employee` VALUES ('4', null, '易枫', '李', '2002-04-24', '营业部主管', '1', '1', '3');
INSERT INTO `employee` VALUES ('5', null, '一维', '周', '2003-11-14', '信贷部主管', '1', '2', '4');
INSERT INTO `employee` VALUES ('6', null, '新', '吴', '2004-03-17', '出纳主任', '1', '1', '4');
INSERT INTO `employee` VALUES ('7', null, '楷', '郑', '2004-09-15', '出纳员', '1', '1', '6');
INSERT INTO `employee` VALUES ('8', null, '瓯', '王', '2002-12-02', '出纳员', '1', '1', '6');
INSERT INTO `employee` VALUES ('9', null, '龚', '冯', '2002-05-03', '出纳员', '1', '1', '6');
INSERT INTO `employee` VALUES ('10', null, '易', '陈', '2002-07-27', '出纳主任', '2', '1', '4');
INSERT INTO `employee` VALUES ('11', null, '健超', '诸', '2000-10-23', '出纳员', '2', '1', '10');
INSERT INTO `employee` VALUES ('12', null, '振', '卫', '2003-01-08', '出纳员', '2', '1', '10');
INSERT INTO `employee` VALUES ('13', null, '琴琴', '蒋', '2000-05-11', '出纳主任', '3', '1', '4');
INSERT INTO `employee` VALUES ('14', null, '藤', '沈', '2002-08-09', '出纳员', '3', '1', '13');
INSERT INTO `employee` VALUES ('15', null, '虹', '韩', '2003-04-01', '出纳员', '3', '1', '13');
INSERT INTO `employee` VALUES ('16', null, '天宝', '杨', '2001-03-15', '出纳主任', '4', '1', '4');
INSERT INTO `employee` VALUES ('17', null, '欣', '朱', '2002-06-29', '出纳员', '4', '1', '16');
INSERT INTO `employee` VALUES ('18', null, '海陆', '秦', '2002-12-12', '出纳员', '4', '1', '16');

-- ----------------------------
-- Table structure for individual
-- ----------------------------
DROP TABLE IF EXISTS `individual`;
CREATE TABLE `individual` (
  `ID_NUMBER` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `BIRTH_DATE` date DEFAULT NULL,
  `FIRST_NAME` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `LAST_NAME` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `CUST_ID` int NOT NULL,
  PRIMARY KEY (`CUST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of individual
-- ----------------------------
INSERT INTO `individual` VALUES ('350403198204222299', '1982-04-22', '青', '尤', '1');
INSERT INTO `individual` VALUES ('41032619780815564X', '1978-08-15', '文强', '许', '2');
INSERT INTO `individual` VALUES ('370900196802069281', '1968-02-06', '婕', '何', '3');
INSERT INTO `individual` VALUES ('450881196612220768', '1966-12-22', '东', '吕', '4');
INSERT INTO `individual` VALUES ('320623197108259227', '1971-08-25', '珊珊', '施', '5');
INSERT INTO `individual` VALUES ('210905197209140068', '1972-09-14', '晓', '张', '6');
INSERT INTO `individual` VALUES ('321111197703197600', '1977-03-19', '庆东', '孔', '7');
INSERT INTO `individual` VALUES ('654322197707011988', '1977-07-01', '方', '曹', '8');
INSERT INTO `individual` VALUES ('320623197806169227', '1978-06-16', '匡', '严', '9');

-- ----------------------------
-- Table structure for officer
-- ----------------------------
DROP TABLE IF EXISTS `officer`;
CREATE TABLE `officer` (
  `OFFICER_ID` int NOT NULL AUTO_INCREMENT,
  `END_DATE` date DEFAULT NULL,
  `FIRST_NAME` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `LAST_NAME` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `START_DATE` date NOT NULL,
  `TITLE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CUST_ID` int DEFAULT NULL,
  PRIMARY KEY (`OFFICER_ID`),
  KEY `officer_fk_custid` (`CUST_ID`),
  CONSTRAINT `officer_fk_custid` FOREIGN KEY (`CUST_ID`) REFERENCES `customer` (`CUST_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of officer
-- ----------------------------
INSERT INTO `officer` VALUES ('1', null, '哨', '华', '2005-05-01', '校长', '10');
INSERT INTO `officer` VALUES ('2', null, '歌', '金', '2001-01-01', '董事长', '11');
INSERT INTO `officer` VALUES ('3', null, '俊杰', '魏', '2002-06-30', '董事长', '12');
INSERT INTO `officer` VALUES ('4', null, '海桥', '陶', '2005-05-01', '董事长', '13');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `PRODUCT_CD` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `DATE_OFFERED` date DEFAULT NULL,
  `DATE_RETIRED` date DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `PRODUCT_TYPE_CD` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_CD`),
  KEY `PRODUCT_CD` (`PRODUCT_CD`),
  KEY `product_fk_producttypecd` (`PRODUCT_TYPE_CD`),
  CONSTRAINT `product_fk_producttypecd` FOREIGN KEY (`PRODUCT_TYPE_CD`) REFERENCES `product_type` (`PRODUCT_TYPE_CD`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('BDA', '2000-01-01', null, '企业基本存款账户', 'ACCOUNT');
INSERT INTO `product` VALUES ('CD', '2000-01-01', null, '个人通知存款账户', 'ACCOUNT');
INSERT INTO `product` VALUES ('CS', '2000-01-01', null, '个人活期储蓄账户', 'ACCOUNT');
INSERT INTO `product` VALUES ('GDA', '2000-01-01', null, '企业一般存款账户', 'ACCOUNT');
INSERT INTO `product` VALUES ('MRT', '2000-01-01', null, '汽车贷款', 'LOAN');
INSERT INTO `product` VALUES ('RS', '2000-01-01', null, '个人定期存款账户', 'ACCOUNT');
INSERT INTO `product` VALUES ('SBL', '2000-01-01', null, '小型商业贷款', 'LOAN');

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type` (
  `PRODUCT_TYPE_CD` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_TYPE_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of product_type
-- ----------------------------
INSERT INTO `product_type` VALUES ('ACCOUNT', '存款');
INSERT INTO `product_type` VALUES ('INSURANCE', '保险');
INSERT INTO `product_type` VALUES ('LOAN', '贷款');
