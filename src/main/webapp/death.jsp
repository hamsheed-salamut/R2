<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
		
		
<head>


</head>

  <%
	  if(session.getAttribute("name") == null){
	   	response.sendRedirect("login.jsp");
	  }
  %>

<jsp:include page="header.jsp"/>
<f:view>
	<jsp:include page="navbar.jsp"/>
    	
    	                 <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
           	List of deaths
            
          </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Dashboard</a></li>
                    <li><a href="#"><i class="fa fa-dashboard"></i> Deaths</a></li>
                    <li class="active">Deaths details</li>
                </ol>
            </section>
            <section class="content">
                <div class="row">
                    <!-- /.col -->
                    <div class="col-md-8">
                        <div class="box box-solid box-danger">
                            <div class="box-header with-border">
                                <h3 class="box-title">Details of deaths</h3>
                                <div class="box-tools">
                                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                </div>
                            </div>

        
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
		<jsp:include page="footer.jsp" flush="true"/>

