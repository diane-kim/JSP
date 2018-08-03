CREATE TABLE board(
i_Count NUMBER(18),
v_Name VARCHAR2(40),
d_Date DATE,
v_Title VARCHAR2(200)
);

CREATE SEQUENCE board_seq
INCREMENT BY 1
START WITH 1
NOCACHE
NOCYCLE;

select * from board;

delete from board;

select i_Count, v_Name, to_char(d_Date, 'yy-mm-dd')as d_Date, v_Title from board
order by i_Count desc;



