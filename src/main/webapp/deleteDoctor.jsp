<jsp:useBean id="db" class="mu.candos.persistence.DoctorManager" scope="session"/>
<%@page import="java.sql.*,mu.candos.model.Login,mu.candos.model.*,mu.candos.webclient.*,java.util.*" %>



	<%
		int doctorID = Integer.parseInt(request.getParameter("doctorID"));
	    session.setAttribute("doctorID", doctorID);
    	
	    DoctorClient dc = new DoctorClient();
    	
			int successDelete = dc.deleteDoctor(Integer.toString(doctorID));

			if (successDelete > 0) {
				
				session.setAttribute("delete", "del");
				response.sendRedirect("addDoctor.jsp");

			}
			
		
		
	%>