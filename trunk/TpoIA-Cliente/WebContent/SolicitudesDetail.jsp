<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="valueObjects.OrdenDespachoVO" %>
<%@page import="valueObjects.SolicitudVO" %>
<%@page import="valueObjects.ItemSolicitudVO" %>
<%@page import="model.BusinessDelegate" %>
<%@page import="java.util.*" %>
<%
	String value = (String)request.getAttribute("valor");
	ArrayList<SolicitudVO> solvec = BusinessDelegate.getInstance().searchSolicitudes("filtro",Integer.parseInt(value));
	SolicitudVO sol = solvec.get(0);
	List<ItemSolicitudVO> items = sol.getItems();	
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.png">

    <title>TPIA / Despacho / Solicitud Detalle</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/home.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery.js"></script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->
	<script>
			$(function() {
  			// Handler for .ready() called.
				
			});
			
			
	</script>
	<style>
		   table tr th {
		   		 text-align:left;
		   }
		   table tr td{
		   		 text-align:left;
		   } 
		   table.table tr th {
		   		 text-align:center;
		   }
		   table.table tr td{
		   		 text-align:center;
		   } 
	</style>
  </head>

  <body>
<!-- Wrap all page content here -->
    <div id="wrap">
      <!-- Begin page content -->
      <div class="container">
      	<ol class="breadcrumb">
		  <li><a class="active">Inicio</a></li>
		  <li class="active">Solicitud</li>
		  <li class="active">Detalle</li>
		</ol>
        <div class="page-header">
          <h1>Solicitudes de Art&iacute;culo - Detalle</h1>
        </div>
       
        <p class="lead">
		   
		   <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">
            <table cellpadding="0" cellspacing="0" border="0" style="width:100%; heigh:100px">
            <tr>
            	<td>&nbsp;</td>
            	<td ><b>Nro Solicitud</b></td>
            	<td>&nbsp;</td>
            	<td><% out.println(sol.getIdSolicitud()); %></td>
            	<td><b>Nro Deposito de envio</b></td>
            	<td>&nbsp;</td>
            	<td><% out.println(sol.getItems().get(0).getArticulo().getDeposito().getIdModulo()); %></td>
            </tr>
            <tr>	
            	<td>&nbsp;</td>
            	<td><b>Nombre Deposito</b></td>
            	<td>&nbsp;</td>
            	<td><% out.println(sol.getItems().get(0).getArticulo().getDeposito().getNombre()); %></td>
            	<td><b></b></td>
            	<td>&nbsp;</td>
            	<td></td>
            </tr>      
            </table>
            
            </div>
            <!-- Table -->
           
            <table class="table">
              <thead>
			  	<tr>
			  		 <th>Item Nro</th>
			  		 <th>Nro Art&iacute;culo</th>
			  		 <th>Art&iacute;culo Nombre</th>
			  		 <th>Cantidad</th>
			  </thead>
			  <tbody>
			  <%
			  int i = 0;
			  for(ItemSolicitudVO item : items){
				  i++;
				  out.println("<tr><td>"+i+"</td><td>"+item.getArticulo().getNroArticulo()+"</td><td>"+item.getArticulo().getNombre()+"</td><td>"+item.getCantidad()+"</td></tr>");
			  }
			  %> 
			  </tbody>
		    </table>
		    
          </div>
		</p>
      </div>
    </div>
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="bootstrap/js/bootbox.min.js"></script>
  </body>
</html>