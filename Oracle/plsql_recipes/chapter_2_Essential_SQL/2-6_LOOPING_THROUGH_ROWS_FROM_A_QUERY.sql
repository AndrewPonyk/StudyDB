SET SERVEROUTPUT ON;

DECLARE 

CURSOR EMP_CUR IS 
  SELECT FIRST_NAME,LAST_NAME,EMAIL FROM EMPLOYEES;
BEGIN
  NULL;
  FOR EMP IN EMP_CUR
  LOOP
    DBMS_OUTPUT.PUT_LINE(EMP.LAST_NAME||' '||EMP.FIRST_NAME);
  END LOOP;

END;