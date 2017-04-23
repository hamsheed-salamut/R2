/**
 * 
 */
package mu.candos.webclient;

import java.util.ArrayList;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.core.GenericType;
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
	
}
