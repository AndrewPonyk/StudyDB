--CREATE OR REPLACE FUNCTION d(input IN VARCHAR2 ) RETURN VARCHAR2 AS LANGUAGE JAVA
--NAME 'Ping.doPing(java.lang.String) return java.lang.String';
--must be java.lang.String !!!
BEGIN
  DBMS_OUTPUT.PUT_LINE(d('andrew'));
END;
/

--public class Ping{
--	public static String doPing(String input){
--		return "hello,"+input;
--	}
--} 
-- 
-- 
-- 