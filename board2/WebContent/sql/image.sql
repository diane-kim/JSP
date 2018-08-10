--CREATE TABLE member
--(
--    id       VARCHAR2(30)    NOT NULL, 
--    pwd      VARCHAR2(30)    NOT NULL, 
--    email    VARCHAR2(30)    NOT NULL, 
--    phone    VARCHAR2(30)    NOT NULL, 
--    count    NUMBER(20)      NOT NULL, 
--    CONSTRAINT MEMBER_PK PRIMARY KEY (id)
--)
--/
--
--CREATE SEQUENCE member_SEQ
--START WITH 1
--INCREMENT BY 1;
--/
--
--CREATE OR REPLACE TRIGGER member_count_AI_TRG
--BEFORE INSERT ON member 
--REFERENCING NEW AS NEW FOR EACH ROW 
--BEGIN 
--    SELECT member_SEQ.NEXTVAL
--    INTO: NEW.count
--    FROM DUAL;
--END;

create table image
(
  file_count NUMBER(38),
  file_path VARCHAR2(4000),
  file_name VARCHAR2(4000)
)
CREATE SEQUENCE image_SEQ
START WITH 1
INCREMENT BY 1;

select file_name from image;

select file_name, file_title, file_content from image;

select X.rnum, X.file_count, X.file_title, X.file_content, X.file_name from (

							select rownum as rnum, A.file_count, A.file_title, A.file_content, A.file_name

							from (

							select file_count, file_title, file_content, file_name 

							from image

							order by file_count desc) A

							where rownum <= 5) X 

							where X.rnum >= 1;

delete from image;
commit;


select file_name, file_title, file_content from image where file_count = 29;

create table image
(
  file_count NUMBER(38),
  file_path VARCHAR2(4000),
  file_name VARCHAR2(4000),
  file_content VARCHAR2(4000),
  file_name2 VARCHAR2(4000)
)

CREATE SEQUENCE image_SEQ
START WITH 1
INCREMENT BY 1;

    <Resource
    	auth="Container"
    	diverClassName="oracle.jdbc.driver.OracleDriver"
    	url="jdbc:oracle:thin:@localhost:1521:xe"
    	username="hr"
    	password="hr"
    	name="jdbc/Oracle11g"
    	type="javax.sql.DataSource"
    	maxActive="50"
    	maxWait="1000"
    	/>

