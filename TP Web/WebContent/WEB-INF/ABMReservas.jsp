<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.*"%>
<%@page import="controladores.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Mis Reservas</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="style/font-awesome.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-show-password/1.0.3/bootstrap-show-password.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
  
  
 <!--  necesario para el calendario -->

   
   
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css" />
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker.min.css" />
 <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
 <script>
 $(function() {
 $("#divMiCalendario1").datepicker({
 onSelect: function(date) {
 alert(date);
 }
 });
 });
 </script>
 <script>
 $(function() {
 $("#divMiCalendario2").datepicker({
 onSelect: function(date) {
 alert(date);
 }
 });
 });
 </script>
   
   
 
   <!--  necesario para el calendario -->
  
  
  
</head>

<body ng-app=""> <!-- body para el angular -->
<!-- <body> -->





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
  <h2>Administrar Reservas</h2>
  <p>En esta tabla se muestran todas sus reservas</p>
  
  
 
  </form>
  
  
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
         <th>Modelo</th> 
        <th>Patente</th>
        <th>Fecha inicio</th>
        <th>Fecha fin</th>
        <th>Detalle</th>
        
       
       
      </tr>
    </thead>
    <tbody>
    
      <%
			ArrayList<Reserva>listaRes=(ArrayList<Reserva>)request.getAttribute("listaRes");
			if (listaRes != null){
			for(Reserva r : listaRes){
		%>
  
      <tr>
		<td><%= r.getId() %></td>   		
	    <td><%= r.getAutoReservado().getTipo().getNombre() %></td>   
        <td><%= r.getAutoReservado().getNombre() %></td>
        <td><%= r.getFechaIni() %></td>
        <td><%= r.getFechaFin() %></td>
        <td><%= r.getDetalle() %></td>
       
        <%-- <%if (p.isHabilitado()){ %>
      <td><label><i class="fa fa-check" aria-hidden="true"></i></label></td>
       <!--  <td><label><input type="checkbox" value="true" checked="checked"></label></td> -->
        <%}
       else {%>
   <td><label><i class="fa fa-times" aria-hidden="true"></i></label></td>
    	 <!-- <td><label><input type="checkbox" value="true"></label></td>   -->
       <% }%> --%>
      
      <%}
			}
			else {%>
			 <p> No hay Reservas para mostrar </p>  
			 <% }
		%>
      
      
      
      
    
    </tbody>
  </table>
  
<form class="form-signin" name="signin" action="aNuevaReserva1" method="post">
   <button class="btn btn-lg btn-primary btn-block" type="submit">Agregar posta reseerva</button> 
  </form>







  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Agregar Reserva</button>
  <div class="modal fade" id="myModal" role="dialog">
      <div class="modal-dialog">
      
        <!-- Modal content-->
        <div class="modal-content">
        
          <form class="form-horizontal"  action="AgregarReserva" method="post">
        
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Agregar nueva Reserva</h4>
          </div>
          <div class="modal-body">

            
            <p>Complete todos los campos  </p>
            
          
           
				 <div class="form-group">
 					<label class="control-label col-sm-2" for="usr">Inicio:</label>
 					<div class="col-sm-10">
               			<div class='input-group date' id='divMiCalendario1'>            
                            <input name="fechaInicio" type='text' id="txtFechaInicio" class="form-control" placeholder="Ingrese fecha de inicio" readonly/>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                 </div>

				 <div class="form-group">
 					<label class="control-label col-sm-2" for="usr">Fin:</label>
 					<div class="col-sm-10">
               			<div class='input-group date' id='divMiCalendario2'>            
                            <input name="fechaFin" type='text' id="txtFechaFin" class="form-control" placeholder="Ingrese fecha de fin" readonly/>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                 </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">Detalle:</label>
                    <div class="col-sm-10"> 
                    <input name="detalle" type="text" class="form-control" id="apellido" placeholder="Ingrese detalle">
                </div>
              </div>



<% 
CtrlTipoAuto ctrlTipoAuto = new CtrlTipoAuto();
ArrayList<TipoAuto> listaTipos = ctrlTipoAuto.getArrayList(); 
%>
			<div class="form-group">
                <label class="control-label col-sm-2" for="usr">Modelo:</label>
                <div class="col-sm-10">
					<select class="form-control" name="nombreTipo" id="tipoAuto" ng-model="myVar" >  <!-- Como tomo datos de un select? es lo mismo que un imput? -->
				        <%for(TipoAuto t: listaTipos){%>
				        <option value=<%=t.getId()%>>
				        <%= t.getNombre()%>
				        </option>
				        <%}%>
      				</select>
      			</div>	
			</div>








<%
CtrlAuto ctrlAuto = new CtrlAuto();
ArrayList<Auto> listaAutos = ctrlAuto.getArrayList();

for (TipoAuto t : listaTipos ){
ArrayList<Auto> autosDelMismoTipo = ctrlAuto.getAutosByID(t.getId());

/* Tenemos que cambiar este ctrlAuto.getAutosByID( id) por uno que solo nos devuelva los disponibles */



	%>
<div ng-switch="myVar">
	<div ng-switch-when=<%=t.getId()%>>
		<div class="form-group">
		    <label class="control-label col-sm-2" for="usr">Auto:</label>
		    <div class="col-sm-10">
				<select class="form-control" name="nombreAuto" id="auto">  <!-- Como tomo datos de un select? es lo mismo que un imput? -->
			        <%for(Auto a : autosDelMismoTipo){%>
			        <option><%=a.getNombre()%></option>
			        <%}%>
					</select>
				</div>	
		</div>
	</div>
</div>	

		<%
	}
%>		












<!-- 
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script>
var options = {
		color : ["red","green","blue"],
		
		country : ["Spain","Germany","France"]
}

$(function(){
	var fillSecondary = function(){
		var selected = $('#tipoAuto').val();
		$('#auto').empty();
		options[selected].forEach(function(element,index){
			$('#auto').append('<option value="'+element+'">'+element+'</option>');
		});
	}
	$('#primary').change(fillSecondary);
	fillSecondary();
});
</script> -->


















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