-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2021-06-01 13:39:31
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

-- --------------------------------------------------------

--
-- 表的结构 `书籍`
--

CREATE TABLE `书籍` (
  `书籍编号` varchar(15) NOT NULL,
  `作者` varchar(30) NOT NULL,
  `出版社` varchar(30) NOT NULL,
  `库存` int(11) DEFAULT NULL,
  `出版年份` date DEFAULT NULL,
  `价格` decimal(10,3) NOT NULL DEFAULT 0.000,
  `类别` varchar(255) NOT NULL DEFAULT '',
  `可借副本数量` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `住宿`
--

CREATE TABLE `住宿` (
  `宿舍编号` varchar(10) NOT NULL,
  `学号` varchar(10) NOT NULL,
  `床号` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `可借图书`
--

CREATE TABLE `可借图书` (
  `可借书籍编号` varchar(15) NOT NULL,
  `可借副本编号` int(11) NOT NULL,
  `学号` varchar(15) NOT NULL,
  `借书日期` date NOT NULL,
  `应还日期` date NOT NULL,
  `罚款` decimal(10,3) NOT NULL DEFAULT 0.000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- 表的结构 `学院`
--

CREATE TABLE `学院` (
  `学院编号` varchar(15) NOT NULL,
  `学院名称` varchar(50) NOT NULL,
  `院长` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `宿舍`
--

CREATE TABLE `宿舍` (
  `宿舍编号` varchar(15) NOT NULL,
  `楼栋编号` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
('02', '1998', '222', NULL, NULL, NULL, NULL, NULL, NULL),
('01', '2001', '111', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `教务`
--

CREATE TABLE `教务` (
  `教务编号` varchar(15) NOT NULL,
  `教务姓名` varchar(255) DEFAULT NULL,
  `密码` varchar(15) NOT NULL DEFAULT '12345'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `教学`
--

CREATE TABLE `教学` (
  `教师编号` varchar(10) NOT NULL,
  `课程编号` varchar(10) NOT NULL,
  `授课时间` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- 表的结构 `管理员`
--

CREATE TABLE `管理员` (
  `管理员编号` varchar(255) NOT NULL,
  `管理员姓名` varchar(255) DEFAULT NULL,
  `密码` varchar(255) NOT NULL DEFAULT '123456789'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `授课老师` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  ADD PRIMARY KEY (`可借书籍编号`);

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
