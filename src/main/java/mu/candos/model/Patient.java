package mu.candos.model;



import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="patient")
public class Patient {
	
	@Id @GeneratedValue
	@Column(name="PatientID")
	private int Id;
	
	@Column(name="FirstName")
    private String firstName;
	
	@Column(name="LastName")
    private String lastName;
	
	@Column(name="Address")
    private String address;
	
	@Column(name="PhoneNum")
    private String phone;
    
	@Column(name="Gender")
    private String gender;
    
	@Column(name="DOB")
    private String DOB;
	
	@Column(name="NIC")
    private String NIC;
	

	@Column(name="Weight")
    private float weight;
    
	@Column(name="Height")
    private float height;
	
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
 
}
