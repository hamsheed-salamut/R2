<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="header.jsp"/>
</head>
        <%
        
        	if(session.getAttribute("uname") == null) {
        		
        		response.sendRedirect("login.jsp");
        	}
        
        %>  
	<jsp:include page="navbar.jsp"/>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Dashboard
        <small>Version 2.0</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Info boxes -->
      <div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
          <a href="addDoctor.jsp"><span class="info-box-icon bg-aqua"><i class="fa fa-user-md"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Manage Doctors</span>
              <span class="info-box-number">Doctor Module</span>
            </div>
            <!-- /.info-box-content -->
         </a>   </div>
          
          
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
          <a href="patients.jsp">  <span class="info-box-icon bg-orange"><i class="fa fa-wheelchair"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Manage Patients</span>
              <span class="info-box-number">Patient Module</span>
            </div>
            <!-- /.info-box-content -->
         </a></div>
         
         
          
          <!-- /.info-box -->
        </div>
        <!-- /.col -->

        <!-- fix for small devices only -->
        <div class="clearfix visible-sm-block"></div>

        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
          <a href="medications.jsp">
            <span class="info-box-icon bg-green"><i class="fa fa-heartbeat"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Manage Medications</span>
              <span class="info-box-number">Medication Module</span>
            </div>
           </a> 
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
          <a href="nurse.jsp">
            <span class="info-box-icon bg-purple"><i class="fa fa-stethoscope"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Manage Nurses</span>
              <span class="info-box-number">Nurse Module</span>
            </div>
           </a>
            
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        
        
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
          <a href="bed.jsp">
            <span class="info-box-icon bg-blue"><i class="fa fa-bed"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Manage Beds</span>
              <span class="info-box-number">Bed Allotment</span>
            </div>
           </a> 
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
                <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
          
          <a href="death.jsp">
          
            <span class="info-box-icon bg-red"><i class="glyphicon glyphicon-trash"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Manage Death reports</span>
              <span class="info-box-number">Death Report</span>
            </div>
           </a> 
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        
                <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
          <a href="billing.jsp">
          
            <span class="info-box-icon bg-maroon"><i class="glyphicon glyphicon-usd"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Manage Payments</span>
              <span class="info-box-number">Billing Module</span>
            </div>
            <!-- /.info-box-content -->
          </div>
         </a> 
          
          <!-- /.info-box -->
        </div>
        
                <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
          
          <a href="admin.jsp">
          
            <span class="info-box-icon bg-olive"><i class="glyphicon glyphicon-user"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Manage Users</span>
              <span class="info-box-number">Administrator Module</span>
            </div>
            <!-- /.info-box-content -->
            </a> 
        
          </div>
         
       
          <!-- /.info-box -->
        </div>
        
      </div>
      <!-- /.row -->

      <div class="row">
        <div class="col-md-12">
          <div class="box">
			 <div class="box-header">
              <i class="fa fa-envelope"></i>

              <h3 class="box-title">Quick Email</h3>
              <!-- tools box -->
  
              <!-- /. tools -->
            </div>
            <div class="box-body">
              <form action="#" method="post">
                <div class="form-group">
                  <input type="email" class="form-control" name="emailto" placeholder="Email to:">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" name="subject" placeholder="Subject">
                </div>
                <div>
                  <textarea class="textarea" placeholder="Message" style="width: 100%; height: 125px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                </div>
              </form>
            </div>
            <div class="box-footer clearfix">
              <button type="button" class="pull-right btn btn-success" id="sendEmail">Send
                <i class="fa fa-arrow-circle-right"></i></button>
            </div>
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

          <!-- /.box -->
        </div>
        <!-- /.col -->

  <jsp:include page="footer.jsp"/>  


</html>