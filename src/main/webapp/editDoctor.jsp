<!DOCTYPE html>

<jsp:useBean id="db" class="mu.candos.persistence.DoctorManager" scope="session"/>
<%@page import="java.sql.*,mu.candos.model.Login,mu.candos.model.*,mu.candos.persistence.*,java.util.*" %>

<%
    
	int doctorID = Integer.parseInt(request.getParameter("doctorID"));
    session.setAttribute("doctorID", doctorID);
    
    Boolean submitted = Boolean.parseBoolean(request.getParameter("submitted"));
    Boolean password_submitted = Boolean.parseBoolean(request.getParameter("password_submitted"));
    ArrayList<Doctor> doctor = db.getDoctors(doctorID);
	
   	DoctorManager docs = new DoctorManager();
   
	int docId = 0;
	String firstName ="";
	String lastName = "";
	String address = "";
	int phoneNumber = 0;
	int mobileNumber = 0;
	String specialisation = "";
	String dob = "";
	double fee = 0;

	for (int i = 0; i < doctor.size(); i++) {

		Doctor doc = doctor.get(i);

		docId = doc.getDocID();
		firstName = doc.getFname();
		lastName = doc.getLname();
		address = doc.getAddress();
		phoneNumber = doc.getPhone();
		mobileNumber = doc.getMob();
		specialisation = doc.getSpecialisation();
		dob = doc.getDob();
		fee = doc.getFee();

	}
	
	// IF SUBMITTED FOR UPDATE
	int succes = 0;
	String errorMessage = null;
	
	//Error variable
	
	Boolean error_exist = false;
	ArrayList<String> errors = new ArrayList<String>();
	ArrayList<String> errors1 = new ArrayList<String>();
	
	if(submitted == true){
		try {
			firstName = request.getParameter("first-name");
			lastName = request.getParameter("last-name");
			address = request.getParameter("address");
			dob = request.getParameter("dob");
			fee = Double.parseDouble(request.getParameter("fee"));
			phoneNumber = Integer.parseInt(request.getParameter("phone-number"));
			mobileNumber = Integer.parseInt(request.getParameter("mobile-number"));
			specialisation = request.getParameter("category");

		} catch (Exception e){
			
			errors.add(e.toString());
			error_exist = true;
		}
		
		if(firstName == null || firstName == "" || firstName.length() < 1){
			errors.add("First Name invalid");
			error_exist = true;
		}
		
		if(lastName == null || lastName == "" || lastName.length() < 1){
			errors.add("Last Name invalid");
			error_exist = true;
		}
		
		if(address == null || address == "" || address.length() < 1){
			errors.add("Address invalid");
			error_exist = true;
		}
		
		if(String.valueOf(fee)== null || String.valueOf(fee) == "" || String.valueOf(fee).length() < 1){
			errors.add("Invalid Fee");
			error_exist = true;
		}
		
		if(String.valueOf(phoneNumber).length()> 8 || String.valueOf(phoneNumber).length() < 7){
			errors.add("Invalid Telephone Number");
			error_exist = true;
		}
		
		if(String.valueOf(mobileNumber).length()>8 || String.valueOf(mobileNumber).length() < 8){
			errors.add("Invalid mobile Number");
			error_exist = true;
		}
		
		if(error_exist == false){
		
	
			int update = db.updateDoctor(doctorID, firstName, lastName, address, phoneNumber, mobileNumber, specialisation, dob, fee);
			succes = update;
			if(update > 0){
				session.setAttribute("update", "1");
				//response.sendRedirect("addDoctor.jsp");
		
			}
		} else {

			succes = 2;
			//response.sendRedirect("addDoctor.jsp");

		}
		
	}
	
	
