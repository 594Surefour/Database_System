/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50617
 Source Host           : localhost:3306
 Source Schema         : bank

 Target Server Type    : MySQL
 Target Server Version : 50617
 File Encoding         : 65001

 Date: 08/04/2021 19:18:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `C_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `P_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`C_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('BIO_101', NULL);
INSERT INTO `course` VALUES ('BIO_102', 'PHY_101');
INSERT INTO `course` VALUES ('CHE_101', 'PHY_101');
INSERT INTO `course` VALUES ('CHE_102', 'BIO_102');
INSERT INTO `course` VALUES ('PHY_101', 'BIO_101');
INSERT INTO `course` VALUES ('PHY_102', 'BIO_101');

SET FOREIGN_KEY_CHECKS = 1;
