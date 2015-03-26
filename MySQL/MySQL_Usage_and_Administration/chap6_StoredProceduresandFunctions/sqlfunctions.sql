
drop function if exists test.with_local_var;
DELIMITER //
create function test.with_local_var()
	returns int
begin
	declare local_var int;
	declare local_char varchar(10);
	set local_char = 'andrew';
	return length(local_char);
end//


select test.with_local_var()//

-- ---
Delimiter //
drop function if exists test.function_with_if//
create function test.function_with_if(n varchar(100), count Int)
returns int
begin
	declare result int default 0; -- we cannot declare variable inside if 
	if length(n) > count then 
		set result = 1;
	else
		set result = 0;
	end if;

return result;
end//
-- ---

select test.function_with_if('Hello', 20);//

-- --
drop function if exists test.function_with_while//

create function test.function_with_while(num int)
returns int
begin 
	declare result int default 0;
	fact: while num > 0 do
		set result = result + num;
		set num = num - 1;
	end while fact;
	return result;
end//

select test.function_with_while(5);
-- --

