<%-- 
    Document   : ingresarAgencia
    Created on : 30/11/2017, 05:56:32 PM
    Author     : kev_i
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>INGREASAR</title>
  
  </head>
  <body>
    <%@include file="../templates/header.jsp" %>
    <div class="content">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">      
  <div class="card-box">
    <br>
    <h1>INGRESAR AGENCIA</h1>
    <br>
     <form action="servletAgencia" method="POST" >
        <input type="hidden" name="opcion" value="1">
        <input type="submit" id="inicio" name="inicio" value="LISTAR AGENCIA" class="form-control" >
    </form>
    <br>
    <% String resp = (String) request.getAttribute("mensaje");


    if(resp != null){  %>
    
    <div class="alert alert-success">
  <strong>EXITO!</strong> <%=resp%>
</div>
    
    <%
    }
    %>
    <br>
    
    
    
    <form id="formAgencia"  action="servletAgencia" method="POST" class="form-horizontal" >
      <div class="form-group">
        <input type="hidden" name="opcion" value="3">
        <label for="nombreAgen" class="control-label col-sm-2">Nombre: </label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="nombreAgen" name="nombreAgen" >
        </div>
      </div>

      <div class="form-group">
        <label for="direccion" class="control-label col-sm-2">Direccion: </label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="direccion" name="direccion"  >

        </div>
      </div>
      <div class="form-group">           
        <label for="telefono" class="control-label col-sm-2">Telefono: </label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="telefono" name="telefono" placeholder="">
        </div>
      </div>
      <div class="form-group">
        <label for="telefonoDos" class="control-label col-sm-2">Fijo: </label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="telefonoDos" name="telefonoDos"  >
        </div>
      </div>
      <div class="form-group">       

        <label for="correo" class="control-label col-sm-2">correo: </label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="correo" name="correo" >

        </div>
      </div>   
      <div class="form-group">    
        <div class="col-sm-offset-2 col-sm-10">

            
          <input type="submit" id="confirm" class="btn btn-succes"  name="guardar" value="confirmar"  >

          
        </div>
      </div>
    </form>
    
   
    </div>
    </div>
               
        </div>
        </div>
        </div>
 
    <style>
         .error{
             color: red;
         }
     </style>
      <script src="javaScript/jquery.validate_1.js" type="text/javascript"></script>
        <script src="javaScript/additional-methods.js" type="text/javascript"></script>
     
     <script>
     $(document).ready(function () {
    $("#formAgencia").validate({
        rules: {
            nombreAgen: {
                required: true,
                minlength: 3,
                maxlength: 50
            },
            telefonoDos: {
                required: true,
                minlength: 8,
                maxlength: 10
            },
            telefono: {
                required: true,
                minlength: 8,
                maxlength: 12
            },
            direccion: {
                required: true,
                minlength: 10,
                maxlength: 20
            },
            correo: {
                required: true,
                minlength: 10,
                maxlength: 200
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
    
        <%@include file="../templates/footer.jsp" %>
     
  </body>
</html>
