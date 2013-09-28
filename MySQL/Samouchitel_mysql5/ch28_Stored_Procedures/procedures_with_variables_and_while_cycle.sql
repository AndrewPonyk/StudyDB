DELIMITER //
DROP PROCEDURE IF EXISTS with_variables;
CREATE PROCEDURE with_variables()
BEGIN
	DECLARE A INT;
	SET A=10;
	SELECT VERSION(),A*2-56;
END;

CALL with_variables();


Delimiter //
drop PROCEDURE IF EXISTS while_cukl;
create PROCEDURE while_cukl()
begin
	DECLARE i INT;

	SET i=0;
	
	WHILE i<10 do
		select version();
		SET i=i+1;
	end while;
end;


call while_cukl();

SHOW CREATE PROCEDURE while_cukl; -- show declaration of procedure
