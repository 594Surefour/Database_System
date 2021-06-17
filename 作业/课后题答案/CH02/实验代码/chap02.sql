create database StudentManage;
use StudentManage;
Create table Students(			//学生表
	Sno varchar(8) primary key,    	//学号
	Sname varchar(10) not null,		//姓名
	Sex enum(‘男’,’女’) default ‘男’,	//性别
	Department varchar(20) default ‘计算机系’)	 //所在系
);
Create table Courses(			//课程表
	Cno varchar(10) primary key,	//课程号
	Cname varchar(20) not null,		//课程名称
	Credit int not null,			//学分
	Semester int not null,			//学期
	Period int not null			//学时
);
Create table SC(			//成绩表
	Sno varchar(8) not null,		//学号
	Cno varchar(10) not null ,		//课程号
	Grade int not null,			//成绩
	Primary key (Sno,Cno),
 Foreign key (Sno) references Students (Sno),
 Foreign key (Cno) references Courses (Cno)
);
