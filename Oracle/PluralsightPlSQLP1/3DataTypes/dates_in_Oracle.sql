DECLARE
  d1 DATE;
  d2 DATE;
  d3 DATE;
  b1 BOOLEAN := true;
BEGIN
  d1  := '02-apr-1991';
  d2  := '03-apr-1991';
  d3 := TO_DATE('11/10/2013 14:33','MM/DD/RRRR HH24:MI');
  DBMS_OUTPUT.PUT_LINE(d3);
  
  IF d2>d1 THEN
    dbms_output.put_line('second date is larger');
  END IF;

  --dbms_output.put_line(1>2); -- IT IS PROBLEM IN PLSQL to print BOOLEAN value
  dbms_output.put_line( d1+5); -- added five days to date

END;