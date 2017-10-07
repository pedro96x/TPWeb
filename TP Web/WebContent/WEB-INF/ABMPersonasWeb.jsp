<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Persona"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>ABM Personas</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="style/font-awesome.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-show-password/1.0.3/bootstrap-show-password.min.js"></script>
  
</head>
<body>





  <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Alquiler de Autos</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="Start">Home</a></li>
      <li><a href="aABMPersonas">Personas</a></li> 
      <li><a href="aABMAutos">Autos</a></li> 
      <li><a href="aMisReservas">Mis Reservas</a></li>     
    </ul>
  </div>
</nav>












<div class="container">
  <h2>Administrar Personas</h2>
  <p>En esta tabla se muestran todas las personas registradas</p>
 <h3>Bienvenido session <%=((Persona)session.getAttribute("user")).getNombre() %></h3>
 <p> bienvenido <%= (String)request.getAttribute("nombrePer") %> </p>
  
  <table>
	<%-- 	<% ArrayList<Persona> listaPers;
		listaPers = (ArrayList<Persona>)request.getAttribute("listaPersonas");%>
			<%
	
			if (listaPers != null){
			 for(Persona p : listaPers){ 
				
			/* Persona	p = listaPers[2];  */
			
			
		%>
		<tr>
			<td><%=p.getDni() %></td>
			<td><%=p.getApellido() %></td>
			<td><%=p.getNombre() %></td>
		</tr>
		<%
			 } }
			else {%>
			 <p> No hay Personas para mostrar </p>  
			 <% }
		%> --%>
	</table>
  
  
  
             
  <table class="table table-hover">
  

    <thead>
      <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Apellido</th>
        <th>DNI</th>
        <th>Usuario</th>
        <th>Contraseña</th>
        <th>Habilitado</th>
       
       
      </tr>
    </thead>
    <tbody>
    
      <%
			ArrayList<Persona>listaPers=(ArrayList<Persona>)request.getAttribute("listaPersonas");
			if (listaPers != null){
			for(Persona p : listaPers){
		%>
  
      <tr>
        <td><%= p.getId() %></td>
        <td><%= p.getNombre() %></td>
        <td><%= p.getApellido() %></td>
        <td><%= p.getDni() %></td>
        <td><%= p.getUser() %></td>
        <td><%= p.getPass() %></td>
        <%if (p.isHabilitado()){ %>
      <td><label><i class="fa fa-check" aria-hidden="true"></i></label></td>
       <!--  <td><label><input type="checkbox" value="true" checked="checked"></label></td> -->
        <%}
       else {%>
   <td><label><i class="fa fa-times" aria-hidden="true"></i></label></td>
    	 <!-- <td><label><input type="checkbox" value="true"></label></td>   -->
       <% }%>
      
      <%}
			}
			else {%>
			 <p> No hay Personas para mostrar </p>  
			 <% }
		%>
      
      
      
      
     <!--  <tr>
          <td>7</td>
          <td>Guido</td>
          <td>Fabio</td>
          <td>3956478</td>
          <td>guido679</td>
          <td>1234</td>
          <td><label><input type="checkbox" value="true"></label></td>
          <td>Usuario</td>
      </tr>
      <tr>
          <td>10</td>
          <td>Miguel</td>
          <td>Oliveros</td>
          <td>19456759</td>
          <td>cubano54</td>
          <td>freecuban</td>
          <td><label><input type="checkbox" value=""></label></td>
          <td>Gerente</td>
      </tr> -->
    </tbody>
  </table>
 

  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Agregar Persona</button>
  <div class="modal fade" id="myModal" role="dialog">
      <div class="modal-dialog">
      
        <!-- Modal content-->
        <div class="modal-content">
        
        
        
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Agregar nueva persona</h4>
          </div>
          <div class="modal-body">

            
            <p>Complete todos los campos  </p>
            
            <form class="form-horizontal"  action="AgregarPersona" method="post">
           

                <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">Nombre:</label>
                    <div class="col-sm-10"> 
                    <input name="nombre" type="text" class="form-control" id="nombre"placeholder="Ingrese Nombre">
                  </div>
                  </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">Apellido:</label>
                    <div class="col-sm-10"> 
                    <input name="apellido" type="text" class="form-control" id="apellido" placeholder="Ingrese Apellido">
                </div>
              </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">DNI:</label>
                    <div class="col-sm-10"> 
                    <input name="dni" type="text" class="form-control" id="dni" placeholder="Ingrese DNI">
                  </div>
                </div>

                  <div class="form-group">
                      <label class="control-label col-sm-2" for="usr">Usuario:</label>
                      <div class="col-sm-10"> 
                      <input name="user" type="text" class="form-control" id="usuario" placeholder="Ingrese Usuario">
                    </div> 
                  </div>

                <div class="form-group">
                  <label class="control-label col-sm-2" for="pwd">Contraseña:</label>
                  <div class="col-sm-10"> 
                    
                    <input name="pass" type="password" id="password" placeholder="Ingrese contraseña" name="password" class="form-control" data-toggle="password">
                  </div>
                </div>

                <div class="form-group">
                      <label class="control-label col-sm-2" for="usr">Habilitado:</label>
                      <div class="col-sm-10"> 
                     <input name="habilitado" type="checkbox" value="true" >
                    </div> 
                  </div>






                  <!-- <div class="container">
                      <label class="control-label col-sm-2" for="pwd2">Tipo:</label>
                      <div class="col-sm-10"> 
                  <div class="btn-group">
                    <button type="button" class="btn btn-primary">Admin</button>
                    <button type="button" class="btn btn-primary">Gerente</button>
                    <button type="button" class="btn btn-primary">Usuario</button>
                  </div>
                </div>
              </div>
 -->
                
             


              </div>

              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>

                
                    <div class="col-sm-10"> 
                    <button type="submit" class="btn btn-success">Aceptar</button>
                  </div>
                
                
                
                
                
                
                

              </div>
           </form>

        </div>
        <!-- Script para ocultar la contraseña-->
        <script type="text/javascript"> 
          $("#password").password('toggle');     
        </script>
        
      </div>
    </div>
</div>

</body>
</html>