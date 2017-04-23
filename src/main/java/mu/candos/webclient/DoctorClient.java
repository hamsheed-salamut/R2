/**
 * 
 */
package mu.candos.webclient;

import java.util.ArrayList;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import mu.candos.model.Doctor;

/**
 * @author Shahad
 *
 */
public class DoctorClient {
	
	Client client = ClientBuilder.newClient();
	
	public ArrayList<Doctor> getAllDoctors() {
		
		Response response = client.target("http://localhost:8080/Candos/webapi/doctors").request().get(); ;
		
		//return (ArrayList<Message>) response.readEntity(new GenericType<ArrayList<Message>>(){});
		
		return (ArrayList<Doctor>) response.readEntity(new GenericType<ArrayList<Doctor>>(){});

		
	}
	
	public int deleteDoctor(String id) {
		
		WebTarget webTarget = client.target("http://localhost:8080/Candos/webapi").path("doctors").path(id);
		
		Invocation.Builder invocationBuilder =  webTarget.request();
		Response response = invocationBuilder.delete();
		
		return 1;
	}
	
	public Doctor addDoctor(Doctor doc) {
		
		WebTarget webTarget = client.target("http://localhost:8080/Candos/webapi/doctors");
		
		Invocation.Builder invocationBuilder = webTarget.request(MediaType.APPLICATION_JSON);
		
		Response response = invocationBuilder.post(Entity.entity(doc, MediaType.APPLICATION_JSON));
		
		return doc;
	}
	
	public Doctor updateDoctor(Doctor doc) {
		
		String id = Integer.toString(doc.getDocID());
		
		WebTarget webTarget = client.target("http://localhost:8080/Candos/webapi").path("doctors").path(id);
		
		Invocation.Builder invocationBuilder = webTarget.request(MediaType.APPLICATION_JSON);
		
		Response response = invocationBuilder.put(Entity.entity(doc, MediaType.APPLICATION_JSON));
		
		return doc;
		
		
	}
}
