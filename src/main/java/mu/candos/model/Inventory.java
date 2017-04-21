package mu.candos.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Inventory {
	private String Medname;
	private String dosage;
	private int price;
	private String expDate;
	private String medCategory;
	private int medID;
	private String stockLevel;
	private int supplierID;
	private String supplierValues;
	private int qty;
	private int newQuantity;
	
	boolean editable;
	
	public boolean isEditable() {
		return editable;
	}
	public void setEditable(boolean editable) {
		this.editable = editable;
	}
	public String getMedname() {
		return Medname;
	}
	public void setMedname(String medname) {
		Medname = medname;
	}
	public String getDosage() {
		return dosage;
	}
	public void setDosage(String dosage) {
		this.dosage = dosage;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getExpDate() {
		return expDate;
	}
	public void setExpDate(String expDate) {
		this.expDate = expDate;
	}
	public String getMedCategory() {
		return medCategory;
	}
	public void setMedCategory(String medCategory) {
		this.medCategory = medCategory;
	}
	@Id
	public int getMedID() {
		return medID;
	}
	public void setMedID(int medID) {
		this.medID = medID;
	}
	public String getStockLevel() {
		return stockLevel;
	}
	public void setStockLevel(String stockLevel) {
		this.stockLevel = stockLevel;
	}
	public int getSupplierID() {
		return supplierID;
	}
	public void setSupplierID(int supplierID) {
		this.supplierID = supplierID;
	}
	public String getSupplierValues() {
		return supplierValues;
	}
	public void setSupplierValues(String supplierValues) {
		this.supplierValues = supplierValues;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getNewQuantity() {
		return newQuantity;
	}
	public void setNewQuantity(int newQuantity) {
		this.newQuantity = newQuantity;
	}
	
	
}
