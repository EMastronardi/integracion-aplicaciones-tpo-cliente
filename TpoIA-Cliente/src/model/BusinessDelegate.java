package model;

import integration.FacadeRemote;

import java.util.ArrayList;
import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.InitialContext;

import valueObjects.ArticuloVO;
import valueObjects.ModuloVO;
import valueObjects.UsuarioVO;
import xml.RespuestaXML;

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

	public boolean login(String username, String password){
		return getFacadeRemote().validarUsuario(username, password);
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

	public boolean validarUsuario(String usuario, String password) {
		return getFacadeRemote().validarUsuario(usuario, password);

	}
	public ArrayList<UsuarioVO> getUsers(){
		return getFacadeRemote().getUsers();
	}
	public boolean updateUser(int idUser, String usuario, String password){
		return getFacadeRemote().updateUser(idUser, usuario, password);
	}
	public boolean deleteUser(int idUser){
		return getFacadeRemote().deleteUser(idUser);
	}
	public ArrayList<ModuloVO> getAllModulos(){
		return getFacadeRemote().getAllModulos();
	}
	public boolean createModulo(String tipo, int idModulo, String ip, String nombre,
			String codigo, String usuario, String password,
			String jmsDestination){
		return getFacadeRemote().createModulo(tipo, idModulo, ip, nombre, codigo, usuario, password, jmsDestination);
	}
	public boolean deleteModulo(int idModulo){
		return getFacadeRemote().deleteModulo(idModulo);
	}
	public boolean updateModulo(String tipo, int idModulo, String ip, String nombre,
			String codigo, String usuario, String password,
			String jmsDestination){
		return getFacadeRemote().updateModulo(tipo,  idModulo, ip, nombre, codigo,  usuario,  password, jmsDestination);
	}
	public ArrayList<ArticuloVO> getAllArticulos(){
		return getFacadeRemote().getArticulos();
	}
	public ArrayList<ArticuloVO> searchArticulos(String filtro, int valor){
		return getFacadeRemote().searchArticulos(filtro, valor);
	}
	public RespuestaXML recibirArticulos(String jsonData){
		return getFacadeRemote().recibirArticulos(jsonData);
	}
}
