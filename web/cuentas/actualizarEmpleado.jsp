<%-- 
    Document   : listarPersona
    Created on : 8/12/2017, 12:05:14 PM
    Author     : kev_i
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
        <title>EMPLEADO</title>
    </head>
    <body>
        <%@include file="../templates/header.jsp" %>
        <%     PersonaVO personaVO = (PersonaVO) request.getAttribute("persona");
        %>

        <form id="forEmpl"  action="servletUser" method="POST" class="form-horizontal" >
        <input type="hidden" name="opcion" value="10">
        <input type="hidden" name="idPersona" id="idPersona" value="<%=personaVO.getIdPersona()%>" > 
            <div class="form-group">
                <label for="nombres" class="control-label col-sm-2">Nombres: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="nombres" name="nombres" value="<%=personaVO.getNombres()%>" disabled title="Este campo no se puede modificar">
                </div>
            </div>
            <div class="form-group">
                <label for="apellidos" class="control-label col-sm-2">Apellidos: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="apellidos" name="apellidos" value="<%=personaVO.getApellidos()%>" disabled title="Este campo no se puede modificar">
                </div>
            </div>
            <div class="form-group">
                <input type="hidden" name="opcion" value="10">
                <input type="hidden" name="idPersona" id="idPersona" value="<%=personaVO.getIdPersona()%>" > 
                <label for="documento" class="control-label col-sm-2">Documento: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="documento" name="documento" value="<%=personaVO.getDocumento()%>" disabled title="Este campo no se puede modificar">
                </div>
            </div>
            <div class="form-group">
                <label for="tipoDoc" class="control-label col-sm-2"> Tipo Documento: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="tipoDoc" name="tipoDoc" value="<%=personaVO.getIdDocumento()%>" disabled title="Este campo no se puede modificar">
                </div>
            </div>
            <div class="form-group">
                <label for="genero" class="control-label col-sm-2">Genero: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="genero" name="genero" value="<%=personaVO.getGenero()%>" disabled title="Este campo no se puede modificar">
                </div>
            </div>
            <div class="form-group">
                <label for="agencia" class="control-label col-sm-2">Agencia: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="agencia" name="agencia" value="<%=personaVO.getIdAgencia()%>">
                </div>
            </div>
            <div class="form-group">
                <label for="rol" class="control-label col-sm-2">Rol: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="rol" name="rol" value="<%=personaVO.getRol()%>" disabled title="Este campo no se puede modificar">
                </div>
            </div>
            <div class="form-group">
                <label for="celular" class="control-label col-sm-2">Celular: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="celular" name="celular" value="<%=personaVO.getNumCelular()%>">
                </div>
            </div>
            <div class="form-group">
                <label for="NumFijo" class="control-label col-sm-2">Num Fijo: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="NumFijo" name="NumFijo" value="<%=personaVO.getNumFijo()%>">
                </div>
            </div>
            <div class="form-group">
                <label for="direccion" class="control-label col-sm-2">Direccion: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="direccion" name="direccion" value="<%=personaVO.getDireccion()%>">
                </div>
            </div>
            <div class="form-group">
                <label for="correo" class="control-label col-sm-2">Correo: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="correo" name="correo" value="<%=personaVO.getCorreo()%>">
                </div>
            </div>
            <div class="form-group">
                <label for="usu" class="control-label col-sm-2">Usuario: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="usu" name="usu" value="<%=personaVO.getUsuario()%>" disabled title="Este campo no se puede modificar">
                </div>
            </div>
            <div class="form-group">
                <label for="pswd" class="control-label col-sm-2">Contraseña: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="pswd" name="pswd" value="<%=personaVO.getPassword()%>">
                </div>
            </div>
            <div class="form-group">
                <label for="estado" class="control-label col-sm-2">Estado: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="estado" name="estado" value="<%=personaVO.getEstado()%>" disabled title="Este campo no se puede modificar">
                </div>
            </div>
                <input type="submit" value="enviar" name="guardar">
        </form>
        <%@include file="../templates/footer.jsp" %>
    </body>
</html>
