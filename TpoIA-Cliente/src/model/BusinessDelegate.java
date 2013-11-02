package model;

import integration.FacadeRemote;

import java.util.Hashtable;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;

/**
 * Representación del servidor, lado cliente.
 * 
 */
public class BusinessDelegate {
	private static BusinessDelegate instance;
	private FacadeRemote despachoFacade;
	private InitialContext initialContext;
	final String appName = "TpoIA-ServidorEAR";
	final String moduleName = "TpoIA-Servidor";
	final String sessionBeanName = "FacadeRemoteBean";
	final String viewClassName = FacadeRemote.class.getName();

	private BusinessDelegate() {
		inicializarContexto();
	}

	public static BusinessDelegate getInstance() {
		if (instance == null)
			instance = new BusinessDelegate();
		return instance;
	}
	private FacadeRemote getFacadeRemote() {
		try {
			if (despachoFacade == null) {
				despachoFacade = (FacadeRemote) initialContext.lookup("ejb:"
						+ appName + "/" + moduleName + "/" + sessionBeanName + "!"
						+ viewClassName);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return despachoFacade;
	}

	public boolean crearUsuario(String nombre, String password) {
		return getFacadeRemote().createUser(nombre, password);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	private void inicializarContexto() {
		try {
			Hashtable jndiProps = new Hashtable();
			
			jndiProps.put(Context.PROVIDER_URL, "remote://127.0.0.1:4447");
			jndiProps.put(Context.SECURITY_PRINCIPAL, "tpia");
			jndiProps.put(Context.SECURITY_CREDENTIALS, "tpia123");
			jndiProps.put(Context.URL_PKG_PREFIXES,"org.jboss.ejb.client.naming");
			initialContext = new InitialContext(jndiProps);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
