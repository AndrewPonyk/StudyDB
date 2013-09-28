DELIMITER //
DROP PROCEDURE IF EXISTS set_y;
CREATE PROCEDURE set_y( OUT value INT )
BEGIN
	
	SET value=7;
	SET @x=value;
END;

 SET @val=123456;
 CALL set_y(@val);
 SELECT @X,@VAL;

/* so ,  after calling set_y procedure @val is still changed to 7 , because it is OUT parameter */

/* !!!! We cant pass parameter value into function with OUT modifier */