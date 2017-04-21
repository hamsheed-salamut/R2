/**
 * 
 */
package mu.candos.persistence;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import mu.candos.model.*;
import mu.candos.jdbc.DBConnection;

/**
 * @author Shahad
 *
 */
public class DoctorManager {
	
		public int addDoctor(String fname, String lname, String address, int phone, int mob,
							 String specialisation, String dob, double fee, String academics, int active) throws SQLException, ClassNotFoundException {
			
			DBConnection.DBConnect();
			
			String queryInsert = "INSERT INTO doctor (FirstName,LastName,DoctorAddress,PhoneNumber,MobileNumber,Specialisation,DoB,Fee,Academics,Active) VALUES (?,?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement pstmt = DBConnection.conn.prepareStatement(queryInsert);
			
			pstmt.setString(1, fname);
			pstmt.setString(2, lname);
			pstmt.setString(3, address);
			pstmt.setInt(4, phone);
			pstmt.setInt(5, mob);
			pstmt.setString(6, specialisation);
			pstmt.setString(7, dob);
			pstmt.setDouble(8, fee);
			pstmt.setString(9, academics);
			pstmt.setInt(10, active);
			
			int insert = pstmt.executeUpdate();
			
			DBConnection.conn.close();
			
			pstmt.close();
			
			return insert;
		}
		
		public ArrayList<Doctor> getAllDoctors()throws SQLException,ClassNotFoundException{
	    
			DBConnection.DBConnect();
			
	    	String queryStr = "SELECT * from doctor";
	    	Statement stmt = DBConnection.conn.createStatement();
	    	ResultSet rs = stmt.executeQuery(queryStr);
	    	
	    	ArrayList<Doctor> docs = new ArrayList<Doctor>();
	    	
	    	while (rs.next()){
	    		int docId = rs.getInt("DoctorID");
	    		String firstName = rs.getString("FirstName");
	    		String lastName = rs.getString("LastName");
	    		String address = rs.getString("DoctorAddress");
	    		int phoneNumber = rs.getInt("PhoneNumber");
	    		int mobileNumber = rs.getInt("mobileNumber");
				String specialisation = rs.getString("Specialisation");
				String academics = rs.getString("Academics");
				String dob = rs.getString("DoB");
				double fee = rs.getDouble("Fee");
				boolean active =  rs.getBoolean("Active");
	    		
	    		Doctor newDoc=new Doctor();
	    		newDoc.setDocID(docId);
	    		newDoc.setFname(firstName);
	    		newDoc.setLname(lastName);
	    		newDoc.setAddress(address);
	    		newDoc.setDob(dob);
	    		newDoc.setFee(fee);
	    		newDoc.setSpecialisation(specialisation);
	    		newDoc.setPhone(phoneNumber);
	    		newDoc.setMob(mobileNumber);
	    		newDoc.setAcademics(academics);
	    		newDoc.setStatus(active);
	    		docs.add(newDoc);
	    	}
	    	DBConnection.conn.close();
	    	stmt.close();
	    	rs.close();
	    	
	    	return docs;
	    }
		
		public ArrayList<Doctor> getDoctors(int doctorID) throws SQLException, ClassNotFoundException {

			ArrayList<Doctor> doctor = new ArrayList<Doctor>();

			DBConnection.DBConnect();

			String queryStr = "SELECT * from doctor WHERE DoctorID = '" + doctorID + "'";
			Statement stmt = DBConnection.conn.createStatement();
			ResultSet rs = stmt.executeQuery(queryStr);

			while (rs.next()) {

				int docId = rs.getInt("DoctorID");
				String firstName = rs.getString("FirstName");
				String lastName = rs.getString("LastName");
				String address = rs.getString("DoctorAddress");
				int phoneNumber = rs.getInt("PhoneNumber");
				int mobileNumber = rs.getInt("MobileNumber");
				String specialisation = rs.getString("Specialisation");
				String dob = rs.getString("DoB");
				double fee = rs.getDouble("Fee");

				Doctor newDoc = new Doctor();

				newDoc.setDocID(docId);
				newDoc.setFname(firstName);
				newDoc.setLname(lastName);
				newDoc.setAddress(address);
				newDoc.setDob(dob);
				newDoc.setFee(fee);
				newDoc.setSpecialisation(specialisation);
				newDoc.setPhone(phoneNumber);
				newDoc.setMob(mobileNumber);

				doctor.add(newDoc);

			}

			DBConnection.conn.close();

			return doctor;

		}
		
		
		public int updateDoctor(int id, String firstName, String lastName, String address, int phoneNumber,
				int mobileNumber, String specialisation, String dob, double fee)
						throws SQLException, ClassNotFoundException {
			
			DBConnection.DBConnect();

			String queryUpdate = "UPDATE doctor SET FirstName = ?, LastName = ?, DoctorAddress = ?, PhoneNumber = ?, mobileNumber = ?, Specialisation  = ?, DoB  = ?, Fee  = ? WHERE DoctorID = ?";
			
			PreparedStatement pstmt = DBConnection.conn.prepareStatement(queryUpdate);
			
			pstmt.setString(1, firstName);
			pstmt.setString(2, lastName);
			pstmt.setString(3, address);
			pstmt.setInt(4, phoneNumber);
			pstmt.setInt(5, mobileNumber);
			pstmt.setString(6, specialisation);
			pstmt.setString(7, dob);
			pstmt.setDouble(8, fee);
			pstmt.setInt(9, id);

			int update = pstmt.executeUpdate();

			DBConnection.conn.close();
			pstmt.close();

			return update;

		}
		
		
		public int deleteDoctor(int id)throws SQLException, ClassNotFoundException {

			DBConnection.DBConnect();
			
			String queryDelete = "DELETE from doctor WHERE DoctorID = ?";
			
			PreparedStatement pstmt = DBConnection.conn.prepareStatement(queryDelete);
			
			pstmt.setInt(1, id);
			
			int update = pstmt.executeUpdate();
		
			DBConnection.conn.close();
			pstmt.close();
			
			return update;
		
		}
}
