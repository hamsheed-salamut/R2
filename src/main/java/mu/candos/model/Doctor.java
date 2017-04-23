package mu.candos.model;

import javax.persistence.*;

@Entity
@Table(name = "doctor")
public class Doctor {
	@Id @GeneratedValue
	@Column(name="DoctorID")
	private int docID;
	@Column(name="FirstName")
	private String fname;
	@Column(name="LastName")
	private String lname;
	@Column(name="DoctorAddress")
	private String address;
	@Column(name="DoB")
	private String dob;
	@Column(name="mobileNumber")
	private int mob;
	@Column(name="PhoneNumber")
	private int phone;
	@Column(name="Specialisation")
	private String specialisation;
	@Column(name="Fee")
	private double fee;
	@Column(name="Academics")
	private String academics;
	@Column(name="Active")
	private boolean status;
	
	public int getDocID() {
		return docID;
	}
	public void setDocID(int docID) {
		this.docID = docID;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public int getMob() {
		return mob;
	}
	public void setMob(int mob) {
		this.mob = mob;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getSpecialisation() {
		return specialisation;
	}
	public void setSpecialisation(String specialisation) {
		this.specialisation = specialisation;
	}
	public double getFee() {
		return fee;
	}
	public void setFee(double fee) {
		this.fee = fee;
	}
	public String getAcademics() {
		return academics;
	}
	public void setAcademics(String academics) {
		this.academics = academics;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	
	
}
