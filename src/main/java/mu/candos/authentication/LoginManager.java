package mu.candos.authentication;

import java.sql.*;
import java.util.ArrayList;

import mu.candos.model.Login;
import mu.candos.jdbc.*;

public class LoginManager {

	
	public ArrayList<Login>	logUser(String username, String password) throws ClassNotFoundException, SQLException {
		
		ArrayList<Login> lgs = new ArrayList<Login>();
		
		DBConnection.DBConnect(); // calling the DB connection method..
		
		String admin = "SELECT * FROM admin WHERE LoginName = ? AND Password = ?";
		
		PreparedStatement pstmt = DBConnection.conn.prepareStatement(admin);
		
		pstmt.setString(1, username);
		pstmt.setString(2, password);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			
			String uname = rs.getString("LoginName");
			String pass = rs.getString("Password");
			String fname = rs.getString("FirstName");
			String lname = rs.getString("LastName");
			
			Login lg = new Login();
			
			lg.setUsername(uname);
			lg.setPassword(pass);
			lg.setFname(fname);
			lg.setLname(lname);
			
			lgs.add(lg);
		}
		
		DBConnection.conn.close();
		rs.close();
		pstmt.close();
		
		return lgs;
	}
}
