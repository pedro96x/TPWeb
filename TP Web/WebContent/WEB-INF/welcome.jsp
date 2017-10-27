<%@page import="entidades.Persona"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Bienvenido</title>
		<link href="style/font-awesome.min.css" rel="stylesheet">
		  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	<body>
	
		<nav class="navbar navbar-inverse">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <a class="navbar-brand" href="Start">Alquiler de Autos</a>
		    </div>
		    <ul class="nav navbar-nav">
		      <li class="active"><a href="Start">Home</a></li>
		      <li><a href="aABMPersonas">Personas</a></li> 
		      <li><a href="aABMAutos">Autos</a></li> 
		       <li><a href="aABMTiposAuto">Tipos Auto</a></li> 
		      <li><a href="aMisReservas">Mis Reservas</a></li>     
		    </ul>
		  </div>
		</nav>
		<div class="container">
		  <h3>Bienvenido <%=((Persona)session.getAttribute("user")).getNombre() %></h3>
		  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nec posuere tellus. Etiam faucibus lorem vel viverra mollis. Nulla ligula felis, imperdiet at libero finibus, vulputate porttitor dolor.</p>
		  <p>  </p>
		   <form class="form-signin" name="signin" action="aABMPersonas" method="post">
   <button class="btn btn-lg btn-primary btn-block" type="submit">Personas</button> 
  </form>
   <form class="form-signin" name="signin" action="aABMAutos" method="post">
   <button class="btn btn-lg btn-primary btn-block" type="submit">Autos</button> 
  </form>
   <form class="form-signin" name="signin" action="aABMTiposAuto" method="post">
   <button class="btn btn-lg btn-primary btn-block" type="submit">Tipos Auto</button> 
  </form>
  
  <form class="form-signin" name="signin" action="aMisReservas" method="post">
   <button class="btn btn-lg btn-primary btn-block" type="submit">Mis Reservas</button> 
  </form>
		</div>
	</body>
</html>