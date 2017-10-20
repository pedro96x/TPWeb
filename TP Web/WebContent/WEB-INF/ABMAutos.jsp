<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%> 
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Auto"%>
<%@page import="entidades.Persona"%>
<%@page import="entidades.TipoAuto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>ABM Autos</title>
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
  <h2>Administrar Autos</h2>
  <p>En esta tabla se muestran todas los autos registrados</p>
 <h3>Bienvenido session <%=((Persona)session.getAttribute("user")).getNombre() %></h3>
 <p> bienvenido <%= (String)request.getAttribute("nombrePer") %> </p>
  
 
  
  
  
             
  <table class="table table-hover">
  

    <thead>
      <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Tipo</th>
       
       
      </tr>
    </thead>
    <tbody>
    
      <%
      String car="No tiene tipo";
		ArrayList<Auto>listaAutos=(ArrayList<Auto>)request.getAttribute("listaAutos");
		ArrayList<TipoAuto>listaTiposAuto=(ArrayList<TipoAuto>)request.getAttribute("listaTiposAuto");
		if (listaAutos != null){
		for(int i=0;i<listaAutos.size();i++){
			for(int j=0;j<listaTiposAuto.size();j++){
				
				if(listaAutos.get(i).getTipo().getId()==listaTiposAuto.get(j).getId()){
					car=listaTiposAuto.get(j).getNombre();
			}
		}
			%>

<tr>
  <td><%= listaAutos.get(i).getId() %></td>
  <td><%= listaAutos.get(i).getNombre() %></td>
  <td><%= car %></td>
     
       <td><a class="btn btn-primary" href="path/to/settings" aria-label="Delete" data-toggle="modal" data-target="#mod<%=listaAutos.get(i).getId()%>">
  			<i class="fa fa-pencil" aria-hidden="true"></i>
	</a>
	<a class="btn btn-danger" href="path/to/settings" aria-label="Delete" data-toggle="modal" data-target="#<%=listaAutos.get(i).getId()%>">
  <i class="fa fa-trash-o" aria-hidden="true"></i>
	</a>  </td>
      
      <%}
			}
			else {%>
			 <p> No hay autos para mostrar </p>  
			 <% }
		%>  
		     
      </tbody>
  </table>
 

  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal"> Agregar Auto</button>
  <div class="modal fade" id="myModal" role="dialog">
      <div class="modal-dialog">
      
        <!-- Modal content-->
        <div class="modal-content">
        
        
        
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title"> Agregar Nuevo Auto</h4>
          </div>
          <form class="form-horizontal"  action="AgregarAuto" method="post">
          <div class="modal-body">

            
            <p>Complete todos los campos  </p>
            
            
           

              <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">Descripción: </label>
                    <div class="col-sm-10"> 
                    <input name="descripcion" type="text" class="form-control" id="descripcion"placeholder="Ingrese descripcion:">
                  </div>
                  </div>

              

			<div class="form-group">
                <label class="control-label col-sm-2" for="usr">Modelo:</label>
                <div class="col-sm-10">
					<select class="form-control" name="nombreTipo" id="tipoAuto">  <!-- Como tomo datos de un select? es lo mismo que un imput? -->
				        <%for(int j=0;j<listaTiposAuto.size();j++){
				        %><option><%=listaTiposAuto.get(j).getNombre() %></option><%}%>
      				</select>
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
      
    
    
    
   <!--  Aca voy a crear un modal de delete por cada persona -->
   
    <%car="bmw";
				if (listaAutos != null){
					for(int i=0;i<listaAutos.size();i++){
						for(int j=0;j<listaTiposAuto.size();j++){
							if(listaAutos.get(i).getTipo().getId()==listaTiposAuto.get(j).getId()){
								car=listaTiposAuto.get(j).getNombre();
						}
					}
		%>
   
   
   
     <div class="modal fade" id="<%=listaAutos.get(i).getId() %>" role="dialog">
      <div class="modal-dialog">
      
        <!-- Modal content-->
        <div class="modal-content">
        
        
        
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Eliminar Auto</h4>
          </div>
          <form class="form-horizontal"  action="EliminarAuto" method="post">
          <div class="modal-body">
   
            <p>¿Esta seguro que desea eliminar a este auto?</p>
            
            <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">ID:</label>
                    <div class="col-sm-10"> 
                    <input name="idPersona" type="text" class="form-control" id="idA"value="<%=listaAutos.get(i).getId()%> " readonly>
                  </div>
                  </div>
            
                 <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">Nombre:</label>
                    <div class="col-sm-10"> 
                    <input name="nombre" type="text" class="form-control" id="nombre"value="<%=listaAutos.get(i).getNombre()%> " readonly>
                  </div>
                  </div>

                     <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">Tipo:</label>
                    <div class="col-sm-10"> 
                    <input name="apellido" type="text" class="form-control" id="tipo" value=<%=car%>  >
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
     
     
     <%car="bmw";
				if (listaAutos != null){
					for(int i=0;i<listaAutos.size();i++){
						for(int j=0;j<listaTiposAuto.size();j++){
							
							if(listaAutos.get(i).getTipo().getId()==listaTiposAuto.get(j).getId()){
								car=listaTiposAuto.get(j).getNombre();
						}
					}
		%>
   
   
   
     <div class="modal fade" id="mod<%=listaAutos.get(i).getId()%>" role="dialog">
      <div class="modal-dialog">
      
        <!-- Modal content-->
        <div class="modal-content">
        
        
        
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Modificar Auto</h4>
          </div>
          <form class="form-horizontal"  action="ModificarAuto" method="post">
          <div class="modal-body">
   
            <p>Modifique los campos que desee</p>
            
            <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">ID:</label>
                    <div class="col-sm-10"> 
                    <input name="idPersona" type="text" class="form-control" id="idA"value="<%=listaAutos.get(i).getId()%>" readonly>
                  </div>
                  </div>
            
                 <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">Nombre:</label>
                    <div class="col-sm-10"> 
                    <input name="nombre" type="text" class="form-control" id="nombre"value="<%=listaAutos.get(i).getNombre()%> " >
                  </div>
                  </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">Tipo:</label>
                    <div class="col-sm-10"> 
                    <input name="apellido" type="text" class="form-control" id="tipo" value=<%=car%>  >
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
    </div>
     
     <%}} %>
     <!--  Aca voy a crear un modal de actualizar por cada persona -->
    
    
    
    
    
</div>

</body>
</html>