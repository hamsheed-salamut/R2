package mu.candos.model;

public class Doctor {
	private int docID;
	private String fname;
	private String lname;
	private String address;
	private String dob;
	private int mob;
	private int phone;
	private String specialisation;
	private double fee;
	private String academics;
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
