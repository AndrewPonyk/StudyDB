DROP TABLE IF EXISTS CATALOGS;
CREATE TABLE CATALOGS (
	ID_CATALOG INT(11) NOT NULL PRIMARY KEY,
	NAME TINYTEXT NOT NULL
);

DROP TABLE IF EXISTS PRODUCTS;
CREATE TABLE PRODUCTS(
	ID_PRODUCT INT(11) NOT NULL PRIMARY KEY,
	NAME TINYTEXT NOT NULL,
	PRICE DECIMAL(7,2) NULL DEFAULT '0.00',
	COUNT INT(11) NULL DEFAULT '0',
	MARK FLOAT (4,1) NOT NULL DEFAULT '0.0',
	DESCRIPTION TEXT NULL,
	ID_CATALOG INT(11) NOT NULL 
);

DROP TABLE IF EXISTS USERS;
CREATE TABLE USERS (
	ID_USER INT(11) NOT NULL PRIMARY KEY,
	SURNAME TINYTEXT,
	PATRONYMIC TINYTEXT,
	NAME TINYTEXT,
	PHONE VARCHAR(12) NULL,
	EMAIL TINYTEXT NULL,
	URL TINYTEXT NULL,
	USERSTATUS ENUM('ACTIVE','PASSIVE','LOCK','GOLD') DEFAULT 'PASSIVE'
);

DROP TABLE IF EXISTS ORDERS;
CREATE TABLE ORDERS ( 
	ID_ORDER INT(11) NOT NULL PRIMARY KEY,
	ID_USER INT(11) NOT NULL ,
	ORDERTIME DATETIME NOT NULL,
	NUMBER INT(11) NOT NULL,
	ID_PRODUCT INT(11) NOT NULL
);