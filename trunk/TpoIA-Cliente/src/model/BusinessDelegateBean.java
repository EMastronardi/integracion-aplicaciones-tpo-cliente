package model;

import integration.FacadeRemote;

import java.util.Hashtable;
import java.util.Properties;

import javax.ejb.EJB;
import javax.ejb.Remote;
import javax.ejb.Stateful;
import javax.ejb.Stateless;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 * Representación del servidor, lado cliente.
 * 
 */
@Stateful
public class BusinessDelegateBean implements BusinessDelegate {
	private static BusinessDelegateBean instance;
	
	@EJB
	private integration.FacadeRemote fac;

	private BusinessDelegateBean() {
	if(fac == null)
		System.out.println("facade remote no inyectado...");
		
	}

	public static BusinessDelegateBean getInstance() {
		if (instance == null)
			instance = new BusinessDelegateBean();
		return instance;
	}

	/* (non-Javadoc)
	 * @see model.BusinessDelegate#createUser(java.lang.String, java.lang.String)
	 */
	@Override
	public void createUser(String string, String string2) {
		fac.createUser(string, string2);

	}

	// EJEMPLO DE METODO DEVOLVIENDO UN VO
	// public void guardarRodamiento(RodamientoVO rodamiento){
	// getTallerFacade().guardarRodamiento(rodamiento);
	// }

	/**
	 * Indicar url del servidor de aplicaciones
	 */

}
