-- !!!!
SELECT @@GLOBAL.tx_isolation, @@tx_isolation;
-- SET GLOBAL tx_isolation='READ-UNCOMMITTED';
SET SESSION tx_isolation='SERIALIZABLE';


drop table test.usingtransactions;
create table test.usingtransactions (id int primary key, name varchar(20));
truncate table test.usingtransactions;

-- for testing transactions open two instances of MySQL workbench =)

start transaction;
insert into test.usingtransactions values (1, '1');
insert into test.usingtransactions values (2, '2');
insert into test.usingtransactions values (3, '3');
update test.usingtransactions set id=10
where id = 1;
commit ;
rollback;


select * from test.usingtransactions;