create database bookmanage;
use bookmanage;

create table tb_manager(
  manageid varchar(20) primary key,
  managepwd varchar(10) not null
);
insert into tb_manager values("administrator","12345678");

create table tb_readertype(
  readertype varchar(5) primary key,
  bookamount int unsigned not null,
  bookdays int unsigned not null,
  dayfine decimal(5,2) not null
);
insert into tb_readertype values("01",10,60,0.1);
insert into tb_readertype values("02",20,90,0.1);
insert into tb_readertype values("03",30,150,0.2);

create table tb_reader(
  readerid varchar(10) primary key,
  readerpwd varchar(8) not null,
  readername varchar(30) not null,
  readergender varchar(2) not null,
  readerunit varchar(50) not null,
  readertel varchar(20),
  readerstart date not null,
  readerend date not null,
  readertype varchar(5) not null,
  constraint reader_type_fk foreign key(readertype) references tb_readertype(readertype)
);
insert into tb_reader values("2015010001","12312312","刘国平","男","外国语","13876541234",
      20150901,20190901,"01");
insert into tb_reader values("2015120002","12345678","赵一宁","女","古生物","13967823414",
      20150901,20180801,"02");
insert into tb_reader values("2001340008","87654321","丁小峰","男","计算机","18712347861",
      20010305,20360419,"03");

create table tb_book(
  isbn varchar(20) primary key,
  bookname varchar(60) not null,
  bookauthor varchar(60) not null,
  booktranslator varchar(60),
  bookpublisher varchar(60) not null,
  publishdate date not null,
  bookpage int unsigned not null,
  bookprice decimal(7,2) not null
);

create table tb_bookinfo(
  bookcode varchar(20) primary key,
  isbn varchar(20) not null,
  status varchar(5) not null,
  constraint bookinfo_isbn_fk foreign key(isbn) references tb_book(isbn)
);

create table tb_booklend(
  id bigint auto_increment primary key,
  bookcode varchar(20) not null,
  readerid varchar(10) not null,
  borrowdate date not null,
  duedate date not null,
  returndate date,
  overdueday int unsigned,
  fine decimal(7,2),
  constraint booklend_bookcode_fk foreign key(bookcode) references tb_bookinfo(bookcode),
  constraint booklend_readerid_fk foreign key(readerid) references tb_reader(readerid)
);