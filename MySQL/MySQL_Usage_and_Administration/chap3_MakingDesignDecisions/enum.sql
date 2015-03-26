-- Enumerations 
CREATE TABLE sizes (
    name ENUM('small', 'medium', 'large')
);

select * from sizes;
insert into sizes values('small'); -- ok
insert into sizes values('huge'); -- insert empty string