DELIMITER //
DROP PROCEDURE IF EXISTS set_y;
CREATE PROCEDURE set_y( IN value INT )
BEGIN
	SET value=7;
	SET @x=value;
END;

MYSQL > SET @val=123456;
MYSQL > CALL set_y(@val);
MYSQL > SELECT @X,@VAL;

/* so ,  after calling set_y procedure @val is still 123456 , because it is IN parameter */