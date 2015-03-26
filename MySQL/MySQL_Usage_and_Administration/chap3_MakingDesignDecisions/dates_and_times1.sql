create table hello_dates_and_times (id int primary key,
event_moment datetime);

insert into hello_dates_and_times values(30, NOW());

select id, event_moment from hello_dates_and_times;

select id, event_moment from hello_dates_and_times
where year(event_moment) = 2014 ; 

select id, event_moment from hello_dates_and_times
order by event_moment desc;

select date_format(NOW(),'%d:%m:%Y');



SELECT id,
CONVERT_TZ(`event_moment`, @@session.time_zone, '+02:00') AS `utc_datetime` 
FROM study_diff_between_datetime_and_timestamp;


create table diff_between_datetime_and_timestamp(id int primary key,
dtime datetime, tstamp timestamp);

insert into diff_between_datetime_and_timestamp values(1, NOW(), NOW());

select * from diff_between_datetime_and_timestamp;