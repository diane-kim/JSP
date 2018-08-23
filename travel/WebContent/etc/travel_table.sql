create table image
(
  id NUMBER(38),
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
pw number not null,
phone VARCHAR2(50) not null,
address VARCHAR2(200) not null,
gender number not null,
name VARCHAR2(30) not null,
email VARCHAR2(100) not null,
member_date date default sysdate
);

create sequence subscribe_seq
start with 1
increment by 1
maxvalue 200;
 
create sequence image_SEQ;


