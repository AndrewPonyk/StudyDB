DECLARE
  CURSOR all_from_test
  IS
    SELECT * FROM TEST;
  row_in_test all_from_test%rowtype;
BEGIN
  OPEN all_from_test;
  dbms_output.put_line('Display all data from test table :');
  LOOP
    FETCH all_from_test INTO row_in_test;
    EXIT
  WHEN all_from_test%notfound;
    dbms_output.put_line(row_in_test.id || ' ' || row_in_test.name);
  END LOOP;
  CLOSE all_from_test;
END;