<%@page import="entidades.Persona"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="style/font-awesome.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

 

	
	
	
	<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Alquiler de Autos</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Autos
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Alta</a></li>
          <li><a href="#">Baja</a></li>
          <li><a href="#">Modificaciones</a></li>
        </ul>
      </li>
      
      <!-- <li><a href="#" action="aABMPersonas" method="post">ABM Personas</a></li>   -->
      <!--  No lo pude hacer andar con un hyperlink, lo cambie por un boton mas abajo  -->
      
      <li><a href="#">Tipo de Auto</a></li>
       <li><a href="#">Autos</a></li>
      <li><a href="#">Mis reservas</a></li>
    </ul>
  </div>
</nav>
	
	<div class="container">
  <h3>Bienvenido <%=((Persona)session.getAttribute("user")).getNombre() %></h3>
  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nec posuere tellus. Etiam faucibus lorem vel viverra mollis. Nulla ligula felis, imperdiet at libero finibus, vulputate porttitor dolor.</p>
  
   <form class="form-signin" name="signin" action="aABMPersonas" method="post">
   <button class="btn btn-lg btn-primary btn-block" type="submit">Gestionar Personas</button> 
  </form>
  
  <form class="form-signin" name="signin" action="aABMAutos" method="post">
   <button class="btn btn-lg btn-primary btn-block" type="submit">Gestionar Autos</button> 
  </form>
  
  <form class="form-signin" name="signin" action="aMisReservas" method="post">
   <button class="btn btn-lg btn-primary btn-block" type="submit">Mis Reservas</button> 
  </form>
  
  
</div>
	
	
	
	
<!-- 	<h3>Menu</h3> (menu viejo)
	
	<nav>
		<a href="url">ABM Autos</a>
		<br>
		<a href="url">ABM Personas</a>
		<br>
		<a href="url">ABM Tipo de Auto</a>
		<br>
		<a href="url">ABM Reservas</a>
	</nav>
	
	 -->
</body>
</html>