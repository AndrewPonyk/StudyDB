DECLARE
  CURSOR test_cur
  IS
    SELECT * FROM TEST;
BEGIN
  FOR item IN test_cur -- simple and elegant way to iterate through cursor in PL/SQL
  -- advantages : 1) Implicit variable of cursor%rowtype type, 2)Compact 3) Automatic close and open
  LOOP
    dbms_output.put_line(item.id);
  END LOOP;
  dbms_output.put_line('---------------------------');
  -- example  of using 'for' and implicit cursor
  FOR item IN
  (SELECT * FROM TEST
  )
  LOOP
    dbms_output.put_line(item.NAME);
  END LOOP;
END;