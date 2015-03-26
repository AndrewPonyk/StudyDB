drop table test.full1;
create table test.full1 (id1 int primary key, name varchar (20));
insert into test.full1 values (1, 'a') , (2, 'b'), (3, 'c'), ( 5, 'c');

create table test.full2 (id2 int primary key, id1 int, additional_name varchar (20));
insert into test.full2 values (1,1, 'aa') , (2, 1, 'bb'), (3, 2, 'bb'),  (4, null, 'bb');
 
-- inner
select * from 
test.full1 as f1 inner join test.full2 as f2
where f1.id1 = f2.id2
;

-- left
select * from 
test.full1 as f1 left join test.full2 as f2
on f1.id1 = f2.id2
;

-- right
select * from 
test.full1 as f1 right join test.full2 as f2
on f1.id1 = f2.id2
;

-- emulate full outer join
select * from 
test.full1 as f1 left join test.full2 as f2
on f1.id1 = f2.id2
UNION
select * from 
test.full1 as f1 right join test.full2 as f2
on f1.id1 = f2.id2;

-- Union - interesting thing
select 10 * 10
UNION ALL
select 100;