<%-- 
    Document   : estadoSolicitud
    Created on : 14/04/2018, 12:16:37 PM
    Author     : Kevin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.SolicitudDAO"%>
<%@page import="modeloVO.SolicitudVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.11/css/jquery.dataTables.css">

          <link rel="shortcut icon" href="img/favicon.png"/> 
    </head>
    <body>
     <%@include file="../templates/header.jsp" %>
     
     
     <% SolicitudVO sv = new SolicitudVO();
                    SolicitudDAO sd = new SolicitudDAO();

                  %>
          
 <div class="content">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">      

          <div class="card-box">

               
      
                <div class="alert-success"> ${mensaje}</div>
                <br>
                <br>
                <div class="card-box">
                <div class="table-responsive">

                    <table id="my"  class="table table-striped datatable no-footer" aria-describedby="datatable_info" >
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
                                                <% if (sv.getEstadoSolicitud() != 2) {%>
                                            <th ></th>
                                                <%}%>
                                            <th ></th>

                                        </tr>
                                    </thead>
                                    <!--Se recorre el listado para mostrarlo en la tabla -->
                                    <tbody>
                                        <%
                                            ArrayList<SolicitudVO> lista = sd.listar();
                                            for (int i = 0; i < lista.size(); i++) {
                                                sv = lista.get(i);
                                        %>
                                        <tr>

                                            <td ><%=sv.getIdSolicitud()%></td>
                                            <td><%=sv.getNombre()%></td>

                                            <td><%=sv.getNombreServicio()%></td>
                                            <td><%=sv.getNombreEstado()%></td>
                                            <td><%=sv.getFechaCreacion()%></td>
                                            <td><%=sv.getFechaRecoleccion()%></td>
                                            <td><%=sv.getFechaEntrega()%></td>
                                            <td ><%=sv.gethInicioIni()%>  <%=sv.gethInicioFin()%></td>
                                            <td><%=sv.gethEntregaIni()%>  <%=sv.gethEntregaFin()%></td>
                                            <td><%=sv.getDescripcion()%></td>

                                            <td><form method="POST" action="servletRecibo" id="<%="formDel" + sv.getIdSolicitud()%>">
                                                    <input type="hidden" name="opcion" value="1">
                                                    <input type="hidden" name="idSolicitud" value="<%=sv.getIdSolicitud()%>">
                                                    <a class="sendDel" data="<%=sv.getIdSolicitud()%>" href="#"><i class="fa  fa-fw fa-file"></i></a> 


                                                </form></td>
                                                <% if (sv.getEstadoSolicitud() == 1 || sv.getEstadoSolicitud() == 3) {%>
                                            <td>

                                                <!-- <form action="servletSolicitud" method="POST">
                                                     <input type="hidden" name="opcion" value="8">
                                                     <input type="hidden" name="change" value="2">
                                                     <input type="hidden" name="idSolicitud" value="">
                                                     <input type="submit"  class="btn btn-danger"  value="DESABILITAR" >   
                                                 </form>
             
                                               
                                                      <form action="servletSolicitud" method="POST">
                                                     <input type="hidden" name="opcion" value="8">
                                                     <input type="hidden" name="change" value="3">
                                                     <input type="hidden" name="idSolicitud" value="">
                                                     <input type="submit"  class="btn btn-info"  value="ENTREGADO" >   
                                                 </form>-->

                                                <form method="POST" action="servletDetalle" id="<%="formEnt" + sv.getIdSolicitud()%>">
                                                    <input type="hidden" name="opcion" value="2">
                                                    <input type="hidden" name="idSolicitud" value="<%=sv.getIdSolicitud()%>">
                                                    <a class="sendEnt badge badge-secondary" data="<%=sv.getIdSolicitud()%>" href="#"><i class="icon-settings"></i></a> 


                                                </form>

                                            </td>
                                            <%} else if (sv.getEstadoSolicitud() == 2) {%>
                                            <td>
                                                <!--<form action="servletSolicitud" method="POST">
                                                       <input type="hidden" name="opcion" value="8">
                                                       <input type="hidden" name="change" value="1">
                                                       <input type="hidden" name="idSolicitud" value="">
                                                       <input type="submit"  class="btn btn-info"  value="HABILITAR" >   
                                                   </form>-->

                                            </td>
                                            <%}%>



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
                <!-- </form>-->


            </div>
            </div>
            </div>
     


        <%@include file="../templates/footer.jsp" %>
     
    </body>
</html>
