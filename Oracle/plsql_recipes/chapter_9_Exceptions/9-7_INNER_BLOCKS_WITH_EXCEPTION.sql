DECLARE
  
BEGIN
  NULL;
  
  --first block
  BEGIN
    RAISE NO_DATA_FOUND;  
    
  EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('FIRST ERROR HANDLER');
  END;
  
  DBMS_OUTPUT.PUT_LINE('123');  
  -- second block  
   BEGIN
--    RAISE_APPLICATION_ERROR(-20000,'ERROR');
  RAISE NO_DATA_FOUND;  
  EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('SECOND ERROR HANDLER');
  END;
  
  
END;