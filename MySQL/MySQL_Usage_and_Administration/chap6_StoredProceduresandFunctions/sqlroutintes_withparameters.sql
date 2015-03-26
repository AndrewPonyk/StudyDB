
drop procedure if exists get_airport_name;

DELIMITER //
create procedure get_airport_name(IN aid INT)
begin
 select AirportName from airport where airportid = aid;  
end// 

call get_airport_name(48)//

-- --------------

drop procedure if exists add_aircraft_type //
DELIMITER //
create procedure add_aircraft_type(IN aid INT,IN atype VARCHAR(255))
begin
	insert into aircrafttype values (aid,atype);
end//

call add_aircraft_type(1000,'AN-2')//

select * from aircrafttype//

-- -----------------------------------------------


drop procedure if exists get_airport_name//

DELIMITER //
create procedure get_airport_name (IN aid INT, OUT aname VARCHAR(255))
BEGIN
select airportname into aname from airport where airportid = aid;
END//

call get_airport_name(1001, @aname)//

-- call get_airport_name(1001, 33)// -- error second parameter must be variable

select @aname//

select * from airport//

-- -----------------------------------
drop procedure if exists add_one//
create procedure add_one(INOUT a INT) -- INOUT parameters
BEGIN
	select (a+1) into a;
END//

set @var = 100//

call add_one(@var)//

select @var//
