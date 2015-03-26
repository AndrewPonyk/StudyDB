show variables;

SHOW EVENTS;

set global event_scheduler = ON;

/* MySQL’s event scheduling engine is deactivated and must be activated with the
following command:
mysql> SET GLOBAL event_scheduler = ON; */

drop event pax_day;

DELIMITER //
CREATE EVENT pax_day
 ON SCHEDULE EVERY 1 Minute
 STARTS '2015-03-24 22:26:00' ENABLE
 DO
 BEGIN
	insert into test.log(message,date) values ('Scheduled event every minute', NOW());
 END//

alter event pax_day disable//

select * from test.log//