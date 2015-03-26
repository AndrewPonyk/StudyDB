create table large_table(id int primary key,
username varchar (20),
city varchar(20),
firstname varchar (20),
lastname varchar (20),
yearregistered int,
hashfromfields_firstname_and_lastname varchar(32));

select md5('andrew');
create table md5_table(id varchar(32) primary key);
insert into md5_table values (md5('andrew')),(md5('111'));
select * from md5_table;

-- Insert 200'000 rows