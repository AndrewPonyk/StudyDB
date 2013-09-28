DECLARE
CURSOR DRIVER IS
SELECT EE.EMPLOYEE_ID , EE.FIRST_NAME,EE.LAST_NAME,EE.SALARY,D.DEPARTMENT_NAME
FROM DEPARTMENTS D,EMPLOYEES EE
WHERE D.DEPARTMENT_ID=EE.DEPARTMENT_ID;

TYPE TOTAL_TYPE IS TABLE OF NUMBER INDEX BY DEPARTMENTS.DEPARTMENT_NAME%TYPE;

TOTALS TOTAL_TYPE;
DEPT DEPARTMENTS.DEPARTMENT_NAME%TYPE;
BEGIN
  NULL;

  FOR REC IN DRIVER LOOP
    
    IF NOT TOTALS.EXISTS(REC.DEPARTMENT_NAME) THEN
      TOTALS(REC.DEPARTMENT_NAME):=0;
    END IF;
    TOTALS(REC.DEPARTMENT_NAME):=TOTALS(REC.DEPARTMENT_NAME)+REC.SALARY;
  END LOOP;
  
  DEPT :=TOTALS.FIRST;
  LOOP  
  EXIT WHEN DEPT IS NULL;
  DBMS_OUTPUT.PUT_LINE(TOTALS(DEPT)||' '||DEPT);
  DEPT:=TOTALS.NEXT(DEPT);
  END LOOP;
END;
/