%>

    
<jsp:include page="header.jsp"/>
<jsp:include page="navbar.jsp"/>
		
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Doctors
            <small>Change Doctor Settings</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li class=""><a href="addDoctor.jsp"> Doctors</a></li>
            <li class="active">Edit Doctor</li>
          </ol>
        </section>

        <section class="content">
          <div class="row">
            <div class="col-md-6">

              <div class="box box-solid">
                <div class="box-header with-border">
                  <h3 class="box-title">Update Doctor</h3>
                  <div class="box-tools">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                  </div>
                </div>
                <div class="box-body">
				
					<form action="editDoctor.jsp?doctorID=<%= doctorID %>" method="post">
                     <!-- ERROR DISPLAY -->
					
					<% if (submitted == true && succes == 1) { %>
					
					<div class="alert alert-warning" role="alert">
						<span class="glyphicon glyphicon-exclamation-sign"
							aria-hidden="true"></span> <span class="sr-only">Error:</span>
						Doctor's details updated successfully
					</div>
					
					<% response.setHeader("Refresh", "1;url=addDoctor.jsp"); %>
					
					<% } %>
					
					<% if(submitted == true && error_exist == true) {%>
        
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
            
                                        <label>Doctor Identification</label>
                                        <input type="text" name="doctor_id" class="form-control" disabled="disabled" value="<%= docId %>">
                                        <br />
                                        <label>First Name
                                        </label>
                                        <input type="text" name="first-name" class="form-control" value="<%= firstName %>">
                                        <br />
                                        <label>Last Name</label>
                                        <input type="text" name="last-name" class="form-control" value="<%= lastName %>">
                                        <br />
                                        <label>Address</label>
                                        <input type="text" name="address" class="form-control" value="<%= address %>">
                                        <br />
                                        <label>Date of Birth</label>
                                        <input type="text" name="dob" class="form-control dob" id="datepicker" value="<%= dob %>">
                                        <br />
                                        <label>Doctor Fee</label>
                                        <input type="text" name="fee" class="form-control" id="fee" value="<%= fee %>">
                                        <br />
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Phone Number</label>
                                                <input type="text" name="phone-number" class="form-control" value="<%= phoneNumber %>">
                                            </div>
                                            <div class="col-md-6">
                                                <label>Mobile Number</label>
                                                <input type="text" name="mobile-number" class="form-control" value="<%= mobileNumber %>">
                                            </div>
                                        </div>
                                        <br />
                                        <label>Specialisation</label>
                                        
							                <select name="category" class="form-control">
							                
							                	<option value="<%= specialisation %>"><%= specialisation %></option>
							                	<option value="Clinical Neurophysiologist">Clinical Neurophysiologist</option>
							                	<option value="Dentist">Dentist</option>
							                	<option value="Dermatologist">Dermatologist</option>
							                	<option value="Emergency Doctors">Emergency Doctors</option>
							                	<option value="Epidemiologists">Epidemiologists</option>
							                	<option value="Gynecologist">Gynecologist</option>
							                	<option value="General Psychiatrist">General Psychiatrist</option>
							                	<option value="Infectious Disease Specialist">Infectious Disease Specialist</option>
							                	<option value="Medical Geneticist">Medical Geneticist</option>
							                	<option value="Neurologist">Neurologist</option>
							                	<option value="Neurosurgeons">Neurosurgeons</option>
							                	<option value="Ophthalmologist">Ophthalmologist</option>
							                	<option value="Cardiologist">Cardiologist </option>
							                	<option value="Neurosurgeons">Neurosurgeons</option>
							                	<option value="General Psychiatrist">General Psychiatrist </option>
							                	
							                </select>

                                        <br>
                                        
                                        <input type="hidden" name="submitted" value="true">
                                        <br>
                                        
                                        <input type="submit" class="btn btn-success" value="Save Changes">
                                        
                    </form>

                </div><!-- /.box-body -->
              </div><!-- /. box -->

            </div>

            <div class="col-md-6">



            </div>

          </div>
        </section>
      </div><!-- /.content-wrapper -->
      
	<jsp:include page="footer.jsp" flush="true"/>