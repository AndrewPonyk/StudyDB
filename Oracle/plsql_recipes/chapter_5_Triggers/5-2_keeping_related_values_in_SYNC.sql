CREATE OR REPLACE TRIGGER JOB_SALARY_UPDATE
AFTER UPDATE 
  ON JOBS
FOR EACH ROW
DECLARE 
  CURSOR EMP_CUR IS
  SELECT * FROM EMPLOYEES
  WHERE JOB_ID=:NEW.JOB_ID
  AND SALARY <:NEW.MIN_SALARY 
  FOR UPDATE;
  
  EMP_REC EMPLOYEES%ROWTYPE;
BEGIN 
    FOR EMP_REC IN EMP_CUR LOOP
      UPDATE EMPLOYEES
      SET EMPLOYEES.SALARY= :NEW.MIN_SALARY
      WHERE CURRENT OF EMP_CUR;
    END LOOP;
END; 