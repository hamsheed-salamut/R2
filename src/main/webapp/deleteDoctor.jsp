<jsp:useBean id="db" class="mu.candos.persistence.DoctorManager" scope="session"/>
<%@page import="java.sql.*,mu.candos.model.Login,mu.candos.model.*,java.util.*" %>



	<%
		int doctorID = Integer.parseInt(request.getParameter("doctorID"));
	    session.setAttribute("doctorID", doctorID);
    
			int successDelete = db.deleteDoctor(doctorID);

			if (successDelete > 0) {
				
				session.setAttribute("delete", "del");
				response.sendRedirect("addDoctor.jsp");

			}
			
		
		
	%>