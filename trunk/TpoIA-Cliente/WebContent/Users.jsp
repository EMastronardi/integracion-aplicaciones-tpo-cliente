<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="valueObjects.UsuarioVO" %>
<%@page import="model.BusinessDelegate" %>
<%@page import="java.util.*" %>
<%
 ArrayList<UsuarioVO> users = BusinessDelegate.getInstance().getUsers();
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.png">

    <title>TPIA / Despacho / Usuarios </title>

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
			var idUsuario= "";
			var usuario= "";
			var password="";
			$(function() {
  			// Handler for .ready() called.
				$( "#newUser" ).click(function() {
					bootbox.dialog({
						  message: "<form id='createuser' method='post' action='UsersServlet?action=createUser'>"+
					        "<label>Nombre </label><input type=\"text\" class=\"form-control\" id='nameinput' name=\"usuario\" autofocus>"+
					        "<br/>"+
					        "<label>Password </label><input type=\"password\" class=\"form-control\" id='passinput' name=\"password\">"+
					        "</form>",
						  title: "Agregar Usuario",
						  buttons: {
						    success: {
						      label: "Confirmar",
						      className: "btn-success",
						      callback: function() {
							      if($( "#nameinput" ).val() != '' ||  $( "#passinput" ).val() != '' ){
							    	  $( "#createuser" ).submit();
								  }else{
									  alert("Para dar de alta un usuario debe ingresar todos los campos");
								 }  
						      }
						    }
						  }
					});
				});
				$( "#updateUser" ).click(function() {
					updateUser();
				});
				$( "#deleteUser" ).click(function() {
					deleteUser();
				});
			});
			function unChecked(obj, useridSelect , userselect, passelect){
				var checks = $( ":checkbox" );
				for (var i = 0; i<checks.length; i++){
					if(checks[i] != obj) checks[i].checked = false;
				}
				
				idUsuario = useridSelect;
				usuario = userselect;
				password = passelect;
			}
			function updateUser (){		
					bootbox.dialog({
						  message: "<form id='updateuser' method='post' action='UsersServlet?action=updateUser'>"+
							"<input type='hidden' name='iduser' value='"+idUsuario+"'/>"+
					        "<label>Nombre </label><input type=\"text\" class=\"form-control\" id='nameinput' name=\"usuario\" value='"+usuario+"' autofocus>"+
					        "<br/>"+
					        "<label>Password </label><input type=\"password\" class=\"form-control\" id='passinput' value='"+password+"' name=\"password\">"+
					        "</form>",
						  title: "Actualizar Usuario",
						  buttons: {
						    success: {
						      label: "Confirmar",
						      className: "btn-success",
						      callback: function() {
							      if($( "#nameinput" ).val() != '' ||  $( "#passinput" ).val() != '' ){
							    	  $( "#updateuser" ).submit();
								  }else{
									  alert("Para dar de alta un usuario debe ingresar todos los campos");
								 }  
						      }
						    }
						  }
					});
			}
			function deleteUser (){		
				bootbox.dialog({
					  message: "<h3>Esta seguro que desea eliminar a "+usuario+" como usuario del sistema?</h2>"+
					  "<form id='deleteuser' method='post' action='UsersServlet?action=deleteUser'>"+
						"<input type='hidden' name='iduser' value='"+idUsuario+"'/>"+
				        "</form>",
					  title: "Eliminar Usuario",
					  buttons: {
					    success: {
					      label: "Confirmar",
					      className: "btn-success",
					      callback: function() {
					    	  $( "#deleteuser" ).submit();
					      }
					    },
				        main: {
						      label: "Cancelar",
						      callback: function() {
						      }
						}
					  }
				});
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
    <a class="navbar-brand" href="#">TPO-IA / Despacho - Usuario: </a>
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
  			<li class="active">Usuarios</li>
		</ol>
        <div class="page-header">
          <h1>Gestion de Usuarios</h1>
          </div>
          <%
          if(request.getAttribute("return") != null ){
        	if(request.getAttribute("return").equals("OK")){
        		out.println("<div class=\"alert alert-success\"><b>El proceso se ha realizado de manera exitosa</b></div>");
        	}else{
        		out.println("<div class=\"alert alert-danger\"><b>El proceso se ha finalizado con error. Vuelva a intentarlo nuevamente.</b></div>");
        	}
          }
          %>
        
        <p class="lead">
		   <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">
			<button type="button" id="newUser" class="btn btn-default btn-sm">
              <span class="glyphicon glyphicon-star"></span> Nuevo Usuario
            </button>
			<button type="button" id="updateUser" class="btn btn-default btn-sm">
              <span class="glyphicon glyphicon-pencil"></span> Editar 
            </button>
			<button type="button" id="deleteUser" class="btn btn-default btn-sm">
              <span class="glyphicon glyphicon-trash"></span> Eliminar 
            </button>
			</div>
            <!-- Table -->
            <table class="table">
              <thead>
			  	<tr>
					 <th>Check</th>
			  		 <th>ID</th>
			  		 <th>Nombre</th>
			  </thead>
			  <tbody>
			  <%
			  for(UsuarioVO user : users){
				  out.println("<tr><td><input type='checkbox' value='"+user.getIdUsuario()+"' onClick=\"unChecked(this,'"+user.getIdUsuario()+"', '"+user.getNombre()+"' , '"+user.getPassword()+"' )\"/></td><td>"+user.getIdUsuario()+"</td><td>"+user.getNombre()+"</td></tr>");
			  }
			  
			  %> 
			  </tbody>
		    </table>
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