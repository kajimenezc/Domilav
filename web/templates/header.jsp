<%-- 
    Document   : header
    Created on : 4/12/2017, 04:42:48 PM
    Author     : kev_i
--%>

<%@page import="modeloVO.PersonaVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PERMATEX</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />


        <script src="javaScript/jquery-3.3.1.min.js" type="text/javascript"></script>

        <!-- App css -->
        <link href="recursos/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="recursos/assets/css/icons.css" rel="stylesheet" type="text/css"/>
        <link href="recursos/assets/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="recursos/assets/css/metismenu.min.css" rel="stylesheet" type="text/css"/>
        <script src="recursos/assets/js/modernizr.min.js"></script>


        <link rel="shortcut icon" href="img/favicon.png"/> 


        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

        <script>

            $(document).ready(function () {
              
                $.noConflict();
                var table = $('#my').DataTable();
                //  $('#my').DataTable();
            });
        </script> 

        <script>
            $(document).ready(function () {
                $('.send').click(function () {

                    id = $(this).attr("data");
                    //alert( i d);
                    $('#form' + id).submit();
                });

            });
            $(document).ready(function () {
                $('.sendDel').click(function () {

                    id = $(this).attr("data");
                    //alert(id);
                    $('#formDel' + id).submit();
                });

            });
            $(document).ready(function () {
                $('.sendEnt').click(function () {

                    id = $(this).attr("data");
                    //a lert(id);
                    $('#formEnt' + id).submit();
                });

            });
            $(document).ready(function () {
                $('.sendDeb').click(function () {

                    id = $(this).attr("data");
                    //alert(id);
                    $('#formDeb' + id).submit();
                });

            });



        </script> 

    </head>
    <body >
        <% HttpSession misesion = (HttpSession) request.getSession();
            PersonaVO pv = (PersonaVO) misesion.getAttribute("persona");
        %>


        <!-- Begin page -->
        <div id="wrapper">

            <!-- ========== Left Sidebar Start ========== -->
            <div class="left side-menu">

                <div class="slimscroll-menu" id="remove-scroll">

                    <!-- LOGO -->
                    <div class="topbar-left">
                        <a href="index.html" class="logo">
                            <span>
                                <img src="img/logoAdmin.jpg" alt="" height="45">
                            </span>
                            <i>
                                <img src="img/logo.jpg" alt="" height="30">
                            </i>
                        </a>
                    </div>
                    <%
                        String nombre = pv.getNombres();
                        String apellido = pv.getApellidos();
                        String nomRol = pv.getNombreRol();
                    %>

                    <div class="user-box">
                        <div class="user-img">
                            <img src="img/usuario.png" width="60" height="60" alt="imagen" > 
                        </div>
                        <%if (apellido != null) {%>

                        <h5 ><%= nombre.toUpperCase()%>&nbsp;<%=apellido.toUpperCase()%></h5>

                        <%} else {%>

                        <h1><%= nombre.toUpperCase()%></h1>
                        <%}%>
                        <p class="text-muted"><%=nomRol.toUpperCase()%></p>

                    </div>


                    <!--- Sidemenu -->
                    <div id="sidebar-menu">

                        <ul class="metismenu" id="side-menu">

                            <!--<li class="menu-title">Navigation</li>-->


                            <li>
                                <a href="indexDomilav.jsp">
                                    <i class="icon-home"></i> <span> INICIO </span>
                                </a>
                            </li>

                            <li>
                                <a href="javascript: void(0);"><i class="mdi mdi-calendar"></i> <span> Solicitudes </span> <span class="menu-arrow"></span></a>
                                <ul class="nav-second-level" aria-expanded="false">
                                    <li>
                                        <form action="servletSolcitudCliente" method="POST">
                                            <input type="hidden" name="opcion" value="4">
                                            <a> <input type="submit" value="Detalles" class="dropdown-item notify-item"></a>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="servletSolcitudCliente" method="POST">
                                            <input type="hidden" name="opcion" value="3">
                                            <a><input type="submit" value="Registro " class="dropdown-item notify-item"></a>
                                        </form>
                                    </li>

                                </ul>
                            </li>


                            <%if (pv.getRol() == 2) {%>


                            <li>
                                <a href="javascript: void(0);"><i class="mdi mdi-account-settings-variant"></i> <span> Usuarios </span> <span class="menu-arrow"></span></a>
                                <ul class="nav-second-level" aria-expanded="false">
                                    
                                    <li>
                                        <form action="servletEmpleado" method="POST">
                                            <input type="hidden" name="opcion" value="1">
                                            <input type="submit" class="dropdown-item notify-item" name="persona" value="   Empleados">
                                        </form>
                                    </li>
                                    <li>
                                        <form action="servletCliente" method="POST">
                                            <input type="hidden" name="opcion" value="3">
                                            <input type="submit" class="dropdown-item notify-item" name="persona" value="Clientes">
                                        </form>
                                    </li>

                                </ul>
                            </li>


                            <li>
                                <a href="javascript: void(0);"><i class="mdi mdi-library-books"></i> <span>Datos </span> <span class="menu-arrow"></span></a>
                                <ul class="nav-second-level" aria-expanded="false">
                                    <li>
                                        <form action="servletAgencia" method="POST">
                                            <input type="hidden" name="opcion" value="1">

                                            <input  type="submit" name="agencia" class="dropdown-item notify-item" value="Agencias" >

                                        </form>
                                    </li>  
                                    <li>
                                        <form action="servletTipoDoc" method="POST">
                                            <input type="hidden" name="opcion" value="1">
                                            <input type="submit" name="tipoDoc" class="dropdown-item notify-item" value="Documentos">
                                        </form>

                                    </li> 
                                    <li>
                                        <form action="servletBarrio" method="POST">
                                            <input type="hidden" name="opcion" value="1">
                                            <input type="submit" name="barrio" class="dropdown-item notify-item" value="Barrios">
                                        </form>
                                    </li>


                                </ul>
                            </li>

                            <%}%>




                            <li>
                                <a href="javascript: void(0);"><i class="mdi mdi-airplay"></i> <span>Empresa </span> <span class="menu-arrow"></span></a>
                                <ul class="nav-second-level" aria-expanded="false">


                                    <li>
                                        <form action="servletTipoPren" method="POST">
                                            <input type="hidden" name="opcion" value="1">
                                            <input type="submit" name="Prendas" class="dropdown-item notify-item"  value="   Prendas">
                                        </form>
                                    </li>
                                    <li>
                                        <form action="servletTipoServ" method="POST">
                                            <input type="hidden" name="opcion" value="1" >
                                            <input type="submit"  class="dropdown-item notify-item" value="Servicios">
                                        </form>
                                    </li>


                                </ul>
                            </li>
























                        </ul>

                    </div>
                    <!-- Sidebar -->

                    <div class="clearfix"></div>

                </div>
                <!-- Sidebar -left -->

            </div>
            <!-- Left Sidebar End -->



            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->

            <div class="content-page">

                <!-- Top Bar Start -->
                <div class="topbar">

                    <nav class="navbar-custom">

                        <ul class="list-unstyled topbar-right-menu float-right mb-0">







                            <li class="dropdown notification-list">
                                <a class="nav-link dropdown-toggle nav-user" data-toggle="dropdown" href="#" role="button"
                                   aria-haspopup="false" aria-expanded="false">
                                    <i  alt="user" class="mdi mdi-account rounded-circle" > <span class="ml-1"><%=  pv.getNombres().toUpperCase() %>  </span></i>

                                </a>
                                <div class="dropdown-menu dropdown-menu-right dropdown-menu-animated profile-dropdown ">
                                    <!-- item-->
                                    <div class="dropdown-item noti-title">
                                        <h6 class="text-overflow m-0">BIENVENIDO !</h6>
                                    </div>

                                    <!-- item-->
                                    <form action="servletEmpleado" method="POST">
                                        <input type="hidden" name="opcion" value="4">
                                        <input type="submit" name="persona" class="dropdown-item notify-item" value="MI CUENTA">
                                    </form>



                                    <!-- item
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <i class="fi-help"></i> <span>Support</span>
                                    </a>-->



                                    <!-- item-->


                                    <form action="loginServlet" method="POST">
                                        <input type="hidden" name="opcion" value="3">
                                        <!-- <i class="fi-power"></i> -->
                                        <input type="submit" value="CERRAR SESION" class="dropdown-item notify-item">
                                    </form>






                                </div>
                            </li>

                        </ul>

                        <ul class="list-inline menu-left mb-0" >
                            <li class="float-left">
                                <button class="button-menu-mobile open-left disable-btn">
                                    <i class="dripicons-menu"></i>
                                </button>
                            </li>
                            <li>
                                <div class="page-title-box">
                                    <h4 class="page-title"><a href="indexDomilav.jsp" >DOMILAV</a></h4>
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item active">Software para el control de agendamiento</li>
                                    </ol>
                                </div>
                            </li>

                        </ul>

                    </nav>

                </div>
                <!-- Top Bar End -->







                </body>
                </html>
