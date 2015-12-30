DECLARE
  l_number NUMBER;
BEGIN
  l_number := 100;
 
  DBMS_OUTPUT.PUT_LINE('hello, lnumer is equals to ' || L_NUMBER*2.02); -- ouput is 202
  /*
  Little comment in code
  */
EXCEPTION
WHEN OTHERS THEN
  NULL;
END;
