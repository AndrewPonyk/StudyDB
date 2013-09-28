set serveroutput on;
<<dept_block>>
Declare 
dept_name varchar2(30):='outer value';
Begin
	select department_name 
	into dept_name
	from departments
	where department_id=230;
	
	dbms_output.put_line(dept_name);

	IF 1>0 THEN
		<<inner>>
	declare
		dept_name varchar2(30):='inner';
	Begin
		dbms_output.put_line('----------');
		dbms_output.put_line( dept_block.dept_name); -- variable from current block
		dbms_output.put_line( inner.dept_name);	-- variable from outer block ;            but it is a bad practice to have two or more variables with the same names =)
		
	END inner;
	End if;
	
end;
/