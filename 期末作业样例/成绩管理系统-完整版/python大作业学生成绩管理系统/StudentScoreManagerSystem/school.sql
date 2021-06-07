/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50626
 Source Host           : localhost:3306
 Source Schema         : school

 Target Server Type    : MySQL
 Target Server Version : 50626
 File Encoding         : 65001

 Date: 16/12/2020 20:32:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '1');
INSERT INTO `admin` VALUES ('111', '111');
INSERT INTO `admin` VALUES ('123', '123');
INSERT INTO `admin` VALUES ('admin', '123');
INSERT INTO `admin` VALUES ('geliang', '666');
INSERT INTO `admin` VALUES ('test', '123');
INSERT INTO `admin` VALUES ('你猜', '321');
INSERT INTO `admin` VALUES ('啦啦啦', '555');
INSERT INTO `admin` VALUES ('张三', '3');
INSERT INTO `admin` VALUES ('李四', '4');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `dno` int(11) NOT NULL,
  `department` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '杭电信工');
INSERT INTO `department` VALUES (1501, '计算机科学与技术');
INSERT INTO `department` VALUES (1504, '管理学院');
INSERT INTO `department` VALUES (1507, '软件工程');
INSERT INTO `department` VALUES (1508, '网络工程');
INSERT INTO `department` VALUES (1509, '物联网');
INSERT INTO `department` VALUES (1510, '测试学院');
INSERT INTO `department` VALUES (1511, '会计学院');
INSERT INTO `department` VALUES (1512, '英语学院');
INSERT INTO `department` VALUES (1513, '机械学院');
INSERT INTO `department` VALUES (1514, '小猫学院');
INSERT INTO `department` VALUES (1516, '小狗学院');
INSERT INTO `department` VALUES (1517, '恐龙学院');
INSERT INTO `department` VALUES (1518, '蛋黄派学院');
INSERT INTO `department` VALUES (1519, '羊肉串学院');
INSERT INTO `department` VALUES (1520, '青山湖学院');
INSERT INTO `department` VALUES (1521, '格致楼学院');
INSERT INTO `department` VALUES (1522, '笃行楼学院');
INSERT INTO `department` VALUES (1523, 'A学院');
INSERT INTO `department` VALUES (1524, 'B学院');
INSERT INTO `department` VALUES (1525, 'C学院');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logintime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 167 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (123, 'admin', '2019-6-1 16:50:55');
INSERT INTO `log` VALUES (124, 'admin', '2019-6-6 14:12:6');
INSERT INTO `log` VALUES (125, 'admin', '2019-6-7 16:27:3');
INSERT INTO `log` VALUES (126, 'admin', '2019-6-7 16:41:24');
INSERT INTO `log` VALUES (127, 'admin', '2019-6-7 16:53:49');
INSERT INTO `log` VALUES (128, 'admin', '2019-6-7 17:31:17');
INSERT INTO `log` VALUES (129, 'admin', '2019-6-7 17:32:12');
INSERT INTO `log` VALUES (130, 'admin', '2019-6-7 17:35:52');
INSERT INTO `log` VALUES (131, 'admin', '2019-6-7 17:36:24');
INSERT INTO `log` VALUES (132, 'admin', '2019-6-7 17:36:50');
INSERT INTO `log` VALUES (133, 'admin', '2019-6-7 17:45:8');
INSERT INTO `log` VALUES (134, 'admin', '2019-6-7 17:49:8');
INSERT INTO `log` VALUES (135, 'admin', '2019-6-8 1:33:23');
INSERT INTO `log` VALUES (136, 'admin', '2019-6-8 14:14:20');
INSERT INTO `log` VALUES (137, 'admin', '2019-6-8 14:15:16');
INSERT INTO `log` VALUES (138, 'admin', '2019-6-8 14:15:37');
INSERT INTO `log` VALUES (139, 'admin', '2019-6-8 14:16:41');
INSERT INTO `log` VALUES (140, 'admin', '2019-6-8 14:16:56');
INSERT INTO `log` VALUES (141, 'admin', '2019-6-8 14:36:11');
INSERT INTO `log` VALUES (142, 'admin', '2019-6-8 14:49:41');
INSERT INTO `log` VALUES (143, 'admin', '2019-6-8 14:50:20');
INSERT INTO `log` VALUES (144, 'admin', '2019-6-8 20:38:39');
INSERT INTO `log` VALUES (145, 'admin', '2019-6-11 0:38:9');
INSERT INTO `log` VALUES (146, 'admin', '2019-6-12 18:10:9');
INSERT INTO `log` VALUES (147, 'admin', '2019-6-12 19:0:17');
INSERT INTO `log` VALUES (148, 'admin', '2019-6-12 19:32:40');
INSERT INTO `log` VALUES (149, 'admin', '2019-6-12 20:28:14');
INSERT INTO `log` VALUES (150, 'admin', '2019-6-12 20:36:16');
INSERT INTO `log` VALUES (151, 'admin', '2019-6-12 21:13:33');
INSERT INTO `log` VALUES (152, 'admin', '2019-6-12 23:6:53');
INSERT INTO `log` VALUES (153, 'admin', '2019-6-13 0:9:27');
INSERT INTO `log` VALUES (154, 'admin', '2019-6-13 0:19:28');
INSERT INTO `log` VALUES (155, 'admin', '2019-6-13 1:24:49');
INSERT INTO `log` VALUES (156, 'admin', '2019-6-13 1:47:26');
INSERT INTO `log` VALUES (157, 'admin', '2019-6-13 8:34:24');
INSERT INTO `log` VALUES (158, 'admin', '2019-6-13 8:44:53');
INSERT INTO `log` VALUES (159, 'admin', '2019-6-13 8:58:3');
INSERT INTO `log` VALUES (160, 'admin', '2019-6-13 8:58:56');
INSERT INTO `log` VALUES (161, 'admin', '2019-6-13 11:12:6');
INSERT INTO `log` VALUES (162, 'admin', '2019-6-13 11:13:38');
INSERT INTO `log` VALUES (163, 'admin', '2019-6-13 17:15:58');
INSERT INTO `log` VALUES (164, 'admin', '2019-6-15 23:15:7');
INSERT INTO `log` VALUES (165, 'admin', '2019-6-15 23:19:36');
INSERT INTO `log` VALUES (166, 'admin', '2019-6-15 23:54:47');

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `mno` int(11) NOT NULL AUTO_INCREMENT,
  `mname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业名',
  `department` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`mno`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87978790 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES (2222, '嗯嗯', '电子与计算机学院');
INSERT INTO `major` VALUES (4444, '艺术', '电子与计算机学院');
INSERT INTO `major` VALUES (5645, '啦啦啦', '电子与计算机学院');
INSERT INTO `major` VALUES (33333, '玩儿', '电子与计算机学院');
INSERT INTO `major` VALUES (41234, '快乐', '电子与计算机学院');
INSERT INTO `major` VALUES (111111, '额', '电子与计算机学院');
INSERT INTO `major` VALUES (150101, '软件工程', '电子与计算机学院');
INSERT INTO `major` VALUES (150102, '计算机科学与技术', '电子与计算机学院');
INSERT INTO `major` VALUES (150103, '电子信息工程', '电子与计算机学院');
INSERT INTO `major` VALUES (150104, '自动化', '电子与计算机学院');
INSERT INTO `major` VALUES (150105, '信息工程', '电子与计算机学院');
INSERT INTO `major` VALUES (150108, '暗室逢灯', '文传学院');
INSERT INTO `major` VALUES (87978789, '哈哈哈', '艺术学院');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `sno` int(11) NOT NULL,
  `sname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `saddress` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭住址',
  `mname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `cname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '1', '男', '杭州', '软件工程', '软件工程151');
