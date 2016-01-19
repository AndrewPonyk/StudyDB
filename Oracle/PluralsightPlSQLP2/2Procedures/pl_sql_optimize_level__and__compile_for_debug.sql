alter session set PLSQL_OPTIMIZE_LEVEL=3;

SELECT *
FROM SYS.ALL_PLSQL_OBJECT_SETTINGS
where name = 'UPDATE_DEPT2';


CREATE OR REPLACE PROCEDURE update_dept2
AS
  l_emp_id employee_pluralsight.emp_id%TYPE:=10;
BEGIN
  UPDATE employee_pluralsight SET emp_dept_id=2 WHERE emp_id = l_emp_id;
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
UPDATE_DEPT2();
end;

-- call procedure without anonymous block
CALL UPDATE_DEPT2();


ALTER PROCEDURE UPDATE_DEPT2 COMPILE;
ALTER PROCEDURE UPDATE_DEPT2 COMPILE DEBUG;
commit;