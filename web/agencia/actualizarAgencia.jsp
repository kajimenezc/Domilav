<%-- 
    Document   : actualizarAgencia
    Created on : 30/11/2017, 05:57:12 PM
    Author     : kev_i
--%>

<%@page import="modeloVO.AgenciaVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Actualizar</title>
  </head>
  <body>
    <%     AgenciaVO agenciaVO = (AgenciaVO) request.getAttribute("agenciaVO");
    %>
<%@include file="../templates/header.jsp" %>

 <div class="content">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">      
  <div class="card-box">
                <br>
                <h1>ACTUALIZAR AGENCIA</h1>
                <br>
                 <form action="servletAgencia" method="POST" >
        <input type="hidden" name="opcion" value="1">
        <input type="submit" id="inicio" name="inicio" value="LISTAR AGENCIA" class="form-control" >
    </form>
                <br>

    <form id="formAgencia"  action="servletAgencia" method="POST" class="form-horizontal" >
      <div class="form-group">
        <input type="hidden" name="opcion" value="5">
        <input type="hidden" name="idAgencia" id="idAgencia" value="<%=agenciaVO.getIdAgencia()%>" > 
        <label for="nombreAgen" class="control-label col-sm-2">Nombre: </label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="nombreAgen" name="nombreAgen"   value="<%=agenciaVO.getNombreAgen()%>" required >
        </div>
      </div>

      <div class="form-group">
        <label for="direccion" class="control-label col-sm-2">Direccion: </label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="direccion" name="direccion" value="<%=agenciaVO.getDireccionAgen()%>" required >

        </div>
      </div>
      <div class="form-group">           
        <label for="telefono" class="control-label col-sm-2">Telefono: </label>
        <div class="col-sm-10">
          <input type="number" class="form-control" id="telefono" name="telefono" value="<%=agenciaVO.getTelUno()%>">
        </div>
      </div>
      <div class="form-group">
        <label for="telefonoDos" class="control-label col-sm-2">FIJO: </label>
        <div class="col-sm-10">
          <input type="number" class="form-control" id="telefonoDos" name="telefonoDos" value="<%=agenciaVO.getTelDos()%>" required >
        </div>
      </div>
      <div class="form-group">       

        <label for="correo" class="control-label col-sm-2">correo: </label>
        <div class="col-sm-10">
          <input type="email" class="form-control" id="correo" name="correo" value="<%=agenciaVO.getCorreoAgen()%>" required >

        </div>
      </div>   
     
          <input type="submit" class="btn btn-default">
          </div>
               
        </div>
        </div>
        </div>
        </div>
          <%@include file="../templates/footer.jsp" %>
          <style>
         .error{
             color: red;
         }
     </style>
     <script>
     $(document).ready(function () {
    $("#formAgencia").validate({
        rules: {
            nombreAgen: {
                required: true,
                minlength: 3,
                maxlength: 20
            },
            telefonoDos: {
                required: true,
                minlength: 7,
                maxlength: 9
            },
            telefono: {
                required: true,
                minlength: 9,
                maxlength: 12
            },
            direccion: {
                required: true,
                minlength: 10,
                maxlength: 20
            },
            correo: {
                required: true,
                email = true
                minlength: 15,
                maxlength: 25
            }
        },
        messages: {
            nombreAgen: {
                required: "Campo obligatorio",
                minlength: "Muy corto",
                maxlength: "Excede el limite"
            },
            telefono: {
                required: "Campo obligatorio",
                minlength: "Muy corto",
                maxlength: "Excede el limite"
            },
            telefonoDos: {
                required: "Campo obligatorio",
                minlength: "Muy corto",
                maxlength: "Excede el limite"
            },
            direccion: {
                required: "Campo obligatorio",
                minlength: "Muy corto.",
                maxlength: "Excede el limite"
            },
            correo: {
                required: "Campo obligatorio",
                minlength: "Muy corto",
                maxlength: "Excede el limite"

            }
        }

    });
});
     </script>
  </body>
</html>
