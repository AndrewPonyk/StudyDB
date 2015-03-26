
drop procedure if exists airport_count;
DELIMITER //
create procedure airport_count()
begin
	select count(*) from db1.airport;
end//


-- call airport_count;


show create procedure airport_count//

show procedure status//

show function status//

-- // because of delimiter 