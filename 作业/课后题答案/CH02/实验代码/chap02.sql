create database StudentManage;
use StudentManage;
Create table Students(			//ѧ����
	Sno varchar(8) primary key,    	//ѧ��
	Sname varchar(10) not null,		//����
	Sex enum(���С�,��Ů��) default ���С�,	//�Ա�
	Department varchar(20) default �������ϵ��)	 //����ϵ
);
Create table Courses(			//�γ̱�
	Cno varchar(10) primary key,	//�γ̺�
	Cname varchar(20) not null,		//�γ�����
	Credit int not null,			//ѧ��
	Semester int not null,			//ѧ��
	Period int not null			//ѧʱ
);
Create table SC(			//�ɼ���
	Sno varchar(8) not null,		//ѧ��
	Cno varchar(10) not null ,		//�γ̺�
	Grade int not null,			//�ɼ�
	Primary key (Sno,Cno),
 Foreign key (Sno) references Students (Sno),
 Foreign key (Cno) references Courses (Cno)
);
