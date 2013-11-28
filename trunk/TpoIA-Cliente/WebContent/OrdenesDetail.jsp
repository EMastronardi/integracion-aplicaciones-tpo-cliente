<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="valueObjects.OrdenDespachoVO" %>
<%@page import="valueObjects.SolicitudVO" %>
<%@page import="valueObjects.ItemSolicitudVO" %>
<%@page import="model.BusinessDelegate" %>
<%@page import="java.util.*" %>
<%
	String value = (String)request.getAttribute("valor");
	OrdenDespachoVO orden = BusinessDelegate.getInstance().getOrdenDespachoById(Integer.parseInt(value));
	List<SolicitudVO> solicitudes = orden.getSolicitudes();
	ArrayList<ItemSolicitudVO> items = new ArrayList<ItemSolicitudVO>();
	for(SolicitudVO sol : solicitudes){
		List<ItemSolicitudVO> itms = sol.getItems();
		for(ItemSolicitudVO itm : itms){
			items.add(itm);
		}
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

    <title>TPIA / Despacho / Ordenes Track </title>

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
		  <li class="active">Ordenes</li>
		  <li class="active">Track</li>
		</ol>
        <div class="page-header">
          <h1>Ordenes de Despacho - Track</h1>
        </div>
       
        <p class="lead">
		   
		   <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">
            <table cellpadding="0" cellspacing="0" border="0" style="width:100%; heigh:100px">
            <tr>
            	<td>&nbsp;</td>
            	<td ><b>Nro OD</b></td>
            	<td>&nbsp;</td>
            	<td><% out.println(orden.getIdOrdenDespacho()); %></td>
            	<td><b>Estado</b></td>
            	<td>&nbsp;</td>
            	<td><% out.println(orden.getEstado()); %></td>
            </tr>
            <tr>	
            	<td>&nbsp;</td>
            	<td><b>Fecha</b></td>
            	<td>&nbsp;</td>
            	<td><% out.println(orden.getFecha()); %></td>
            	<td><b>Venta</b></td>
            	<td>&nbsp;</td>
            	<td><% out.println(orden.getNroVenta()); %></td>
            </tr>
            <tr>
            	<td>&nbsp;</td>
            	<td><b>Nro Portal Web </b></td>
            	<td>&nbsp;</td>
            	<td><% out.println(orden.getModulo().getIdModulo()); %></td>
            	<td><b>Nombre</b></td>
            	<td>&nbsp;</td>
            	<td><% out.println(orden.getModulo().getNombre()); %></td>
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