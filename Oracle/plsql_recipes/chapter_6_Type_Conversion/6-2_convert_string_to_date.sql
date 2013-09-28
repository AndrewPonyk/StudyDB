DECLARE
  
  my_val DATE;
BEGIN
  my_val:=TO_DATE('2001:JAN:1','YYYY:MONTH:DD');
  
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(my_val,'YYYY:MM:DD'));
END;
/