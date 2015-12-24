

    What types of logging are available in MySQL ? 
  
-----------------------------
Answer
:
-----
https://dev.mysql.com/doc/refman/5.0/en/binary-log.html
======================================
    Several different types of logs are available:
1 The error log
2 The general query log
3 The slow query log
4 The binary log

You can configure each of them in my.cnf (config file /etc/mysql/my.cnf)

    1 The Error Log
The error log does exactly what you think it would do—it keeps a record of every error
that occurs on the server. As such, this is a basic diagnostic tool, and one that comes in
handy when troubleshooting hard-to-diagnose problems.

Config  :
# Error log - should be very few entries.
#
log_error = /var/log/mysql/error.log
-----------
    2 The General Query Log
The general query log is another useful log because it (surprise, surprise!) keeps track
of every query sent to the server by a client. It also displays details about which clients
are connected to the server and what these clients are doing.

Config  :
# Both location gets rotated by the cronjob.
# Be aware that this log type is a performance killer.
# As of 5.1 you can enable the log at runtime!
general_log_file        = /var/log/mysql/mysql.log
general_log             = 1

----------
    3 The Slow Query Log
A related log is the slow query log, which lists all the queries that exceed a predefined
amount of time (specified by the long_query_time variable). Any query that takes longer
than this value is listed in this log. If you’re looking for a way to optimize performance,
this log is a good place to start.

COnfig  :
# Here you can see queries with especially long duration
log_slow_queries    = /var/log/mysql/mysql-slow.log
long_query_time = 2
-----------
    4 The Binary Log
MySQL 3.23.14 and later also support logging of all the commands that make changes
to a table’s data. Commands such as INSERT, REPLACE, DELETE, GRANT, and REVOKE,
along with UPDATE, CREATE TABLE, and DROP TABLE are all in this category. This
information is stored in a binary log, which provides a more efficient storage format
for data and also records a larger amount of information. A utility named mysqlbinlog
converts the binary log back to text so you can read it.

Binary logging is done immediately after a statement or transaction completes but before
any locks are released or any commit is done. This ensures that the log is logged in commit order.

Tip:     Because the binary log is critical for crash recovery, it’s always a good idea
to save it to a different drive or device than the one which holds the MySQL database files

Config : 
# The following can be used as easy to replay backup logs or for replication.
# note: if you are setting up a replication slave, see README.Debian about
#       other settings you may need to change.
#server-id        = 1
#log_bin            = /var/log/mysql/mysql-bin.log
expire_logs_days    = 10
max_binlog_size         = 100M
#binlog_do_db        = include_database_name
#binlog_ignore_db    = include_database_name


TIP : you can convert bin log to TEXT using mysqlbinlog application , in my case 
    sudo mysqlbinlog /var/lib/mysql/mysql-bin.000004

Example output : 
......
# at 1737
#150411  1:22:43 server id 10  end_log_pos 1945     Query    thread_id=57    exec_time=0    error_code=0
SET TIMESTAMP=1428704563/*!*/;
UPDATE `db1`.`airport` SET `AirportName`='International Boryspil Airport (Replication in action =) It works, but be .. )' WHERE `AirportID`='1001'
/*!*/;
# at 1945
#150411  1:22:43 server id 10  end_log_pos 2013     Query    thread_id=57    exec_time=0    error_code=0
SET TIMESTAMP=1428704563/*!*/;
COMMIT
/*!*/;
DELIMITER ;
# End of log file
ROLLBACK /* added by mysqlbinlog */;
/*!50003 SET COMPLETION_TYPE=@OLD_COMPLETION_TYPE*/;
/*!50530 SET @@SESSION.PSEUDO_SLAVE_MODE=0*/;
....


at 1737 - it is current position in bin log (it is using for replication) 
========