/**
 * 
 */
package mu.candos.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.jsp.jstl.sql.Result;
import javax.servlet.jsp.jstl.sql.ResultSupport;

import mu.candos.jdbc.DBConnection;
import mu.candos.model.Billing;

/**
 * @author Shahad
 *
 */
public class BillingManager {
	
	public ArrayList<Billing> getAllUnpaid() throws SQLException, ClassNotFoundException{
		
		DBConnection.DBConnect();
				
		String unpaid = "SELECT * FROM billing WHERE status = 'unpaid'";
		
		Statement stmt = DBConnection.conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(unpaid);
		
		ArrayList<Billing> unp = new ArrayList<Billing>();
		
		while (rs.next()) {
			
			Billing bill = new Billing();
			
			bill.setInvoiceID(rs.getInt("InvoiceID"));
			bill.setTotalCharges(rs.getDouble("TotalCharges"));
			bill.setStatus(rs.getString("status"));
			bill.setSupplierID(rs.getInt("SupplierID"));
			
			unp.add(bill);
		}
		
		rs.close();
		
		return unp;
	}
	
	public int updateBilling(int id, String status, String dateIssue) throws SQLException, ClassNotFoundException{
		
		DBConnection.DBConnect();
		
		String upd = "UPDATE billing SET status = '" + status + "', DateOfInvoice = '" + dateIssue + "' WHERE InvoiceID = '" + id + "'";
		
		Statement stt = DBConnection.conn.createStatement();
		
		int up = stt.executeUpdate(upd);
		
		stt.close();
		DBConnection.conn.close();
		
		return up;
	}
	
	public ArrayList<Billing> getAllpaid() throws SQLException, ClassNotFoundException{
		
		DBConnection.DBConnect();
		
		String paid = "SELECT * FROM billing b INNER JOIN medications m ON b.SupplierID = m.SupplierID INNER JOIN supplier s ON b.SupplierID = s.SupplierID WHERE status = 'paid' GROUP BY InvoiceID";
		
		Statement stmt = DBConnection.conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(paid);
		
		ArrayList<Billing> pay = new ArrayList<Billing>();
		
		while (rs.next()) {
			
			Billing bill = new Billing();
			bill.setPrice(rs.getDouble("Price"));
			bill.setQty(rs.getInt("Quantity"));
			bill.setProdName(rs.getString("MName"));
			bill.setMedID(rs.getInt("MedcineID"));
			bill.setInvoiceID(rs.getInt("InvoiceID"));
			bill.setTotalCharges(rs.getDouble("TotalCharges"));
			bill.setDateInvoice(rs.getString("DateOfInvoice"));
			bill.setStatus(rs.getString("status"));
			bill.setSupplierID(rs.getInt("SupplierID"));
			bill.setSupFname(rs.getString("SupplierName"));
			bill.setSupLname(rs.getString("SupplierSurname"));
			bill.setAddress(rs.getString("Address"));
			bill.setPhone(rs.getInt("PhoneNumber"));
			
			pay.add(bill);
		}
		
		rs.close();
		
		return pay;
	}
	
	public ArrayList<Billing> displayInvoice(int id) throws SQLException, ClassNotFoundException {
		
		DBConnection.DBConnect();
		
		String getInvoice = "SELECT * FROM medications WHERE MedcineID = '" + id +"'";
		
		Statement stmt = DBConnection.conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(getInvoice);
		
		ArrayList<Billing> inv = new ArrayList<Billing>();
		
		while (rs.next()) {
			
			Billing bil = new Billing();
			
			bil.setProdName(rs.getString("MName"));
			bil.setPrice(rs.getDouble("Price"));
			bil.setQty(rs.getInt("Quantity"));
			
			inv.add(bil);
			
		}
		
		rs.close();
		
		return inv;
	}
	
}
