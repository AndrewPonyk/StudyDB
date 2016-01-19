DECLARE
  l_num PLS_INTEGER;
  name_from_test varchar(20);
BEGIN
  SELECT NAME INTO name_from_test from test WHERE ID =3;  -- 100ORA-01403: no data found

  ---1426ORA-01426: numeric overflow
  l_num := 2147483648; -- max value for PLS_INTEGER is 2147483647, if you assign number larger you'll get EXCEPTION
  dbms_output.put_line(l_num); 
  EXCEPTION
  WHEN NO_DATA_FOUND THEN 
  dbms_output.put_line('NO Data FOUND : ' || sqlcode || ' - ' || sqlerrm);
  WHEN others THEN 
  dbms_output.put_line(sqlcode || sqlerrm);
END;