----SPECIFICATION
--CREATE OR REPLACE PACKAGE process_employee_time IS
--  total_employee_salary NUMBER;
--  
--  PROCEDURE INCREASE_WAGE(EMPNO IN NUMBER,
--                                          PCT_INCREASE IN NUMBER,
--                                          UPPER_BOUND IN NUMBER);
--  
--  PROCEDURE increase_raises (pct_icrease IN NUMBER ,
--                              upper_bound IN NUMBER);
--
--END;
-----------------------




create or replace
PACKAGE BODY process_employee_time IS


    PROCEDURE INCREASE_RAISES  (pct_increase IN NUMBER ,
                                  upper_bound IN NUMBER)IS 
      CURSOR EMP_CUR IS 
      SELECT EMPLOYEE_ID , FIRST_NAME,LAST_NAME
      FROM EMPLOYEES;
    BEGIN
        DBMS_OUTPUT.PUT_LINE(total_employee_salary||'<- TEST VALUE FROM INIT BLOCK');
        FOR EMP_REC IN EMP_CUR LOOP
            INCREASE_WAGE(EMP_REC.EMPLOYEE_ID,PCT_INCREASE,UPPER_BOUND);
            NULL;
          END LOOP;
    END ;
    
    PROCEDURE INCREASE_WAGE(EMPNO IN NUMBER,
                                          PCT_INCREASE IN NUMBER,
                                          UPPER_BOUND IN NUMBER)AS
  
    EMP_COUNT NUMBER:=0;
    emp_sal EMPLOYEES.SALARY%TYPE;

    RESULTS VARCHAR2(50);
    BEGIN

      SELECT SALARY
      INTO EMP_SAL
      FROM EMPLOYEES
      WHERE EMPLOYEE_ID=EMPNO;
  
      IF EMP_SAL<UPPER_BOUND AND
          ROUND(EMP_SAL+ EMP_SAL*PCT_INCREASE,2 )<UPPER_BOUND THEN
      
      UPDATE EMPLOYEES 
      SET SALARY=ROUND(EMP_SAL+ EMP_SAL*PCT_INCREASE,2 )
      WHERE EMPLOYEE_ID=EMPNO;
      
      RESULTS:='SUCCESSFUL INCREASE';
      ELSE
      RESULTS:='TO MUCH';
      END IF;
  
      DBMS_OUTPUT.PUT_LINE(RESULTS);
      EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('N/A');
    END ;

  BEGIN
  total_employee_salary:=5000000;
  DBMS_OUTPUT.PUT_LINE('PROCESS_EMPLOYEE_TIME  : PACKAGE INIT');
  
  END;