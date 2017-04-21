/**
 * 
 */
package mu.candos.persistence;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;

import mu.candos.jdbc.DBConnection;
import mu.candos.model.Inventory;

/**
 * @author Shahad
 *
 */
public class InventoryManager {
	private SessionFactory sessionFactory;
	
	public InventoryManager() {
		
		sessionFactory = new Configuration().configure().buildSessionFactory();
	}
	
	public int addMedicine(String medName, String dosage, int price, String expDate, String medCategory, int supID,
			int qty) throws SQLException, ClassNotFoundException {

		Session session = sessionFactory.openSession();
		
		Transaction tx = session.beginTransaction();
		
		Inventory inv = new Inventory();
		
		inv.setMedname(medName);
		inv.setDosage(dosage);
		inv.setPrice(price);
		inv.setExpDate(expDate);
		inv.setMedCategory(medCategory);
		inv.setQty(qty);
	
		
		if (qty > 10) {
			
			inv.setStockLevel("High");
			
		} else {
			
			inv.setStockLevel("Low");
		}
		
		inv.setSupplierID(supID);
		
		int invID = (Integer)session.save(inv);
		
		tx.commit();
		
		session.close();
		
		return invID;


	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public LinkedHashMap<String, Object> getAllSuppliers() throws SQLException, ClassNotFoundException{
		
		Session session = sessionFactory.openSession();
		
		Transaction tx = session.beginTransaction();
		
		// Use of SQL Native Query in Hibernate..
		
		NativeQuery query = session.createNativeQuery("SELECT SupplierID, SupplierName, SupplierSurname FROM supplier");
		
		List<Object[]> allSups = query.getResultList();
		

		LinkedHashMap <String, Object> suppliers = new LinkedHashMap<String, Object>();
			
			for(Object[] obj : allSups){
			
				suppliers.put(obj[1] + " " + obj[2] , obj[0]);
		
				}
		
		tx.commit();
		session.close();
		
		return suppliers;

	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<Inventory> getAllMedicines() throws SQLException, ClassNotFoundException {
		
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();

		ArrayList<Inventory> allInvs = (ArrayList<Inventory>)session.createQuery("from Inventory").getResultList();
		
		tx.commit();
		
		session.close();
		
		return allInvs;

	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList<Inventory> getAllLowStocks() throws SQLException, ClassNotFoundException {
		
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		
		String hql = "FROM Inventory i WHERE i.qty < 10";
		
		Query query = session.createQuery(hql);
		
		ArrayList<Inventory> allLowStocks = (ArrayList<Inventory>)query.getResultList();
		
		tx.commit();
		session.close();

		return allLowStocks;
	}
	
	public int updateStock(int medID, int quantity) throws SQLException, ClassNotFoundException {

		DBConnection.DBConnect();

		String get = "SELECT Quantity FROM medications WHERE MedcineID  = '" + medID +"'";
		
		Statement stmt = DBConnection.conn.createStatement();

		ResultSet rs = stmt.executeQuery(get);

		int old_stock = 0;

		while (rs.next()) {
			old_stock = rs.getInt("Quantity");
		}

		int new_quantity = old_stock + quantity;

		String update = "UPDATE medications SET Quantity = '" + new_quantity + "' WHERE MedcineID = '" + medID +"'";
		
		Statement stt = DBConnection.conn.createStatement();

		int upd = stt.executeUpdate(update);

		String medPrice = "SELECT Price, SupplierID FROM medications WHERE MedcineID = '" + medID +"'";
		
		Statement stm = DBConnection.conn.createStatement();
			
		ResultSet rs1 = stm.executeQuery(medPrice);
		
		double price = 0;
		int supID = 0;
		
		while(rs1.next()) {
			
			price = rs1.getDouble("Price");
			supID = rs1.getInt("SupplierID");
		}
		
		double total = price * quantity;
		
		String updateBilling = "INSERT INTO billing (TotalCharges, SupplierID) VALUES (?, ?)";
		
		
		PreparedStatement pstmt = DBConnection.conn.prepareStatement(updateBilling);
		pstmt.setDouble(1, total);
		pstmt.setInt(2, supID);
		
		int insert = pstmt.executeUpdate();
		
		pstmt.executeUpdate();
		
		stt.close();

		return upd;

	}
	
	public int updateInventory(int medID, String medName, String dosage, int price, String expDate, int supID,
			String medCategory) throws SQLException, ClassNotFoundException {

		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		
		Inventory inv = new Inventory();
		
		inv.setMedID(medID);
		inv.setMedname(medName);
		inv.setDosage(dosage);
		inv.setPrice(price);
		inv.setExpDate(expDate);
		inv.setMedCategory(medCategory);
		inv.setSupplierID(supID);
		
		session.update(inv);
		
		tx.commit();
		session.close();
		
		return 1;

	}
	
	
	public int deleteMedications(Inventory in) {
		
		
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		
		Inventory inv = (Inventory)session.get(Inventory.class, in.getMedID());		
		
		session.delete(inv);
		
		tx.commit();
		session.close();	
		
		return 1;
		
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList<Inventory> searchMedicine(String type, String search) {

		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();

	
		
		Query query = session.createQuery("from Inventory where Medname =:MName");
		
		query.setParameter("MName", search);
		
		
		
		// NativeQuery query = session.createNativeQuery("SELECT * FROM medications WHERE " + searchType + " LIKE '" + search + "%'");
		
		ArrayList<Inventory> searchResults = (ArrayList<Inventory>)query.getResultList();
		
		
		
		tx.commit();
		session.close();

		return searchResults;

	}
	
}
