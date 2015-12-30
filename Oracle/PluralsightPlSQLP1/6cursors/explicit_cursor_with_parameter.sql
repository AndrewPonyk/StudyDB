DECLARE
-- we can pass parameters into cursors
  CURSOR cur_with_par(id NUMBER)
  IS
    SELECT * FROM TEST WHERE TEST.ID=ID;
  row_in_test cur_with_par%rowtype;
BEGIN
  DBMS_OUTPUT.PUT_LINE('WE CAN PASS PARAMETERS INTO CURSOR');
  OPEN cur_with_par(2);
  fetch cur_with_par INTO row_in_test;
  DBMS_OUTPUT.PUT_LINE(row_in_test.name);
  CLOSE cur_with_par;
END;