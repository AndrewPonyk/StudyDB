DECLARE

  STR VARCHAR2(20):='andrew9999@ukr.net';
  PATTERN VARCHAR2(20):='\D';
  MAILPATTERN VARCHAR2(20):='\w+@\w+(\.\w+)+';
BEGIN
  NULL;
  DBMS_OUTPUT.PUT_LINE(REGEXP_COUNT(STR,MAILPATTERN));
  

END;
/