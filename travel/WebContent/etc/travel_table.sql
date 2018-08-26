create table image
(
  key NUMBER(38),
  path VARCHAR2(4000),
  title VARCHAR2(4000),
  content VARCHAR2(4000),
  thumnail VARCHAR2(4000),
  detail VARCHAR2(4000),
  price VARCHAR2(4000),
  hits VARCHAR2(4000)  
);

create table contact_information (
  name varchar2(40) not null primary key,
  mail varchar2(60) not null,
  message varchar2(4000) not null
);

create table subscribe (
  no number primary key,
  submail varchar2(60) not null
);

create table member ( 
id VARCHAR2(30) primary key,
pw VARCHAR2(30) not null,
phone VARCHAR2(50) not null,
address VARCHAR2(200) not null,
gender number not null,
name VARCHAR2(30) not null,
email VARCHAR2(100) not null,
member_date date default sysdate
);


create table searchData(
key NUMBER,
fromName VARCHAR2(4000),
toName VARCHAR2(4000),
title VARCHAR2(4000),
content VARCHAR2(4000),
hits NUMBER
);

create table imageList(
toName VARCHAR2(4000),
imageName VARCHAR2(4000)
);

create sequence searchData_SEQ;
create sequence imageList_SEQ;

create sequence subscribe_seq; 
create sequence image_SEQ;

insert into SEARCHDATA values(searchdata_seq.nextval, '런던', 'good', 'very good', 0);

insert into IMAGELIST values('런던','런던1.png');
insert into IMAGELIST values('런던','런던2.png');
insert into IMAGELIST values('런던','런던3.png');
insert into IMAGELIST values('런던','런던4.png');

select * from imagelist;
select * from SEARCHDATA;



