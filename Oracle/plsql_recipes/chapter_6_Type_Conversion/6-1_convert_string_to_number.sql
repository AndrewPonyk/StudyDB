DECLARE
in_dollars VARCHAR2(10):=&DOLLARS;

dollars_formatted NUMBER;
BEGIN
  DOLLARS_FORMATTED:= TO_NUMBER('1,100');
  -- DOLLARS_FORMATTED:=to_number('1,110.123456', '999G999G999D999999');
  DBMS_OUTPUT.PUT_LINE(dollars_formatted);
END;
/