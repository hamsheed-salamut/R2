/**
 * 
 */
package mu.candos.view;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.bean.SessionScoped;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.servlet.jsp.jstl.sql.Result;

import mu.candos.jdbc.DBConnection;
import mu.candos.model.Inventory;
import mu.candos.persistence.InventoryManager;


/**
 * @author Shahad
 *
 */
@ManagedBean
@SessionScoped
public class InventoryView {
	
	private String Medname;
	private String dosage;
	private int price;
	private String expDate;
	private String medCategory;
	private int medID;
	private int stockLevel;
	private int supplierID;
	private String supplierValues;
	private int qty;
	private int newQuantity;
	private int successAdd = 0;
	private String  searchStr;
	private String searchType;
	private ArrayList<Inventory> searchResults;
	
	private String header = "Add Medicines";
	private boolean render = false;
	private boolean refresh = false;
	private boolean refreshAdd = true;
	
	
	public boolean isRefreshAdd() {
		return refreshAdd;
	}

	public void setRefreshAdd(boolean refreshAdd) {
		this.refreshAdd = refreshAdd;
	}

	public boolean isRefresh() {
		return refresh;
	}

	public void setRefresh(boolean refresh) {
		this.refresh = refresh;
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

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchStr() {
		return searchStr;
	}

	public void setSearchStr(String searchStr) {
		this.searchStr = searchStr;
	}

	public ArrayList<Inventory> getSearchResults() {
		return searchResults;
	}

	public void setSearchResults(ArrayList<Inventory> searchResults) {
		this.searchResults = searchResults;
	}

	public int getSuccessAdd() {
		return successAdd;
	}

	public void setSuccessAdd(int successAdd) {
		this.successAdd = successAdd;
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

	public int getMedID() {
		return medID;
	}

	public void setMedID(int medID) {
		this.medID = medID;
	}

	public int getStockLevel() {
		return stockLevel;
	}

	public void setStockLevel(int stockLevel) {
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

	public String addMedicines()throws SQLException, ClassNotFoundException{
		
		InventoryManager add = new InventoryManager();
		
		try {
			
			if (Medname != null) {
				successAdd = add.addMedicine(Medname, dosage, price, expDate, medCategory, supplierID, qty);
			}
			
		} catch (Exception e) {
			
			successAdd = 2;
			
		}
		
		return "medicine";
	}
	
	public LinkedHashMap<String, Object> getAllSuppliers() throws ClassNotFoundException, SQLException {
		
		InventoryManager sups = new InventoryManager();
		
		return sups.getAllSuppliers();
	}
	
	InventoryManager inv = new InventoryManager();
	
	public ArrayList<Inventory> getAllMedicines() throws SQLException, ClassNotFoundException {
		
		return inv.getAllMedicines();
	
	}
	
	public ArrayList<Inventory> getAllMinStocks() throws SQLException, ClassNotFoundException {
		
		return inv.getAllLowStocks();
	}
	
	public String reOrderMedicines(Inventory in) throws SQLException, ClassNotFoundException {
		
		setMedID(in.getMedID());
		setMedname(in.getMedname());
		setQty(in.getQty());
		
		
		return "update_inventory"; // redirects to the update_inventory.jsp page
		
	}
	
	public String updateStocks() throws SQLException, ClassNotFoundException {
		
		InventoryManager inv = new InventoryManager();
		
		System.out.println(medID + "------ " + newQuantity);
		
		inv.updateStock(medID, newQuantity);
		
		return "medications";
	}
	
	public String editMedications(Inventory myInv) throws SQLException, ClassNotFoundException {
		
	//	InventoryManager inv = new InventoryManager();
		
	//	inv.updateInventory(medID, Medname, dosage, price, expDate, supplierID, medCategory);
		
		setMedID(myInv.getMedID());
		
		setMedname(myInv.getMedname());
		setDosage(myInv.getDosage());
		setExpDate(myInv.getExpDate());
		setQty(myInv.getQty());
		setPrice(myInv.getPrice());
		
		return "editMedications";
		
	}
	
	public String updateMedications() throws SQLException, ClassNotFoundException {
		
		InventoryManager inv = new InventoryManager();
		
		inv.updateInventory(medID, Medname, dosage, price, expDate, supplierID, medCategory);
		
		return "medications";
	}
	
	public String deleteMed(Inventory in) throws SQLException, ClassNotFoundException {
		
		InventoryManager inv = new InventoryManager();
	
		
		inv.deleteMedications(in);
		
		return "del";
	}
	
	public String searchMedicines() {
		
		searchResults = inv.searchMedicine(searchType, searchStr);
		
		setHeader("Search Results");
		setRender(true);
		setRefresh(true);
		setRefreshAdd(false);
		
		for (Inventory i : searchResults) {
			
			setMedname(i.getMedname());
			setDosage(i.getDosage());
			setExpDate(i.getExpDate());
			setMedCategory(i.getMedCategory());
			setQty(i.getQty());
			setPrice(i.getPrice());
			setSupplierID(i.getSupplierID());
			
			System.out.println("Method is called " + i.getMedname());
		}
		
		return "success";
	}
	
	public String reset() {
		
		setHeader("Add Medicines");
		setRender(false);
		setRefresh(false);
		setRefreshAdd(true);
		setMedname(null);
		setDosage(null);
		setExpDate(null);
		setMedCategory(null);
		setQty(0);
		setPrice(0);
		setSupplierID(0);
		
		return "success";
	}
}
