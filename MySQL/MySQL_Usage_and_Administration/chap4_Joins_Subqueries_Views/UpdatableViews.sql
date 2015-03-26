-- Updatable views 

select * from airport;

insert into airport values(1000, 'BSP', 'International Boryspil Airport', 'Kyiv', 'UA', 2, 2);
delete from airport 
where AirportID = 1000;


-- -----------
create view v_airport as 
select * from airport;

-- insert and delete from view
insert into v_airport values(1000, 'BSP', 'International Boryspil Airport', 'Kyiv', 'UA', 2, 2);
delete from v_airport 
where AirportID = 1000;

update v_airport 
set airportId = 1001
where AirportID = 1000;

-- ----------------------------------------------------------------------

/* Joins
Multitable views that make use of inner joins can be updated, so long as the INSERT or
UPDATE statement references fields from only one of the tables used in the join.
However, DELETE statements will fail when executed on a multitable view.*/

drop table if exists studyviews_parent;
create table studyviews_parent (parentid int primary key,
firstname varchar(20),
lastname varchar(20)
);
insert into studyviews_parent values (1, 'afirst', 'alast');

drop table if exists studyviews_child;
create table studyviews_child (childid int primary key,
parentid int,
childvalue varchar(20),
constraint foreign key child_parent (parentid) references studyviews_parent(parentid));
insert into studyviews_child values (1,1,'achild');

drop view if exists v_studyviewsparent_studyviewschild;
create view v_studyviewsparent_studyviewschild
as select p.parentid, p.firstname, p.lastname, c.childvalue 
from studyviews_parent as p , studyviews_child as c
where p.parentid = c.parentid;

select * from v_studyviewsparent_studyviewschild;

-- select from original tables 
select * from studyviews_parent;
select * from studyviews_child;

-- here we update , OK
update v_studyviewsparent_studyviewschild
set firstname = concat(firstname,'9')
where parentid = 1;

-- trying to update child table , OK 
update v_studyviewsparent_studyviewschild
set childvalue = concat(childvalue,'8')
where parentid = 1;