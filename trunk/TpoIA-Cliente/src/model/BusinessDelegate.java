package model;


import interfaces.FacadeLocal;

import java.util.Hashtable;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;

import valueObjects.UsuarioVO;

/**
 * Representación del servidor, lado cliente.
 * 
 */
public class BusinessDelegate {
	private static BusinessDelegate instance;
	private FacadeLocal despachoFacade;
	private InitialContext initialContext;
	// private String naming =
	// "TpoIA-ServidorEAR/TpoIA-Servidor/FacadeLocalBean!integration.FacadeLocal";
	final String appName = "TpoIA-ServidorEAR";
	final String moduleName = "TpoIA-Servidor";
	final String sessionBeanName = "FacadeLocalBean";
	final String viewClassName = FacadeLocal.class.getName();

	private BusinessDelegate() {
		inicializarContexto();
	}

	public static BusinessDelegate getInstance() {
		if (instance == null)
			instance = new BusinessDelegate();
		return instance;
	}

	private FacadeLocal getFacadeLocal() {
		try {
			if (despachoFacade == null) {
				// Obtencion de referencia del session bean dentro del servidor
				// de aplicaciones

				despachoFacade = (FacadeLocal) initialContext.lookup(appName
						+ "/" + moduleName + "/" + sessionBeanName + "!"
						+ viewClassName);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return despachoFacade;
	}

	public boolean crearUsuario(int id, String nombre, String password) {
		return getFacadeLocal().createUser(nombre, password);
	}

	// public RodamientoVO buscarRodamiento(RodamientoVO rodamiento){
	// return getTallerFacade().buscarRodamiento(rodamiento);
	// }
	//
	// public CotizacionVO generarSolicitudYCotizar(SolicitudCotizacionVO
	// solicitud){
	// return getTallerFacade().generarSolicitudYCotizar(solicitud);
	// }
	//
	// public ItemCotizacionVO buscarUltimaCotizacion(RodamientoVO rodamiento){
	// return getTallerFacade().buscarUltimaCotizacion(rodamiento);
	// }
	//
	// public SolicitudCompraVO generarSolicitudCompra(SolicitudCompraVO
	// solicitud){
	// return getTallerFacade().generarSolicitudCompra(solicitud);
	// }
	//
	// public void guardarRodamiento(RodamientoVO rodamiento){
	// getTallerFacade().guardarRodamiento(rodamiento);
	// }
	//
	// public List<RodamientoVO> obtenerListaRodamientos(){
	// return getTallerFacade().obtenerListaRodamientos();
	// }
	//
	// public List<RodamientoVO> obtenerListaRodamientos(int desde, int
	// cantidad){
	// return getTallerFacade().obtenerListaRodamientos(desde, cantidad);
	// }
	//
	// public int getCantidadRodamientos() {
	// return getTallerFacade().getCantidadRodamientos();
	// }

	/**
	 * Indicar url del servidor de aplicaciones
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	private void inicializarContexto() {
		try {
			Properties jndiProps = new Properties();
			jndiProps.put(Context.INITIAL_CONTEXT_FACTORY,
					"org.jboss.naming.remote.client.InitialContextFactory");
			jndiProps.put(Context.PROVIDER_URL, "remote://127.0.0.1:4447");
			jndiProps.put(Context.SECURITY_PRINCIPAL, "test");
			jndiProps.put(Context.SECURITY_CREDENTIALS, "test123");
			jndiProps.put("jboss.naming.client.ejb.context", true);
			this.initialContext = new InitialContext(jndiProps);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
