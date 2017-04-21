<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>


<f:view>
		<jsp:include page="header.jsp" flush="true"/>
		<jsp:include page="navbar.jsp" flush="true"/>
		
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                  Billing
                  <small> Invoices</small>
               </h1>
                <ol class="breadcrumb">
                    <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Dashboard</a></li>
                    <li class="active">Billing</li>
                </ol>
            </section>
            <section class="content">
                <div class="row">
                    
                    <div class="col-md-6">
                        <div class="box box-danger">
                            <div class="box-header with-border">
                                <h3 class="box-title">List of Unpaid Invoices</h3>

                                <!-- /.box-tools -->
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body no-padding">
                                <div class="table-responsive mailbox-messages">
                                   <h:form>
                                    <h:dataTable value = "#{billingView.allUnpaids}" var="unpaid" styleClass="table table-hover table-striped"
											border="0" width="100%">
                                     <h:column>
												<f:facet name="header">
													<f:verbatim>
													Invoice ID
												</f:verbatim>
												</f:facet>
												<h:outputText value = "#{unpaid.invoiceID }" />
											</h:column>

											<h:column>
												<f:facet name="header">
													<f:verbatim>
													Total Charges (Rs)
												</f:verbatim>
												</f:facet>
												<h:outputText value = "#{unpaid.totalCharges }" />
											</h:column>	
																													
											<h:column>
												<f:facet name="header">
													<f:verbatim>
													Status
												</f:verbatim>
												</f:facet>
												<span style="color:red;"><h:outputText value = "#{unpaid.status }" styleClass ="color:red; font-weight:bold;"/></span>
											</h:column>
											
											<h:column>
												<f:facet name = "header">
													<f:verbatim>
													Action
													</f:verbatim>
												</f:facet>
												<h:commandButton styleClass = "btn btn-success btn-xs" value = "Pay" action="#{billingView.payBill(unpaid)}">
													<i class="fa fa-paypal"></i>
												</h:commandButton>
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

                    <div class="col-md-6">
                        <div class="box box-success">
                            <div class="box-header with-border">
                                <h3 class="box-title">List of Paid Invoices</h3>

                                <!-- /.box-tools -->
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body no-padding">
                                <div class="table-responsive mailbox-messages">
                                    <h:form>
                                    <h:dataTable value = "#{billingView.allPaids }" var="paid" styleClass="table table-hover table-striped"
											border="0" width="100%">
                                     <h:column>
												<f:facet name="header">
													<f:verbatim>
													Invoice ID
												</f:verbatim>
												</f:facet>
												<h:outputText value = "#{paid.invoiceID }" />
											</h:column>

											<h:column>
												<f:facet name="header">
													<f:verbatim>
													Total (Rs)
												</f:verbatim>
												</f:facet>
												<h:outputText value = "#{paid.totalCharges }" />
											</h:column>	
																		
											<h:column>
												<f:facet name="header">
													<f:verbatim>
													Date of Issue
												</f:verbatim>
												</f:facet>
												<h:outputText value = "#{paid.dateInvoice }" />
											</h:column>
											
												<h:column>
												<f:facet name="header">
													<f:verbatim>
													Status
												</f:verbatim>
												</f:facet>
												<span style="color:green;"><h:outputText value = "#{paid.status }" styleClass ="color:green;" /></span>
											</h:column>
											
											<h:column>
												<f:facet name = "header">
													<f:verbatim>
													Action
													</f:verbatim>
												</f:facet>
												<h:commandButton styleClass="btn btn-primary btn-xs" value="View Invoice" action="#{billingView.displayInvoice(paid)}"/>
												
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

		<jsp:include page="footer.jsp" flush="true"></jsp:include>
</f:view>    

</html>