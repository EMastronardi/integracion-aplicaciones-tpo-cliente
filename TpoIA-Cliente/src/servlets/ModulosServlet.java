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
public class ModulosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ModulosServlet instancia;
	private BusinessDelegate bd = null;
	private boolean resultado;
	public ModulosServlet() {
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
		else if("createModulo".equals(action)){
			int idModulo = Integer.parseInt(request.getParameter("idmodulo"));
			String tipo = request.getParameter("tipo");
			String codigo = request.getParameter("codigo");
			String ip = request.getParameter("ip");
			String jmsdestination = request.getParameter("jmsdestination");
			String nombre = request.getParameter("nombre");
			String usuario = request.getParameter("usuario");
			String password = request.getParameter("password");
			resultado = bd.getInstance().createModulo(tipo, idModulo, ip, nombre, codigo, usuario, password, jmsdestination);
			if(resultado){
				request.setAttribute("return", "OK");
				System.out.println("Modulo creado correctamente");
			}else{
				request.setAttribute("return", "NOK");
				System.out.println("Error al crear el modulo");
			}
			
			jspPage = "/Modulos.jsp";
		}else if("updateModulo".equals(action)){
			int idModulo = Integer.parseInt(request.getParameter("idmodulo"));
			String tipo = request.getParameter("tipo");
			String codigo = request.getParameter("codigo");
			String ip = request.getParameter("ip");
			String jmsdestination = request.getParameter("jmsdestination");
			String nombre = request.getParameter("nombre");
			String usuario = request.getParameter("usuario");
			String password = request.getParameter("password");
			resultado = bd.getInstance().updateModulo(tipo, idModulo, ip, nombre, codigo, usuario, password, jmsdestination);
			if(resultado){
				request.setAttribute("return", "OK");
				System.out.println("Modulo actualizado correctamente");
			}else{
				request.setAttribute("return", "NOK");
				System.out.println("Error al actualizar el modulo");
			}
			jspPage = "/Modulos.jsp";
		}else if("deleteModulo".equals(action)){
			
			int idModulo = Integer.parseInt(request.getParameter("idmodulo"));
			resultado = bd.getInstance().deleteModulo(idModulo);
			if(resultado){
				request.setAttribute("return", "OK");
				System.out.println("Modulo eliminado correctamente");
			}else{
				request.setAttribute("return", "NOK");
				System.out.println("Error al eliminar el Modulo");
			}
			jspPage = "/Modulos.jsp";
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
