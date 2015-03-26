drop table test_full_text;
create table test_full_text(id  int primary key auto_increment,
long_text varchar (200))
engine = MyISAM;

insert into test_full_text(long_text) values ('Once the index is created, you can search it with the');
insert into test_full_text(long_text) values ('manual, similarity is scored on the basis of a number of');
insert into test_full_text(long_text) values ('A similarity score of 0 indicates that no similarity exists between the values being');

select * from test_full_text;

select id, match(long_text) against ('manual') as score from test_full_text
-- where match(long_text) against ('manual') > 0
; -- 0.65 in second

select id, match(long_text) against ('A similarity score of 0 indicates') as score
from test_full_text; -- 0.56 in third


-- However, up until MySQL 5.6, MyISAM was the only storage
-- engine with support for full-text search
CREATE FULLTEXT INDEX hello_full ON test_full_text(long_text);

select version();