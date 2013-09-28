DELIMITER //  -- without this line doesnt work =)
DROP PROCEDURE if EXISTS my_version;
CREATE PROCEDURE my_version()
BEGIN
	update customers set customers.age=customers.age+1;
END;

--SELECT * from customers

--CALL my_version()