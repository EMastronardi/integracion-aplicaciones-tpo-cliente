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
public class SolicitudesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static SolicitudesServlet instancia;
	private BusinessDelegate bd = null;
	private boolean resultado;
	public SolicitudesServlet() {
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
		else if("search".equals(action)){
			String filtro = request.getParameter("searchby");
			String valor = request.getParameter("valor");
			request.setAttribute("filtro", filtro);
			request.setAttribute("valor", valor);
			jspPage = "/Solicitudes.jsp";
		}else if("detail".equals(action)){
			//detail&idorden
			String idOrdenDespacho = request.getParameter("idorden");
			request.setAttribute("valor", idOrdenDespacho);
			jspPage = "/SolicitudesDetail.jsp";
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
