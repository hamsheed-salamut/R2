<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
		<jsp:include page="header.jsp"/>
</head>


	<jsp:include page="navbar.jsp"/>
	<f:view>
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
            Update Medications
            
          </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Dashboard</a></li>
                    <li><a href="#"><i class="fa fa-dashboard"></i> Medications</a></li>
                    <li class="active">Update Medications</li>
                </ol>
            </section>
            <section class="content">
                <div class="row">
                    <!-- /.col -->
                    <div class="col-md-6">
                        <div class="box box-solid">
                            <div class="box-header with-border">
                                <h3 class="box-title">Update Medications</h3>
                                <div class="box-tools">
                                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                </div>
                            </div>
                            <div class="box-body">
                              <h:form>	
                                <label>Name</label>
                                <h:inputText value ="#{inventoryView.medname}" styleClass="form-control"/>
                                <br/>
                                <label>Dosage (Gram)</label>
                                <h:inputText value ="#{inventoryView.dosage}"  styleClass="form-control"/>
                                <br/>
                                <label>Price</label>
                                <h:inputText value ="#{inventoryView.price}"  styleClass="form-control"/>
                                <br/>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Expiry Date</label>
                                        <h:inputText value ="#{inventoryView.expDate}" styleClass="form-control datepick"/>
                                    </div>
                                    <div class="col-md-6">
                                        <label>Medicine Category</label>
                                        <h:selectOneMenu value="#{inventoryView.medCategory }" styleClass="form-control">
                           						 <f:selectItem itemValue="1" itemLabel="A" />
                    	  						 <f:selectItem itemValue="2" itemLabel="B" />
                    	  						 <f:selectItem itemValue="3" itemLabel="C" />
                    	  						 <f:selectItem itemValue="4" itemLabel="D" />
                    	  						 <f:selectItem itemValue="5" itemLabel="E" />
                       					</h:selectOneMenu>
                                    </div>
                                </div>
                                <br/>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Supplier</label>
                                        <h:selectOneMenu value="#{inventoryView.supplierID}" styleClass="form-control">
											<f:selectItems value="#{inventoryView.allSuppliers }"/>
										</h:selectOneMenu>
                                    </div>
                                    <div class="col-md-6">
                                        <label>Quantity</label>
                                        <h:inputText value = "#{inventoryView.qty }" styleClass="form-control" disabled="true"/>
                                    </div>
                                </div>
                                <br>
                                <h:commandButton value="Update Medicine" action="#{inventoryView.updateMedications}" styleClass="btn btn-primary"/>
                                
                               </h:form> 
                            </div>
                            <!-- /.box-body -->
                        </div>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </section>
            <!-- /.content -->
        </div>
        
       </f:view> 
        <!-- /.content-wrapper -->
    <jsp:include page="footer.jsp" flush="true"/>  

</html>

