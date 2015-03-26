select * from test.mysql_xml;

create table test.mysql_xml(
id int primary key auto_increment,
firstname varchar(20),
lastname varchar (20),
year int);

insert into test.mysql_xml values (1, 'a' , 'aa',1992),
(2, 'b' , 'bb',1993);

-- ==================================
-- export xml from db

-- Exporting XML
-- When it comes to exporting XML, MySQL currently lacks an equivalent to the SELECT ...
-- INTO OUTFILE statement, so XML-based export can only be accomplished using either
-- the mysql or mysqldump command-line tools.
-- To export the contents of a table using mysqldump, pass it the --xml command-line
-- option, together with other connection-specific parameters. Here’s an example, which
-- generates an XML file containing airport records:
-- [user@host] mysqldump --xml -u root -p db1 airport > /tmp/airport.xml
-- Password: ******
 
-- mysqldump --xml -u root -p test mysql_xml > /tmp/mysql_and_xml.xml

-- ================================================
-- import xml from file into db , works only in mysql CONSOLE !!!!!!!!!
truncate table test.mysql_xml;
select * from test.mysql_xml;
LOAD XML INFILE '/tmp/mysql_and_xml.xml'      -- WE CANT USE DATA FROM mysqldump, it is limited way
INTO TABLE test.mysql_xml;
