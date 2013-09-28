DELIMITER //
DROP PROCEDURE IF EXISTS catalogname;
CREATE  PROCEDURE  catalogname(	IN catalogid INT , 
								OUT catalogname TINYTEXT)
	BEGIN
		SELECT catalogs.NAME INTO catalogname FROM catalogs WHERE
		catalogs.ID_CATALOG =  catalogid;
	END
	
	
	/*USING FUNCTION TO GET GATALOGNAME BY ID*/
	SET @NAME='';
	CALL test.catalogname(2,@NAME);
	SELECT @NAME;
	