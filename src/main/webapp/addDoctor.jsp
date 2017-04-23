<!DOCTYPE html>
<jsp:useBean id="db" class="mu.candos.persistence.DoctorManager" scope="session"/>

<%@page import="java.sql.*,mu.candos.model.Login,mu.candos.model.*,mu.candos.webclient.*,java.util.*" %>

<%
	String update_success = "0";

	if (session.getAttribute("update") != null) {

		update_success = session.getAttribute("update").toString();

	}
%>

<%
	String delete_success = "0";

	if (session.getAttribute("delete") != null) {

		delete_success = session.getAttribute("delete").toString();

	}
%>


<%
	Boolean isSubmitted = Boolean.parseBoolean(request.getParameter("submitted"));

	String firstName = null, lastName = null, address = null, specialisation = null, academics = null,
			 dob = null;
	int active = 0;
	
	int phoneNumber = 0, mobileNumber = 0;
	double fee = 0.0;
	int success = 0;
	String errorMessage = null;
	String status = null;
	//Error variable
	
	Boolean error_exist = false;
	ArrayList<String> errors = new ArrayList<String>();

	if (isSubmitted) {
		Doctor doc = new Doctor();
		try {
			
			doc.setFname(request.getParameter("first-name"));
			doc.setLname(request.getParameter("last-name"));
			doc.setAddress(request.getParameter("address"));
			doc.setPhone(Integer.parseInt(request.getParameter("phone-number")));
			doc.setMob(Integer.parseInt(request.getParameter("mobile-number")));
			doc.setSpecialisation(request.getParameter("category"));
			doc.setAcademics(request.getParameter("academics"));
			doc.setStatus(Boolean.parseBoolean(request.getParameter("active")));
			doc.setDob(request.getParameter("dob"));
			doc.setFee(Double.parseDouble(request.getParameter("fee")));
		
		} catch (Exception e){
			
			errors.add("The following errors occured: ");
			error_exist = true;
		}

		
		if(doc.getFname() == null || doc.getFname() == "" || doc.getFname().length() < 1){
			errors.add("First Name invalid");
			error_exist = true;
		}
		
		if(doc.getLname() == null || doc.getLname() == "" || doc.getLname().length() < 1){
			errors.add("Last Name invalid");
			error_exist = true;
		}
		
		if(doc.getAddress() == null || doc.getAddress() == "" || doc.getAddress().length() < 1){
			errors.add("Address invalid");
			error_exist = true;
		}
		
		if(String.valueOf(doc.getPhone()).length()> 8 || String.valueOf(doc.getPhone()).length() < 7){
			errors.add("Invalid Telephone Number");
			error_exist = true;
		}
		
		if(String.valueOf(doc.getMob()).length()> 8 || String.valueOf(doc.getMob()).length() < 8){
			errors.add("Invalid Mobile Number");
			error_exist = true;
		}
		
		if(doc.getAcademics() == null || doc.getAcademics() == "" || doc.getAcademics().length() < 1){
			errors.add("Academics Qualifications invalid");
			error_exist = true;
		}
		
		
		if(error_exist == false){

			 db.addDoctor(doc);
			
			 success = 1;
			 
			} else {

				success = 2;
				//response.sendRedirect("addDoctor.jsp");

			}
		

	}
