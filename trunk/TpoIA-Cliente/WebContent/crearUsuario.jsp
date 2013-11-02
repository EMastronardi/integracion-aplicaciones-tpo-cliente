<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
*{
	font-family: Verdana, Arial, Sans-Serif"
}
</style>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Crear Usuario</title>
</head>
<body>
<h1 style="color: #9FCF21; font-family: Verdana, Arial, Sans-Serif">Nuevo Usuario</h1>
<form action="Controlador?action=nuevoUsuario" method="post">
	<div>
		<span>Usuario: </span><input type="text" name="usuario"/>
		<br />
		<span>Password: </span> <input type="password" name="password"/>
		<br />
		<input type="submit" value="Crear"/>
	</div>
</form>
</body>
</html>