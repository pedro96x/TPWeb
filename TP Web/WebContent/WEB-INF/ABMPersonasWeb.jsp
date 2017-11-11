<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Persona"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Administrar Personas</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="style/font-awesome.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-show-password/1.0.3/bootstrap-show-password.min.js"></script>
  
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
		      <li><a href="aABMPersonas">Personas</a></li> 
		      <li><a href="aABMAutos">Autos</a></li> 
		       <li><a href="aABMTiposAuto">Tipos Auto</a></li> 
		      <li><a href="aMisReservas">Mis Reservas</a></li>     
		    </ul>
  			<ul class="nav navbar-nav navbar-right">
	  			<li class="dropdown">
		          	<a class="dropdown-toggle" data-toggle="dropdown" href="#">
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
  <h2>Administrar Personas</h2>
  <p>En la siguiente tabla se muestran todas las personas registradas</p>
 
  
 
  
  
  
             
  <table class="table table-hover">
  

    <thead>
      <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Apellido</th>
        <th>DNI</th>
        <th>Email</th>
        <th>Contraseña</th>
        <th>Habilitado</th>
        <th></th>
       
       
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
      <td><label><i class="fa fa-check" style="font-size:20px;color:green;" aria-hidden="true"></i></label></td>
       <!--  <td><label><input type="checkbox" value="true" checked="checked"></label></td> -->
        <%}
       else {%>
   <td><label><i class="fa fa-times" style="font-size:20px;color:red;" aria-hidden="true"></i></label></td>
    	 <!-- <td><label><input type="checkbox" value="true"></label></td>   -->
       <% }%>
       
       
<td>
<a class="btn btn-primary" href="path/to/settings" aria-label="Delete" data-toggle="modal" data-target="#mod<%=p.getId()%>">
<i class="fa fa-pencil" aria-hidden="true"></i>
</a>
<a class="btn btn-danger" href="path/to/settings" aria-label="Delete" data-toggle="modal" data-target="#<%=p.getId()%>">
  <i class="fa fa-trash-o" aria-hidden="true"></i>
