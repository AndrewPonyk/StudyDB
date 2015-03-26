create table awithprimary(id int primary key);

create table bwithreferencetoa(id int primary key,
aid int ,
constraint ba foreign key(aid) references awithprimary(id));


alter table bwithreferencetoa drop foreign key ba;

alter table bwithreferencetoa add constraint ba foreign key (aid) references awithprimary(id);