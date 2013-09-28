DECLARE
MYEXCEPTION EXCEPTION;
BEGIN
  DBMS_OUTPUT.PUT_LINE('BEFORE MYEXCEPTION');
  --RAISE MYEXCEPTION;
  DBMS_OUTPUT.PUT_LINE('AFTER MYEXCEPTION');

  EXCEPTION
  WHEN MYEXCEPTION THEN
  DBMS_OUTPUT.PUT_LINE('MYEXCEPTION RAISED');  
END;
/