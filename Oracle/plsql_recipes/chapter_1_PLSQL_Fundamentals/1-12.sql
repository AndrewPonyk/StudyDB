set serveroutput on;
Declare
dept departments%rowtype; 
dept_name departments.department_name%type;
Begin
Select * into dept 
	from departments 
	where department_id=100;
	
Select department_name into dept_name
	from departments
	where department_id=100;
	
	Dbms_Output.put_line(dept.department_name);
	Dbms_Output.put_line(dept_name);
End;
/