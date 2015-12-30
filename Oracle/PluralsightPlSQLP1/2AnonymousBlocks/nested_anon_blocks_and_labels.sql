DECLARE
  l_outer NUMBER := 100;
BEGIN
  DECLARE
    l_inner NUMBER := 101;
  BEGIN
    dbms_output.put_line('Outer variable : ' || l_outer);
    dbms_output.put_line('Inner variable : ' || l_inner);
    l_outer := l_outer * 3;
  END;
  dbms_output.put_line('IN outer block l_outer now is : ' || l_outer);
END; 