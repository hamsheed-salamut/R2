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
<div class="col-md-6">
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">Search Existing Medicines</h3>
            <div class="box-tools">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            </div>
        </div>
        <h:form>
        <div class="box-body">
            <div class="row">
                <div class="col-md-5">
                
                    <label>Search By</label>
                      <h:selectOneMenu value="#{inventoryView.searchType }" styleClass="form-control">
                           <f:selectItem itemValue="1" itemLabel="Name" />
                    	   <f:selectItem itemValue="2" itemLabel="ID" />
                       </h:selectOneMenu>
                </div>
                <div class="col-md-5">
                    <label>Search String</label>
                  <h:inputText value="#{inventoryView.searchStr}" styleClass="form-control" required="true" id="srch" requiredMessage="Please enter a Medicine Name or ID"/>
                  <h:message for="srch" errorStyle="color:red"/>
                </div>
                <div class="col-md-2">
                    <label>Action</label>
                     <h:commandLink value="Search" action="#{inventoryView.searchMedicines}" styleClass="btn btn-success"/>
                  
                     <!-- Modal Starts Here -->
					  <div class="modal fade" id="myModal" role="dialog">
					    <div class="modal-dialog">
					    
					      <!-- Modal content-->
					      <div class="modal-content">
					        <div class="modal-header">
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					          <h4 class="modal-title">Search Results</h4>
					        </div>
					        
					        <!--  Add Contents here -->
					         <div class="box-body">
					         <div class="row">
					         <div class="col-md-6">
					      	  <label>Name</label>
                                 <h:inputText value="#{inventoryView.medname}" styleClass="form-control" />
                              </div>
                              </div>
                              <div class="row">
                                    <div class="col-md-6">
                                <label>Dosage (Gram)</label>
                                <h:inputText value="#{inventoryView.dosage }" styleClass="form-control" />
                               </div>
                               </div> 
                                <br/>
                                 <div class="row">
                                    <div class="col-md-6">
                                <label>Price</label>
                                 <h:inputText value="#{inventoryView.price}" styleClass="form-control" />
                                <br/>
                               
                                        <label>Expiry Date</label>
                                         <h:inputText value="#{inventoryView.expDate}" styleClass="form-control datepick" />
                                       
                                    </div>
                               
                               
                                <div class="col-md-6">
                                        <label>Medicine Category</label>
                                        <h:inputText value="#{inventoryView.expDate}" styleClass="form-control datepick" />
                             	</div>
                              	
                              	<div class="col-md-6">
                                        <label>Supplier</label>
                                        <h:inputText value="#{inventoryView.qty}" styleClass="form-control" />
                                </div>
                                  
                                    <div class="col-md-6">
                                        <label>Quantity</label>
                                         <h:inputText value="#{inventoryView.qty}" styleClass="form-control" />
                                    </div>
                                </div>    
                             </div>   
					        
					        
					 
					        <div class="modal-footer">
					          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					        </div>
					      </div>
					      
					    </div>
					  </div>
  			<!-- Modal ends here -->
                     
                 <script type="text/javascript">

					function openModal(){
					
					    $('#myModal').modal();
					}       
				</script>
                </div>
            </div>
            <br>

           </h:form> 
            <br/>
        </div>
        <!-- /.box-body -->
    </div>
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">List of Medicines</h3>
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
													Name
												</f:verbatim>
												</f:facet>
												<h:outputText value="#{medicines.medname }"/>
											</h:column>
											
											<h:column>
												<f:facet name="header">
													<f:verbatim>
													Stock Level
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
                        <div class="box box-solid box-warning">
                            <div class="box-header with-border">
                                <h3 class="box-title"><h:outputText value="#{inventoryView.header}" /></h3>
                                <div class="box-tools">
                                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                </div>
                            </div>
                            <h:form>

                            <div class="box-body">
                         
                         <c:if test="${inventoryView.successAdd eq 1 }"> 
                           	
                        <div class='alert alert-success' role='alert'>
						 <span class='glyphicon glyphicon-exclamation-sign aria-hidden='true'>
						 </span> <span class='sr-only'>Error:</span>
						 Medication added successfully 
						 </div>
				
						</c:if>
						
						
						<c:if test="${inventoryView.successAdd eq 2 }">
							
						<div class='alert alert-error' role='alert'>
							 <span class='glyphicon glyphicon-exclamation-sign aria-hidden='true'>
								 </span> <span class='sr-only'>Error:</span>
						 		An error occured.. Could not save medications details 
						 </div>
						
						</c:if>		
                                <label>Name</label>
                                 <h:inputText value="#{inventoryView.medname}" readonly="#{inventoryView.render}" styleClass="form-control" />
                                <br/>
                                <label>Dosage (Gram)</label>
                                <h:inputText value="#{inventoryView.dosage }" readonly="#{inventoryView.render}"  styleClass="form-control" />
                                <br/>
                                <label>Price</label>
                                 <h:inputText value="#{inventoryView.price}" readonly="#{inventoryView.render}"  styleClass="form-control" />
                                <br/>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Expiry Date</label>
                                         <h:inputText value="#{inventoryView.expDate}" readonly="#{inventoryView.render}"  styleClass="form-control datepick" />
                                       
                                    </div>
                                    <div class="col-md-6">
                                        <label>Medicine Category</label>
                                        	<h:selectOneMenu value="#{inventoryView.medCategory}" readonly="#{inventoryView.render}"  styleClass="form-control">
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
                                        <h:selectOneMenu value="#{inventoryView.supplierID}" readonly="#{inventoryView.render}"  styleClass="form-control">
											<f:selectItems value="#{inventoryView.allSuppliers }"/>
										</h:selectOneMenu>
                                    </div>
                                    <div class="col-md-6">
                                        <label>Quantity</label>
                                         <h:inputText value="#{inventoryView.qty}" disabled="#{inventoryView.render}"  styleClass="form-control" />
                                    </div>
                                </div>
                                <br>
                                <h:commandButton value="Add Medicine" action="#{inventoryView.addMedicines}" rendered="#{inventoryView.refreshAdd }"  styleClass="btn btn-warning"/>
                                <h:commandButton value="Refresh to Add Medicine" action="#{inventoryView.reset}" rendered="#{inventoryView.refresh }" styleClass="btn btn-info"/>
                            </div>
                           </h:form> 
                            <!-- /.box-body -->
                        </div>
                        <div class="box box-solid box-info">
                            <div class="box-header with-border">
                                <h3 class="box-title">List of Medicines to Reorder</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body no-padding">
                                <div class="table-responsive mailbox-messages">
                                  <h:form>
                                         <h:dataTable value="#{inventoryView.allMinStocks}" var="medicines" styleClass="table table-hover table-striped"
											border="0" width="100%">
								
											<h:column>
												<f:facet name="header">
													<f:verbatim>
													ID
												</f:verbatim>
												</f:facet>
												<h:outputText value="#{medicines.medID}"/>
											</h:column>

											<h:column>
												<f:facet name="header">
													<f:verbatim>
													Name
												</f:verbatim>
												</f:facet>
												<h:outputText value="#{medicines.medname}"/>
											</h:column>
											
											<h:column>
												<f:facet name="header">
													<f:verbatim>
													Stock Level
												</f:verbatim>
												</f:facet>
												<h:outputText value="#{medicines.qty}"/>
											</h:column>														
											
											<h:column>
												<f:facet name = "header">
													<f:verbatim>
													Action
													</f:verbatim>
												</f:facet>
												<h:commandButton action="#{inventoryView.reOrderMedicines(medicines)}" styleClass="btn btn-success btn-xs" value="Reorder"/>
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
                </div>
                <!-- /.row -->
            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->
 </f:view>
<jsp:include page="footer.jsp" flush="true"></jsp:include>