<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Persona"%>
<%@page import="entidades.TipoAuto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Gestionar Tipos de Autos</title>
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
      <a class="navbar-brand" href="Start">Alquiler de Autos</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="Start">Home</a></li>
      <li><a href="aABMPersonas">Personas</a></li> 
      <li><a href="aABMAutos">Autos</a></li> 
         <li class="active"><a href="aABMTiposAuto">Tipos Auto</a></li> 
      <li><a href="aMisReservas">Mis Reservas</a></li>     
    </ul>
  </div>
</nav>












<div class="container">

  <h2>Administrar Tipos de Auto</h2>
  <p>En la siguiente tabla se muestran todos los tipos de autos</p>
 
  
 
  
  
  
             
  <table class="table table-hover">
  

    <thead>
      <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th></th>
       
       
      </tr>
    </thead>
    <tbody>
    
      <%
			ArrayList<TipoAuto> listaTiposAuto = (ArrayList<TipoAuto>)request.getAttribute("listaTiposAuto");
			if (listaTiposAuto != null){
			for(TipoAuto ta : listaTiposAuto){
		%>
  
      <tr>
        <td><%= ta.getId() %></td>
        <td><%= ta.getNombre() %></td>
        
        
      
       
       
<td><a class="btn btn-primary" href="path/to/settings" aria-label="Delete" data-toggle="modal" data-target="#mod<%=ta.getId()%>">
  	<i class="fa fa-pencil" aria-hidden="true"></i>
	</a>
<a class="btn btn-danger" href="path/to/settings" aria-label="Delete" data-toggle="modal" data-target="#<%=ta.getId()%>">
  <i class="fa fa-trash-o" aria-hidden="true"></i>
</a></td>
      
      <%}
			}
			else {%>
			 <p> No hay tipos de auto para mostrar </p>  
			 <% }
		%>  
		     
      </tbody>
  </table>
 

  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Agregar tipo de auto</button>
  <div class="modal fade" id="myModal" role="dialog">
      <div class="modal-dialog">
      
        <!-- Modal content-->
        <div class="modal-content">
        
        
        
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Agregar nuevo tipo de auto</h4>
          </div>
          <form class="form-horizontal"  action="AgregarTipoAuto" method="post">
          <div class="modal-body">

            
            <p>Complete todos los campos  </p>
            
            
           

                <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">Nombre:</label>
                    <div class="col-sm-10"> 
                    <input name="nombre" type="text" class="form-control" id="nombre"placeholder="Ingrese Nombre">
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
			
    if (listaTiposAuto != null){
		for(TipoAuto ta : listaTiposAuto){
		%>
   
   
   
     <div class="modal fade" id="<%=ta.getId() %>" role="dialog">
      <div class="modal-dialog">
      
        <!-- Modal content-->
        <div class="modal-content">
        
        
        
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Eliminar tipo de auto</h4>
          </div>
          <form class="form-horizontal"  action="EliminarTipoAuto" method="post">
          <div class="modal-body">
   
            <p>¿Esta seguro que desea eliminar a este tipo de auto?</p>
            
            <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">ID:</label>
                    <div class="col-sm-10"> 
                    <input name="idTipoAuto" type="text" class="form-control" id="idTipoAuto"value="<%=ta.getId()%>" readonly>
                  </div>
                  </div>
            
                 <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">Nombre:</label>
                    <div class="col-sm-10"> 
                    <input name="nombre" type="text" class="form-control" id="nombre"value="<%=ta.getNombre()%>" readonly>
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
			
    if (listaTiposAuto != null){
		for(TipoAuto ta : listaTiposAuto){
		%>
   
   
   
     <div class="modal fade" id="mod<%=ta.getId() %>" role="dialog">
      <div class="modal-dialog">
      
        <!-- Modal content-->
        <div class="modal-content">
        
        
        
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Modificar tipo de auto</h4>
          </div>
          <form class="form-horizontal"  action="ModificarTipoAuto" method="post">
          <div class="modal-body">
   
            <p>Modifique los campos que desee</p>
            
            <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">ID:</label>
                    <div class="col-sm-10"> 
                    <input name="idTipoAuto" type="text" class="form-control" id="nombre"value="<%=ta.getId()%>" readonly>
                  </div>
                  </div>
            
                 <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">Nombre:</label>
                    <div class="col-sm-10"> 
                    <input name="nombre" type="text" class="form-control" id="nombre"value="<%=ta.getNombre()%>" >
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