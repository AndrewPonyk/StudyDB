DECLARE
CURSOR TEMP_CUR 
IS SELECT * FROM TEMP;

TEMP_COUNT NUMBER :=0;
temp_total_count number:=0;

BEGIN
  
  FOR TEMP_REC IN TEMP_CUR LOOP
   
  SELECT COUNT(*)
  into temp_count
  FROM TEMP
  where temp.c=temp_rec.c and temp.p=temp_rec.p;
  
   DBMS_OUTPUT.PUT_LINE(temp_count);
    
    IF TEMP_COUNT >1 THEN
      BEGIN
      DELETE FROM TEMP 
      WHERE TEMP.C=TEMP_REC.C AND TEMP.P=TEMP_REC.P 
      AND ROWID> ( SELECT MIN(ROWID) FROM TEMP WHERE TEMP.C=TEMP_REC.C AND TEMP.P=TEMP_REC.P  );
      END;
    END IF;
  
  end loop;
  
END;
/