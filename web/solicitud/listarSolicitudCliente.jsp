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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.11/css/jquery.dataTables.css">
        
        
        <script>

           /*var date = new Date();
            var fecha = date.getYear()."-".date.getMonth()."-".date.getDay();
                    $(function () {
                        $('#cancelar').click()(function () {
                          if($('#recoge').val().eq(fecha)){
                          alert('No se puede cancelar el mmismo dia.');
                          
                          }else{
                          $('#cancelar').submit();
                            }
                    });
                });
*/
        </script>


    </head>
    <body>
        <%@include file="../templates/headerCliente.jsp" %> 

        <%   /*HttpSession misesion = (HttpSession) request.getSession();
            PersonaVO pv = (PersonaVO) misesion.getAttribute("persona");*/%>
        <br>
        <% String mensaje = (String) request.getAttribute("mensaje");
            if (mensaje != null) {%>
            <script>
                alert("<%=mensaje%>");
            </script>

        <%
            }
        %>
                
        <div class="wrapper">
            <div class="container-fluid">

                <!-- Page-Title -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-title-box">
                            <div class="btn-group pull-right">
                                <ol class="breadcrumb hide-phone p-0 m-0">
                                    <li class="breadcrumb-item"><a href="indexCliente.jsp">Inicio</a></li>
                                    <li class="breadcrumb-item active">Mis Pedidos</li>
                                </ol>
                            </div>
                            <h4 class="page-title">Mis Pedidos</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title end breadcrumb -->
                <div class="row">
                    <div class="col-12">
                        <div class="card-box table-responsive">
                            <h4 class="m-t-0 header-title">Pedidos Realizados</h4>
                            <p class="text-muted font-14 m-b-30">
                                Listado de los pedidos realizados:
                            </p>

                            <table id="datatable" class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Cliente</th>
                                    <th>Servicio</th>
                                    <th>Estado</th>
                                    <th>Creación</th>
                                    <th>Recolección</th>
                                    <th>Entrega</th>
                                    <th id="rango">Rango de Recolección</th>
                                    <th>Rango de Entrega</th>
                                    <th>Descripción</th>
                                    <th>Recibo</th>
                                    <th>Cancelar</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    SolicitudVO sv = new SolicitudVO();
                                    SolicitudDAO sd = new SolicitudDAO();

                                    ArrayList<SolicitudVO> lista = sd.solicitudCliente(pv.getIdPersona());
                                    for (int i = 0; i < lista.size(); i++) {
                                        sv = lista.get(i);
                                %>
                                <tr>
                                    <td ><%=sv.getIdSolicitud()%></td>
                                    <td><%=sv.getNombre()%></td>
                                    <td><%=sv.getNombreServicio()%></td>
                                    <td><%=sv.getNombreEstado()%></td>
                                    <td><%=sv.getFechaCreacion()%></td>
                                    <td id="recoge" value="<%=sv.getFechaRecoleccion()%>"  ><%=sv.getFechaRecoleccion()%></td>
                                    <td><%=sv.getFechaEntrega()%></td>
                                    <td><%=sv.gethInicioIni()%>  <%=sv.gethInicioFin()%></td>
                                    <td><%=sv.gethEntregaIni()%>  <%=sv.gethEntregaFin()%></td>
                                    <td><%=sv.getDescripcion()%></td>
                                    <td>
                                        <form method="POST" action="servletRecibo">
                                            <input type="hidden" name="opcion" value="2">
                                            <input type="hidden" name="idSolicitud" value="<%=sv.getIdSolicitud()%>">
                                            <input type="submit" class="btn btn-success" value="RECIBO">
                                        </form>
                                    </td>
                                    <td>
                                    <%if (sv.getEstadoSolicitud() == 1) {%>
                                        <form action="servletSolcitudCliente" method="POST">
                                            <input type="hidden" name="opcion" value="2">
                                            <input type="hidden" name="change" value="2">
                                            <input type="hidden" name="fecha" value="<%=sv.getFechaRecoleccion() %>">
                                            <input type="hidden" name="idSolicitud" value="<%=sv.getIdSolicitud()%>">
                                            <input type="submit" id="cancelar"  class="btn btn-danger"  value="Cancelar" >   
                                        </form>
                                    <% }%>
                                    </td>
                                </tr>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div> <!-- end row -->
            </div>
        </div>

        <%@include file="../templates/footerCliente.jsp" %> 

        <!-- Required datatable js -->
        <script src="plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="plugins/datatables/dataTables.bootstrap4.min.js"></script>
        
        <script type="text/javascript">
            $(document).ready(function() {

                // Default Datatable
                $('#datatable').DataTable();

                //Buttons examples
                var table = $('#datatable-buttons').DataTable({
                    lengthChange: false,
                    buttons: ['copy', 'excel', 'pdf']
                });

                // Key Tables

                $('#key-table').DataTable({
                    keys: true
                });

                // Responsive Datatable
                $('#responsive-datatable').DataTable();

                // Multi Selection Datatable
                $('#selection-datatable').DataTable({
                    select: {
                        style: 'multi'
                    }
                });

                table.buttons().container()
                        .appendTo('#datatable-buttons_wrapper .col-md-6:eq(0)');
            } );

        </script>
    </body>
</html>
