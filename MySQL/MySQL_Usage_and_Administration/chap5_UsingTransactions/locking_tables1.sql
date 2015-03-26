drop table if exists test.lockingtables;
create table test.lockingtables(
 id int primary key,
 name varchar(20)
);

truncate table test.lockingtables;

lock table test.lockingtables write; -- halt work , i don't know what is the problem
insert into test.lockingtables values (1,'1');
insert into test.lockingtables values (2,'2');
unlock tables;

select * from test.lockingtables;