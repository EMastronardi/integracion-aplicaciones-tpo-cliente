<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="valueObjects.ModuloVO" %>
<%@page import="model.BusinessDelegate" %>
<%@page import="java.util.*" %>
<%
 ArrayList<ModuloVO> modulos = BusinessDelegate.getInstance().getAllModulos();
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.png">

    <title>TPIA / Despacho / Modulos </title>

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

			var idModulo= "";
			var tipo= "";
			var codigo="";
			var ip ="";
			var jmsdestination ="";
			var nombre ="";
			var usuario = "" ;
			var password = "";
			$(function() {
  			// Handler for .ready() called.
				$( "#newModulo" ).click(function() {
					bootbox.dialog({
						  message: "<form id='createmodulo' method='post' action='ModulosServlet?action=createModulo'>"+
						  	"<label>Identificador </label><input type=\"text\" class=\"form-control\" id='idmoduloinput' name=\"idmodulo\" autofocus>"+
					        "<br/>"+
					        "<label>Tipo </label><select name=\"tipo\"><option value=\"deposito\">Deposito</option><option value=\"portalweb\">Portal Web</option><option value=\"logistica\">Logistica</option></select>"+
					        "<br/>"+
					        "<label>Codigo </label><input type=\"text\" class=\"form-control\" id='codigoinput' name=\"codigo\">"+
					        "<br/>"+
					        "<label>IP </label><input type=\"text\" class=\"form-control\" id='ipinput' name=\"ip\">"+
					        "<br/>"+
					        "<label>Jms Destination </label><input type=\"text\" class=\"form-control\" id='jmsdestinationinput' name=\"jmsdestination\">"+
					        "<br/>"+
					        "<label>Nombre </label><input type=\"text\" class=\"form-control\" id='nombreinput' name=\"nombre\">"+
					        "<br/>"+
					        "<label>Usuario </label><input type=\"text\" class=\"form-control\" id='userinput' name=\"usuario\">"+
					        "<br/>"+
					        "<label>Password </label><input type=\"password\" class=\"form-control\" id='passinput' name=\"password\">"+
					        "</form>",
						  title: "Agregar Modulo",
						  buttons: {
						    success: {
						      label: "Confirmar",
						      className: "btn-success",
						      callback: function() {
							     if($( "#idmoduloinput" ).val() != '' ||  $( "#codigoinput" ).val() != '' ||  $( "#ipinput" ).val() != '' ||  $( "#jmsdestinationinput" ).val() != '' ||  $( "#nombreinput" ).val() != '' ||  $( "#userinput" ).val() != '' ||  $( "#passinput" ).val() != ''){
							   	  	$( "#createmodulo" ).submit();
								}else{
									  alert("Para dar de alta un modulo debe ingresar todos los campos");
								 }  
						      }
						    }
						  }
					});
				});
				$( "#updateUser" ).click(function() {
					updateUser();
				});
				$( "#deleteModulo" ).click(function() {
					deleteModulo();
				});
			});
			//

			function unChecked(obj, tipoSelect , idmoduloselect, codigoselect, ipselect, jmsselect, nombreselect,userselect, passelect){
				var checks = $( ":checkbox" );
				for (var i = 0; i<checks.length; i++){
					if(checks[i] != obj) checks[i].checked = false;
				}
				
				 idModulo= idmoduloselect;
				 tipo= tipoSelect;
				 codigo= codigoselect;
				 ip = ipselect;
				 jmsdestination = jmsselect;
				 nombre = nombreselect;
				 usuario = userselect;
				 password = passelect;
			}
			function updateUser (){
					if(idModulo != ""){
						bootbox.dialog({
							message: "<form id='updatemodulo' method='post' action='ModulosServlet?action=updateModulo'>"+
						  	"<label>Identificador </label><input type=\"text\" class=\"form-control\" id='idmoduloinput' name=\"idmodulo\" value='"+idModulo+"'autofocus>"+
					        "<br/>"+
					        "<label>Tipo </label><select name=\"tipo\"><option value=\"deposito\">Deposito</option><option value=\"portalweb\">Portal Web</option><option value=\"logistica\">Logistica</option></select>"+
					        "<br/>"+
					        "<label>Codigo </label><input type=\"text\" class=\"form-control\" id='codigoinput' value='"+codigo+"' name=\"codigo\">"+
					        "<br/>"+
					        "<label>IP </label><input type=\"text\" class=\"form-control\" id='ipinput' name=\"ip\" value='"+ip+"'>"+
					        "<br/>"+
					        "<label>Jms Destination </label><input type=\"text\" class=\"form-control\" id='jmsdestinationinput' value='"+jmsdestination+"' name=\"jmsdestination\">"+
					        "<br/>"+
					        "<label>Nombre </label><input type=\"text\" class=\"form-control\" id='nombreinput' name=\"nombre\" value='"+nombre+"' >"+
					        "<br/>"+
					        "<label>Usuario </label><input type=\"text\" class=\"form-control\" id='userinput' name=\"usuario\" value='"+usuario+"' >"+
					        "<br/>"+
					        "<label>Password </label><input type=\"password\" class=\"form-control\" id='passinput' name=\"password\" value='"+password+"' >"+
					        "</form>",	
							  
							  title: "Actualizar Modulo",
							  buttons: {
							    success: {
							      label: "Confirmar",
							      className: "btn-success",
							      callback: function() {
							    	  if($( "#idmoduloinput" ).val() != '' ||  $( "#codigoinput" ).val() != '' ||  $( "#ipinput" ).val() != '' ||  $( "#jmsdestinationinput" ).val() != '' ||  $( "#nombreinput" ).val() != '' ||  $( "#userinput" ).val() != '' ||  $( "#passinput" ).val() != ''){
									   	  	$( "#updatemodulo" ).submit();
									  }else{
										  alert("Para dar de modificar un modulo debe ingresar todos los campos");
									 }  
							      }
							    }
							  }
						});
					}else{
						bootbox.alert("Debe seleccionar un Modulo!", function() {});
					}
					
			}
			function deleteModulo (){	
				if(idModulo!=""){	
					bootbox.dialog({
						  message: "<h3>Esta seguro que desea eliminar el modulo seleccionado?</h2>"+
						  "<form id='deletemodulo' method='post' action='ModulosServlet?action=deleteModulo'>"+
							"<input type='hidden' name='idmodulo' value='"+idModulo+"'/>"+
					        "</form>",
						  title: "Eliminar Modulo",
						  buttons: {
						    success: {
						      label: "Confirmar",
						      className: "btn-success",
						      callback: function() {
						    	  $( "#deletemodulo" ).submit();
						      }
						    },
					        main: {
							      label: "Cancelar",
							      callback: function() {
							      }
							}
						  }
					});
				} else {
					bootbox.alert("Debe seleccionar un Modulo!", function() {});
				}
		}
	</script>
	<style>
		   table tr th {
		   		 text-align:center;
		   }
		   table tr td{
		   		   text-align:center;
		   } 
		   select {
		   		display: block;
				width: 100%;
				height: 34px;
				padding: 6px 12px;
				font-size: 14px;
				line-height: 1.428571429;
				color: #555555;
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
      <li><a href="Ordenes.jsp">Ordenes</a></li>
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
  			<li><a href="#">Configuraci&oacute;n</a></li>
  			<li class="active">Modulos</li>
		</ol>
        <div class="page-header">
          <h1>Gesti&oacute;n de Modulos</h1>
        </div>
         <%
          if(request.getAttribute("return") != null ){
        	if(request.getAttribute("return").equals("OK")){
        		out.println("<div class=\"alert alert-success\"><b>El proceso se ha realizado de manera exitosa.</b></div>");
        	}else{
        		out.println("<div class=\"alert alert-danger\"><b>El proceso se ha finalizado con error. Vuelva a intentarlo nuevamente.</b></div>");
        	}
          }
          %>
        <p class="lead">
		   <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">
			<button type="button" id="newModulo" class="btn btn-default btn-sm">
              <span class="glyphicon glyphicon-star"></span> Nuevo Modulo
            </button>
			<button type="button" id="updateUser" class="btn btn-default btn-sm">
              <span class="glyphicon glyphicon-pencil"></span> Editar 
            </button>
			<button type="button" id="deleteModulo" class="btn btn-default btn-sm">
              <span class="glyphicon glyphicon-trash"></span> Eliminar 
            </button>
			</div>
            <!-- Table -->
            <% if(modulos.size() > 0) {%>
            <table class="table">
              <thead>
			  	<tr>
					 <th>Check</th>
			  		 <th>ID</th>
			  		 <th>Nombre</th>
			  		 <th>Tipo</th>
			  		 <th>IP</th>
			  		 <th>Codigo</th>
	           	  	 <th>jmsDestination</th>
	           	  	 <th>Usuario</th>
	           	  	 <th>Password</th>
			  </thead>
			  <tbody>
			  <%
			  //tipoSelect , idmoduloselect, codigoselect, ipselect, jmsselect, nombreselect,userselect, passelect
			 	 for(ModuloVO modulo : modulos){
					  out.println("<tr><td><input type='checkbox' value='"+modulo.getIdModulo()+"' onClick=\"unChecked(this,'"+modulo.getTipo()+"', '"+modulo.getIdModulo()+"' , '"+modulo.getCodigo()+"', '"+modulo.getIp()+"', '"+modulo.getJmsDestination()+"', '"+modulo.getNombre()+"', '"+modulo.getUsuario()+"', '"+modulo.getPassword()+"')\"/></td><td>"+modulo.getIdModulo()+"</td><td>"+modulo.getNombre()+"</td><td>"+modulo.getTipo()+"</td><td>"+modulo.getIp()+"</td><td>"+modulo.getCodigo()+"</td><td>"+modulo.getJmsDestination()+"</td><td>"+modulo.getUsuario()+"</td><td>"+modulo.getPassword()+"</td></tr>");
				  }
			  
			  %> 
			  </tbody>
		    </table>
		    <%}else{ %>
		    	<div class="alert alert-info"><b>No se ha cargado ningun Modulo</b></div>
		    <%} %>
          </div>
		</p>
      </div>
    </div>

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