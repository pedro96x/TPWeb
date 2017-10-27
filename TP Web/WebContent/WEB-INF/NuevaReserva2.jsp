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
  

  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Continuar</button>
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
                    <input  type="text" name="fechaInicio" id="txtFechaInicio" class="form-control" placeholder="Ingrese detalle" value=<%=(String)request.getAttribute("fechaInicio")%> readonly>
                </div>
              </div>
               <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">Fin:</label>
                    <div class="col-sm-10"> 
                    <input name="fechaFin" id="txtFechaFin" type="text" class="form-control"  placeholder="Ingrese detalle" value=<%=(String)request.getAttribute("fechaFin")%> readonly>
                </div>
              </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="usr">Detalle:</label>
                    <div class="col-sm-10"> 
                    <input name="detalle" type="text" class="form-control" id="apellido" placeholder="Ingrese detalle" value=<%=(String)request.getAttribute("detalle")%> readonly>
                </div>
              </div>

				<div class="form-group">
                    <label class="control-label col-sm-2" for="usr">Modelo:</label>
                    <div class="col-sm-10"> 
                    <input name="nombreTipo" id="tipoAuto" type="text" class="form-control" readonly= "true" value="<%=(String)request.getAttribute("nombreTipo")%>" >
                </div>
              </div> 


			<%-- <div class="form-group">
                <label class="control-label col-sm-2" for="usr">Modelo:</label>
                <div class="col-sm-10">
					<select class="form-control" name="nombreTipo" id="tipoAuto" readonly>  <!-- Como tomo datos de un select? es lo mismo que un imput? -->
				        <option><%= (String)request.getAttribute("nombreTipo") %></option>
      				</select>
      			</div>	
			</div> --%>

 <%
/* CtrlAuto ctrlAuto = new CtrlAuto(); */
ArrayList<Auto> listaAuto = new ArrayList<Auto>() ;
listaAuto= (ArrayList<Auto>)request.getAttribute("listaAutos");
%>
			<div class="form-group">
                <label class="control-label col-sm-2" for="usr">Auto:</label>
                <div class="col-sm-10">
					<select class="form-control" name="nombreAuto" id="auto">  <!-- Como tomo datos de un select? es lo mismo que un imput? -->
				        <%for(Auto a : listaAuto){%>
				        <option><%=a.getNombre() %></option><%}%>
      				</select>
      			</div>	
			</div>

              </div>

              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>

                
                    <div class="col-sm-10"> 
                    <button type="submit" class="btn btn-success">Reservar</button>
                  </div>
              </div>
           </form>
        </div>        
      </div>
    </div>
</div>

</body>
</html>