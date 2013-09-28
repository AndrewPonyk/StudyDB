DELIMITER //
DROP PROCEDURE IF EXISTS with_comment;
CREATE PROCEDURE with_comment()
BEGIN
/* COMMENT IN PROCEDURE */
SELECT * FROM mysql.proc;
END


/*CALL with_comment();*/