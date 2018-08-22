<%-- 
    Document   : reporteDiario
    Created on : 21/03/2018, 01:53:43 PM
    Author     : Kevin
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="modeloDAO.SolicitudDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modeloVO.SolicitudVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../templates/header.jsp" %>
        <%  SolicitudDAO sd = new SolicitudDAO();

            DateFormat formato = new SimpleDateFormat("yyyy/MM/dd");


        %>

        <div class="container">
            <div class="col-sm-3" ></div>
            <div class="col-sm-8" >
                <div class="panel panel-heading">
                    <h1> REPORTE DIARIO</h1>
                </div>
                <div class="panel panel-body" >

                    <%  ArrayList<SolicitudVO> lista = sd.pedido(formato.format(new Date())); %>

                    <label>Total solicitudes: </label><br>

                    <%
                        for (int i = 0; i < lista.size(); i++) {
                            lista.get(i);
                    %>
                      <!--  <tr style="border: 1px solid;">

                                <th ><%=//sv.getIdSolicitud()%></td>
                                <td><%=//sv.getNombre()%></td>

                                <td><%=//sv.getNombreServicio()%></td>
                                <td><%=//sv.getNombreEstado()%></td>
                                <td><%=//sv.getFechaCreacion()%></td>
                                <td><%=//sv.getFechaRecoleccion()%></td>
                                <td><%=//sv.getFechaEntrega()%></td>
                                <td><%=//sv.gethInicioIni()%>  <%=//sv.gethInicioFin()%></td>
                                <td><%=//sv.gethEntregaIni()%>  //sv.gethEntregaFin()%></td>
                                <td><%=//sv.getDescripcion()%></td>
                               

                            </tr>-->



                    <%}%>

                </div>
            </div>
            <div class="col-sm-1" ></div>
        </div>







        <%@include  file="../templates/footer.jsp" %>
    </body>
</html>
