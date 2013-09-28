delimiter //
DROP PROCEDURE IF EXISTS if_else;
CREATE PROCEDURE if_else (number INT)
	BEGIN

	if (number<10) then
		SET number=100;	
	end if;
	
	SELECT number;	
	END;
	
	
	call if_else(53);
	