<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="valueObjects.OrdenDespachoVO" %>
<%@page import="model.BusinessDelegate" %>
<%@page import="java.util.*" %>
<%
ArrayList<OrdenDespachoVO> ordenes = null;
if(request.getAttribute("filtro") == null ){
	ordenes = BusinessDelegate.getInstance().getAllOrdenes();
	
}else{
	String value = (String)request.getAttribute("valor");
	String filtro = (String) request.getAttribute("filtro");
	ordenes = BusinessDelegate.getInstance().searchOrdenes(filtro, Integer.parseInt(value));
}
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.png">

    <title>TPIA / Despacho / Ordenes </title>

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
				$( "#theform" ).submit(function( event ) {
					if(isNaN($('#valorinput').val()) || $('#valorinput').val() == ""){ 
						bootbox.alert("El valor ingresado para la busqueda debe ser Numerico", function() {});
						event.preventDefault();
					}
				});
			});
			
			function openPopUp(idOrden){
				window.open("OrdenesServlet?action=detail&idorden="+idOrden, "_blank", 'width=560,height=600');
			}
	</script>
	<style>
		   table tr th {
		   		 text-align:center;
		   }
		   table tr td{
		   		   text-align:center;
		   } 
		    
	</style>
  </head>

  <body>
<!-- Wrap all page content here -->
    <div id="wrap">

 <nav class="navbar navbar-default" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="#">TPO-IA / Despacho</a>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav">
      <li><a href="Home.jsp" id="inicio">Inicio</a></li>
      <li class="active"><a href="Ordenes.jsp">Ordenes</a></li>
      <li><a href="Solicitudes.jsp">Solicitudes</a></li>
      <li><a href="Articulos.jsp">Art&iacute;culos</a></li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle active" data-toggle="dropdown">Configuraci&oacute;n <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="Users.jsp">Usuarios</a></li>
          <li><a href="#">Servicios</a></li>
		  <li><a href="Modulos.jsp">Modulos</a></li>
        </ul>
      </li>
    </ul>
  </div><!-- /.navbar-collapse -->
</nav>
      <!-- Begin page content -->
      <div class="container">
      	<ol class="breadcrumb">
		  <li><a href="Home.jsp">Inicio</a></li>
		  <li class="active">Ordenes</li>
		</ol>
        <div class="page-header">
          <h1>Ordenes de Despacho</h1>
        </div>
       
        <p class="lead">
		   <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">
            	<form method="post"  action='OrdenesServlet?action=search' id="theform">
            	<div class="row">
				  <div class="col-lg-4">
				    <div class="input-group">
				      <input type="text" class="form-control" id="valorinput" name="valor" value="">
				      <span class="input-group-btn">
				        <button class="btn btn-default" type="submit">Buscar!</button>
				      </span>
				    </div><!-- /input-group -->
				  </div><!-- /.col-lg-4 -->
				  </div>
				 <div class="row">
			    	<span style="padding-left: 15px;"><b>Buscar Por&nbsp;</b></span>
			    	<input type="radio" name="searchby" checked="checked" value="nrorden">&nbsp;Numero de Orden&nbsp;<input type="radio" name="searchby" value="portalweb">&nbsp;Portal Web Nro
			    </div>
			    </form>
			    </div>
            <!-- Table -->
            <%if(ordenes.size() > 0){ %>
            <table class="table">
              <thead>
			  	<tr>
			  		 <th>Nro Orden</th>
			  		 <th>Fecha</th>
			  		 <th>Nro Venta</th>
			  		 <th>Portal Web </th>
			  		 <th>Nro Portal Web </th>
			  		 <th>Accion</th>
			  </thead>
			  <tbody>
			  <%
			  for(OrdenDespachoVO orden : ordenes){
				  out.println("<tr><td>"+orden.getIdOrdenDespacho()+"</td><td>"+orden.getFecha()+"</td><td>"+orden.getNroVenta()+"</td><td>"+orden.getModulo().getNombre()+"</td><td>"+orden.getModulo().getIdModulo()+"</td><td><a href='javascript:openPopUp("+orden.getIdOrdenDespacho()+")'>Ver Track</a></td></tr>");
			  }
			  %> 
			  </tbody>
		    </table>
		    <%}else{ %>
		    	<div class="alert alert-info"><b>No se ha encontrado ningun Orden de Despacho</b></div>
		    <%} %>
          </div>
		</p>
      </div>
    </div>
	<br/>
    <div id="footer">
      <div class="container">
        <p class="text-muted credit">
		   TP Obligatorio - Integración de Aplicaciones - Curso 167215
		   <br/>
		   <b>Alumnos:</b> Emmanuel Mastronardi - Daniel Zanotti - Andrés Orellano - Damián Quiroga
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