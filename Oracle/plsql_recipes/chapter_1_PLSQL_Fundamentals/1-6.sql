set serveroutput on;
Declare
id number:=&id;
first  varchar2(20);
last varchar2(20);
begin

select first_name,last_name 
into first ,last
from employees 
where employee_id=id;


dbms_output.put_line('-- your emp is : '||first||' '||last);
end;
/