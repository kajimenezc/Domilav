<%-- 
    Document   : headerCliente
    Created on : 5/03/2018, 04:06:38 PM
    Author     : Kevin
--%>

<%@page import="modeloVO.PersonaVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Domilav</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!-- App css -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/style.css" rel="stylesheet" type="text/css" />
        
        <!-- Datepicker css -->
        <link href="plugins/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
        <link href="plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
        <link href="plugins/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">
        <link href="plugins/clockpicker/css/bootstrap-clockpicker.min.css" rel="stylesheet">
        <link href="plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
        
        <link rel="stylesheet" href="plugins/magnific-popup/css/magnific-popup.css"/>

        <script src="assets/js/modernizr.min.js"></script>

    </head>

    <body>
        
        <%  HttpSession misesion = (HttpSession) request.getSession();
            PersonaVO pv = (PersonaVO) misesion.getAttribute("persona");
        %>

        <!-- Navigation Bar-->
        <header id="topnav">
            <div class="topbar-main">
                <div class="container-fluid">
                    <!-- Logo container-->
                    <div class="logo">
                        <a href="index.html" class="logo">
                            <img src="img/favicon.png" alt="" height="22" class="logo-large"> DOMILAV
                        </a>
                    </div>
                    <!-- End Logo container-->
                    <div class="menu-extras topbar-custom">
                        <ul class="list-unstyled topbar-right-menu float-right mb-0">
                            <li class="menu-item">
                                <!-- Mobile menu toggle-->
                                <a class="navbar-toggle nav-link">
                                    <div class="lines">
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                    </div>
                                </a>
                                <!-- End mobile menu toggle-->
                            </li>
                            <li class="dropdown notification-list">
                                <a class="nav-link dropdown-toggle waves-effect nav-user" data-toggle="dropdown" href="#" role="button"
                                   aria-haspopup="false" aria-expanded="false">
                                    <img src="img/usuario.png" alt="user" class="rounded-circle"> <span class="ml-1 pro-user-name"><%= pv.getNombres().toUpperCase()%>&nbsp;<%=pv.getApellidos().toUpperCase()%><i class="mdi mdi-chevron-down"></i> </span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
                                    <!-- item-->
                                    <div class="dropdown-item noti-title">
                                        <h6 class="text-overflow m-0">Bienvenido !</h6>
                                    </div>

                                    <!-- item-->
                                    <a href="configura.jsp" class="dropdown-item notify-item">
                                        <i class="fi-cog"></i> <span>Configuración</span>
                                    </a>

                                    <!-- item-->
                                    <a href="#" onclick="sSolicitudMisPedidos.submit();
                                        return false;" class="dropdown-item notify-item">
                                        <i class="fi-help"></i> <span>Mis Pedidos</span>
                                    </a>

                                    <!-- item-->
                                    <a href="#" onclick="loginS.submit();
                                        return false;" class="dropdown-item notify-item">
                                        <i class="fi-power"></i> <span>Cerrar Sesión</span>
                                    </a>

                                </div>
                            </li>
                        </ul>
                    </div>
                    <!-- end menu-extras -->

                    <div class="clearfix"></div>

                </div> <!-- end container -->
            </div>
            <!-- end topbar-main -->

            <div class="navbar-custom">
                <div class="container-fluid">
                    <div id="navigation">
                        <!-- Navigation Menu-->
                        <ul class="navigation-menu">

                            <li class="has-submenu">
                                <a href="indexCliente.jsp"><i class="icon-speedometer"></i>Inicio</a>
                            </li>

                            <li class="has-submenu">
                                <a href="#" onclick="sMostrarServ.submit();
                                    return false;"><i class="icon-layers"> </i> Servicios </a>
                            </li>

                            <li class="has-submenu">
                                 <a href="#" onclick="sSolicitud.submit(); return false;"><i class="icon-briefcase"></i> Registrar Solicitud </a>
                              
                            </li>

                        </ul>
                        <!-- End navigation menu -->
                    </div> <!-- end #navigation -->
                </div> <!-- end container -->
            </div> <!-- end navbar-custom -->
        </header>
        <!-- End Navigation Bar-->
        <form action="servletMostrarServicios" method="POST" name="sMostrarServ">
            <input type="hidden" name="opcion" value="1">
        </form>
        <form action="servletSolicitud" method="POST" name="sSolicitud">
            <input type="hidden" name="opcion" value="9">
        </form>
        <form action="servletSolicitud" method="POST" name="sSolicitudMisPedidos">
            <input type="hidden" name="opcion" value="3">
        </form>
        <form action="loginServlet" method="POST" name="loginS" > 
            <input type="hidden" name="opcion" value="3">
        </form>
    </body>
</html>
