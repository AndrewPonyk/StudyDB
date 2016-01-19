DECLARE
  i NUMBER;
BEGIN
  FOR i IN 1..10
  LOOP
    dbms_output.put_line(i);
  END LOOP;
  
  
  i:=0;
  LOOP
    i:= i+1;
    dbms_output.put_line(i);
    EXIT
  WHEN i > 10;
  END LOOP;
END;
