DECLARE
TYPE my_test_cursor_type IS REF CURSOR RETURN TEST%rowtype; -- IF WE DIDNT specify RETURN .. , it will be weakly typed cursor
myvar   my_test_cursor_type;
myvar1   my_test_cursor_type; -- we will assign one cursor to another !!!
testrow test%rowtype;
BEGIN
 
 -- first use of myvar
 OPEN myvar FOR SELECT * FROM TEST;
 
 loop
  fetch myvar INTO testrow;
  exit WHEN myvar%notfound;
  dbms_output.put_line(testrow.id || ' ' || testrow.name);
 END loop;
 
 -- secound use of myvar
 OPEN myvar FOR SELECT * FROM TEST 
 where id = 2;
 
 dbms_output.put_line('---');
 dbms_output.put_line('Display values from cursor which we reopen');
 myvar1 := myvar; -- ASSIGN cursor variable
 loop 
  fetch myvar1 INTO testrow;
  exit WHEN myvar%notfound; 
  dbms_output.put_line(testrow.id || '      ' || testrow.name);
 end loop;
 
 close myvar;
END;
