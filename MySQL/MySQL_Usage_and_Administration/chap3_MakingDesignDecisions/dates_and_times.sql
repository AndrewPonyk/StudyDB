create table hello_dates_and_times (id int primary key,
event_moment datetime);

insert into hello_dates_and_times values(4, NOW());

select id, event_moment from hello_dates_and_times;

select id, event_moment from hello_dates_and_times
where year(event_moment) = 2014 ; 

select id, event_moment from hello_dates_and_times
order by event_moment desc;

select date_format(NOW(),'%d:%m:%Y');


create table study_diff_between_datetime_and_timestamp(id int primary key, 
event_moment timestamp);

select * from  study_diff_between_datetime_and_timestamp;

insert into study_diff_between_datetime_and_timestamp values (1, NOW());

