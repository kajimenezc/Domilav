<%@page import="java.util.ArrayList"%>
<%@page import="modeloVO.ComentarioVO"%>
<%@page import="modeloDAO.ComentarioDAO"%>
<%@page import="modeloVO.PersonaVO"%>
<%@page import="modeloDAO.SolicitudDAO"%>
<%@page import="modeloVO.SolicitudVO"%>
<%@page import="java.util.Iterator"%>
<!DOCTYPE html>
<html >

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Domilav</title>
    </head>

    <body>
        <%@include file="templates/headerCliente.jsp" %>
        <%  /*HttpSession misesion = (HttpSession) request.getSession();
            PersonaVO pv = (PersonaVO) misesion.getAttribute("persona");¨*/
        %>

        <div class="wrapper">
                <div class="alert-success">${mensaje}</div>
            <div class="container-fluid">
                <!-- Page-Title -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-title-box">
                            <div class="btn-group pull-right">
                                <ol class="breadcrumb hide-phone p-0 m-0">
                                    <li class="breadcrumb-item active">Inicio</li>
                                </ol>
                            </div>
                            <h4 class="page-title">Inicio</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title end breadcrumb -->
                
                <div class="row">
                    <div class="col-sm-8">
                        <!-- meta -->
                        <div class="profile-user-box card-box bg-custom">
                            <div class="row">
                                <div class="col-sm-6">
                                    <span class="pull-left mr-3"><img src="img/usuario.png" alt="" class="thumb-lg rounded-circle"></span>
                                    <div class="media-body text-white">
                                        <h4 class="mt-1 mb-1 font-18"><%= pv.getNombres().toUpperCase()%>&nbsp;<%=pv.getApellidos().toUpperCase()%></h4>
                                        <p class="font-13 text-light"> Cliente</p>
                                        <p class="text-light mb-0"><%= pv.getCorreo().toUpperCase()%></p>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="text-right">
                                        <button type="button" class="btn btn-light waves-effect">
                                            <a href="configura.jsp"><i class="mdi mdi-account-settings-variant mr-1"></i> Editar Perfil</a>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-13">
                            <div class="card-box">
                                <h4 class="header-title mb-3">Mis Pedidos</h4>
                                <div class="table-responsive">
                                    <table class="table m-b-0">
                                        <thead>
                                        <tr>
                                            <th>SERVICIO</th>
                                            <th>ESTADO</th>
                                            <th>CREACIÓN</th>
                                            <th>RECOLECCIÓN</th>
                                            <th>ENTREGA</th>
                                            <th>DESCRIPCIÓN</th>
                                            <th></th>
                                            <th></th>
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
                                            <td><%=sv.getNombreServicio()%></td>
                                            <td><%=sv.getNombreEstado()%></td>
                                            <td><%=sv.getFechaCreacion()%></td>
                                            <td id="recoge" value="<%=sv.getFechaRecoleccion()%>"  ><%=sv.getFechaRecoleccion()%></td>
                                            <td><%=sv.getFechaEntrega()%></td>
                                            <td><span class="label label-warning"><%=sv.getDescripcion()%></span></td>
                                        </tr>
                                        <% } // cierre while %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>          
                        <!--/ meta -->
                    </div>
                    <div class="col-sm-4">
                        <div class="card-box">
                            <h4 class="header-title m-t-0">Calendario</h4>
                            <p class="text-muted font-14 m-b-25">
                                Puede utilizar el calendario como guía para realizar su solicitud.
                            </p>
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="p-20">
                                        <div class="center-block" style="margin: 10px auto">
                                            <div id="datepicker-inline" class=""></div>
                                        </div><!-- input-group -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card-box">
                            <h4 class="m-t-0 header-title">Comentarios</h4>
                            <p class="text-muted m-b-30 font-14">
                                Ingrese los Comentarios:
                            </p>
                            <div class="row">
                                <div class="col-12">
                                    <div class="p-20">
                                        <form class="form-horizontal" role="form" action="servletComentario" method="POST">
                                            <input type="hidden" id="opcion" name="opcion" value="3">
                                            <div class="form-group row">
                                                <textarea class="form-control" rows="5" id="comentario" name="comentario"></textarea>
                                            </div>
                                            <div class="form-group mb-0 justify-content-end row">
                                                <div class="col-1">
                                                    <button type="submit" class="btn btn-info waves-effect waves-light">Enviar</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                                <!-- end row -->
                        </div> <!-- end card-box -->
                    </div><!-- end col -->
                </div>
                <!-- end row -->
            </div> <!-- end container -->
            <div class="row">
                    <div class="col-12">
                        <div class="">
                            <div class="timeline">
                                <article class="timeline-item alt">
                                    <div class="text-right">
                                        <div class="time-show first">
                                            <a href="#" class="btn btn-custom w-lg">Comentarioa Registrados</a>
                                        </div>
                                    </div>
                                </article>
                                <%
                                     ComentarioDAO commDAO = new ComentarioDAO();
                                     ComentarioVO comVO = new ComentarioVO();

                                     ArrayList<ComentarioVO> comm = commDAO.consultaComentarios(pv.getIdPersona());
                                     for (int i = 0; i < comm.size(); i++) {
                                         comVO = comm.get(i);
                                 %>
                                 <% if(i%2==0){ %>
                                    <article class="timeline-item alt">
                                <% } else { %>
                                    <article class="timeline-item">
                                <% } %>
                                    <div class="timeline-desk">
                                        <div class="panel">
                                            <div class="timeline-box">
                                                <span class="arrow-alt"></span>
                                                <span class="timeline-icon bg-custom"><i class="mdi mdi-adjust"></i></span>
                                                <h4 class="text-custom"><%=comVO.getFecha()%></h4>
                                                <p class="timeline-date text-muted"><small><%=comVO.getIdComentario() %></small></p>
                                                <p><%=comVO.getDescripcion()%> </p>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                   <% }
                   %>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
        
        <%@include file="templates/footerCliente.jsp" %>

    </body>

</html>
