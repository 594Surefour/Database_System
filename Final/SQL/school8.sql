-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2021-06-07 11:50:37
-- 服务器版本： 10.4.18-MariaDB
-- PHP 版本： 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `school`
--

-- --------------------------------------------------------

--
-- 表的结构 `专业`
--

CREATE TABLE `专业` (
  `专业编号` varchar(15) NOT NULL,
  `专业名称` varchar(50) NOT NULL,
  `学院编号` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `专业`
--

INSERT INTO `专业` (`专业编号`, `专业名称`, `学院编号`) VALUES
('ZYBH001', '计算机科学与技术', 'XYBH001'),
('ZYBH002', '教育学', 'XYBH002'),
('ZYBH003', '心理学', 'XYBH003'),
('ZYBH004', '软件工程', 'XYBH001');

-- --------------------------------------------------------

--
-- 表的结构 `书籍`
--

CREATE TABLE `书籍` (
  `书籍编号` varchar(15) NOT NULL,
  `书籍名称` varchar(255) NOT NULL,
  `作者` varchar(30) NOT NULL,
  `出版社` varchar(30) NOT NULL,
  `库存` int(11) DEFAULT NULL,
  `出版年份` date DEFAULT NULL,
  `价格` decimal(10,3) NOT NULL DEFAULT 0.000,
  `类别` varchar(255) NOT NULL DEFAULT '',
  `可借副本数量` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `书籍`
--

INSERT INTO `书籍` (`书籍编号`, `书籍名称`, `作者`, `出版社`, `库存`, `出版年份`, `价格`, `类别`, `可借副本数量`) VALUES
('SJBH001', '反骗案中案', '常书欣', '江苏凤凰文艺出版社', 5, '2021-04-01', '12.990', '小说', 3),
('SJBH002', '还原真实的美联储', '王健', '浙江大学出版社', 5, '2013-11-01', '12.000', '经管', 2),
('SJBH003', '深入理解Java虚拟机：JVM高级特性与最佳实践（第3版）', '周志明', '机械工业出版社', 5, '2019-12-01', '64.500', '计算机', 4),
('SJBH004', '民法典与日常生活', '彭诚信', '上海人民出版社', 5, '2020-07-01', '24.000', '法律', 4);

-- --------------------------------------------------------

--
-- 表的结构 `住宿`
--

CREATE TABLE `住宿` (
  `宿舍编号` varchar(10) NOT NULL,
  `学号` varchar(10) NOT NULL,
  `床号` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `住宿`
--

INSERT INTO `住宿` (`宿舍编号`, `学号`, `床号`) VALUES
('SSBH001', 'XH001', 1),
('SSBH001', 'XH002', 2),
('SSBH001', 'XH003', 3),
('SSBH002', 'XH004', 1),
('SSBH002', 'XH005', 2),
('SSBH002', 'XH006', 3),
('SSBH003', 'XH007', 1),
('SSBH003', 'XH008', 2),
('SSBH003', 'XH009', 3),
('SSBH004', 'XH010', 1),
('SSBH004', 'XH011', 2),
('SSBH004', 'XH012', 3),
('SSBH005', 'XH013', 1),
('SSBH005', 'XH014', 2),
('SSBH005', 'XH015', 3),
('SSBH005', 'XH016', 4),
('SSBH006', 'XH017', 1),
('SSBH006', 'XH018', 2),
('SSBH006', 'XH019', 3),
('SSBH006', 'XH020', 4),
('SSBH007', 'XH021', 1),
('SSBH007', 'XH022', 2),
('SSBH007', 'XH023', 3),
('SSBH007', 'XH024', 4),
('SSBH008', 'XH025', 1),
('SSBH008', 'XH026', 2),
('SSBH008', 'XH027', 3),
('SSBH008', 'XH028', 4),
('SSBH009', 'XH029', 1),
('SSBH009', 'XH030', 2),
('SSBH009', 'XH031', 3),
('SSBH010', 'XH032', 1),
('SSBH010', 'XH033', 2),
('SSBH010', 'XH034', 3);

-- --------------------------------------------------------

--
-- 表的结构 `可借图书`
--

CREATE TABLE `可借图书` (
  `可借书籍编号` varchar(15) NOT NULL,
  `可借副本编号` varchar(15) NOT NULL,
  `学号` varchar(15) NOT NULL,
  `借书日期` date NOT NULL,
  `应还日期` date NOT NULL,
  `罚款` decimal(10,3) NOT NULL DEFAULT 0.000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `可借图书`
--

INSERT INTO `可借图书` (`可借书籍编号`, `可借副本编号`, `学号`, `借书日期`, `应还日期`, `罚款`) VALUES
('KJSJBH001', 'KJFBBH001', 'XH001', '2021-02-02', '2021-03-02', '0.000'),
('KJSJBH001', 'KJFBBH002', 'XH002', '2021-02-03', '2021-03-03', '0.000'),
('KJSJBH002', 'KJFBBH003', 'XH003', '2021-02-04', '2021-03-04', '0.000'),
('KJSJBH002', 'KJFBBH004', 'XH004', '2021-02-05', '2021-03-05', '0.000'),
('KJSJBH002', 'KJFBBH005', 'XH005', '2021-02-06', '2021-03-06', '0.000'),
('KJSJBH003', 'KJFBBH001', 'XH006', '2021-02-07', '2021-03-07', '0.000'),
('KJSJBH004', 'KJFBBH003', 'XH007', '2021-02-08', '2021-03-08', '0.000');

--
-- 触发器 `可借图书`
--
DELIMITER $$
CREATE TRIGGER `book_available` BEFORE INSERT ON `可借图书` FOR EACH ROW BEGIN
	UPDATE 书籍 SET 可借副本数量 = 可借副本数量-1 WHERE 书籍编号 = new.可借书籍编号;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `学生`
--

CREATE TABLE `学生` (
  `学号` varchar(15) NOT NULL,
  `密码` varchar(30) NOT NULL,
  `性别` varchar(3) DEFAULT NULL,
  `姓名` varchar(30) NOT NULL,
  `生日` date DEFAULT NULL,
  `电话` varchar(30) DEFAULT NULL,
  `班级编号` varchar(15) DEFAULT NULL,
  `意愿值` int(11) NOT NULL DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `学生`
--

INSERT INTO `学生` (`学号`, `密码`, `性别`, `姓名`, `生日`, `电话`, `班级编号`, `意愿值`) VALUES
('XH001', '123456', '男', '文景胜', '2020-01-01', '13733871170', 'BJBH001', 100),
('XH002', '123456', '男', '程子民', '2020-01-02', '13733871171', 'BJBH001', 100),
('XH003', '123456', '男', '黎康乐', '2020-01-03', '13733871172', 'BJBH001', 100),
('XH004', '123456', '女', '宁妙竹', '2020-01-04', '13733871173', 'BJBH001', 100),
('XH005', '123456', '女', '利凡梅', '2020-01-05', '13733871174', 'BJBH001', 100),
('XH006', '123456', '女', '蒙小星', '2020-01-06', '13733871175', 'BJBH001', 100),
('XH007', '123456', '女', '邹天玉', '2020-01-07', '13733871176', 'BJBH002', 100),
('XH008', '123456', '女', '瞿苒苒', '2020-01-08', '13733871177', 'BJBH002', 100),
('XH009', '123456', '女', '朱新梅', '2020-01-09', '13733871178', 'BJBH002', 100),
('XH010', '123456', '男', '戈星华', '2020-01-10', '13733871179', 'BJBH002', 100),
('XH011', '123456', '男', '吴丰羽', '2020-01-11', '13733871180', 'BJBH002', 100),
('XH012', '123456', '男', '贾泰宁', '2020-01-12', '13733871181', 'BJBH002', 100),
('XH013', '123456', '男', '卢成济', '2020-01-13', '13733871182', 'BJBH003', 100),
('XH014', '123456', '男', '简子实', '2020-01-14', '13733871183', 'BJBH003', 100),
('XH015', '123456', '男', '弘英杰', '2020-01-15', '13733871184', 'BJBH003', 100),
('XH016', '123456', '男', '黄和泰', '2020-01-16', '13733871185', 'BJBH003', 100),
('XH017', '123456', '女', '向元瑶', '2020-01-17', '13733871186', 'BJBH003', 100),
('XH018', '123456', '女', '刘如雪', '2020-01-18', '13733871187', 'BJBH003', 100),
('XH019', '123456', '女', '相芸英', '2020-01-19', '13733871188', 'BJBH003', 100),
('XH020', '123456', '女', '甘正清', '2020-01-20', '13733871189', 'BJBH003', 100),
('XH021', '123456', '女', '蔡姗姗', '2020-01-21', '13733871190', 'BJBH004', 100),
('XH022', '123456', '女', '毛雨彤', '2020-01-22', '13733871191', 'BJBH004', 100),
('XH023', '123456', '女', '董秀秀', '2020-01-23', '13733871192', 'BJBH004', 100),
('XH024', '123456', '女', '丁水琼', '2020-01-24', '13733871193', 'BJBH004', 100),
('XH025', '123456', '男', '董飞翔', '2020-01-25', '13733871194', 'BJBH004', 100),
('XH026', '123456', '男', '张开朗', '2020-01-26', '13733871195', 'BJBH004', 100),
('XH027', '123456', '男', '万阳炎', '2020-01-27', '13733871196', 'BJBH004', 100),
('XH028', '123456', '男', '罗伟兆', '2020-01-28', '13733871197', 'BJBH004', 100),
('XH029', '123456', '男', '田元忠', '2020-01-29', '13733871198', 'BJBH005', 100),
('XH030', '123456', '男', '白宏放', '2020-01-30', '13733871199', 'BJBH005', 100),
('XH031', '123456', '男', '吴鸿波', '2020-01-31', '13733871200', 'BJBH005', 100),
('XH032', '123456', '女', '段玉珂', '2020-02-01', '13733871201', 'BJBH005', 100),
('XH033', '123456', '女', '石燕平', '2020-02-02', '13733871202', 'BJBH005', 100),
('XH034', '123456', '女', '叶沛文', '2020-02-03', '13733871203', 'BJBH005', 100);

-- --------------------------------------------------------

--
-- 表的结构 `学院`
--

CREATE TABLE `学院` (
  `学院编号` varchar(15) NOT NULL,
  `学院名称` varchar(50) NOT NULL,
  `院长` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `学院`
--

INSERT INTO `学院` (`学院编号`, `学院名称`, `院长`) VALUES
('XYBH001', '信息学部', '胡德义'),
('XYBH002', '教育学部', '文景胜'),
('XYBH003', '心理与认知科学学院', '董思远');

-- --------------------------------------------------------

--
-- 表的结构 `宿舍`
--

CREATE TABLE `宿舍` (
  `宿舍编号` varchar(15) NOT NULL,
  `楼栋编号` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `宿舍`
--

INSERT INTO `宿舍` (`宿舍编号`, `楼栋编号`) VALUES
('SSBH001', 'LDBH001'),
('SSBH002', 'LDBH002'),
('SSBH003', 'LDBH002'),
('SSBH004', 'LDBH001'),
('SSBH005', 'LDBH001'),
('SSBH006', 'LDBH003'),
('SSBH007', 'LDBH003'),
('SSBH008', 'LDBH004'),
('SSBH009', 'LDBH004'),
('SSBH010', 'LDBH005');

-- --------------------------------------------------------

--
-- 表的结构 `开设课程`
--

CREATE TABLE `开设课程` (
  `课程编号` varchar(15) NOT NULL,
  `开课学期` varchar(255) NOT NULL,
  `课程名称` varchar(255) NOT NULL,
  `课程类别` varchar(255) DEFAULT NULL,
  `考试时间` date DEFAULT NULL,
  `考试地点` varchar(30) DEFAULT NULL,
  `选课开始时间` datetime DEFAULT NULL,
  `选课截止时间` datetime DEFAULT NULL,
  `人数上限` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `开设课程`
--

INSERT INTO `开设课程` (`课程编号`, `开课学期`, `课程名称`, `课程类别`, `考试时间`, `考试地点`, `选课开始时间`, `选课截止时间`, `人数上限`) VALUES
('KCBH001', '2021秋', '数据库', '专业必修', '2022-01-12', '教学楼', '2021-06-01 00:00:00', '2021-06-15 00:00:00', '30.00'),
('KCBH002', '2021秋', '编译原理', '专业必修', '2022-01-13', '教学楼', '2021-06-01 00:00:00', '2021-06-15 00:00:00', '30.00'),
('KCBH003', '2021秋', '数据挖掘', '专业选修', '2022-01-14', '教学楼', '2021-06-01 00:00:00', '2021-06-15 00:00:00', '30.00'),
('KCBH004', '2021秋', '操作系统', '专业必修', '2022-01-15', '教学楼', '2021-06-01 00:00:00', '2021-06-15 00:00:00', '30.00'),
('KCBH005', '2021秋', '计算机导论', '专业必修', '2022-01-16', '教学楼', '2021-06-01 00:00:00', '2021-06-15 00:00:00', '30.00'),
('KCBH006', '2021秋', '临床心理学', '专业选修', '2022-01-17', '教学楼', '2021-06-01 00:00:00', '2021-06-15 00:00:00', '30.00'),
('KCBH007', '2021秋', '发展心理学', '专业必修', '2022-01-18', '教学楼', '2021-06-01 00:00:00', '2021-06-15 00:00:00', '30.00'),
('KCBH009', '2021秋', '教育导论', '专业必修', '2022-01-19', '教学楼', '2021-06-01 00:00:00', '2021-06-15 00:00:00', '30.00');

-- --------------------------------------------------------

--
-- 表的结构 `教务`
--

CREATE TABLE `教务` (
  `教务编号` varchar(15) NOT NULL,
  `教务姓名` varchar(255) DEFAULT NULL,
  `密码` varchar(15) NOT NULL DEFAULT '12345'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `教务`
--

INSERT INTO `教务` (`教务编号`, `教务姓名`, `密码`) VALUES
('JWBH001', '须安国', '12345'),
('JWBH002', '闻向阳', '12345'),
('JWBH003', '闻向阳', '12345');

-- --------------------------------------------------------

--
-- 表的结构 `教学`
--

CREATE TABLE `教学` (
  `教师编号` varchar(10) NOT NULL,
  `课程编号` varchar(10) NOT NULL,
  `授课时间` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `教学`
--

INSERT INTO `教学` (`教师编号`, `课程编号`, `授课时间`) VALUES
('KCBH001', 'JSBH001', '周一3-4节'),
('KCBH002', 'JSBH002', '周二3-5节'),
('KCBH003', 'JSBH003', '周一7-8节'),
('KCBH004', 'JSBH004', '周五3-7节'),
('KCBH005', 'JSBH004', '周二1-2节'),
('KCBH006', 'JSBH005', '周三3-4节'),
('KCBH007', 'JSBH006', '周四3-4节'),
('KCBH009', 'JSBH008', '周四5-6节');

-- --------------------------------------------------------

--
-- 表的结构 `教师`
--

CREATE TABLE `教师` (
  `教师编号` varchar(15) NOT NULL,
  `教师姓名` varchar(30) NOT NULL,
  `邮箱` varchar(50) NOT NULL,
  `性别` varchar(3) DEFAULT NULL,
  `电话` varchar(20) DEFAULT NULL,
  `薪资` decimal(8,2) DEFAULT NULL,
  `生日` date DEFAULT NULL,
  `密码` varchar(20) DEFAULT NULL,
  `学院编号` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `教师`
--

INSERT INTO `教师` (`教师编号`, `教师姓名`, `邮箱`, `性别`, `电话`, `薪资`, `生日`, `密码`, `学院编号`) VALUES
('JSBH001', '田欣怡', '120345913@qq.com', '女', '18532194354', '12000.00', '1966-01-01', '12345', 'XYBH001'),
('JSBH002', '沈海燕', '120345914@qq.com', '女', '18532194355', '9000.00', '1966-01-02', '12345', 'XYBH001'),
('JSBH003', '毛学真', '120345915@qq.com', '男', '18532194356', '15000.00', '1966-01-03', '12345', 'XYBH001'),
('JSBH004', '宋宏博', '120345916@qq.com', '男', '18532194357', '8000.00', '1966-01-04', '12345', 'XYBH001'),
('JSBH005', '武兴学', '120345917@qq.com', '男', '18532194358', '20000.00', '1966-01-05', '12345', 'XYBH002'),
('JSBH006', '常可可', '120345918@qq.com', '女', '18532194359', '12000.00', '1966-01-06', '12345', 'XYBH002'),
('JSBH007', '谭乐水', '120345919@qq.com', '男', '18532194360', '9000.00', '1966-01-07', '12345', 'XYBH003'),
('JSBH008', '叶芹悦', '120345920@qq.com', '女', '18532194361', '16000.00', '1966-01-08', '12345', 'XYBH003');

-- --------------------------------------------------------

--
-- 表的结构 `班级`
--

CREATE TABLE `班级` (
  `班级编号` varchar(15) NOT NULL,
  `班长学号` varchar(30) DEFAULT NULL,
  `专业编号` varchar(10) DEFAULT NULL,
  `人数` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `班级`
--

INSERT INTO `班级` (`班级编号`, `班长学号`, `专业编号`, `人数`) VALUES
('BJBH001', 'XH001', 'ZYBH001', 6),
('BJBH002', 'XH007', 'ZYBH001', 6),
('BJBH003', 'XH015', 'ZYBH002', 8),
('BJBH004', 'XH028', 'ZYBH003', 8),
('BJBH005', 'XH034', 'ZYBH004', 6);

-- --------------------------------------------------------

--
-- 表的结构 `管理员`
--

CREATE TABLE `管理员` (
  `管理员编号` varchar(255) NOT NULL,
  `管理员姓名` varchar(255) DEFAULT NULL,
  `密码` varchar(255) NOT NULL DEFAULT '123456789'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `管理员`
--

INSERT INTO `管理员` (`管理员编号`, `管理员姓名`, `密码`) VALUES
('GLYBH001', '董鸿波', '12345'),
('GLYBH002', '郁秋月', '12345');

-- --------------------------------------------------------

--
-- 表的结构 `课程`
--

CREATE TABLE `课程` (
  `课程编号` varchar(10) NOT NULL,
  `课程名称` varchar(30) NOT NULL,
  `考试类型` varchar(30) NOT NULL,
  `学分` decimal(5,2) DEFAULT NULL,
  `类别` varchar(30) NOT NULL,
  `教师编号` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `课程`
--

INSERT INTO `课程` (`课程编号`, `课程名称`, `考试类型`, `学分`, `类别`, `教师编号`) VALUES
('KCBH001', '数据库', '上机', '2.00', '专业必修', 'JSBH001'),
('KCBH002', '编译原理', '上机', '3.00', '专业必修', 'JSBH002'),
('KCBH003', '数据挖掘', '项目', '2.00', '专业选修', 'JSBH003'),
('KCBH004', '操作系统', '闭卷', '2.00', '专业必修', 'JSBH004'),
('KCBH005', '计算机导论', '项目', '1.50', '专业必修', 'JSBH004'),
('KCBH006', '临床心理学', '论文', '2.00', '专业选修', 'JSBH005'),
('KCBH007', '发展心理学', '论文', '1.00', '专业必修', 'JSBH006'),
('KCBH008', '异常心理学', '论文', '2.00', '专业必修', 'JSBH005'),
('KCBH009', '教育导论', '开卷', '3.00', '专业必修', 'JSBH008'),
('KCBH010', '教育心理学', '论文', '2.00', '专业选修', 'JSBH007');

-- --------------------------------------------------------

--
-- 表的结构 `选课`
--

CREATE TABLE `选课` (
  `学号` varchar(15) NOT NULL,
  `开课编号` varchar(255) NOT NULL,
  `所投意愿值` decimal(4,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `选课`
--

INSERT INTO `选课` (`学号`, `开课编号`, `所投意愿值`) VALUES
('XH001', 'KCBH001', '0'),
('XH001', 'KCBH002', '0'),
('XH001', 'KCBH003', '0'),
('XH002', 'KCBH001', '0'),
('XH002', 'KCBH002', '0'),
('XH002', 'KCBH003', '0'),
('XH003', 'KCBH004', '0'),
('XH004', 'KCBH002', '0'),
('XH004', 'KCBH003', '0'),
('XH004', 'KCBH004', '0'),
('XH004', 'KCBH005', '0');

--
-- 触发器 `选课`
--
DELIMITER $$
CREATE TRIGGER `xuanke_del` BEFORE DELETE ON `选课` FOR EACH ROW BEGIN
 DECLARE rest INT DEFAULT 0;
 DECLARE final INT DEFAULT 0;
 DECLARE zho INT DEFAULT 0;
 SELECT 意愿值 INTO rest
 FROM 学生
 WHERE `学生`.学号 = old.学号;
 SELECT 所投意愿值 INTO final
 FROM 选课
 WHERE 选课.学号 = old.学号 and `选课`.`开课编号`=old.开课编号;
 UPDATE 学生 SET 意愿值 = final+rest WHERE 学号 = old.学号;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `xuanke_up` BEFORE UPDATE ON `选课` FOR EACH ROW BEGIN
	DECLARE rest INT DEFAULT 0;
	DECLARE final INT DEFAULT 0;
	DECLARE zho INT DEFAULT 0;
	SELECT 意愿值 INTO rest
	FROM 学生
	WHERE `学生`.学号 = new.学号;
	SELECT 所投意愿值 INTO final
	FROM 选课
	WHERE 选课.学号 = new.学号 and `选课`.`开课编号`=new.开课编号;
	UPDATE 学生 SET 意愿值 = final+rest WHERE 学号 = new.学号;
	SET zho = rest+ final;
	IF zho >= new.所投意愿值 THEN 
		SET zho = zho- new.所投意愿值;
		UPDATE 学生 SET 意愿值 = zho WHERE 学号=new.学号;
	ELSE
		
		SIGNAL SQLSTATE '46000' SET MESSAGE_TEXT = "余额不足Insufficient Balance";
	END IF;
END
$$
DELIMITER ;

--
-- 转储表的索引
--

--
-- 表的索引 `专业`
--
ALTER TABLE `专业`
  ADD PRIMARY KEY (`专业编号`),
  ADD KEY `学院编号` (`学院编号`);

--
-- 表的索引 `书籍`
--
ALTER TABLE `书籍`
  ADD PRIMARY KEY (`书籍编号`);

--
-- 表的索引 `住宿`
--
ALTER TABLE `住宿`
  ADD PRIMARY KEY (`宿舍编号`,`学号`),
  ADD KEY `学号` (`学号`);

--
-- 表的索引 `可借图书`
--
ALTER TABLE `可借图书`
  ADD PRIMARY KEY (`可借书籍编号`,`可借副本编号`);

--
-- 表的索引 `学生`
--
ALTER TABLE `学生`
  ADD PRIMARY KEY (`学号`),
  ADD KEY `班级编号` (`班级编号`);

--
-- 表的索引 `学院`
--
ALTER TABLE `学院`
  ADD PRIMARY KEY (`学院编号`);

--
-- 表的索引 `宿舍`
--
ALTER TABLE `宿舍`
  ADD PRIMARY KEY (`宿舍编号`);

--
-- 表的索引 `开设课程`
--
ALTER TABLE `开设课程`
  ADD PRIMARY KEY (`开课学期`,`课程编号`) USING BTREE,
  ADD KEY `课程编号` (`课程编号`);

--
-- 表的索引 `教务`
--
ALTER TABLE `教务`
  ADD PRIMARY KEY (`教务编号`);

--
-- 表的索引 `教学`
--
ALTER TABLE `教学`
  ADD PRIMARY KEY (`教师编号`,`课程编号`,`授课时间`),
  ADD KEY `课程编号` (`课程编号`);

--
-- 表的索引 `教师`
--
ALTER TABLE `教师`
  ADD PRIMARY KEY (`教师编号`),
  ADD KEY `学院编号` (`学院编号`);

--
-- 表的索引 `班级`
--
ALTER TABLE `班级`
  ADD PRIMARY KEY (`班级编号`),
  ADD KEY `专业编号` (`专业编号`);

--
-- 表的索引 `管理员`
--
ALTER TABLE `管理员`
  ADD PRIMARY KEY (`管理员编号`);

--
-- 表的索引 `课程`
--
ALTER TABLE `课程`
  ADD PRIMARY KEY (`课程编号`);

--
-- 表的索引 `选课`
--
ALTER TABLE `选课`
  ADD PRIMARY KEY (`学号`,`开课编号`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
