SELECT @@GLOBAL.tx_isolation, @@tx_isolation;
SET SESSION tx_isolation='SERIALIZABLE';

start transaction;
select * from test.usingtransactions;
select count(*) from test.usingtransactions;

select * from test.usingtransactions
where id=1;

commit;