%>	

   <%
   		// Create an instance of Web Service Doctor Client here
   		
   		DoctorClient client = new DoctorClient();
   		
   		ArrayList<Doctor> docs = client.getAllDoctors();
   %>	
	
	
	<jsp:include page="header.jsp"/>
	<jsp:include page="navbar.jsp"/>

      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Doctors
            <small>20 Doctors</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li class="active">Doctors</li>
          </ol>
        </section>

        <section class="content">
 				
          <div class="row">
            <div class="col-md-5">

              <div class="box box-solid">
                <div class="box-header with-border">
                  <h3 class="box-title">Add New Doctor</h3>
                  <div class="box-tools">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                  </div>
                </div>
                <div class="box-body">
				<form action="addDoctor.jsp" method="post">
				<input type="hidden" name="submitted" value="true">
								<!-- ERROR DISPLAY -->
				
				<% if(isSubmitted == true && error_exist == true) {%>
        
					<div class="alert alert-danger" role="alert">
						<span class="glyphicon glyphicon-exclamation-sign"
						aria-hidden="true"></span> <span class="sr-only">Error:</span>
						
						<%
						
							for(int i = 0; i < errors.size(); i++){

								
								%>
									<ul>
										<li><%= errors.get(i) %></li>
									</ul>
								<% 
								
							}
						
						%>
						
					</div>

				
				<% } %>
				
				<!-- ERROR DISPLAY -->
				
				<% if(success == 1 && isSubmitted == true) {%>
        
					<div class="alert alert-success" role="alert">
						<span class="glyphicon glyphicon-exclamation-sign"
						aria-hidden="true"></span> <span class="sr-only">Error:</span>
						Doctor added successfully
					</div>
										
				<% }%>
				
				
				<% if(success == 2 && isSubmitted == true) {%>
        
					<div class="alert alert-danger" role="alert">
						<span class="glyphicon glyphicon-exclamation-sign"
						aria-hidden="true"></span> <span class="sr-only">Error:</span>
						Error! Couldn't save doctor
					</div>
										
				<% }%>
				

				<input type="hidden" name="submitted" value="true">
				
                <label>First Name</label>
                <input type="text" name="first-name" class="form-control">

                <br/>

                <label>Last Name</label>
                <input type="text" name="last-name" class="form-control">

                <br/>

                <label>Address</label>
                <input type="text" name="address" class="form-control">

                <br/>

                <label>Date of Birth</label>
                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                <input type="text" class="form-control pull-right" name="dob" id="datepicker">
                </div>

                <br/>

                <div class="row">
	                <div class="col-md-6">

	                	<label>Phone Number</label>
	                	<input type="text" name="phone-number" class="form-control">

	                </div>
	                <div class="col-md-6">

	                	<label>Mobile Number</label>
	                	<input type="text" name="mobile-number" class="form-control">

	                </div>
                </div>

                <br/>

                <label>Specialisation</label>
                <select name="category" class="form-control">
                	<option>Clinical Neurophysiologist</option>
                	<option>Dentist</option>
                	<option>Dermatologist</option>
                	<option>Emergency Doctors</option>
                	<option>Epidemiologists</option>
                	<option>Gynecologist</option>
                	<option>General Psychiatrist</option>
                	<option>Infectious Disease Specialist</option>
                	<option>Medical Geneticist</option>
                	<option>Neurologist</option>
                	<option>Neurosurgeons</option>
                	<option>Ophthalmologist</option>
                	<option>Cardiologist </option>
                	<option>Neurosurgeons</option>
                	<option>General Psychiatrist </option>
                </select>

                <br>
				
				<label>Doctor Fee</label>
                <input type="text" name="fee" class="form-control">

                <br>
				
				<label>Academics</label> 
				<input type="text" name="academics" class="form-control">
				
				<br>
				
				<label>Active</label> &nbsp; 
				  <input type="checkbox" name="active" value="1" class="minimal">
				<br> <br>

                <button class="btn btn-primary">Add Doctor</button>
				</form>


                </div><!-- /.box-body -->
              </div><!-- /. box -->

            </div><!-- /.col -->
            <div class="col-md-7">
              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">List of Doctors</h3>

                </div><!-- /.box-header -->
                <div class="box-body no-padding">
				
				
                  <div class="table-responsive mailbox-messages">
                    <table class="table table-hover table-striped">
                    <thead>
                    	 <tr>
                    	  <th> ID </th>
                          <th>Name</th>
                          <th>Status</th>
                          <th>Specialisation</th>
                          <th>Actions</th>
                        </tr>
                    </thead>
                      <tbody>
										
													<% for (int i = 0; i < docs.size(); i++) {
														
														Doctor doc = docs.get(i);
														
														if(doc.isStatus()) {
															status = "Active";
														}
														else {
															status = "Unactive";
														}
											
												%>
							
											<tr>
												<td><%=doc.getDocID() %></td>												
												<td><%= "Dr." + " " + doc.getFname() + " " + doc.getLname() %></td>
												<td><%=status%></td>
												<td class="mailbox-subject"><b><%=doc.getSpecialisation()%></b></td>
												<td>
												
												<a
													href="editDoctor.jsp?doctorID=<%= doc.getDocID()%>"
													class="btn btn-success btn-xs">Edit</a>
												<a
													href="deleteDoctor.jsp?doctorID=<%= doc.getDocID()%>"
													class="btn btn-danger btn-xs" onclick="return confirm('Are you sure to delete?');">Delete</a>
													
													
												</td>
															
													
											</tr>

							<% } %>

										</tbody>
                    </table><!-- /.table -->
                  </div><!-- /.mail-box-messages -->

                </div><!-- /.box-body -->
              </div><!-- /. box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      
	<jsp:include page="footer.jsp" flush="true"/>
	