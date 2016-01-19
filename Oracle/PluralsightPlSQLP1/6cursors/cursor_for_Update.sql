DECLARE
  CURSOR all_from_test(row_id INTEGER)
  IS
    SELECT * FROM TEST WHERE ID = row_id FOR UPDATE nowait;
BEGIN
  FOR item IN all_from_test(1)
  LOOP
    dbms_output.put_line(item.ID);
    -- most interesting
    UPDATE TEST
    SET NAME=NAME
      ||'_0'
    WHERE CURRENT OF all_from_test;
  END LOOP;
  --COMMIT;
END;
/