INSERT INTO `student` VALUES (2, '2', '男', '杭州', '软件工程', '软件工程151');
INSERT INTO `student` VALUES (111, '葛二麻子', '男', '杭州', '软件工程', '软件工程154');
INSERT INTO `student` VALUES (122, 'AAA', '男', '杭州', '软件工程', '软件工程151');
INSERT INTO `student` VALUES (123, 'BBB', '男', '浙江', '软件工程', '软件工程151');
INSERT INTO `student` VALUES (2222, '奥黛丽赫本', '女', '北京', '软件工程', '软件工程151');
INSERT INTO `student` VALUES (3333, '李四', '男', '上海', '软件工程', '软件工程152');
INSERT INTO `student` VALUES (11111, 'CCC', '男', '浙江', '软件工程', '软件工程151');
INSERT INTO `student` VALUES (20160101, '建军', '男', '西藏', '软件工程', '软件工程151');
INSERT INTO `student` VALUES (20170101, '张三', '女', '台湾', '软件工程', '软件工程152');
INSERT INTO `student` VALUES (20180101, '王五', '男', '香港', '软件工程', '软件工程151');
INSERT INTO `student` VALUES (189051010, '小红', '女', '澳门', '软件工程', '软件工程151');

-- ----------------------------
-- Table structure for student_score
-- ----------------------------
DROP TABLE IF EXISTS `student_score`;
CREATE TABLE `student_score`  (
  `sid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sdept` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `chinese` float(5, 2) NOT NULL,
  `math` float(5, 2) NOT NULL,
  `english` float(5, 2) NOT NULL,
  `average_score` float(5, 2) NOT NULL,
  `classmate_score` float(5, 2) NOT NULL,
  `teacher_score` float(5, 2) NOT NULL,
  `total_score` float(5, 2) NOT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student_score
-- ----------------------------
INSERT INTO `student_score` VALUES ('1815925213', '张三', '信息学院', 86.00, 87.00, 87.00, 86.67, 92.00, 89.00, 87.67);
INSERT INTO `student_score` VALUES ('1815925233', '李四', '信息学院', 95.00, 91.00, 70.00, 85.33, 88.00, 80.00, 84.53);
INSERT INTO `student_score` VALUES ('1815925324', '王五', '信息学院', 88.00, 80.00, 85.00, 84.33, 92.00, 87.00, 85.63);
INSERT INTO `student_score` VALUES ('1815925435', '赵六', '信息学院', 83.00, 97.00, 78.00, 86.00, 91.00, 79.00, 85.10);
INSERT INTO `student_score` VALUES ('1815925507', '孙七', '信息学院', 84.00, 85.00, 77.00, 82.00, 91.00, 83.00, 83.10);
INSERT INTO `student_score` VALUES ('1815925544', '周八', '信息学院', 83.00, 82.00, 82.00, 82.33, 92.00, 81.00, 83.03);
INSERT INTO `student_score` VALUES ('1815925554', '吴九', '信息学院', 85.00, 91.00, 82.00, 86.00, 86.00, 78.00, 84.40);
INSERT INTO `student_score` VALUES ('1815925558', '郑十', '信息学院', 74.00, 88.00, 84.00, 82.00, 90.00, 81.00, 82.60);
INSERT INTO `student_score` VALUES ('1815925575', '十一', '信息学院', 90.00, 80.00, 83.00, 84.33, 84.00, 80.00, 83.43);
INSERT INTO `student_score` VALUES ('1815925579', '十二', '信息学院', 83.00, 72.00, 83.00, 79.33, 91.00, 78.00, 80.23);
INSERT INTO `student_score` VALUES ('1815925581', '十三', '信息学院', 78.00, 76.00, 85.00, 79.67, 90.00, 78.00, 80.37);
INSERT INTO `student_score` VALUES ('1815925595', '十四', '信息学院', 84.00, 80.00, 75.00, 79.67, 90.00, 81.00, 80.97);
INSERT INTO `student_score` VALUES ('1815925596', '十五', '信息学院', 82.00, 61.00, 81.00, 74.67, 89.00, 80.00, 77.17);
INSERT INTO `student_score` VALUES ('1815925602', '十六', '信息学院', 100.00, 73.00, 78.00, 83.67, 86.00, 80.00, 83.17);
INSERT INTO `student_score` VALUES ('1815925607', '十七', '信息学院', 77.00, 82.00, 78.00, 79.00, 89.00, 78.00, 79.80);
INSERT INTO `student_score` VALUES ('1815925609', '十八', '信息学院', 77.00, 82.00, 76.00, 78.33, 94.00, 84.00, 81.03);
INSERT INTO `student_score` VALUES ('1815925612', '十九', '信息学院', 77.00, 76.00, 79.00, 77.33, 90.00, 78.00, 78.73);
INSERT INTO `student_score` VALUES ('1815925624', '二十', '信息学院', 70.00, 90.00, 77.00, 79.00, 91.00, 82.00, 80.80);
INSERT INTO `student_score` VALUES ('1831050398', '阮相歌', '信息学院', 100.00, 100.00, 99.00, 99.67, 100.00, 100.00, 99.77);

-- ----------------------------
-- Table structure for teacher_login
-- ----------------------------
DROP TABLE IF EXISTS `teacher_login`;
CREATE TABLE `teacher_login`  (
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher_login
-- ----------------------------
INSERT INTO `teacher_login` VALUES ('111111', '111111');
INSERT INTO `teacher_login` VALUES ('1122334', '123456');
INSERT INTO `teacher_login` VALUES ('123456', '123456');
INSERT INTO `teacher_login` VALUES ('12345678', '12345678');

-- ----------------------------
-- Table structure for theclass
-- ----------------------------
DROP TABLE IF EXISTS `theclass`;
CREATE TABLE `theclass`  (
  `cno` int(11) NOT NULL,
  `cname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业名',
  `mname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of theclass
-- ----------------------------
INSERT INTO `theclass` VALUES (1, '无敌一班', '计算机科学与技术');
INSERT INTO `theclass` VALUES (2, '最帅二班', '电气工程及其自动化');
INSERT INTO `theclass` VALUES (3, '霸气三班', '物联网工程');
INSERT INTO `theclass` VALUES (4, '四班', '软件工程');
INSERT INTO `theclass` VALUES (5, '五班', '信息工程');
INSERT INTO `theclass` VALUES (6, '六班', '法学');
INSERT INTO `theclass` VALUES (7, '七班', '软件工程');
INSERT INTO `theclass` VALUES (8, '八班', '物联网工程');
INSERT INTO `theclass` VALUES (9, '九班', '商务英语');
INSERT INTO `theclass` VALUES (10, '欢乐十班', '物联网工程');
INSERT INTO `theclass` VALUES (11, '浮点数', '法学');
INSERT INTO `theclass` VALUES (12, '测试测试输出', '软件工程');
INSERT INTO `theclass` VALUES (13, '时代', '电气工程及其自动化');
INSERT INTO `theclass` VALUES (14, '手打', '软件工程');
INSERT INTO `theclass` VALUES (111, '臭豆腐', '软件工程');

SET FOREIGN_KEY_CHECKS = 1;
