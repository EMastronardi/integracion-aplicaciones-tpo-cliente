<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.png">

    <title>TPIA / Despach / Login </title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/home.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
  <%
String userName = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
    if(cookie.getName().equals("user")) userName = cookie.getValue();
}
}
if(userName == null) response.sendRedirect("login.jsp");
%>
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
    <a class="navbar-brand" href="#">TPO-IA / Despacho - Usuario: <%=userName %></a>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Inicio</a></li>
      <li><a href="#">Ordenes</a></li>
      <li><a href="#">Art&iacute;culos</a></li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Configuraci&oacute;n <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="Users.jsp">Usuarios</a></li>
          <li><a href="#">Servicios</a></li>
		  <li><a href="#">Modulos</a></li>
        </ul>
       
        
      </li>
      
    </ul>
    <form class="navbar-form navbar-right" role="search">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Buscar Orden">
      </div>
      <button type="submit" class="btn btn-default">Buscar</button>
    </form>
  </div><!-- /.navbar-collapse -->
</nav>
      <!-- Begin page content -->
      <div class="container">
        <div class="page-header">
          <h1>Bienvenido al Modulo Despacho</h1>
        </div>
        <p class="lead">
		   Mediante esta interfaz Web usted podra:
		   <ul>
		   <li>Registrar un usuario</li>
		   <li>Listar Usuarios</li>
		   <li>Activar/Desactivar usuarios</li>
		   <li>Listar Artículos (filtro por Dep&oacute;sito, b&uacute;squeda por c&oacte;digo, etc)</li>
		   <li>Buscar y listar Ordenes de Despacho (junto con su detalle)</li>
		   <li>Buscar y listar Solicitudes de Articulos </li>
		   <li>Track de Ordenes de Despacho: Ver solicitudes de artículos y la recepci&oacte;n de los mismos y <br/>la notificaci&oacte;n de entrega (con informaci&oacte;n detallada, indicando Depositos, Portal, Fecha y Hora)</li>
		   </ul>
		</p>
      </div>
    </div>

    <div id="footer">
      <div class="container">
        <p class="text-muted credit">
		   TP Obligatorio - Integraci&oacte;n de Aplicaciones - Curso 167215
		   <br/>
		   <b>Alumnos:</b> Emmanuel Mastronardi - Daniel Zanotti - Andr&eacte;s Orellano - Dami&aacte;n Quiroga
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
  </body>
</html>