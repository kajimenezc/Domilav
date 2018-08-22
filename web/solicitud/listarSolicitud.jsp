<%-- 
    Document   : tablaSolicitud
    Created on : 27/01/2018, 02:22:31 PM
    Author     : Kevin
--%>

<%@page import="modeloDAO.SolicitudDAO"%>
<%@page import="modeloVO.SolicitudVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SOLICITUDES</title>



    </head>
    <body>
        <%@include file="../templates/header.jsp" %> 
        <div class="content">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">      

          <div class="card-box">


                <div class="table-responsive">

                    <table class="table table-striped" >
                        <thead >
                            <tr>
                                <th >ID</th>
                                <th >CLIENTE</th>

                                <th>SERVICIO</th>
                                <th >ESTADO</th>
                                <th >CREACIÓN</th>
                                <th >RECOLECCIÓN</th>
                                <th >ENTREGA</th>
                                <th >RAGO RECOGER</th>
                                <th >RANGO ENTREGA</th>
                                <th >DESCRIPCIÓN</th>
                            </tr>
                        </thead>
                        <!--Se recorre el listado para mostrarlo en la tabla -->
                        <tbody>
                            <%            
                            SolicitudVO sv = new SolicitudVO();
                            SolicitudDAO sd = new SolicitudDAO();
                            
                            
                            ArrayList<SolicitudVO> lista = sd.listar();
                            for(int i = 0;i < lista.size();i++){
                                sv = lista.get(i);
                            %>
                            <tr style="border: 1px solid;">

                                <th ><%=sv.getIdSolicitud()%></td>
                                <td><%=sv.getNombre()%></td>

                                <td><%=sv.getNombreServicio()%></td>
                                <td><%=sv.getNombreEstado()%></td>
                                <td><%=sv.getFechaCreacion()%></td>
                                <td><%=sv.getFechaRecoleccion()%></td>
                                <td><%=sv.getFechaEntrega()%></td>
                                <td><%=sv.gethInicioIni()%>  <%=sv.gethInicioFin()%></td>
                                <td><%=sv.gethEntregaIni()%>  <%=sv.gethEntregaFin()%></td>
                                <td><%=sv.getDescripcion()%></td>
                                <td>

                                    <form action="servletSolicitud" method="POST">
                                        <input type="hidden" name="opcion" value="8">
                                        <input type="hidden" name="idSolicitud" value="<%=sv.getIdSolicitud()%>">
                                        <input type="submit" name="CANCELAR" value="CANCELAR" >   
                                    </form>

                                    <form method="POST" action="servletDetalle">
                                        <input type="hidden" name="opcion" value="2">
                                        <input type="hidden" name="idSolicitud" value="<%=sv.getIdSolicitud()%>">
                                        <input type="submit" value="Mas">

                                    </form>

                                </td>
                                <td><form method="POST" action="servletRecibo">
                                        <input type="hidden" name="opcion" value="1">
                                        <input type="hidden" name="idSolicitud" value="<%=sv.getIdSolicitud()%>">
                                        <input type="submit" value="RECIBO">

                                    </form></td>
                            </tr>
                            <%

                                    } // cierre while    
                              
                            %>

                        </tbody>
                    </table>

                </div>
                </div>
                </div>
                </div>
                </div>
                </div>
                <!-- </form>-->

                
     
        <%@include file="../templates/footer.jsp" %> 
    </body>
</html>
