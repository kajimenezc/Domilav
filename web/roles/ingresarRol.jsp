<%-- 
    Document   : ingresarRol
    Created on : 30/11/2017, 05:57:52 PM
    Author     : kev_i
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
  </head>
  <body>
    <%@include file="../templates/header.jsp" %>
    <form id="forRol"  action="servletRol" method="POST" class="form-horizontal" >
                    <div class="form-group">
                        <input type="hidden" name="opcion" value="3">
                        <label for="nombre" class="control-label col-sm-2">Nombre: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="nombre" name="nombre"  required >
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="descripcion" class="control-label col-sm-2">Descripcion: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="descripcion" name="descripcion" required >

                        </div>
                    </div>
                    <input type="submit" value="enviar" name="guardar">
                </form>
    
    <br>
     <form actio="servletRol" method="POST" >
        <input type="hidden" name="opcion" value="1">
        <input type="submit" id="inicio" name="inicio" value="LISTAR ROL" class="form-control" >
    </form>
    
    <BR>
       <% String resp = (String) request.getAttribute("mensaje");


    if(resp != null){  %>
    
    <div class="alert alert-success">
  <strong>Success!</strong> <%=resp%>
</div>
    
    <%
    }
    %>
           
    <%@include file="../templates/footer.jsp" %>
  </body>
</html>
