<!DOCTYPE html>

<jsp:include page="header.jsp"/>

<jsp:include page="navbar.jsp"/>

      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Administrators
            <small>Confidential Information about HMS</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li class="active">Administrators</li>
          </ol>
        </section>

        <section class="content">

        
        	<div class="alert alert-success" role="alert">
				<span class="glyphicon glyphicon-exclamation-sign"
					aria-hidden="true"></span> <span class="sr-only">Error:</span>
				Success Update
			</div>
			

          <div class="row">
            <div class="col-md-5">

              <div class="box box-solid-success">
                <div class="box-header with-border">
                  <h3 class="box-title">Edit Administrator Settings</h3>
                  <div class="box-tools">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                  </div>
                </div>
                <div class="box-body">

				<form action="registrar.jsp" method="post">
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
						Admin edited successfully
					</div>
										

				
				<!-- Error Alert box -->
        
					<div class="alert alert-danger" role="alert">
						<span class="glyphicon glyphicon-exclamation-sign"
						aria-hidden="true"></span> <span class="sr-only">Error:</span>
						Error! Couldn't edit admin
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
			
			                <label>Date of Birth</label>
			                <input type="text" name="dob" class="form-control" id="datepicker">
			
			                <br/>
			
			                <div class="row">
				                <div class="col-md-6">
			
				                	<label>Phone Number</label>
				                	<input type="text" name="phone-number" class="form-control">
			
				                </div>
				                <div class="col-md-6">
			
				                	<label>Email</label>
				                	<input type="email" name="email" class="form-control">
			
				                </div>
			                </div>
			
			                <br/>
			
			                <label>Username</label>
			                <input type="text" name="login" class="form-control">
			
			                <br>
			                
			                <label>Email</label>
			                <input type="email" name="email" class="form-control">
			                
			                <br>
			
			                <label>Password</label>
			                <input type="text" name="password" class="form-control">
			
			
			                <br>
			
			                <label>Retype Password</label>
			                <input type="text" name="password_two" class="form-control">
			
			                <br/>
			
			                <button class="btn btn-warning">Update Admin</button>

				</form>

                </div><!-- /.box-body -->
              </div><!-- /. box -->

            </div><!-- /.col -->

          </div><!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      
		<jsp:include page="footer.jsp" flush="true"></jsp:include>