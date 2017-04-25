package mu.candos.view;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import mu.candos.model.Patient;
import mu.candos.persistence.PatientManager;

import org.primefaces.event.SelectEvent;


@ManagedBean
@SessionScoped
public class PatientView {
	
	private int Id;
    private String firstName;
    private String lastName;
    private String address;
    private String phone;
    private String gender;
    private String  DOB;
    private String NIC;
    private float weight;
    private float height;
    
    private int successAdd = 0;
    private String  searchStr;
	private String searchType;
	private ArrayList<Patient> searchResults;
	
	
	private String header = "Add Patients";
	private boolean render = false;
	private boolean refresh = false;
	private boolean refreshAdd = true;
	
    
    

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getDOB() {
		return DOB;
	}



	public void setDOB(String dOB) {
		DOB = dOB;
	}



	public String getNIC() {
		return NIC;
	}



	public void setNIC(String nIC) {
		NIC = nIC;
	}



	public float getWeight() {
		return weight;
	}



	public void setWeight(float weight) {
		this.weight = weight;
	}



	public float getHeight() {
		return height;
	}



	public void setHeight(float height) {
		this.height = height;
	}



	public int getSuccessAdd() {
		return successAdd;
	}



	public void setSuccessAdd(int successAdd) {
		this.successAdd = successAdd;
	}



	public String getSearchStr() {
		return searchStr;
	}



	public void setSearchStr(String searchStr) {
		this.searchStr = searchStr;
	}



	public String getSearchType() {
		return searchType;
	}



	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}



	public ArrayList<Patient> getSearchResults() {
		return searchResults;
	}



	public void setSearchResults(ArrayList<Patient> searchResults) {
		this.searchResults = searchResults;
	}



	public String getHeader() {
		return header;
	}



	public void setHeader(String header) {
		this.header = header;
	}



	public boolean isRender() {
		return render;
	}



	public void setRender(boolean render) {
		this.render = render;
	}



	public boolean isRefresh() {
		return refresh;
	}



	public void setRefresh(boolean refresh) {
		this.refresh = refresh;
	}



	public boolean isRefreshAdd() {
		return refreshAdd;
	}



	public void setRefreshAdd(boolean refreshAdd) {
		this.refreshAdd = refreshAdd;
	}


//delete patient
	
   public String deletePat(Patient pa) throws SQLException, ClassNotFoundException {
	   
   PatientManager pat = new PatientManager();
   
    pat.deletePatients(pa);
    
	return "del";
	}
	
   public ArrayList<Patient> getAllPatients() {
	   
	   PatientManager pat = new PatientManager();
	   
	   return pat.getAllPatients();
   }
	
 //edit patient Information
   
   public String editPatients(Patient myPat) throws SQLException, ClassNotFoundException {
	   
		    setId(myPat.getId());
			setFirstName(myPat.getFirstName());
			setLastName(myPat.getLastName());
			setAddress(myPat.getAddress());
			setPhone(myPat.getPhone());
			setGender(myPat.getGender());
			setDOB(myPat.getDOB());
			setNIC(myPat.getNIC());
			setWeight(myPat.getWeight());
			setHeight(myPat.getHeight());
			
			return "editPatients";
			
		}
	
	
//Add patients
   
   public String addPatients()throws SQLException, ClassNotFoundException{
	   
		PatientManager add = new PatientManager();
		try {
			
			add.addPatient(firstName, lastName,address,phone,gender,DOB,NIC,weight,height);
			
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Info", "Patient added !"));
			
		} catch (Exception e) {
		
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error!", "Contact admin."));
		}
		return "patient";
	}
   
   
   
   
//search for patient
   
	public String searchPatients() {
		PatientManager pat = new PatientManager();
		searchResults = pat.searchPatient(searchType, searchStr);
		
		setHeader("Search Results");
		setRender(true);
		setRefresh(true);
		setRefreshAdd(false);
		
		for (Patient p : searchResults) {
			setFirstName(p.getFirstName());
			setLastName(p.getLastName());
			setAddress(p.getAddress());
			setPhone(p.getPhone());
			setGender(p.getGender());
			setDOB(p.getDOB());
			setNIC(p.getNIC());
            setWeight(p.getWeight());
			setHeight(p.getHeight());
			
		System.out.println("Method is called " + p.getFirstName());
		}
		return "success";
	}
	
     public String reset() {
		
		setHeader("Add Patients");
		setRender(false);
		setRefresh(false);
		setRefreshAdd(true);
		setFirstName(null);
		setLastName(null);
		setAddress(null);
		setDOB(null);
		setNIC(null);
		setWeight(0);
		setHeight(0);
		
		
		return "success";
	}
   }

