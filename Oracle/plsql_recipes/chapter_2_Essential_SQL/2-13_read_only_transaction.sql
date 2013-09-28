-- !!!!!! то треба попробувати в sqlplus відкрити дві сесії , в одній зробити снапшот а в другій змінювати дані і комітити ,
-- і бачити шо друга не бачить тих змін , бо в тому і суть снапшот

DECLARE

i number;

BEGIN
  commit; -- because set transaction read only must be the first command in transaction
  
  SET TRANSACTION READ ONLY NAME 'my';
  
  i:=&i;
  
  SELECT SUM(C) INTO I FROM TEMP ;
  dbms_output.put_line(i);
  
  commit;
  
  
end;