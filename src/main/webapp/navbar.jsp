<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
        <%
        
        	if(session.getAttribute("uname") == null) {
        		
        		response.sendRedirect("login.jsp");
        	}
        
        %>    
    
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">

    <!-- Logo -->
    <a href="index.jsp" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>H</b>MS</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Candos</b>HMS</span>
    </a>

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
           
            </a>
            <ul class="dropdown-menu">
         
            </ul>
          </li>
          <!-- Notifications: style can be found in dropdown.less -->
          <li class="dropdown notifications-menu">
          
         
          </li>
          <!-- Tasks: style can be found in dropdown.less -->
          <li class="dropdown tasks-menu">
         
       
          </li>
          <!-- User Account: style can be found in dropdown.less -->
          
      </div>

    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        
        
        <div class="pull-left info">
          <p><%=session.getAttribute("name") %></p>
          <a href="#"><i class="fa fa-circle text-success"></i> Admin </a>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">MAIN NAVIGATION</li>
        
        <li class="active treeview"><a href="index.jsp"><i class="fa fa-circle-o text-green"></i> <span>Dashboard</span></a></li>
        <li class="treeview">
          <a href="addDoctor.jsp">
            <i class="fa fa-user-md"></i> <span>Doctor Module</span>
            <span class="pull-right-container">
          
            </span>
          </a>
 
        </li>
        <li class="treeview">
          <a href="patients-new.xhtml">
            <i class="fa fa-wheelchair"></i>
            <span>Patient Module</span>
            <span class="pull-right-container">
             
            </span>
          </a>
      
        </li>
        <li>
          <a href="medications.jsp">
            <i class="fa fa-heartbeat"></i> <span>Medication Module</span>
          </a>
        </li>
        <li class="treeview">
          <a href="nurse.jsp">
            <i class="fa fa-plus-square custom"></i>
            <span>Nurse Module</span>
          </a>
        </li>
        <li class="treeview">
          <a href="bed.jsp">
            <i class="fa fa-bed"></i>
            <span>Bed Allotment</span>
      
          </a>
        </li>
        <li class="treeview">
          <a href="death.jsp">
            <i class="glyphicon glyphicon-trash"></i> <span>Death Report</span>
          </a>

        </li>
        
        <li class="treeview">
          <a href="billing.jsp">
            <i class="glyphicon glyphicon-usd"></i> <span>Billing Module</span>

          </a>
        </li>
        
        <li>
          <a href="admin.jsp">
            <i class="fa fa-user"></i> <span>Administrator Module</span>
    
          </a>
        </li>
        <li>
        </li>
	<li><a href="logout.jsp"><i class="fa fa-circle-o text-yellow"></i> <span>Log out</span></a></li>
     
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
  
</body>