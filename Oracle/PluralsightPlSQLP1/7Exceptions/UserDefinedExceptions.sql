DECLARE
  name_from_test                   VARCHAR (20);
  not_contains_some_word EXCEPTION;
BEGIN
  SELECT NAME INTO name_from_test FROM TEST WHERE ID = 2;
  IF name_from_test LIKE '%some%' THEN
    dbms_output.put_line('Value contains "some"  =>:' ||name_from_test);
  ELSE
    raise not_contains_some_word;
  END IF;
  dbms_output.put_line(name_from_test);
  EXCEPTION
  WHEN not_contains_some_word THEN
  dbms_output.put_line('not_contains_some_word HAPPENS )))');
END;