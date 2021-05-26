CREATE DATABASE school;
use school;
create table 学院(
编号 VARCHAR(10) PRIMARY KEY,
名称 VARCHAR(50) NOT NULL,
院长 VARCHAR(20) NOT NULL
);

create table 专业(
编号  VARCHAR(10) PRIMARY KEY,
专业名称 VARCHAR(50) NOT NULL,
学院编号 VARCHAR(10),
FOREIGN KEY(学院编号) REFERENCES 学院(编号)
); 
create table 班级(
编号  VARCHAR(10) PRIMARY KEY,
班长 VARCHAR(30),
专业编号 VARCHAR(10),
FOREIGN KEY(专业编号) REFERENCES 专业(编号)
); 
create table 宿舍(
编号  VARCHAR(10) PRIMARY KEY,
楼栋 VARCHAR(30) NOT NULL
); 
create table 学生(
编号  VARCHAR(10) PRIMARY KEY,
密码 VARCHAR(30) NOT NULL,
性别 VARCHAR(3),
姓名 VARCHAR(30) NOT NULL,
生日 date,
电话 VARCHAR(30),
班级编号 VARCHAR(10),
FOREIGN KEY(班级编号) REFERENCES 班级(编号)
); 
create table 住宿(
宿舍编号  VARCHAR(10),
学号 VARCHAR(10),
PRIMARY KEY(宿舍编号,学号),
FOREIGN KEY(宿舍编号) REFERENCES 宿舍(编号),
FOREIGN KEY(学号) REFERENCES 学生(编号)
); 
create table 课程(
编号  VARCHAR(10) PRIMARY KEY,
名称 VARCHAR(30) NOT NULL,
考试类型 VARCHAR(30) NOT NULL,
学分 INT,
类别 VARCHAR(30) NOT NULL
); 
create table 选课(
学号  VARCHAR(10) ,
课程编号  VARCHAR(10) ,
分数 DECIMAL(5,2),
考试时间 DATE,
考试地点 VARCHAR(30) NOT NULL,
选课时间 DATE,
PRIMARY KEY(学号,课程编号),
FOREIGN KEY(学号) REFERENCES 学生(编号),
FOREIGN KEY(课程编号) REFERENCES 课程(编号)
); 
create table 书籍(
编号 VARCHAR(10) PRIMARY KEY,
作者 VARCHAR(30) NOT NULL,
出版社 VARCHAR(30) NOT NULL,
库存 INT,
出版年份 INT,
可借数量 INT
); 
create table 借阅(
学号 VARCHAR(10),
图书编号 VARCHAR(10),
借阅日期 DATE,
归还日期 DATE,
欠费情况 DECIMAL(8,2),
PRIMARY KEY(学号,图书编号,借阅日期),
FOREIGN KEY(图书编号) REFERENCES 书籍(编号),
FOREIGN KEY(学号) REFERENCES 学生(编号)
); 
create table 教师(
编号 VARCHAR(10) PRIMARY KEY,
姓名  VARCHAR(30) NOT NULL,
邮箱  VARCHAR(50) NOT NULL,
性别 VARCHAR(3),
电话 VARCHAR(20),
薪资 DECIMAL(8,2),
生日 DATE,
密码 VARCHAR(20),
学院编号 VARCHAR(10),
FOREIGN KEY(学院编号) REFERENCES 学院(编号)
); 
CREATE TABLE 教学(
教师编号 VARCHAR(10),
课程编号  VARCHAR(10),
授课时间 date,
primary key(教师编号,课程编号,授课时间),
FOREIGN KEY(教师编号) REFERENCES 教师(编号),
FOREIGN KEY(课程编号) REFERENCES 课程(编号)
);

