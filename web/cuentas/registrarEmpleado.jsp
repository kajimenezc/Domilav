<%-- 
    Document   : registrarEmpleado
    Created on : 6/12/2017, 12:14:43 PM
    Author     : kev_i
--%>

<%@page import="modeloVO.BarrioVO"%>
<%@page import="modeloVO.AgenciaVO"%>
<%@page import="modeloVO.PersonaVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="modeloDAO.conexioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EMPLEADOS</title>
           <script src="javaScript/jquery-3.2.2.min.js" type="text/javascript"></script>
        <script>$(document).ready(function () {

                $("#validaDatos").click(function () {


                    if ($("#nombre").val().length < 3) {

                        var mensaje = document.getElementById('mensajeVal');
                        mensaje.innerHTML = "<p>INGRESE UN NOMBRE MAYOR O IGUAL A TRES LETRAS. </p>";
                        return false;

                    }
// IsNaN = Toma los valores y compara si son numericos.
                    else if ($("#tel").val().length < 7 || isNaN($("#tel").val())) {
                        var mensaje = document.getElementById('mensajeVal');
                        mensaje.innerHTML = "<p>Se admiten mas de 6 numeros. </p>";
                        return false;
                    }
                    /* else if ($("#correo").val().indexOf('@', 0) === -1 || $("#correo").val().indexOf('.', 0) === -1) {
                     var mensaje = document.getElementById('mensajeVal');
                     mensaje.innerHTML = "<p>Correo Electrnico no valido. </p>";
                     return false;
                     }*/

                });
                document.getElementById('mensajeVal').clear;

            });</script>
       
    </head>
    <body>
 <%@include file="../templates/header.jsp" %>
 <div class="col-sm-2"  ></div>

 <div class="col-sm-10">
 <h1>REGISTRAR EMPLEADO</h1>

        <form action="servletUser" method="POST" class="form-horizontal">
            <div class="form-group">

                <input type="hidden" name="opcion" value="6" >

                <label for="nombreEmpl" class="control-label col-sm-2">Nombres: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="nombreEmpl" name="nombreEmpl" >
                </div>
            </div>
            
            
             <div class="form-group">
                <label for="apellidos" class="control-label col-sm-2">Apellidos: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="apellidos" name="apellidos" >
                </div>
            </div>
            
              <div class="form-group">
                <label for="documento" class="control-label col-sm-2">Documento: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="documento" name="documento" >
                </div>
            </div>

          

      
 <div class="form-group">
                <label for="genero" class="control-label col-sm-2">Genero: </label>
                <div class="col-sm-10">
                    <input type="radio" class="radio-inline form-control" name="genero" value="Masculino" checked>Masculino
                    <input type="radio" class="radio-inline form-control" name="genero" value="Femenino">Femenino
                    <input type="radio" class="radio-inline form-control" name="genero" value="Otro">Otro
                  
                </div>
            </div>
            
                 <div class="form-group">

                <label for="direccion" class="control-label col-sm-2">Direccion: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="direccion" name="direccion" >
                </div>
            </div>
            
             <!-- Lista desplegable de barrios -->
            <div class="form-group">
                <label for="barrios" class="control-label col-sm-2">Barrios: </label>
                <div class="col-sm-10">
                    <select name="barrio">
                       <%
                               ArrayList barrio = (ArrayList) request.getAttribute("listaBarrio");
                           
                             if (barrio != null) {
                    Iterator iterator = barrio.listIterator();
                       while (iterator.hasNext()) {
                        BarrioVO barrioVO = (BarrioVO) iterator.next();
                       %>
            
                       <option  value="<%=barrioVO.getIdBarrio()%>"><%=barrioVO.getNombre()%> </option>
                              <%
                    }
                }
            %>
                    </select>
                </div>
            </div>
            


            <div class="form-group">

                <label for="celular" class="control-label col-sm-2">Celular: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="celular" name="celular" >
                </div>
            </div>

            <div class="form-group">
                <label for="fijo" class="control-label col-sm-2">Telefono: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="fijo" name="fijo" >
                </div>
            </div>

       
            

            <div class="form-group">
                <label for="correo" class="control-label col-sm-2">Correo: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="correo" name="correo" >
                </div>
            </div>

         
              <!-- Lista desplegable de agencia -->
            <div class="form-group">
                <label for="agencia" class="control-label col-sm-2">Agencia: </label>
                <div class="col-sm-10">
                    <select name="agencia">
                       <%
                       ArrayList agencia = (ArrayList) request.getAttribute("lista");
                       
                           if (agencia != null) {
                    Iterator iterator = agencia.listIterator();
                       while (iterator.hasNext()) {
                        AgenciaVO agenciaVO = (AgenciaVO) iterator.next();
                       %>
            
                       <option  value="<%=agenciaVO.getIdAgencia()%>"><%=agenciaVO.getNombreAgen()%> </option>
                              <%
                    }
                }
            %>
                    </select>
                </div>
            </div>

                    
          
            
                <div class="col-sm-2">
                    <input type="submit" class="form-control" value="aceptar" >
                </div>
        
                    
           

        </form>
 </div>
                    <div class="col-sm-2"></div>
                     <%@include file="../templates/footer.jsp" %>
    </body>
</html>
