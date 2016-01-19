DECLARE
  TYPE array_from_test IS TABLE OF VARCHAR(20) INDEX BY PLS_INTEGER ;
  arr array_from_test;
BEGIN
  
  FOR item IN (SELECT * FROM TEST) loop
    arr(item.ID) := item.name;
  end loop;

  FOR i IN arr.FIRST..arr.LAST loop
    dbms_output.put_line(arr(i));
  end loop;

end;