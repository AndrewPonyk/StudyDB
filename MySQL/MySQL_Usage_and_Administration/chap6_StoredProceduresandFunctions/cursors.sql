
-- Java : break, continue
-- SQL  : LEAVE, ITERATE 

-- DECLARE c CURSOR FOR
--  SELECT AirportName, NumTerminals FROM airport;
drop procedure if exists db1.get_airport_size; -- work proper only from mysql console , not from workbench
Delimiter //
create procedure db1.get_airport_size()
begin
	DECLARE a VARCHAR(255);
	DECLARE b,x INT;
	DECLARE done INT DEFAULT FALSE;
	DECLARE c CURSOR FOR
	SELECT AirportName, NumTerminals FROM airport;
	-- DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	DECLARE EXIT HANDLER FOR 1329 set done = TRUE;
		-- Tip The NOT FOUND keyword serves as a “catch-all” shortcut that represents all errors
		-- occurring due to a cursor reaching the end of its record set.
 OPEN c;
	size: LOOP
		if done then
			leave size;
		end if;
		FETCH c INTO a,x;
		IF x > 2
			THEN SELECT a AS Name, 'big' AS Size;
		ELSE
			SELECT a AS Name, 'small' AS Size;
		END IF;
	END LOOP size;
 CLOSE c;
end//

call db1.get_airport_size()// -- work proper only from mysql console , not from workbench

-- Another example of using cursors
drop function if exists db1.sumIds//

delimiter //
create function db1.sumIds()
returns int
begin
	declare result, done,  t int default 0;  -- IT IS Default for all variables in declaration
	
	declare c cursor for select AirportID from db1.airport;
	declare continue handler for not found set done = 1; -- should be after cursor definition
	-- if it will be 'exit' handler : we will get 'ERROR 1321 (2F005): FUNCTION sumIds ended without RETURN'
	open c;
	sum: loop
		fetch c into t;
		if done = 1 then
			leave sum;
		end if;
		set result = result + t ;
	end loop;
	close c;
	return result;
end//



