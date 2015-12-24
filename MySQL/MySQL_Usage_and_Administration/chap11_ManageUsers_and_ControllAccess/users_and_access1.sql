use mysql;
show tables;

-- main tables which is used to check permissions
select * from host;
select * from user;
select * from db;
select * from columns_priv;
select * from tables_priv;

show grants for root; -- to see which grants are available for user

-- One row from mysql table
-- # Host '%'
-- User  'root'
-- Password  '*3173AFC5BF993FFE945CC6932F8171DD1E02771F'
-- Select_priv, Insert_priv, Update_priv, Delete_priv, Create_priv, Drop_priv, Reload_priv, Shutdown_priv, Process_priv, File_priv, Grant_priv, References_priv, Index_priv, Alter_priv, Show_db_priv, Super_priv, Create_tmp_table_priv, Lock_tables_priv, Execute_priv, Repl_slave_priv, Repl_client_priv, Create_view_priv, Show_view_priv, Create_routine_priv, Alter_routine_priv, Create_user_priv, Event_priv, Trigger_priv, Create_tablespace_priv, ssl_type, ssl_cipher, x509_issuer, x509_subject, max_questions, max_updates, max_connections, max_user_connections, plugin, authentication_string
-- 'Y', 		'Y', 		 'Y', 		  'Y', 		   'Y', 		'Y', 	   'Y', 		'Y', 		   'Y', 		 'Y', 		'Y', 		'Y',             'Y', 		 'Y', 		 'Y', 		   'Y', 	   'Y',                   'Y',              'Y', 		  'Y', 			   'Y', 			 'Y', 			   'Y', 		   'Y', 				'Y', 				'Y', 			  'Y', 		  'Y', 			'Y', 					'', 	  ?, 		  ?, 		   ?, 			 '0', 			0	         '0', 			  '0', 				    '',     ''

select Password('sofgijoid'); -- 41 bit algorithm


-- =========================================================
-- Recipe 1 'Playing with domains , for example if we set host value for user as "192.168.0.2" this user cannot connect from localhost =) '

	-- change for example for user 'test' host in 'user' table to 192.23.32.2 and  after this
	-- you cant connect from localhost =)

-- Recipe 2 'Setting empty passford for user'
	-- two ways
	-- 1) set empty password in table mysql.user and after this 'flush privileges;'
	-- 2) SET PASSWORD FOR 'joe'@'localhost' = PASSWORD('1rock');


-- Recipe 3 give permissions to user 'test' only for some rows in db1.
	select * from db1.airport;
	grant select (AirportID, AirportCode) on db1.airport to test;
	

	-- removing access from particular columns
	revoke select (AirportID, AirportCode) on db1.airport from test;
	
-- Recipe 4 give user permissions only to views
	select * from information_schema.TABLES where table_name like '%v\_%' and table_schema = 'db1';
	grant select on db1.v_airport to test;
		flush privileges;

	revoke select on db1.v_airport from test;
	

-- !!!! 'host' is  Important row in tables 'mysql.user', 'mysql.tables_priv', 'mysql.columns_priv' , it determines from which host action can be performed !!!


-- ======= Interesting variable : 
show  variables like '%tx_i%';
set global max_connect_errors= 100;


create user bbb identified by 'bbb'; -- by default user will have host='%'
