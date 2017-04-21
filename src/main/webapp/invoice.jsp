<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<f:view>
	
	<jsp:include page="header.jsp" flush="true"/>
	<jsp:include page="navbar.jsp" flush="true"/>
	
	<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Invoice

      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Payment</a></li>
        <li class="active">Invoice</li>
      </ol>
    </section>

    <div class="pad margin no-print">
      <div class="callout callout-info" style="margin-bottom: 0!important;">
        <h4><i class="fa fa-info"></i> Note:</h4>
        This page has been enhanced for printing. 
      </div>
    </div>

    <!-- Main content -->
    <section class="invoice">
      <!-- title row -->
      <div class="row">
        <div class="col-xs-12">
          <h2 class="page-header">
            <i class="fa fa-h-square"></i> Candos Hospital
            <small class="pull-right"><b style="color:red;">Invoice generated on <h:outputText value="#{billingView.dateNow }"/></b></small>
          </h2>
        </div>
        <!-- /.col -->
      </div>
      <!-- info row -->
      <div class="row invoice-info">
        <div class="col-sm-4 invoice-col">
          From
          <address>
            <strong>Candos Hospital</strong><br>
            Candos Vacoas Road, <br>
            Quatre Bornes<br>
            Phone: (230) 123-5432<br>
            Email: info@candos.com
          </address>
        </div>
        <!-- /.col -->
        <div class="col-sm-4 invoice-col">
          To
          <address>
            <strong><h:outputText value="#{billingView.supFname}, #{billingView.supLname}"/></strong><br>
            <h:outputText value="#{billingView.address }"/> <br>
            Phone: (230) <h:outputText value="#{billingView.phone}" /> <br>
          </address>
        </div>
        <!-- /.col -->
        <div class="col-sm-4 invoice-col">
          <b>Invoice #00<h:outputText value="#{billingView.invoiceID }"/></b><br>

        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

      <!-- Table row -->
      <div class="row">
        <div class="col-xs-12 table-responsive">
                     	<h:form>
                	<h:dataTable value="" styleClass="table table-hover table-striped"
											border="0" width="100%">
								
											<h:column>
												<f:facet name="header">
													<f:verbatim>
													Product ID
												</f:verbatim>
												</f:facet>
												<h:outputText value="#{billingView.medID}"/>
											</h:column>
											
											<h:column>
												<f:facet name="header">
													<f:verbatim>
													Qty
												</f:verbatim>
												</f:facet>
												<h:outputText value="#{billingView.qty }"/>
											</h:column>
											
											
											<h:column>
												<f:facet name="header">
													<f:verbatim>
													Product Name
												</f:verbatim>
												</f:facet>
												<h:outputText value="#{billingView.prodName}"/>
											</h:column>
											
											<h:column>
												<f:facet name="header">
													<f:verbatim>
													Unit Price
												</f:verbatim>
												</f:facet>
												<h:outputText value="#{billingView.price }"/>
											</h:column>																																	
										</h:dataTable>
								</h:form>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

      <div class="row">
        <!-- accepted payments column -->
        <div class="col-xs-6">
          <p class="lead">Payment Methods:</p>

          <img src="dist/img/credit/mastercard.png" alt="Mastercard">


        </div>
        <!-- /.col -->
        <div class="col-xs-6">
          <p class="lead" style="color:green;"><b>Amount Paid on <h:outputText value="#{billingView.dateInvoice }"/></b></p>

          <div class="table-responsive">
            <table class="table">

              <tr>
                <th>Total:</th>
                <td><h:outputText value="Rs #{billingView.totalCharges }"/></td>
              </tr>
            </table>
          </div>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

      <!-- this row will not appear when printing -->
      <div class="row no-print">
        <div class="col-xs-12">
          <a href="invoice-print.html" target="_blank" class="btn btn-default"><i class="fa fa-print"></i> Print</a>
          <button type="button" class="btn btn-success pull-right" style="margin-right: 5px;">
            <i class="fa fa-download"></i> Generate PDF
          </button>
        </div>
      </div>
    </section>
</div>

</f:view>

	<jsp:include page="footer.jsp" flush="true"></jsp:include>
</html>