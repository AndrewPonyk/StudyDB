create or replace
PACKAGE JDBC_TO_PLSQL_STUDY AS
PROCEDURE INCREASE_WAGE (SUMA IN NUMBER );
END ;

--CREATE OR REPLACE PACKAGE BODY JDBC_TO_PLSQL_STUDY AS
--PROCEDURE INCREASE_WAGE (SUMA IN NUMBER ) AS
--BEGIN
--  UPDATE EMPLOYEES 
--  SET SALARY=SALARY+SUM
--END;
--END;

--java code
--package mainpackage;
--
--import java.sql.SQLException;
--import java.sql.*;
--import oracle.sql.*;
--
--public class EmployeeFacade {
--
--	public void increaseWage(int n){
--		
--		int ret_code;
--		Connection conn=null;
--		
--		try {
--			DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
--			conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ocp11g","HR","Ekzyrf12");
--			conn.setAutoCommit(false);
--			
--			CallableStatement pstmt=conn.prepareCall("call JDBC_TO_PLSQL_STUDY.INCREASE_WAGE(?) ");
--			pstmt.setInt(1, n);
--			
--			pstmt.executeUpdate();
--			conn.commit();
--			conn.rollback();
--			conn.close();
--			
--			System.out.println("goodl");
--		} catch (Exception e) {
--			System.err.println("something wrong");
--			System.err.println(e.getMessage());
--		}
--	}
--	
--	/**
--	 * @param args
--	 */
--	public static void main(String[] args) {
--
--		EmployeeFacade facade=new EmployeeFacade();
--			facade.increaseWage(-10);
--		
--	}
--
--}
