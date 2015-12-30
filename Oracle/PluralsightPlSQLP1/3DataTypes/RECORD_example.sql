DECLARE
TYPE myrec
IS
  REcord
  ( id int,
    NAME VARCHAR(30));
  a1 myrec;
BEGIN
  dbms_output.put_line('a');
 a1.NAME := 'abc';
dbms_output.put_line(a1.name);
END;