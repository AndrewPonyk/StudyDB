DECLARE
  --  
  
  i  NUMBER(2,0);
  i2 NUMBER(4,2); -- cant be more than 99,  for '111.4' will be error
  i3 NUMBER (5,-2); -- max value is 1234567, and will be 
  i4 NUMBER (5,1); -- max value is 9999, 
BEGIN
  
  i:= 11;
  dbms_output.put_line(i); -- 11
  
  i2 := 1.1263;
  dbms_output.put_line(i2); -- 11.13
  
  -- i2 := 111.62;
  -- dbms_output.put_line(i2); -- error
  
  i4 := 9999.3777777;
  dbms_output.put_line(i4); -- 9999.4
  
  -- i4 := 12345.1; -- error
END;