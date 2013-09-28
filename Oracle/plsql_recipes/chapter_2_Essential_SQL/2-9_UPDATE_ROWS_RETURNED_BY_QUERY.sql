--TESTING PROCEDURE
--EXEC CHANGE_EMP_DEPT(149,100);



create or replace
PROCEDURE CHANGE_EMP_DEPT(EMP_ID IN NUMBER,
                                            DEPT_ID IN NUMBER) AS
  emp_row employees%ROWTYPE;
  dept departments.department_name%type;
  rec_count number :=0;
BEGIN
    
    SELECT count(*) 
    into rec_count
    from employees
    where employee_id=emp_id;
    
    IF REC_COUNT=1 THEN
    
      SELECT * INTO EMP_ROW
      FROM EMPLOYEES 
      WHERE EMPLOYEE_ID=EMP_ID;
    
      EMP_ROW.DEPARTMENT_ID:=DEPT_ID;

     -- SELECT SYSDATE INTO EMP_ROW.HIRE_DATE FROM DUAL; 
      emp_row.hire_date:=Sysdate;
      
      UPDATE EMPLOYEES SET ROW=EMP_ROW
      
      WHERE EMPLOYEE_ID=EMP_ID;
      
        COMMIT;
      SELECT DEPARTMENT_NAME INTO DEPT 
      FROM DEPARTMENTS
      WHERE DEPARTMENT_ID=DEPT_ID;
      
      DBMS_OUTPUT.PUT_LINE('CHANGED '||EMP_ROW.FIRST_NAME||'  TO '||DEPT);
      ELSE
      DBMS_OUTPUT.PUT_LINE('NO employee with id =>'||dept_id);
      
    end IF;
    
    
END;