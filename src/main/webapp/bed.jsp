<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<f:view>

  
  <%
	  if(session.getAttribute("name") == null){
	   	response.sendRedirect("login.jsp");
	  }
  %>

	<jsp:include page="header.jsp"/>
	<jsp:include page="navbar.jsp"/>
		
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
            Bed Allotment Module
            <small>Manage Bed Allotment</small>
          </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Dashboard</a></li>
                    <li class="active">Bed Allotment</li>
                </ol>
            </section>
            <section class="content">
                <div class="row">
<div class="col-md-6">

    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">List of Allocated Beds in Departments</h3>
        </div>
        <!-- /.box-header -->
        
        <div class="box-body no-padding">
            <div class="table-responsive mailbox-messages">
            	<h:form>
                	<h:dataTable value="#{inventoryView.allMedicines}" var="medicines" styleClass="table table-hover table-striped"
											border="0" width="100%">
								
											<h:column>
												<f:facet name="header">
													<f:verbatim>
													ID
												</f:verbatim>
												</f:facet>
												<h:outputText value="#{medicines.medID }"/>
											</h:column>

											<h:column>
												<f:facet name="header">
													<f:verbatim>
													Patient Name
												</f:verbatim>
												</f:facet>
												<h:outputText value="#{medicines.medname }"/>
											</h:column>
											
											<h:column>
												<f:facet name="header">
													<f:verbatim>
													Bed Number and Department
												</f:verbatim>
												</f:facet>
												<h:outputText value="#{medicines.qty}"/>
											</h:column>
																			
											<h:column>
												<f:facet name="header">
													<f:verbatim>
													Action
												</f:verbatim>
												</f:facet>
												<h:commandButton styleClass="btn btn-primary btn-xs" value="Edit" action="#{inventoryView.editMedications(medicines)}"/>
												&nbsp;
												<h:commandButton styleClass="btn btn-danger btn-xs" value="Delete" action="#{inventoryView.deleteMed(medicines)}" onclick="return confirm('Are you sure to delete?');" ></h:commandButton>
											</h:column>
																																	
										</h:dataTable>
								</h:form>		
                <!-- /.table -->
            </div>
            <!-- /.mail-box-messages -->
        </div>
        <!-- /.box-body -->
    </div>
    <!-- /. box -->
</div>

                    <!-- /.col -->
                    <div class="col-md-6">
                        <div class="box box-solid box-info">
                            <div class="box-header with-border">
                                <h3 class="box-title">Allocate new bed</h3>
                                <div class="box-tools">
                                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                </div>
                            </div>
                            <h:form>

                            <div class="box-body">
        	
                                <label>Patient Name</label>
                                 <h:inputText value="#{inventoryView.medname}" styleClass="form-control" />

                                <br/>
                                <label>Bed Number</label>
                                <h:inputText value="#{inventoryView.dosage }" styleClass="form-control" />
                                <br/>
                                <label>Department</label>
                                
                                      <h:selectOneListbox value="" styleClass="form-control">
                                      	
                                      	<f:selectItem itemLabel="Accident and Emergency Dept"/>
                                      	<f:selectItem itemLabel="Cardiac Unit"/>
                                      	<f:selectItem itemLabel="Intensive care Medical and Surgical Unit"/>
                                      	<f:selectItem itemLabel="Casualty"/>
                                      	<f:selectItem itemLabel="General Surgery"/>
                                      	<f:selectItem itemLabel="Orthopaedics Surgery"/>
                                      	<f:selectItem itemLabel="Gynaecology and Obstetrics"/>
                                      	<f:selectItem itemLabel="Neonatal Intensive Care"/>
                                      	<f:selectItem itemLabel="Radiology"/>
                                      </h:selectOneListbox>
                                      
                           
                                <br/>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Admission Date</label>
                                         <h:inputText value="#{inventoryView.expDate}" styleClass="form-control datepick" />
                                       
                                    </div>
                      
                                </div>
                                <br/>
                                <div class="row">
                                	<div class="col-md-6">
							          <div class="bootstrap-timepicker">
							                <div class="form-group">
							                  <label>Time Admitted</label>
							
							                  <div class="input-group">
							                    <input type="text" class="form-control timepicker">
							
							                    <div class="input-group-addon">
							                      <i class="fa fa-clock-o"></i>
							                    </div>
							                  </div>
							                  <!-- /.input group -->
							                </div>
							                <!-- /.form group -->
							              </div>
							           </div>   
                                </div>
                                <br>
                                <h:commandButton value="Allocate Bed" action="#{inventoryView.addMedicines}" styleClass="btn btn bg-purple"></h:commandButton>
                            </div>
                           </h:form> 
                            <!-- /.box-body -->
                        </div>

                        <!-- /. box -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->
 </f:view>
<jsp:include page="footer.jsp" flush="true"></jsp:include>