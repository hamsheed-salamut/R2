/**
 * 
 */
package mu.candos.view;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import mu.candos.model.Billing;
import mu.candos.persistence.BillingManager;

/**
 * @author Shahad
 *
 */
@ManagedBean
@SessionScoped
public class BillingView {
	
	private int invoiceID;
	private double totalCharges;
	private String dateIssue;
	private String status;
	private int qty;
	private double price;
	private String prodName;
	private int medID;
	private String supFname;
	private String supLname;
	private String address;
	private int phone;
	private Date dateNow = new Date();
	private String dateInvoice;
	
	public String getDateInvoice() {
		return dateInvoice;
	}
	public void setDateInvoice(String dateInvoice) {
		this.dateInvoice = dateInvoice;
	}
	public Date getDateNow() {
		return dateNow;
	}
	public void setDateNow(Date dateNow) {
		this.dateNow = dateNow;
	}
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
	public int getMedID() {
		return medID;
	}
	public void setMedID(int medID) {
		this.medID = medID;
	}
	public int getInvoiceID() {
		return invoiceID;
	}
	public void setInvoiceID(int invoiceID) {
		this.invoiceID = invoiceID;
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
	
	public ArrayList<Billing> getAllUnpaids() throws SQLException, ClassNotFoundException {
		
		BillingManager bm = new BillingManager();
		
		return bm.getAllUnpaid();
	}
	
	public String payBill(Billing bil) throws SQLException, ClassNotFoundException {
		
		BillingManager bm = new BillingManager();
		
		Date dateIssue = Calendar.getInstance().getTime();
		
		String status = "paid";
		
		bm.updateBilling(bil.getInvoiceID(), status, dateIssue.toString());
		
		return "paid";
	}
	
	public ArrayList<Billing> getAllPaids() throws SQLException, ClassNotFoundException {
		
		BillingManager bm = new BillingManager();
		
		return bm.getAllpaid();
	}
	
	public String displayInvoice(Billing bil) throws SQLException, ClassNotFoundException {
		
		setMedID(bil.getMedID());
		setProdName(bil.getProdName());
		setPrice(bil.getPrice());
		setQty(bil.getQty());
		setSupFname(bil.getSupFname());
		setSupLname(bil.getSupLname());
		setAddress(bil.getAddress());
		setPhone(bil.getPhone());
		setDateInvoice(bil.getDateInvoice());
		setTotalCharges(bil.getTotalCharges());
		return "invoice";
	}
}