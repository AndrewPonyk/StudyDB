-- !!!!!! �� ����� ����������� � sqlplus ������� �� ��� , � ���� ������� ������� � � ����� �������� ��� � ������� ,
-- � ������ �� ����� �� ������ ��� ��� , �� � ���� � ���� �������

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