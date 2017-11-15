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
	
	<!-- MENU -->
	
		 <nav class="navbar navbar-inverse">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <a class="navbar-brand" href="Start">Alquiler de Autos</a>
		    </div>
		    <ul class="nav navbar-nav mr-auto">
		      <li class="active"><a href="Start">Home</a></li>
		      <%if (((Persona)session.getAttribute("user")).getTipo().equals("ADM")){ %>
		      
		      <li><a href="aABMPersonas">Personas</a></li> 
		      <li><a href="aABMAutos">Autos</a></li> 
		       <li><a href="aABMTiposAuto">Tipos Auto</a></li> 
		       <li><a href="aTodasLasReservas">Todas las Reservas</a></li> 
		       <%} %>
		      <li><a href="aMisReservas">Mis Reservas</a></li>     
		    </ul>
  			<ul class="nav navbar-nav navbar-right">
	  			<li class="dropdown">
		          	<a class="dropdown-toggle" data-toggle="dropdown" href="aLogin">
		          		<span class="glyphicon glyphicon-user"></span><%=" " + ((Persona)session.getAttribute("user")).getNombre() + " " + ((Persona)session.getAttribute("user")).getApellido()%><span class="caret"></span></a>
		          	<ul class="dropdown-menu">
		            	<li>
		            	<a href="aLogin"><span class="glyphicon glyphicon-log-out"></span> Salir</a>
		            	</li>
		          	</ul>
	       		</li>
     		</ul>
		  </div>
		</nav> 
		
	<!-- /MENU -->	
		
		<div class="container">
		  <h3>Bienvenido <%=((Persona)session.getAttribute("user")).getNombre() %></h3>
		  
		  <%if (((Persona)session.getAttribute("user")).getTipo().equals("ADM")){ %>
		  
		   <form class="form-signin" name="signin" action="aABMPersonas" method="post">
   <button class="btn btn-lg btn-primary btn-block" type="submit" style="margin= 10px;margin-bottom: 10px;margin-top: 10px;">Personas</button> 
  </form>
   <form class="form-signin" name="signin" action="aABMAutos" method="post" margin= 10px>
   <button class="btn btn-lg btn-primary btn-block" type="submit" style="margin= 10px;margin-bottom: 10px;margin-top: 10px;">Autos</button> 
  </form>
   <form class="form-signin" name="signin" action="aABMTiposAuto" method="post">
   <button class="btn btn-lg btn-primary btn-block" type="submit" style="margin= 10px;margin-bottom: 10px;margin-top: 10px;">Tipos Auto</button> 
  </form>
  <form class="form-signin" name="signin" action="aTodasLasReservas" method="post">
   <button class="btn btn-lg btn-primary btn-block" type="submit" style="margin= 10px;margin-bottom: 10px;margin-top: 10px;">Todas las Reservas</button> 
  </form>
  			<%} %>
  <form class="form-signin" name="signin" action="aMisReservas" method="post">
   <button class="btn btn-lg btn-primary btn-block" type="submit" style="margin= 10px;margin-bottom: 10px;margin-top: 10px;">Mis Reservas</button> 
  </form><br>
		</div>
	</body>
</html>