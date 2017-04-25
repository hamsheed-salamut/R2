package mu.candos.persistence;

import java.util.ArrayList;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;

import mu.candos.model.Inventory;
import mu.candos.model.Patient;



 public class PatientManager {
	
	private SessionFactory sessionFactory;
	public PatientManager() {
	sessionFactory = new Configuration().configure().buildSessionFactory();
	}
	
  public int addPatient(String firstName, String lastName, String address, String phone, String NIC, String DOB,String gender,float weight,float height) 
		 {
	  
        Session session = sessionFactory.openSession();
        
		Transaction tx = session.beginTransaction();
    
		Patient pat = new Patient();
		
		pat.setFirstName(firstName);
		pat.setLastName(lastName);
		pat.setAddress(address);
		pat.setDOB(DOB);
		pat.setPhone(phone);
		pat.setGender(gender);
		pat.setWeight(weight);
		pat.setHeight(height);
		
		int patID = (Integer)session.save(pat);
		tx.commit();
		session.close();
	    return patID;	    
  }    
   
 
    public int deletePatients(Patient pa) {
		
		
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		
		Patient pat = (Patient)session.get(Patient.class, pa.getId());		
		
		session.delete(pat);
		
		tx.commit();
		session.close();	
		
		return 1;
		
	}
	
    
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList<Patient> searchPatient(String type, String search) {

		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();

	
		Query query = session.createQuery("from Patient where firstName =:PName");
		
		query.setParameter("PName", search);
		
		
		
	// NativeQuery query = session.createNativeQuery("SELECT * FROM patients WHERE " + searchType + " LIKE '" + search + "%'");
		
	    ArrayList<Patient> searchResults = (ArrayList<Patient>)query.getResultList();
		
		tx.commit();
		session.close();

		return searchResults;

	}
 
	
	@SuppressWarnings("unchecked")
	public ArrayList<Patient> getAllPatients() {
		
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		
		ArrayList<Patient> allPats = (ArrayList<Patient>)session.createQuery("from Patient").getResultList();
		
		tx.commit();
		
		session.close();
		
		return allPats;
	}
	
	
}
