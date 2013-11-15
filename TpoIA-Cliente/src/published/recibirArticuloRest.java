package published;


import javax.ejb.EJB;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import xml.RespuestaXML;
import integration.FacadeRemote;

@Path("/rest")
public class recibirArticuloRest {
	
	//@EJB
	//FacadeRemote facade;
	
	@POST
	@Path("/despachador/recibirArticulos")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public RespuestaXML recibirArticulos(String jsonData){

		System.out.println("Recibido: " + jsonData.toString());
		
		RespuestaXML respuesta = new RespuestaXML();
		respuesta.setEstado("OK");
		respuesta.setMensaje("HOLA");
		return respuesta;
		
	}

	}
