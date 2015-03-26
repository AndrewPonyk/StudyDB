drop table test.usingtransactions;
create table test.usingtransactions (id int primary key, name varchar(20));
truncate table test.usingtransactions;

-- for testing transactions open two instances of MySQL workbench =)

start transaction;
insert into test.usingtransactions values (1, '1');
insert into test.usingtransactions values (2, '1');
commit ;
rollback;

select * from test.usingtransactions;

-- Nested transcations are not supported, BUT Savepoints support is available : 
drop table test.usingtransactions;
create table test.usingtransactions (id int primary key, name varchar(20));
truncate table test.usingtransactions;


start transaction;
insert into test.usingtransactions values (100, '100');

savepoint p1;

insert into test.usingtransactions values (200, '100');

 rollback to p1;
-- or
-- release savepoint p1;
commit;

