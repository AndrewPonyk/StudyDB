select current_user();

select * from test.log;
truncate table test.log;
create table test.log(id int primary key auto_increment,
message varchar(100),
date datetime);


truncate table test.undertrigger;
drop table if exists test.undertrigger;
create table test.undertrigger(
	id int primary key auto_increment,
	name varchar (20),
	calculated int not null
);

insert into test.undertrigger (name, calculated) values('y', 3);
select * from test.undertrigger;


drop trigger if exists test.undertrigger_bi;
delimiter //
create trigger test.undertrigger_bi before insert on test.undertrigger 
for each row
begin
	-- DECLARE EXIT Handler for 1644 insert into test.log (message, date) values ('Trying to insert wrong value into test.undertrigger_bi', NOW()); 
	if length(NEW.name) <> 4 then
		insert into test.log (message, date) values ('Insert new row to test.undertrigger', NOW());
	else
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'pps'; -- this revert all changes, i dont know how to ADD SOMETHING TO LOG TABLE after cancel inserting 
	end if;
end//

show variables//


show triggers//

drop trigger if exists test.undertrigger_bi//
create trigger test.undertrigger_bi before insert on test.undertrigger 
for each row
begin
	insert into test.log (message, date) values 
	(concat('Insert new row to test.undertrigger : id=',NEW.id,', name=',NEW.name, 'Id sum :', (select sum(id) from test.undertrigger)), NOW()); 

	-- insert into test.log (message, date) values 
	-- (concat('Insert new row to test.undertrigger : id=',OLD.id,', name=',OLD.name), NOW());  -- ERROR : There is no OLD row in insert trigger
end//


-- before VS after triggers
drop trigger if exists test.undertrigger_ai//
create trigger test.undertrigger_ai after insert on test.undertrigger 
for each row
begin
	insert into test.log (message, date) values 
	(concat('AFTER Insert new row to test.undertrigger : id=',NEW.id,', name=',NEW.name,'; Id sum :', (select sum(id) from test.undertrigger)) , NOW()); 

	-- insert into test.log (message, date) values 
	-- (concat('Insert new row to test.undertrigger : id=',OLD.id,', name=',OLD.name), NOW());  -- ERROR : There is no OLD row in insert trigger
end//



-- NOTE If constraint failed triggers are ROLLED BACK. !!!

select concat('1', null)//  -- =) result is null in MySQL