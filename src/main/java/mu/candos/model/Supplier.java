/**
 * 
 */
package mu.candos.model;

import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * @author Shahad
 *
 */
@Entity
public class Supplier {
	private int supplierID;
	private String fname;
	private String lname;
	private String phoneNum;
	private String address;
	private String compName;
	private String brn;
	
	@Id
	public int getSupplierID() {
		return supplierID;
	}
	public void setSupplierID(int supplierID) {
		this.supplierID = supplierID;
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
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCompName() {
		return compName;
	}
	public void setCompName(String compName) {
		this.compName = compName;
	}
	public String getBrn() {
		return brn;
	}
	public void setBrn(String brn) {
		this.brn = brn;
	}
	
	
}
