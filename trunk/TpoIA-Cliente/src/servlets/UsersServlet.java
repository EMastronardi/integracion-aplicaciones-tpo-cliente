package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BusinessDelegate;
import valueObjects.*;
/**
 * Servlet implementation class Controlador
 */
@WebServlet("/Controlador")
public class UsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UsersServlet instancia;
	private BusinessDelegate bd = null;
	private boolean resultado;
	public UsersServlet() {
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
		String action = request.getParameter("action");
		String jspPage = "/Login.jsp";

		if ((action == null) || action.length() < 1) {
			action = "default";
		}
		
		if ("default".equals(action)) {
			jspPage = "/Login.jsp";
		} 
		else if("createUser".equals(action)){
			String usuario = request.getParameter("usuario");
			String password = request.getParameter("password");
			resultado = bd.getInstance().crearUsuario(usuario, password);
			if(resultado){
				System.out.println("Usuario creado correctamente");
			}else{
				System.out.println("Error al crear el usuario");
			}
			jspPage = "/Users.jsp";
		}else if("updateUser".equals(action)){
			String usuario = request.getParameter("usuario");
			String password = request.getParameter("password");
			int idUser = Integer.parseInt(request.getParameter("iduser"));
			resultado = bd.getInstance().updateUser(idUser, usuario, password);
			if(resultado){
				System.out.println("Usuario actualizado correctamente");
			}else{
				System.out.println("Error al actualizar el usuario");
			}
			jspPage = "/Users.jsp";
		}else if("deleteUser".equals(action)){
			
			int idUser = Integer.parseInt(request.getParameter("iduser"));
			resultado = bd.getInstance().deleteUser(idUser);
			if(resultado){
				System.out.println("Usuario eliminado correctamente");
			}else{
				System.out.println("Error al eliminar el usuario");
			}
			jspPage = "/Users.jsp";
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
