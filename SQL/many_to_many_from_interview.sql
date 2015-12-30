--create table S (id integer, name varchar(20))
--create table T (id integer, name varchar(20))
INSERT INTO S VALUES (1, 'Andrew');
INSERT INTO S values(2, 'Misha');

select * from s;

INSERT INTO t VALUES (11, 'Kyh');
INSERT INTO t VALUES (22, 'Dyiak');
select * from t;

CREATE TABLE s_t(s_id INTEGER, t_id INTEGER);
INSERT INTO s_t VALUES (1,11);
INSERT INTO s_t VALUES (2,11);
insert into s_t values (2,22);

-- Question : find all students which have teacher '<name>'
-- My answer
SELECT s.NAME FROM s, s_t
where s.id = s_t.s_id and s_t.t_id in (select id from t where name='Dyiak')