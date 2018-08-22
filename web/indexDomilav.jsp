<%-- 
    Document   : index
    Created on : 30/11/2017, 05:16:01 PM
    Author     : kev_i
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
        <title>PERMATEX</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.11/css/jquery.dataTables.css">

        <link rel="shortcut icon" href="img/favicon.png"/> 
    </head>
    <body>


        <%@include file="templates/header.jsp" %>

        <div class="content">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">
                        <br>
                        <div class="card-box">
                            <br>







                            <% SolicitudVO sv = new SolicitudVO();
                                SolicitudDAO sd = new SolicitudDAO();

                                if (pv.getRol() != 3) {%>


                            <div class="row">
                                <div class="col-lg-6">

                                    <h4 class="header-title">EMPLEADOS</h4>

                                    <div class="combine-chart">
                                        <form action="servletEmpleado" method="POST">
                                            <input type="hidden" name="opcion" value="1">
                                            <input type="submit" class="btn-custom w-lg btn-lg" name="persona" value="GESTION EMPLEADO">
                                        </form>


                                    </div>
                                </div>

                                <div class="col-lg-6">

                                    <h4 class="header-title">CLIENTES</h4>

                                    <div id="combine-chart">
                                        <form action="servletCliente" method="POST">
                                            <input type="hidden" name="opcion" value="3">
                                            <input type="submit" class="btn-custom w-lg btn-lg" name="persona" value="LISTAR CLIENTES">
                                        </form>
                                    </div>


                                </div>
                            </div>
                            <!-- end row -->    
                            <%} else {%>

                            <form action="servletCliente" method="POST">
                                <input type="hidden" name="opcion" value="3">
                                <input type="submit" class="btn-custom w-lg btn-lg" name="persona" value="LISTAR CLIENTES">
                            </form>


                            <% }%>
                            <br>




                            <br>

                            <div class="alert-success"> ${mensaje}</div>



                            <br>
                            <div class="table-responsive">
                                <table id="my" class="table table-striped datatable no-footer" aria-describedby="datatable_info"  >
                                    <thead >
                                        <tr>
                                            <th >ID</th>
                                            <th >CLIENTE</th>

                                            <th>SERVICIO</th>
                                            <th >ESTADO</th>
                                            <!--<th >CREACIÓN</th>-->
                                            <th >RECOLECCIÓN</th>
                                            <th >HORA</th>
                                            <th >ENTREGA</th>
                                            <th >HORA</th>
                                            <th >DESCRIPCIÓN</th>

                                            <th ></th>

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
                                            <!--<td>sv.getFechaCreacion()</td>-->
                                            <td ><%=sv.getFechaRecoleccion()%></td>
                                            <td><%=sv.gethInicioIni()%>  <%=sv.gethInicioFin()%></td>
                                            <td><%=sv.getFechaEntrega()%></td>
                                            <td><%=sv.gethEntregaIni()%>  <%=sv.gethEntregaFin()%></td>
                                            <td><%=sv.getDescripcion()%></td>

                                            <% if (sv.getEstadoSolicitud() == 1 || sv.getEstadoSolicitud() == 3) {%>
                                            
                                            <td>
                                                <!-- entregado -->
                                                <form action="servletSolicitud" method="POST"  id="<%="formEnt" + sv.getIdSolicitud()%>">
                                                    <input type="hidden" name="opcion" value="8">
                                                    <input type="hidden" name="change" value="3">
                                                    <input type="hidden" name="idSolicitud" value="<%=sv.getIdSolicitud()%>">
                                                    <a  class="sendEnt" data="<%=sv.getIdSolicitud()%>" href="#"><i class="fa  fa-check"></i></a> 
                                                </form>



                                            </td>
                                            
                                            
                                            <% // if(pv.getRol() != 3 ){  %>
                                            <td>
                                                <!-- desabilitar -->
                                                <form action="servletSolicitud" method="POST"  id="<%="formDel" + sv.getIdSolicitud()%>">
                                                    <input type="hidden" name="opcion" value="8">
                                                    <input type="hidden" name="change" value="2">
                                                    <input type="hidden" name="idSolicitud" value="<%=sv.getIdSolicitud()%>">
                                                    <a id="cancelar" class="sendDel" data="<%=sv.getIdSolicitud()%>" href="#">eliminar</a>   

                                                </form>
                                            </td>
                                            
                                            
                                            <% //} %>
                                            
                     
                                            <%} else if (sv.getEstadoSolicitud() == 2) {%>
                                            
                                                               <% // if(pv.getRol() != 3 ){  %>
                                            <td>
                                                <!-- habilitar -->
                                                <form action="servletSolicitud" method="POST"  id="<%="form" + sv.getIdSolicitud()%>">
                                                    <input type="hidden" name="opcion" value="8">
                                                    <input type="hidden" name="change" value="1">
                                                    <input type="hidden" name="idSolicitud" value="<%=sv.getIdSolicitud()%>">
                                                    <a  class="send" data="<%=sv.getIdSolicitud()%>" href="#"><i class="fa  fa-fw fa-eye"></i></a> 
                                                </form>

                                            </td>
                                            
                                            <%// }%>
                                            <td></td>
                                            <%}%>



                                        </tr>
                                        <%

                                            } // cierre while    

                                        %>

                                    </tbody>
                                </table>


                            </div>
                            <!-- </form>-->


                        </div>
                    </div>

                </div>
            </div>
        </div>


        <%@include file="templates/footer.jsp" %>

        <script>



            $("#cancelar").click(function () {

                var date = new Date();
                var anio = date.getFullYear();
                var mes = date.getMonth() + 1;
                var dia = date.getDate();
                if (dia > 0 & dia < 10) {
                    dia = "0" + dia;
                }
                if (mes > 0 & mes < 10) {
                    mes = "0" + mes;
                }

                var fullfecha = anio + "-" + mes + "-" + dia;

                alert("fecha " + fullfecha);

                if (fullfecha === <%=sv.getFechaRecoleccion()%>) {
                    confirm("No se puede cancelar la solicitud.");

                } else {
                    confirm("Esta seguro de cancelar la solicitud.");
                }


            });



        </script>


    </body >




</html>
