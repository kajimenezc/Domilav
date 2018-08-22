<%-- 
    Document   : tablaSolicitud
    Created on : 27/01/2018, 02:22:31 PM
    Author     : Kevin
--%>

<%@page import="modeloVO.SolicitudVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SOLICITUDES</title>
        <script type="text/javascript">
      function defineOpcion(opcion, id) {

        document.forms[0].opcion.value = opcion;
        //id es para actualizar y eliminar
        document.forms[0].idSolicitud.value = id;
        //si la opción es eliminar (6), debe preguntar si está seguro.
        if (opcion !== 6) {
          document.forms[0].submit();
        } else if (confirm("¿esta seguro de borrar al id " + id + "?")) {
          document.forms[0].submit();
        }

      }
    </script>
    </head>
    <body>
        <%@include file="../templates/header.jsp" %> 
        <div class="row">
            <div class="col-sm-1"></div>
            <div class="col-sm-10">

                <% ArrayList solicitud = (ArrayList) request.getAttribute("solicitud");
    %>


    <form method="POST" action="servletSolicitud">
      <input type="hidden" name="opcion" value="">
      <input type="hidden" name="idSolicitud" value="">
     
      <table class="table table-striped" >
        <thead >
          <tr>
            <th >ID</th>
            <th >DOCUMENTO</th>
            <th >ESTADO</th>
            <th >CREACIÓN</th>
            <th >RECOLECCIÓN</th>
            <th >ENTREGA</th>
            <th >HORA RECO</th>
            <th >HORA ENTREGA</th>
            <th >DESCRIPCIÓN</th>
          </tr>
        </thead>
        <!--Se recorre el listado para mostrarlo en la tabla -->
        <tbody>
          <%
            if (solicitud != null) {
              Iterator iterator = solicitud.listIterator();
              while (iterator.hasNext()) {
                SolicitudVO solicitudVO = (SolicitudVO) iterator.next();
          %>
          <tr style="border: 1px solid;">

            <th ><%=solicitudVO.getIdSolicitud()%></td>
            <td><%=solicitudVO.getDocumento()  %></td>
            <td><%=solicitudVO.getEstado() %></td>
            <td><%=solicitudVO.getFechaCreacion() %></td>
            <td><%=solicitudVO.getFechaRecoleccion() %></td>
            <td><%=solicitudVO.getFechaEntrega() %></td>
            <td><%=solicitudVO.getHoraRecoge() %></td>
            <td><%=solicitudVO.getHoraEntrega() %></td>
            <td><%=solicitudVO.getDescripcion() %></td>
            <td>
              <input type="button" name="editar" value="Editar" onclick="defineOpcion(10,<%=solicitudVO.getIdSolicitud()%>)">
              <input type="button" name="borrar" value="borrar" onclick="defineOpcion(12,<%=solicitudVO.getIdSolicitud() %>)">   
            </td>
          </tr>
          <%
              } // cierre while    
            } // cierre if
%>

        </tbody>
      </table>
    </form>
                

            </div>
            <div class="col-sm-1"></div>
        </div>

        <%@include file="../templates/footer.jsp" %> 
    </body>
</html>
