DECLARE 
  EMPS EMPDATA.EMPS_TYPE ;
BEGIN
  EMPS :=EMPDATA.GET_EMP_DATA;
  
  
  FOR I IN 1..107 LOOP
    DBMS_OUTPUT.PUT_LINE( EMPS(I).FIRST_NAME );
  END LOOP;
  
END;