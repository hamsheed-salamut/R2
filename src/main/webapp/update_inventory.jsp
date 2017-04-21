<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<f:view>

	<jsp:include page="header.jsp"/>
	<jsp:include page="navbar.jsp"/>
		        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
            Medication Module
            <small>Manage Medicines Inventory</small>
          </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Dashboard</a></li>
                    <li class="active">Inventory</li>
                </ol>
            </section>
            <section class="content">
                <div class="row">
                    <!-- /.col -->
                    <div class="col-md-6">
                        <div class="box box-solid">
                            <div class="box-header with-border">
                                <h3 class="box-title">Update Medecine</h3>
                                <div class="box-tools">
                                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                </div>
                            </div>
                            <div class="box-body">
                              <h:form>
                                <label>ID</label>
                                <h:inputText value ="#{inventoryView.medID}" styleClass="form-control" disabled="true"/>
                                <br/>
                                <label>Name</label>
                                <h:inputText value ="#{inventoryView.medname}" styleClass="form-control" readonly="true"/>
                                
                                <br/>
                                <label>Amount to put in stock</label>
                                <h:inputText value ="#{inventoryView.newQuantity}" styleClass="form-control"/>

								<br/><br/>
                                <h:commandButton value="Update Stock" action="#{inventoryView.updateStocks}" styleClass="btn btn-success"/>
                                
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
 </body>       <!-- /.content-wrapper -->
 </f:view>
<jsp:include page="footer.jsp" flush="true"></jsp:include>
