 -- Full oracle documentation http://docs.oracle.com/cd/E11882_01/nav/portal_4.htm

-- Find number of employee in IT department
CREATE OR REPLACE FUNCTION get_emp_count
  RETURN NUMBER
AS
  emp_count NUMBER;
  dept_id   NUMBER;
BEGIN
  SELECT dept_id
  INTO dept_id
  FROM DEPARTMENTS_PLURALSIGHT
  WHERE dept_name = 'IT';
  SELECT COUNT(*)
  INTO emp_count
  FROM employee_pluralsight
  WHERE emp_dept_id = dept_id;
  
  RETURN emp_count;
END;

BEGIN
DBMS_OUTPUT.PUT_LINE(get_emp_count());
END;
