DECLARE
  i pls_integer;
BEGIN
  i:= 21490000000;
  dbms_output.put_line(i);
EXCEPTION
WHEN OTHERS THEN
  dbms_output.put_line(sqlerrm);
  raise; -- RAISE error to level up
END;

-- The RAISE statement stops normal execution of a PL/SQL block or subprogram and transfers control to an exception handler.
-- In an exception handler, you can omit the exception name in a RAISE statement, which raises the current exception again. This technique allows you to take some initial corrective action (perhaps just logging the problem),
-- then pass control to another handler that does more extensive correction

-- https://docs.oracle.com/cd/B19306_01/appdev.102/b14261/raise_statement.htm