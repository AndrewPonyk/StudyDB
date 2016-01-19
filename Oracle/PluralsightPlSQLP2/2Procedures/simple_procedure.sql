CREATE OR REPLACE PROCEDURE update_dept
AS
  l_emp_id employee_pluralsight.emp_id%TYPE:=10;
BEGIN
  UPDATE employee_pluralsight SET emp_dept_id=3 WHERE emp_id = l_emp_id;
  COMMIT;
  dbms_output.put_line('Value has updated !!!');
EXCEPTION
WHEN OTHERS THEN
  dbms_output.put_line('Exception happens : ' || sqlerrm);
  ROLLBACK;
  RAISE;
END;


-- example of using stored procedure in anonymous block
BEGIN
UPDATE_DEPT;
end;