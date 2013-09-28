CREATE OR REPLACE PROCEDURE retrieve_emp_info(last_name IN VARCHAR2) AS
first varchar2(20);
last varchar2(20);
email varchar2(25);
begin 

SELECT FIRST_NAME,LAST_NAME,EMAIL INTO FIRST,LAST,EMAIL FROM EMPLOYEES WHERE LAST_NAME=retrieve_emp_info.last_name;
DBMS_OUTPUT.PUT_LINE('INFO :'||FIRST||' '||LAST||' '||EMAIL);

EXCEPTION
WHEN TOO_MANY_ROWS THEN
DBMS_OUTPUT.PUT_LINE('! TOO MANY ROWS');

WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('! NO DATA');

end;


----testing little procedure
--exec retrieve_emp_info('King') 