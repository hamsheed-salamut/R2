/**
 * 
 */
package mu.candos.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



/**
 * @author Shahad
 *
 */
public class DBConnection {
	
	static String url = "jdbc:mysql://localhost/hms";
	static String username = "root";
	static String password = "";
	public static Connection conn = null;
	public static void DBConnect() throws SQLException, ClassNotFoundException {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		conn = DriverManager.getConnection(url, username, password);
		
		System.out.println("Connecting to DB...");
		
	}
}
