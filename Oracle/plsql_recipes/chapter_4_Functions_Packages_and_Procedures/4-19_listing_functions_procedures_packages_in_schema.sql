DECLARE

CURSOR USER_OBJECTS IS 
SELECT * FROM USER_OBJECTS
  order by object_type;
BEGIN
  FOR OBJ IN USER_OBJECTS LOOP
      dbms_output.put_line(obj.object_name||' '||obj.object_type);
  end loop;
end;