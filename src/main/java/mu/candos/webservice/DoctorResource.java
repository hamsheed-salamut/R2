/**
 * 
 */
package mu.candos.webservice;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import mu.candos.model.Doctor;
import mu.candos.persistence.DoctorManager;

/**
 * @author Benazir
 *
 */
@Path("/doctors")
public class DoctorResource {
	
	DoctorManager dm = new DoctorManager();
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<Doctor> getAllDoctors() throws ClassNotFoundException, SQLException {
		
		return dm.getAllDoctors();
	}
	
	@GET
	@Path("/{doctorId}")
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Doctor> getDoctor(@PathParam("doctorId") int id) throws ClassNotFoundException, SQLException {
		
		return dm.getDoctors(id);
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Doctor addDoctor(Doctor doctor) throws ClassNotFoundException, SQLException {
		
		return dm.addDoctor(doctor);
	}
	

	@PUT
	@Path("/{doctorId}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Doctor updateDoctor(@PathParam("doctorId") int id, Doctor doctor) throws ClassNotFoundException, SQLException {
		doctor.setDocID(id);
		return dm.updateDoctor(doctor);
	}
	
	
	@DELETE
	@Path("/{doctorId}")
	@Produces(MediaType.APPLICATION_JSON)
	public void deleteDoctor(@PathParam("doctorId") int id) throws ClassNotFoundException, SQLException {
		
		 dm.deleteDoctor(id);
	}
}
