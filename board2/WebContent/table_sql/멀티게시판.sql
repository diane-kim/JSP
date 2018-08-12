create table member (
code number(20) not null,
id varchar2(30) primary key,
pwd varchar2(30) not null,
name varchar2(30) not null,
email varchar2(40) not null,
phone1 varchar2(10) not null, phone2 varchar2(10) not null, phone3 varchar2(10) not null);

create sequence member_seq;

insert into member values(
member_seq.nextval, 'admin', 'admin', '������', 'admin@xxx.xx', '010', '0000', '0000');

create table QnAboard(
  qa_id NUMBER(4) primary key,
  qa_name VARCHAR2(20),
  qa_subject varchar2(100),
  qa_content varchar2(300),
  qa_date Timestamp default sysdate ,
  qa_read number(4),
  qa_replyCount number(4),
  qa_pwd varchar2(12));
  
create table ReplyBoard(
  re_id NUMBER(4) PRIMARY KEY,
  re_name varchar2(20),
  re_content varchar2(300),
  re_date   Timestamp default sysdate,
  re_group NUMBER(4),
  re_step NUMBER(4),
  re_indent NUMBER(4),
  qa_id NUMBER(4),
  constraint qa_id FOREIGN KEY(qa_id) REFERENCES QnAboard(qa_id));
  
  create sequence qna_board_sequence;
  create sequence reply_board_sequence;
  
create table image
(
  file_count NUMBER(38),
  file_path VARCHAR2(4000),
  file_name VARCHAR2(4000),
  file_title VARCHAR2(4000),
  file_content VARCHAR2(4000),
  file_name2 VARCHAR2(4000)
);

CREATE SEQUENCE image_SEQ
START WITH 1
INCREMENT BY 1;

alter table QnAboard add(write_id varchar2(20));

create table board
(
  i_count number(18),
  v_name varchar2(40),
  d_date date,
  v_title varchar2(4000),
  v_content varchar2(4000),
  file_name varchar2(4000),
  file_path varchar2(4000)
);

CREATE SEQUENCE board_SEQ
START WITH 1
INCREMENT BY 1;


ora-12519 에러 발생시 was 를 끊고
sqld 에서 conn / as sysdba
alter system set processes=500 scope=spfile;
commit;

  