/*SHOW STATUS provides server status information
(see Section 5.1.6, “Server Status Variables”).*/
-- https://dev.mysql.com/doc/refman/5.1/en/server-status-variables.html 

SHOW STATUS like '%handler%';

SHOW VARIABLES LIKE '%query_cache%';

show status; show variables;

select * from test.test_indexes_table limit 0, 10000;

select * from test.test_indexes_table
where lastname = '3333Last';

analyze table test.test_indexes_table;


set session have_query_cache = 'NO';
-- set global query_cache_limit = 1048576;
-- set global query_cache_size = 16777216;

-- Setting these values to 0 , disable cache, so MySQL doesn't "Remember" last queries results
-- set global query_cache_limit = 0;
-- set global query_cache_size = 0;

/*
Caution Once a table is changed, the cached queries that use this table become invalid and are
removed from the cache. This prevents a query from returning inaccurate data from the old
table.
*/

-- ====================================

EXPLAIN select * from test.test_indexes_table;


-- Explain
EXPLAIN select * from test.test_indexes_table
where lastname = 'ad3a42213Lasat21asa' and firstname = '3'; -- EXPLAIN shows uses indexes, this query use indexes

EXPLAIN select * from test.test_indexes_table
where lastname = 'ad3a42213Lasat21asa'; -- this query dont use indexes
-- 

EXPLAIN SELECT p.PaxName, f.FlightID
 FROM db1.pax AS p,
 db1.flight AS f, db1.route AS r
 WHERE p.FlightID = f.FlightID
 AND p.ClassID = 2 AND r.Duration = 85;



OPTIMIZE TABLE test.awithprimary;

ANALYZE TABLE test.author;