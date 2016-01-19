CREATE OR REPLACE PACKAGE first_package AS
a1 constant VARCHAR(1) := '2';
procedure say_hello;
end first_package;


CREATE OR REPLACE PACKAGE BODY first_package  AS 
PROCEDURE say_hello as 
BEGIN
 dbms_output.put_line('hello from first package');
end;
end first_package;


-- usage package constants 
BEGIN
NULL;
DBMS_OUTPUT.put_line('abc');
DBMS_OUTPUT.PUT_LINE(first_package.a1);
first_package.say_hello();
end;