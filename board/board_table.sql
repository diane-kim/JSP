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

delete from board;
commit;

select count(*)as a from board;
select i_Count, v_Name, to_char(d_Date, 'yy-mm-dd') as d_Date, v_Title from board order by i_Count desc;

select rownum as rnum, A.i_Count, A.v_Name, A.v_Title, A.d_Date;

delete from board where i_Count = 9;
commit;

from (

    select i_Count, v_Name, v_Title, d_Date

    from board

    order by d_Date) A

where rownum between 2 and 3;
--where rownum >= 2 and rownum <= 3; 이방법은 안좋음

    select X.rnum, X.i_Count, X.v_Name, X.v_Title, X.d_Date
    
      from (
            
            select rownum as rnum, A.i_Count, A.v_Name, A.v_Title, A.d_Date
            
              from (
                     
                     select i_Count, v_Name, v_Title, d_Date
                     
                       from board
                     
                      order by i_Count desc) A
            
             where rownum <= 10) X
    
     where X.rnum >= 1;



create or replace procedure Page_list(startPage IN NUMBER,
                                      endPage   IN NUMBER) is
  cursor Page_list_cursor is
  
    select X.rnum, X.i_Count, X.v_Name, X.v_Title, X.d_Date
    
      from (
            
            select rownum as rnum, A.i_Count, A.v_Name, A.v_Title, A.d_Date
            
              from (
                     
                     select i_Count, v_Name, v_Title, d_Date
                     
                       from board
                     
                      order by d_Date desc) A
            
             where rownum <= endPage) X
    
     where X.rnum >= startPage;

begin

end;




