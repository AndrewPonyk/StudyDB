
drop table if exists test.fromandto_text_file;
create table test.fromandto_text_file(
id int primary key auto_increment,
firstname varchar(20),
lastname varchar (20),
year int);

--
select * from test.fromandto_text_file;

insert into test.fromandto_text_file values (1, 'a' , 'aa',1992),
(2, 'b' , 'bb',1993);

-- perform export to CSV file
select * from test.fromandto_text_file
into outfile '/tmp/fromandto_text_file.txt'  -- ON UBUNTU works only to /tmp dir  =)
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n';

-- perform import from file 
truncate table test.fromandto_text_file;

load data infile '/tmp/fromandto_text_file.txt'
into table test.fromandto_text_file
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n';

select * from test.fromandto_text_file;