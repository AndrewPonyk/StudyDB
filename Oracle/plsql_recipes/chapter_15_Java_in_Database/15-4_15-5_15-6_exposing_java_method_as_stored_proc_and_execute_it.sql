--CREATE OR REPLACE PROCEDURE GET_IT_EMPS AS LANGUAGE JAVA
--NAME 'Employees.getItEmps()';
BEGIN
DBMS_JAVA.SET_OUTPUT(1000);
GET_IT_EMPS;

END;
/

-- java code Employees
--import java.sql.*;
--import oracle.jdbc.*;
--
--public class Employees{
--	public static void getItEmps(){
--		String firstName=null;
--		String lastName=null;
--		String email=null;
--		try{
--			Connection conn=DriverManager.getConnection("jdbc:default:connection:");
--			String sql = "select first_name,last_name,email from employees where department_id=60";
--			PreparedStatement pstmt=conn.prepareStatement(sql);
--			ResultSet rset=pstmt.executeQuery();
--			while(rset.next()){
--				firstName=rset.getString(1);
--				lastName=rset.getString(2);
--				email=rset.getString(3);
--				System.out.println(firstName+" "+lastName+" "+email);
--			}
--			pstmt.close();
--			conn.close();
--		}
--		catch(SQLException e){
--			System.err.println(e.getMessage());	
--		}
--	}
--} 
