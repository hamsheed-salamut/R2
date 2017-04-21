<%@ page language="java" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>

<jsp:include page="header.jsp"/>
<jsp:include page="navbar.jsp"/>
		
		<f:view>
		<h:form>
		
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
            Case <h:outputText value=""></h:outputText>
          </h1>
                <ol class="breadcrumb">
                    <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Dashboard</a></li>
                    <li><a href="case.jsp"><i class="fa fa-dashboard"></i> Case</a></li>
                    <li class="active">View Case</li>
                </ol>
            </section>
            <section class="content">
                <div class="row">
                    <div class="col-md-6">
                        <div class="box box-solid box-info">
                            <div class="box-header with-border">
                                <h3 class="box-title">Patient & Case Information</h3>
                                <div class="box-tools">
                                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                </div>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Patient Name</label>
                                        <h:inputText value="" styleClass="form-control"></h:inputText>
                                    </div>
                           
                                </div>
                                <br/>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Doctor Assigned Name</label>
                                        <h:inputText value="" styleClass="form-control"></h:inputText>
                                    </div>
                                    <div class="col-md-6">
                                        <label>Doctor ID</label>
                                        <h:inputText value="" styleClass="form-control"></h:inputText>
                                    </div>
                                </div>
                                <br/>
                                <label>Problem on Registration</label>
                                <h:inputTextarea value="" styleClass="form-control" rows="2"></h:inputTextarea>
                                <br/>
                                <label>Additional Information Notes</label>
                                <h:inputTextarea value="" styleClass="form-control" rows="4" required="true" id="additional_info" 
                                requiredMessage="Additional Information is required"></h:inputTextarea>
                            	<h:message for="additional_info" errorClass="error"></h:message>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <div class="box box-solid box-success">
                            <div class="box-header with-border">
                                <h3 class="box-title">Appointment </h3>
                                <div class="box-tools">
                                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                </div>
                            </div>
                            <div class="box-body">
                            
                            	<p style="color:green;"><h:outputText value=""></h:outputText></p>
                            	<p style="color:red;"><h:outputText value=""></h:outputText></p>
                            
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Patient Name</label>
                                        <h:inputText value="" styleClass="form-control"></h:inputText>
                                    </div>
                                    <div class="col-md-6">
                                        <label>Patient ID</label>
                                        <h:inputText value="" styleClass="form-control" readonly="true"></h:inputText>
                                    </div>
                                </div>
                                <br/>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>Doctor Assigned Name</label>
                                        
											<h:selectOneMenu value="" styleClass="form-control" readonly="true">
										
											</h:selectOneMenu>
                                        
                                    </div>
                                </div>
                                <br/>
                                <label>Date</label>
                                <h:inputText value="" styleClass="form-control dob" readonly="true" />

                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /. box -->
                    </div>
                    <div class="col-md-6">
             
                            <h:form>
          
                            </h:form>
                            <!-- /.box-body -->
                     
                        <!-- /. box -->
                        <div class="box box-solid box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Prescription</h3>
                                <div class="box-tools">
                                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                </div>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>Prescription Given</label>
                                        
												<h:inputTextarea value="" styleClass="form-control" rows="3"/>
											
                                        <br/>

                                    </div>

                                </div>

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
        </h:form>
        </f:view>
		<jsp:include page="footer.jsp" flush="true"></jsp:include>
