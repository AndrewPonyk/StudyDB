CREATE OR REPLACE TRIGGER POPULATE_HIRE_DATE
BEFORE INSERT ON TEMP
DECLARE
BEGIN
  :new.hire_date:=sysdate;
END;