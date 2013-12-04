package published;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import model.BusinessDelegate;
import xml.RespuestaXML;

@Path("/despachador")
public class recibirArticuloRest {
	@POST
	@Path("/recibirArticulos")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String recibirArticulos(String jsonData){	
		RespuestaXML aux = BusinessDelegate.getInstance().recibirArticulos(jsonData);
		String resultado = "{\"estado\" : \""+aux.getEstado()+"\",\"mensaje\" : \""+aux.getMensaje()+"\"}"; 
		return resultado;
	}

}
