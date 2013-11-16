package published;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import model.BusinessDelegate;
import xml.RespuestaXML;

@Path("/rest")
public class recibirArticuloRest {
	@POST
	@Path("/despachador/recibirArticulos")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public RespuestaXML recibirArticulos(String jsonData){	
		return BusinessDelegate.getInstance().recibirArticulos(jsonData);		
	}

}
