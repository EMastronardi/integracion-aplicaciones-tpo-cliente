package published;


import javax.ejb.EJB;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import integration.FacadeRemote;

@Path("/despacho_web")
public class recibirArticuloRest {
	
	//@EJB
	//FacadeRemote facade;
	
	@POST
	@Path("/despachador")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String recibirArticulos(){
		
		return "Hello World!";
		
	}
}
