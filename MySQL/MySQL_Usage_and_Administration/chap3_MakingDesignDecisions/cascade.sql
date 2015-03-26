drop table test_cascade_child;
drop table test_cascade_parent;


create table test_cascade_parent(id int primary key, name varchar(20));

create table test_cascade_child(id int primary key, 
parentid int ,
itemtext varchar(20),
constraint child_parent foreign key (parentid) references test_cascade_parent(id) 
-- on delete set null
);

insert into test_cascade_parent values (1, 'Andrew');
insert into test_cascade_parent values (2, 'Ivan');

insert into test_cascade_child values (1, 2, 'Ivan item 1');

select * from test_cascade_parent;
select * from test_cascade_child;

delete from test_cascade_parent where id = 2;

-- Keyword What It Means
/*
CASCADE Delete all records containing references to the deleted key value.
SET NULL Modify all records containing references to the deleted key value to instead use
a NULL value (this can only be used for fields previously marked as NOT NULL).
RESTRICT Reject the deletion request until all subordinate records using the deleted key
value have themselves been manually deleted and no references exist (this is
the default setting, and it’s also the safest).
NO ACTION Do nothing.
*/