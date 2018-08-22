<%-- 
    Document   : actEstadoSoli
    Created on : 14/02/2018, 04:29:41 PM
    Author     : Kevin
--%>


<%@page import="modeloVO.SolicitudVO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar</title>
    </head>
    <body>
        <%@include file="../templates/header.jsp" %>
    <%     SolicitudVO solicitudVO = (SolicitudVO) request.getAttribute("solicitudVO");
    %>

    <form id="forRol"  action="servletRol" method="POST" class="form-horizontal" >
      <div class="form-group">
        <input type="hidden" name="opcion" value="5">
        <input type="hidden" name="idRol" id="idRol" value="<%=solicitudVO.getIdSolicitud()%>" > 
        <label for="nombre" class="control-label col-sm-2">Nombre: </label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="nombre" name="nombre"   value="<%=solicitudVO.getEstado()%>" required >
        </div>
      </div>

      <div class="form-group">
        <label for="horaEntrega" class="control-label col-sm-2">Hora entrega: </label>
        <div class="col-sm-10">
          <input type="date" class="form-control" id="horaEntrega" name="horaEntrega" value="<%=solicitudVO.getHoraEntrega()%>" disable>
        </div>
      </div>
 
      <input type="submit" value="enviar" name="guardar">
    </form>
          <%@include file="../templates/footer.jsp" %>
    </body>
</html>
