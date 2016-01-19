DECLARE
name_from_test varchar(20);
BEGIN
SELECT NAME INTO name_from_test FROM TEST WHERE ID = 1;
dbms_output.put_line(name_from_test );
commit;
end;