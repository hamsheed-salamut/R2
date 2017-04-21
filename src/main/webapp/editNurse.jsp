<!DOCTYPE html>

<jsp:include page="header.jsp"/>
<jsp:include page="navbar.jsp"/>
  
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Nurses
            <small>list</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li class="active">Nurses</li>
          </ol>
        </section>

        <section class="content">
    
	
          <div class="row">



            <div class="col-md-5">
			<div class="box box-solid box-primary">
        
                <div class="box-header with-border">
                  <h3 class="box-title">Edit Nurse Details</h3>
                  <div class="box-tools">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                  </div>
                </div>
                <div class="box-body">
				<form action="pharmacist.jsp" method="post">
						<!-- ERROR DISPLAY -->
				
		
        
					<div class="alert alert-danger" role="alert">
						<span class="glyphicon glyphicon-exclamation-sign"
						aria-hidden="true"></span> <span class="sr-only">Error:</span>
						
	
						


								
		
									<ul>
										<li></li>
									</ul>
						
						
			
						
					</div>

				
	
				
				<!-- ERROR DISPLAY -->
				
			
        
					<div class="alert alert-success" role="alert">
						<span class="glyphicon glyphicon-exclamation-sign"
						aria-hidden="true"></span> <span class="sr-only">Error:</span>
						Nurse edited successfully
					</div>
		
        
					<div class="alert alert-danger" role="alert">
						<span class="glyphicon glyphicon-exclamation-sign"
						aria-hidden="true"></span> <span class="sr-only">Error:</span>
						Error! Couldn't edit Nurse
					</div>
										
		
								
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
		
		                <label>Date Joined</label>
		                <input type="text" name="dob" class="form-control" id="datepicker">
		
		                <br/>
		
		                <div class="row">
			                <div class="col-md-6">
		
			                	<label>Phone Number</label>
			                	<input type="text" name="phone-number" class="form-control">
		
			                </div>
			                <div class="col-md-6">
		
			                	<label>Department Affected</label> 
			                	                <select name="dept" class="form-control">
     
							                	<option value="Accident and Emergency Dept">Accident and Emergency Dept.</option>
							                	<option value="Cardiac Unit">Cardiac Unit</option>
							                	<option value="Casualty">Casualty</option>
							                	<option value="General Surgery">General Surgery</option>
							                	<option value="Orthopaedics Surgery">Orthopaedics Surgery</option>
							                	<option value="Gynaecology and Obstetrics">Gynaecology and Obstetrics</option>
							                	<option value="Neonatal Intensive Care">Neonatal Intensive Care</option>
							                	<option value="General Surgery">General Surgery</option>
							                	<option value="Intensive care Medical and Surgical">Intensive care Medical and Surgical</option>
												<option value="Radiology">Radiology</option>
								                </select>
		
			                </div>
		                </div>
		
		                <br/>
		
		                <label>Trainee : </label>
		                <input type="checkbox" name="trainee">
		
		                <br> <br>

		                <button class="btn btn-primary">Edit Nurse</button>


					</form>
                </div><!-- /.box-body -->
              </div><!-- /. box -->

            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      
	<jsp:include page="footer.jsp" flush="true"></jsp:include>