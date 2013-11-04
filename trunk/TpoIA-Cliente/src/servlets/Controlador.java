package servlets;

import integration.FacadeRemote;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BusinessDelegate;

/**
 * Servlet implementation class Controlador
 */
@WebServlet("/Controlador")
public class Controlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Controlador instancia;
	private BusinessDelegate bd = null;
	private boolean resultado;
	public Controlador() {
		super();
		//bd.getInstance();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		//bd.getInstance().crearUsuario("aaa", "aaa");
		
		String action = request.getParameter("action");
		String jspPage = "/Login.jsp";

		if ((action == null) || action.length() < 1) {
			action = "default";
		}
		if ("default".equals(action)) {
			jspPage = "/Login.jsp";
		} else if ("salir".equals(action)) {
			jspPage = "/Login.jsp";
		} else if ("validarLogin".equals(action)) {
			String usuario = request.getParameter("usuario");
			String password = request.getParameter("password");
			resultado = bd.getInstance().validarUsuario(usuario, password);
			if(resultado == true) //Usuario Valido
			{
				//Creando cookies
				Cookie loginCookie = new Cookie("user",usuario);
	            //setting cookie to expiry in 30 mins
	            loginCookie.setMaxAge(30*60);
	            response.addCookie(loginCookie);
	            jspPage="/Home.jsp";
			}else{ //Usuario Invalido
				jspPage = "/Login.jsp?error=UsuarioInvalido";
				
			}
		} 
		else if("nuevoUsuario".equals(action)){
			String usuario = request.getParameter("usuario");
			String password = request.getParameter("password");
			resultado = bd.getInstance().crearUsuario(usuario, password);
			if(resultado){
				System.out.println("Usuario creado correctamente");
			}else{
				System.out.println("Error al crear el usuario");
			}
			jspPage = "/Login.jsp";
		}
		
		dispatch(jspPage, request, response);
	}

	protected void dispatch(String jsp, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		if (jsp != null) {
			/*
			 * Envía el control al JSP que pasamos como parámetro, y con los
			 * request / response cargados con los parámetros
			 */
			RequestDispatcher rd = request.getRequestDispatcher(jsp);
			rd.forward(request, response);
		}
	}
	public void init(ServletConfig config) throws ServletException {
	    super.init(config);
	    bd.getInstance();
	}
}
