<%-- 
    Document   : Respuesta
    Created on : 30/11/2017, 05:16:32 PM
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
     <% String mensaje = (String) request.getAttribute("mensaje");%>
        <% String opcion = (String) request.getAttribute("opcion"); %>
       
              <div  class="jumbotron text-center" style="margin-top:80px;opacity: 0.6;">
                <h1 style="position: relative">RESPUESTA DE LA OPERACION:</h1>
                <p><%=mensaje%></p> 
                </div>
                
                
    
                
                 <form action="servletAdmin" method="POST" >
            <input type="hidden" name="opcion" value="<%=opcion%>">
            <input type="submit" name="persona" value="Aceptar">
            
              </form>
  </body>
</html>
