DECLARE
  TYPE REC_TYPE IS RECORD(
                    LAST_NAME VARCHAR2(25),
                    DEPARTMENT VARCHAR2(30),
                    SALARY NUMBER);
                    
REC REC_TYPE;
BEGIN
  REC.LAST_NAME:='PONYK';
  REC.DEPARTMENT:='01';
  REC.SALARY:=4000;
  
END;
/


