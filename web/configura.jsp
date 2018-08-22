<%-- 
    Document   : configura
    Created on : 22/03/2018, 08:10:43 PM
    Author     : prueva
--%>

<%@page import="java.util.Date"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="modeloVO.PersonaVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mi cuenta</title>
       <!-- <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="bootstrap/js/jquery-3.2.1.min.js" type="text/javascript"></script>-->
    </head>
    <body>
        <%
            /*HttpSession misesion = (HttpSession) request.getSession();
            PersonaVO pv = (PersonaVO) misesion.getAttribute("persona");*/
        %>
        <%@include file="templates/headerCliente.jsp" %>
        <div class="wrapper">
            <div class="container-fluid">

                <!-- Page-Title -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-title-box">
                            <div class="btn-group pull-right">
                                <ol class="breadcrumb hide-phone p-0 m-0">
                                    <li class="breadcrumb-item"><a href="indexCliente.jsp">Inicio</a></li>
                                    <li class="breadcrumb-item active">Perfil</li>
                                </ol>
                            </div>
                            <h4 class="page-title">Perfil</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title end breadcrumb -->

                <div class="row">
                    <div class="col-sm-12">
                        <% Date fecha = new Date();%>
                        <!-- meta -->
                        <div class="profile-user-box card-box bg-custom">
                            <div class="row">
                                <div class="col-sm-6">
                                    <span class="pull-left mr-3"><img src="img/usuario.png" alt="" class="thumb-lg rounded-circle"></span>
                                    <div class="media-body text-white">
                                        <h4 class="mt-1 mb-1 font-18"><%=pv.getNombres().toUpperCase()%> <%=pv.getApellidos().toUpperCase()%></h4>
                                        <p class="font-13 text-light"><%=pv.getCorreo()%></p>
                                        <p class="text-light mb-0"><%out.println(fecha);%></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/ meta -->
                    </div>
                </div>
                <!-- end row -->
                <div class="row">
                    <div class="col-md-12">
                        <!-- Personal-Information -->
                        <div class="card-box">
                            <h4 class="header-title mt-0 m-b-20">Información Personal</h4>
                            <div class="panel-body">
                                <p class="text-muted font-13">
                                    Cliente
                                </p>
                                <hr/>
                                <div class="text-left">
                                    <p class="text-muted font-13"><strong>Documento: :</strong> <span class="m-l-15"><%=pv.getDocumento()%></span></p>

                                    <p class="text-muted font-13"><strong>Genero :</strong><span class="m-l-15"><%=pv.getGenero()%></span></p>

                                    <p class="text-muted font-13"><strong>Celular :</strong> <span class="m-l-15"><%=pv.getNumCelular()%></span></p>

                                    <p class="text-muted font-13"><strong>Número Fijo :</strong> <span class="m-l-15"><%=pv.getNumFijo()%></span></p>
                                    
                                    <p class="text-muted font-13"><strong>Dirección :</strong> <span class="m-l-15"><%=pv.getDireccion()%></span></p>
                                    
                                    <p class="text-muted font-13"><strong>Correo :</strong> <span class="m-l-15"><%=pv.getCorreo()%></span></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <form action="servletCliente" method="POST" > 
                                        <input type="hidden" name="opcion" value="4">
                                        <button type="submit" class="btn btn-outline-info waves-light waves-effect">Actualizar</button>
                                    </form>
                                </div>
                                <div class="col-md-4">
                                    <form action="servletCliente" method="POST" > 
                                        <input type="hidden" name="opcion" value="8">
                                        <input type="hidden" name="idPersona" id="idPersona" value="<%=pv.getIdPersona()%>" > 
                                        <button type="submit" class="btn btn-outline-info waves-light waves-effect">Eliminar Cuenta</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- Personal-Information -->
                    </div>
                </div>
            </div>
        </div>

        <%@include file="templates/footerCliente.jsp" %>
    </body>
</html>
