<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.*"%>
<%@page import="controladores.*"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
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
 <script>
 $(function() {
 $("#divMiCalendario3").datepicker({
 onSelect: function(date) {
 alert(date);
 }
 });
 });
 </script>
 <script>
 $(function() {
 $("#divMiCalendario4").datepicker({
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


<% boolean errorNoHayAutos = (boolean)request.getAttribute("errorNoHayAutos");%>

<%if(errorNoHayAutos){%>
	<div class="alert alert-warning alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
    <strong>Algo salio mal!</strong> No hay autos disponibles para el modelo y fecha seleccionada, por favor intente  con otra fecha o modelo.
  </div>
<%}%>



  <h2>Administrar Reservas</h2><br><br><br>
    <p>En esta tabla se muestran todas sus reservas</p>
  

  <table class="table table-hover">
  

    <thead>
      <tr>
        <th>ID</th>
         <th>Modelo</th> 
        <th>Patente</th>
        <th>Fecha inicio</th>
        <th>Fecha fin</th>
        <th>Detalle</th>
        <td></td>
        
       
       
      </tr>
    </thead>
     <%
			
     
     
     
     
     CtrlReserva ctrl= new CtrlReserva();
		int id = 0;
		ArrayList<Reserva>listaRes=new ArrayList<Reserva>();
		
		id = ((Persona) request.getSession().getAttribute("user")).getId();
		
		listaRes = ctrl.getReservasAFututoByIdPersona(id);
		
	
     
     
     
     
			if (listaRes.size()>0){
			for(Reserva r : listaRes){
		%>

    <tbody>
    
   
  
      <tr>
		<td><%= r.getId() %></td>   		
	    <td><%= r.getAutoReservado().getTipo().getNombre() %></td>   
        <td><%= r.getAutoReservado().getNombre() %></td>
        <td><%= r.getFechaIni() %></td>
        <td><%= r.getFechaFin() %></td>
        <td><%= r.getDetalle() %></td>
       
        <td>
        	<a class="btn btn-danger" href="path/to/settings" aria-label="Delete" data-toggle="modal" data-target="#<%=r.getId()%>">
 				<i class="fa fa-trash-o" aria-hidden="true"></i>
			</a>  
			<a class="btn btn-primary" href="path/to/settings" aria-label="Delete" data-toggle="modal" data-target="#mod<%=r.getId()%>">
  				<i class="fa fa-pencil" aria-hidden="true"></i>
			</a>
		</td>
      
      <%}
			}
			else {%>
			
			 <h3> No hay Reservas para mostrar </h3>  
			 <% }
		%>
      
      
      
      
    
    </tbody>
  </table>
  

<!-- Primer modal de Agregar reserva -->

  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" style="margin-bottom: 20px;">Agregar Reserva</button>
  <div class="modal fade" id="myModal" role="dialog">
      <div class="modal-dialog">
      
        <!-- Modal content-->
        <div class="modal-content">
          <form class="form-horizontal"  action="aNuevaReserva2" method="post">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Agregar nueva Reserva</h4>
          </div>
          <div class="modal-body">
            <p>Complete todos los campos  </p>
				 <div class="form-group">
				 
 					<label class="control-label col-sm-2" for="usr">Inicio:</label>
 					<div class="col-sm-10">
               			<div class='input-group date' id='calendario'>            
                            <input type='date' name="fechaInicio" id="txtFechaInicio" class="form-control" required/>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                 </div>
				 <div class="form-group">
 					<label class="control-label col-sm-2" for="usr">Fin:</label>
 					<div class="col-sm-10">
               			<div class='input-group date' id='calendario'>            
                            <input type='date' name="fechaFin" id="txtFechaFin" class="form-control" required/>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                 </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">Detalle:</label>
                    <div class="col-sm-10"> 
                    <input name="detalle" type="text" class="form-control" id="apellido" placeholder="Ingrese detalle" required>
                </div>
              </div>
              
              
              
              
<% 
Persona per = (Persona)session.getAttribute("user");
ArrayList<TipoAuto> listaTipos = new ArrayList<TipoAuto>();
CtrlTipoAuto ctrlTipoAuto = new CtrlTipoAuto();

if( per.getTipo().equals("ADM") || per.getTipo().equals("ENC")  ) {
listaTipos = ctrlTipoAuto.getArrayList(); 
}
else{ listaTipos = ctrlTipoAuto.getTipoAutosForUser();}
%>
			<div class="form-group">
                <label class="control-label col-sm-2" for="usr">Modelo:</label>
                <div class="col-sm-10">
					<select class="form-control" name="nombreTipo" id="tipoAuto">  <!-- Como tomo datos de un select? es lo mismo que un imput? -->
				        <%for(TipoAuto t: listaTipos){
				        %><option><%= t.getNombre() %></option><%}%>
      				</select>
      			</div>	
			</div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                    <div class="col-sm-10"> 
                    <button type="submit" class="btn btn-primary">Continuar</button>
                  </div>
              </div>
           </form>
        </div>  
      </div>
    </div>

<!-- Primer modal de Agregar reserva -->


 <!--  Modal DELETE -->
    <%
			
			if (listaRes != null){
			for(Reserva r : listaRes){
		%>

     <div class="modal fade" id="<%=r.getId() %>" role="dialog">
      <div class="modal-dialog">
      
        <!-- Modal content-->
        <div class="modal-content">
        
        
        
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Eliminar Reserva</h4>
          </div>
          <form class="form-horizontal"  action="EliminarReserva" method="post">
          <div class="modal-body">
   
            <p>¿Esta seguro que desea eliminar a esta reserva?</p>
            
            <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">ID:</label>
                    <div class="col-sm-10"> 
                    <input name="idReserva" type="text" class="form-control" id="nombre"value="<%=r.getId()%>" readonly>
                  	</div>
                  </div>
                 <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">Fecha inicio:</label>
                    <div class="col-sm-10"> 
                    <input name="fechaIni" type="text" class="form-control" id="fechaIni"value="<%=r.getFechaIni() %> " readonly>
                  </div>
                  </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">Fecha fin:</label>
                    <div class="col-sm-10"> 
                    <input name="fechaFin" type="text" class="form-control" id="fechaFin" value=<%=r.getFechaFin()%>  readonly>
                </div>
              </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">Detalle:</label>
                    <div class="col-sm-10"> 
                    <input name="detalle" type="text" class="form-control" id="detalle" value=<%=r.getDetalle()%> readonly>
                  </div>
                </div>
                  <div class="form-group">
                      <label class="control-label col-sm-2" for="usr">Modelo:</label>
                      <div class="col-sm-10"> 
                      <input name="user" type="text" class="form-control" id="usuario" value=<%=r.getAutoReservado().getTipo().getNombre() %> readonly>
                    </div> 
                  </div>
                 <div class="form-group">
                      <label class="control-label col-sm-2" for="usr">Auto:</label>
                      <div class="col-sm-10"> 
                      <input name="user" type="text" class="form-control" id="usuario" value=<%=r.getAutoReservado().getNombre()%> readonly>
                    </div> 
                  </div>
                  
                  <input type="hidden" name="paginaAnterior" value="ABMReservas"> 
			
              </div>
              <div class="modal-footer">
                <button type="button" class="btn" data-dismiss="modal">Cancelar</button>
                    <div class="col-sm-10"> 
                    <button type="submit" class="btn btn-danger"><i class="fa fa-trash-o fa-lg"></i> Eliminar</button>
                  </div>
              </div>
           </form>
        </div>
      </div>
    </div>
    <%}} %>
   
<!--  Modal DELETE -->




 <!--  Modal Editar Reserva  -->
    <%
			
			if (listaRes != null){
			for(Reserva r : listaRes){
		%>
   
   
   
     <div class="modal fade" id="mod<%=r.getId() %>" role="dialog">
      <div class="modal-dialog">
      
        <!-- Modal content-->
        <div class="modal-content">
        
        
        
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Modificar Reserva</h4>
          </div>
          <form class="form-horizontal"  action="aModificarReserva2" method="post">
          <div class="modal-body">
   
            <p>Modifique los campos</p>
                  
            <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">ID:</label>
                    <div class="col-sm-10"> 
                    <input name="idReserva" type="text" class="form-control" id="idReserva" value=<%=r.getId()%> readonly>
                  </div>
                </div>
            
            <%SimpleDateFormat formatoOutput=new SimpleDateFormat("yyyy-MM-dd");%>
                   <div class="form-group">
 					<label class="control-label col-sm-2" for="usr">Inicio:</label>
 					<div class="col-sm-10">
               			<div class='input-group date' id='Calendario'>            
                            <input type='date' name="fechaInicio" id="txtFechaInicio" class="form-control" value=<%=formatoOutput.format(r.getFechaIni())%> required />
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                 </div>
                <div class="form-group">
 					<label class="control-label col-sm-2" for="usr">Fin:</label>
 					<div class="col-sm-10">
               			<div class='input-group date' id='Calendario'>            
                            <input type='date' name="fechaFin" id="txtFechaFin" class="form-control" value=<%=formatoOutput.format(r.getFechaFin())%> required/>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                 </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">Detalle:</label>
                    <div class="col-sm-10"> 
                    <input name="detalle" type="text" class="form-control" id="detalle" value=<%=r.getDetalle()%> required >
                  </div>
                </div>
                  
                  

			 <div class="form-group">
                <label class="control-label col-sm-2" for="usr">Modelo:</label>
                <div class="col-sm-10">
					<select class="form-control" name="nombreTipo" id="tipoAuto">  <!-- Como tomo datos de un select? es lo mismo que un imput? -->
				        <%for(TipoAuto t: listaTipos){
				     if(r.getAutoReservado().getTipo().getNombre().equals(t.getNombre()))
				     		{%><option selected><%=t.getNombre()%></option><%}
				     else {%><option><%=t.getNombre()%></option><%}}%>
      				</select>
      			</div>	
			</div>
                  
                  <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">Auto:</label>
                    <div class="col-sm-10"> 
                    <input name="nombreAuto" type="text" class="form-control" id="nombreAuto" value=<%=r.getAutoReservado().getNombre()%> readonly>
                  </div>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">ID Auto:</label>
                    <div class="col-sm-10"> 
                    <input name="idAuto" type="text" class="form-control" id="idAuto" value=<%=r.getAutoReservado().getId()%> readonly >
                  </div>
                </div>
                  
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                    <div class="col-sm-10"> 
                    <button type="submit" class="btn btn-primary">Continuar</button>
                  </div>
              </div>
           </form>
        </div>
      </div>
    </div>
  
<%} %>
<%} %>

 <!--  Modal Editar Reserva  -->
 
</div> 

</body>
</html>