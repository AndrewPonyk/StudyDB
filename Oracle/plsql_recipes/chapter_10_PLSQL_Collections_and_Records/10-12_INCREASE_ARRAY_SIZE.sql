DECLARE
  TYPE DOW_TYPE IS VARRAY(7) OF VARCHAR2(3);
  DOW DOW_TYPE:=DOW_TYPE('SUN','MON');
  
BEGIN
  DOW.EXTEND;
  DOW(3):='TUE';
   DOW.EXTEND;
  DOW(4):='WEN';
    DOW.EXTEND;
  DOW(5):='THU';
    DOW.EXTEND;
  DOW(6):='FRI';
    DOW.EXTEND;
  DOW(7):='SAT';
  
  NULL;
  FOR I IN 1..DOW.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE(DOW(I));
  END LOOP;
    
END;
/