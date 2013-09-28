DELIMITER // 
DROP FUNCTION IF EXISTS say_hello;
CREATE FUNCTION say_hello(name CHAR(50))
RETURNS CHAR(50)
BEGIN
	RETURN CONCAT('Hello',name);
END;

SELECT

/* in MySQL in function we can not use IN or  OUT parameters , all parameters in function are IN*/