</a></td>
      
      <%}
			}
			else {%>
			 <p> No hay Personas para mostrar </p>  
			 <% }
		%>  
		     
      </tbody>
  </table>
 

  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal"style="margin-bottom: 20px;">Agregar Persona</button>
  <div class="modal fade" id="myModal" role="dialog">
      <div class="modal-dialog">
      
        <!-- Modal content-->
        <div class="modal-content">
        
        
        
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Agregar nueva persona</h4>
          </div>
          <form class="form-horizontal"  action="AgregarPersona" method="post">
          <div class="modal-body">

            
            <p>Complete todos los campos  </p>
            
            
           

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
                      <label class="control-label col-sm-2" for="usr">Email:</label>
                      <div class="col-sm-10"> 
                      <input name="user" type="text" class="form-control" id="usuario" type="email" placeholder="Ingrese email">
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
    
    
    
   <!--  Aca voy a crear un modal de delete por cada persona -->
   
   
    <%
			
			if (listaPers != null){
			for(Persona p : listaPers){
		%>
   
   
   
     <div class="modal fade" id="<%=p.getId() %>" role="dialog">
      <div class="modal-dialog">
      
        <!-- Modal content-->
        <div class="modal-content">
        
        
        
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Eliminar persona</h4>
          </div>
          <form class="form-horizontal"  action="EliminarPersona" method="post">
          <div class="modal-body">
   
            <p>¿Esta seguro que desea eliminar a esta persona?</p>
            
            <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">ID:</label>
                    <div class="col-sm-10"> 
                    <input name="idPersona" type="text" class="form-control" id="nombre"value="<%=p.getId()%> " readonly>
                  </div>
                  </div>
            
                 <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">Nombre:</label>
                    <div class="col-sm-10"> 
                    <input name="nombre" type="text" class="form-control" id="nombre"value="<%=p.getNombre()%> " readonly>
                  </div>
                  </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">Apellido:</label>
                    <div class="col-sm-10"> 
                    <input name="apellido" type="text" class="form-control" id="apellido" value=<%=p.getApellido()%>  readonly>
                </div>
              </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">DNI:</label>
                    <div class="col-sm-10"> 
                    <input name="dni" type="text" class="form-control" id="dni" value=<%=p.getDni()%> readonly>
                  </div>
                </div>

                  <div class="form-group">
                      <label class="control-label col-sm-2" for="usr">Email:</label>
                      <div class="col-sm-10"> 
                      <input name="user" type="text" class="form-control" id="usuario" value=<%=p.getUser()%> readonly>
                    </div> 
                  </div>

                <div class="form-group">
                  <label class="control-label col-sm-2" for="pwd">Contraseña:</label>
                  <div class="col-sm-10"> 
                  
                    <input name="pass" type="text" class="form-control" id="password" value=<%=p.getPass()%> readonly>
                    
                  </div>
                </div>

                <div class="form-group">
                      <label class="control-label col-sm-2" for="usr">Habilitado:</label>
                      <div class="col-sm-10"> 
                      
                       <%if (p.isHabilitado()){ %>
    <i class="fa fa-check" style="font-size:20px;color:green;" aria-hidden="true"></i>
    <!--    <input name="habilitado" type="checkbox" value="true" checked="checked" readonly="readonly" > -->
        <%}
       else {%>
       <i class="fa fa-times" style="font-size:20px;color:red;" aria-hidden="true"></i>
 <!--   <input name="habilitado" type="checkbox" value="true" readonly="readonly" > -->
       <% }%>
                      
             
                    </div> 
                  </div>
                  
                  
                  
                  
              </div>

              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>

                
                    <div class="col-sm-10"> 
                    <button type="submit" class="btn btn-success">Aceptar</button>
                  </div>
              </div>
           </form>

        </div>
       
        
      </div>
    </div>
    
    <%}} %>
    
     <!--  Aca voy a crear un modal de delete por cada persona -->
     
     <!--  Aca voy a crear un modal de actualizar por cada persona -->
     
     
     <%
			
			if (listaPers != null){
			for(Persona p : listaPers){
		%>
   
   
   
     <div class="modal fade" id="mod<%=p.getId() %>" role="dialog">
      <div class="modal-dialog">
      
        <!-- Modal content-->
        <div class="modal-content">
        
        
        
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Modificar persona</h4>
          </div>
          <form class="form-horizontal"  action="ModificarPersona" method="post">
          <div class="modal-body">
   
            <p>Modifique los campos que desee</p>
            
            <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">ID:</label>
                    <div class="col-sm-10"> 
                    <input name="idPersona" type="text" class="form-control" id="nombre"value="<%=p.getId()%>" readonly>
                  </div>
                  </div>
            
                 <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">Nombre:</label>
                    <div class="col-sm-10"> 
                    <input name="nombre" type="text" class="form-control" id="nombre"value="<%=p.getNombre()%> " >
                  </div>
                  </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">Apellido:</label>
                    <div class="col-sm-10"> 
                    <input name="apellido" type="text" class="form-control" id="apellido" value=<%=p.getApellido()%>  >
                </div>
              </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">DNI:</label>
                    <div class="col-sm-10"> 
                    <input name="dni" type="text" class="form-control" id="dni" value=<%=p.getDni()%> >
                  </div>
                </div>

                  <div class="form-group">
                      <label class="control-label col-sm-2" for="usr">Email:</label>
                      <div class="col-sm-10"> 
                      <input name="user" type="text" class="form-control" type="email" id="usuario" value=<%=p.getUser()%> >
                    </div> 
                  </div>

                <div class="form-group">
                  <label class="control-label col-sm-2" for="pwd">Contraseña:</label>
                  <div class="col-sm-10"> 
                  
                    <input name="pass" type="text" class="form-control" id="password" value=<%=p.getPass()%> >
                    
                  </div>
                </div>

                <div class="form-group">
                      <label class="control-label col-sm-2" for="usr">Habilitado:</label>
                      <div class="col-sm-10"> 
                      
                       <%if (p.isHabilitado()){ %>
    
       <input name="habilitado" type="checkbox" value="true" checked="checked"  >
        <%}
       else {%>
   <input name="habilitado" type="checkbox" value="true"  >
       <% }%>
                      
             
                    </div> 
                  </div>
                  
                  
                  
                  
              </div>

              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>

                
                    <div class="col-sm-10"> 
                    <button type="submit" class="btn btn-success">Aceptar</button>
                  </div>
              </div>
           </form>

        </div>
       
        
      </div>
    </div>
     
     <%}} %>
     <!--  Aca voy a crear un modal de actualizar por cada persona -->
    
    
    
    
    
</div>

</body>
</html>