/**
 * 
 */
package mu.candos.persistence;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import mu.candos.model.*;
import mu.candos.jdbc.DBConnection;

/**
 * @author Shahad
 *
 */
public class DoctorManager {
	
	private SessionFactory sessionFactory;
	
	public DoctorManager() {
		
		sessionFactory = new Configuration().configure().buildSessionFactory();
	}
	
		public Doctor addDoctor(Doctor doc) throws SQLException, ClassNotFoundException {
			
			DBConnection.DBConnect();
			
			String queryInsert = "INSERT INTO doctor (FirstName,LastName,DoctorAddress,PhoneNumber,MobileNumber,Specialisation,DoB,Fee,Academics,Active) VALUES (?,?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement pstmt = DBConnection.conn.prepareStatement(queryInsert);
			
			pstmt.setString(1, doc.getFname());
			pstmt.setString(2, doc.getLname());
			pstmt.setString(3, doc.getAddress());
			pstmt.setInt(4, doc.getPhone());
			pstmt.setInt(5, doc.getMob());
			pstmt.setString(6, doc.getSpecialisation());
			pstmt.setString(7, doc.getDob());
			pstmt.setDouble(8, doc.getFee());
			pstmt.setString(9, doc.getAcademics());
			pstmt.setBoolean(10, doc.isStatus());
			
			int insert = pstmt.executeUpdate();
			
			DBConnection.conn.close();
			
			pstmt.close();
			
			return doc;
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
		
		
		public Doctor updateDoctor(Doctor doc) {
			
			Session session = sessionFactory.openSession();
			Transaction tx = session.beginTransaction();
			
			Doctor dc = new Doctor();
			
			dc.setFname(doc.getFname());
			dc.setLname(doc.getLname());
			dc.setAddress(doc.getAddress());
			dc.setDob(doc.getDob());
			dc.setDocID(doc.getDocID());
			dc.setMob(doc.getMob());
			dc.setPhone(doc.getPhone());
			dc.setSpecialisation(doc.getSpecialisation());
			dc.setAcademics(doc.getAcademics());
			dc.setStatus(doc.isStatus());
			dc.setFee(doc.getFee());
			
			session.update(dc);
			
			tx.commit();
			
			session.close();

			return doc;

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
