CREATE OR REPLACE FUNCTION GET_TOTAL_SALARY(DEP_ID IN NUMBER DEFAULT 0) RETURN NUMBER AS
SUMA NUMBER :=0;

BEGIN
  IF DEP_ID=0 THEN
    SELECT SUM(SALARY) INTO SUMA FROM EMPLOYEES; 
  ELSE 
    SELECT SUM(SALARY) INTO SUMA FROM EMPLOYEES WHERE DEPARTMENT_ID=DEP_ID;
  END IF;
  
  RETURN SUMA;
END;

--package mainpackage;
--
--import java.sql.CallableStatement;
--import java.sql.Connection;
--import java.sql.DriverManager;
--import java.sql.SQLException;
--
--public class CallPlSqlFunction {
--
--	
--	
--	/**
--	 * getting total salary Getting total salary in one departmnet or in all departments
--	 @param depId   : 0 to get total salary in all departments
--	 	
--	 	
--	 */
--	public Double getTotalSalaryInDepartment( int depId){
--		
--		Connection conn;
--		Double retutnValue=new Double(0);
--		try {
--			DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
--			conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ocp11g","HR","Ekzyrf12");
--			
--			CallableStatement pstmt=conn.prepareCall("{ ?=call GET_TOTAL_SALARY(?) }");
--			pstmt.registerOutParameter(1,java.sql.Types.DOUBLE);
--			pstmt.setInt(2, depId);
--					
--			pstmt.executeQuery();
--			
--			retutnValue=pstmt.getDouble(1);
--			
--			System.out.println("good");
--		} catch (SQLException e) {
--			System.err.println(e.getMessage());
--		}
--		
--		
--		
--		return retutnValue;
--	}
--	
--	/**
--	 * @param args
--	 */
--	public static void main(String[] args) {
--		// TODO Auto-generated method stub
--			CallPlSqlFunction callPlSqlFunctionFacade=new CallPlSqlFunction();
--			
--			
--		System.out.println("Total salary in department 20 : "+	callPlSqlFunctionFacade.getTotalSalaryInDepartment(0) );
--	}
--
--}
