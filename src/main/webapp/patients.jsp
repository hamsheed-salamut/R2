<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="header.jsp" flush="true"/>
</head>
<body>
<f:view>
	
	<jsp:include page="navbar.jsp"/>

 <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Patients
            <small>Patients records</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li class="active">Patients Patients</li>
          </ol>
        </section>

        <section class="content">
          <div class="row">


            <div class="col-md-6">

               <div class="box box-primary">
                  <div class="box-header with-border">
                     <h3 class="box-title">Search Existing Patients</h3>
                     <div class="box-tools">
                        <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                     </div>
                  </div>
                  <h:form>
                  <div class="box-body">
                     <div class="row">
                        
                        <div class="col-md-5">
                           <label>Search By</label>
                           <h:selectOneMenu styleClass="form-control">
                                        	<f:selectItem itemValue="1" itemLabel="First Name" />
                                        	<f:selectItem itemValue="2" itemLabel="Last Name" />
                                        	<f:selectItem itemValue="3" itemLabel="NIC" />
                           </h:selectOneMenu>
                        </div>

                        <div class="col-md-5">
                           <label>Search String</label>
                           <h:inputText value="" styleClass="form-control"/>
                         
                        </div>

                        <div class="col-md-2">
                          <label>Action</label>
                          <h:commandButton value="Search" styleClass="btn btn-success"></h:commandButton>
                        </div>

                     </div>

                     <br>

                     <div class="row">
                       <div class="col-md-12">
                         <label>Search Result(s)</label>
                         <h:selectOneListbox styleClass="form-control">
										
						 </h:selectOneListbox>
                       </div>
                     </div>

                     <br/>
                     
                  </div>
                  </h:form>
                  <!-- /.box-body -->
               </div>

              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">List of Patients</h3>
                </div><!-- /.box-header -->
                <div class="box-body no-padding">
					<h:form>
                  <div class="table-responsive mailbox-messages">
                    <h:dataTable styleClass="table table-hover table-striped"
											border="0" width="100%">
								
											<h:column>
												<f:facet name="header">
													<f:verbatim>
													ID
												</f:verbatim>
												</f:facet>
												<h:outputText value="gfg"></h:outputText>
											</h:column>

											<h:column>
												<f:facet name="header">
													<f:verbatim>
													First Name
												</f:verbatim>
												</f:facet>
												<h:outputText value="gfgf"></h:outputText>
											</h:column>
											
											<h:column>
												<f:facet name="header">
													<f:verbatim>
													Last Name
												</f:verbatim>
												</f:facet>
												<h:outputText value="gfgf"></h:outputText>
											</h:column>
																
											<h:column>
												<f:facet name="header">
													<f:verbatim>
													NIC
												</f:verbatim>
												</f:facet>
												<h:outputText value="gfg"></h:outputText>
											</h:column>						

											<h:column>
												<f:facet name="header">
													<f:verbatim>
													Action
												</f:verbatim>
												</f:facet>
												<h:commandButton styleClass="btn btn-primary btn-xs" value="Edit"></h:commandButton>
												&nbsp;
												<h:commandButton styleClass="btn btn-danger btn-xs" value="Delete" onclick="return confirm('Are you sure to delete?');"></h:commandButton>
											</h:column>
																																	
										</h:dataTable>
										<!-- /.table -->
                  </div><!-- /.mail-box-messages -->
                  </h:form>
                </div><!-- /.box-body -->
              </div><!-- /. box -->
            </div><!-- /.col -->

            <div class="col-md-6">
			<div class="box box-solid box-success">
              
                <div class="box-header with-border">
                  <h3 class="box-title">Add New Patient</h3>
                  <div class="box-tools">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                  </div>
                </div>
                <h:form>
                <div class="box-body">

                          
                           <label>First Name</label>
                           <h:inputText value="" styleClass="form-control"/>
                         
                           <br/>
                           <label>Last Name</label>
                           <h:inputText value="" styleClass="form-control"/>
        
                             <br/>
                           <label>Address</label>
                           <h:inputText value="" styleClass="form-control"/>

                           <br/>
                           <div class="row">
                              <div class="col-md-6">
                                 <label>Date of Birth</label>
                                <h:inputText value="" styleClass="form-control datepick"/>
                              
                              </div>
                              <div class="col-md-6">
                                 <label>National Identity Card</label>
                                 <h:inputText value="" styleClass="form-control"/>
                        
                              </div>
                           </div>
                           <br/>
                           <div class="row">
                              <div class="col-md-6">
                                 <label>Phone Number</label>
                                 <h:inputText value="" styleClass="form-control"/>
                      
                              </div>
                              
                           </div>
                           <br/>
                           <div class="row">
                              
                              <div class="col-md-4">
                                 <label>Gender</label><br/>

                                 <h:selectOneRadio style="minimal">
									<f:selectItem itemValue="male" itemLabel="&nbsp; Male &nbsp;  <i class='fa fa-male'> </i> &nbsp; &nbsp;" escape="false"/> 
									<f:selectItem itemValue="female" itemLabel="&nbsp; Female &nbsp;  <i class='fa fa-female'> </i> &nbsp; &nbsp;" escape="false"/> 
								</h:selectOneRadio>
                         
                                 
                              </div>
                              
                              <div class="col-md-4">
                                 <label>Weight (kg)</label>
                                 <h:inputText value="" styleClass="form-control"/>
                      
                              </div>
                              
                              <div class="col-md-4">
                                 <label>Height (m)</label>
                                 <h:inputText value="" styleClass="form-control" >
                              </h:inputText>
                 
                              </div>
                              
                           </div>
                           <br>

                		<div class="row">
                			<div class="col-md-12"><h:commandButton value="Save Changes"  styleClass="btn btn-success"/></div>
                		</div>

		
			</h:form>
                </div><!-- /.box-body -->
               	
              </div><!-- /. box -->

            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      
 </f:view>


<jsp:include page="footer.jsp" flush="true" />
</html>