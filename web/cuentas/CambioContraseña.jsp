<%-- 
    Document   : CambioContraseña
    Created on : 8/03/2018, 01:57:22 PM
    Author     : prueva
--%>

<%@page import="modeloVO.PersonaVO"%>
<%@page import="modeloVO.RolVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Permatex</title>
    </head>
    <body>
        <%@include file="../templates/header.jsp" %>
        <%     PersonaVO personaVO = (PersonaVO) request.getAttribute("persona");
        %>

        <div class="container">

            <div class="bg-faded p-4 my-4">
                <form id="forEmpl"  action="servletUser" method="POST" class="form-horizontal" >
                    <input type="hidden" name="opcion" value="12">
                    <input type="hidden" name="idPersona" id="idPersona" value="<%=personaVO.getIdPersona()%>" > 
                    <div class="form-group">
                        <label for="pswd" class="control-label col-sm-2">Nueva contraseña: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="pswd" name="pswd" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pswd2" class="control-label col-sm-2">Confirmar contraseña: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="pswd2" name="pswd2" required>
                        </div>
                    </div>
                    <input type="submit" value="Enviar" name="enviar">
                </form>
            </div>
        </div>
    </body>
</html>