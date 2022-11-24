package connector;

import java.sql.Connection;
import java.sql.DriverManager;



public class ConnectionProvider
{
	public static Connection getConnection()
	{
		Connection con=null;
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/eCommerce";
			con =DriverManager.getConnection(url,"root","admin");
			
			
		} catch (Exception e) {
			
			System.out.println(e);
		}
		return con;
	}

}
