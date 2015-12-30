-- here in example we have implicit cursor

DECLARE
  row_in_test TEST%Rowtype;
  id_in_test TEST.ID%type;
BEGIN
 
 -- possible exceptions : no data found(), more than one row found

SELECT * INTO row_in_test FROM TEST WHERE ID = 1;
 DBMS_OUTPUT.put_line(row_in_test.id);
 EXCEPTION
 WHEN others THEN
 dbms_output.put_line('some exception happens');
END;