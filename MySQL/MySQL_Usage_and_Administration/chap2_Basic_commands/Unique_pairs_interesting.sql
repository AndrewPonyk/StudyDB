SELECT * FROM test.pair;

-- test.pair.table
/*CREATE TABLE `pair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `a` int(11) DEFAULT NULL,
  `b` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
*/


/*
# id, a, b
'1', '1', '2'
'2', '2', '1'
'3', '3', '4'
'4', '4', '3'
'5', '5', '5'
*/

SELECT DISTINCT a, b
FROM 
    (
            SELECT a, b
            FROM pair
        UNION ALL
            SELECT b as 'a', a as 'b'
            FROM pair
    ) as T
WHERE a <= b;

drop table testengine;
create table testengine(it int primary key)



