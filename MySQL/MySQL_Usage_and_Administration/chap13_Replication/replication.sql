select * from information_schema.USER_PRIVILEGES;
show grants for root;
select version();
show variables like '%binlog_format%';

-- GRANT REPLICATION SLAVE ON *.*
-- TO 'db1-slave'@'192.168.0.105' IDENTIFIED BY 'rosebud';

show master status;

unlock tables;
CREATE USER 'db1-slave'@'%' IDENTIFIED BY 'rosebud';
GRANT ALL ON *.* TO 'db1-slave'@'%';

use db1;
select * from airport;

show master  status;

select * from information_schema.USER_PRIVILEGES;

