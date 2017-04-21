/**
 * 
 */
package mu.candos.model;

/**
 * @author Shahad
 *
 */
public class Billing {
	
	private int medID;
	private int invoiceID;
	private int supplierID;
	private double totalCharges;
	private String dateIssue;
	private String status;
	private String dateInvoice;
	private int qty;
	private double price;
	private String prodName;
	private String supFname;
	private String supLname;
	private String address;
	private int phone;
	
	public String getSupFname() {
		return supFname;
	}
	public void setSupFname(String supFname) {
		this.supFname = supFname;
	}
	public String getSupLname() {
		return supLname;
	}
	public void setSupLname(String supLname) {
		this.supLname = supLname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public int getMedID() {
		return medID;
	}
	public void setMedID(int medID) {
		this.medID = medID;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public int getInvoiceID() {
		return invoiceID;
	}
	public void setInvoiceID(int invoiceID) {
		this.invoiceID = invoiceID;
	}
	public int getSupplierID() {
		return supplierID;
	}
	public void setSupplierID(int supplierID) {
		this.supplierID = supplierID;
	}
	public double getTotalCharges() {
		return totalCharges;
	}
	public void setTotalCharges(double totalCharges) {
		this.totalCharges = totalCharges;
	}
	public String getDateIssue() {
		return dateIssue;
	}
	public void setDateIssue(String dateIssue) {
		this.dateIssue = dateIssue;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDateInvoice() {
		return dateInvoice;
	}
	public void setDateInvoice(String dateInvoice) {
		this.dateInvoice = dateInvoice;
	}

	
	
}
