<%-- 
    Document   : listarAgencia
    Created on : 30/11/2017, 05:56:54 PM
    Author     : kev_i
--%>

<%@page import="modeloVO.PersonaVO"%>
<%@page import="modeloVO.TipoServicioVO"%>
<%@page import="modeloVO.AgenciaVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SERVICIOS</title>
        <link rel="shortcut icon" href="img/favicon.png"/> 
        <link rel="stylesheet" href="plugins/magnific-popup/css/magnific-popup.css"/>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/style.css" rel="stylesheet" type="text/css" />

        <script src="assets/js/modernizr.min.js"></script>
    </head>
    <body>      
       
        <%@include file="../templates/headerCliente.jsp" %>
        <%
            ArrayList servicio = (ArrayList) request.getAttribute("servicio");
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
                                    <li class="breadcrumb-item active">Servicios</li>
                                </ol>
                            </div>
                            <h4 class="page-title">Galeria de Servicios</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title end breadcrumb -->

                <div class="port">
                    <div class="portfolioContainer">
                        
                        <%
                            if (servicio != null) {
                                for(int i = 0; i < servicio.size(); i++){
                                    TipoServicioVO tipoServicioVO = (TipoServicioVO) servicio.get(i);
                        %>
                        <div class="col-sm-6 col-md-4 illustrator photography graphicdesign">
                            <a href="data:image/png;base64,<%=tipoServicioVO.getImagen()%>" class="image-popup">
                                <div class="portfolio-masonry-box">
                                    <div class="portfolio-masonry-img">
                                        <img src="data:image/png;base64,<%=tipoServicioVO.getImagen()%>" class="thumb-img img-fluid" alt="work-thumbnail">
                                    </div>
                                    <div class="portfolio-masonry-detail">
                                        <h4 class="font-18"><%=tipoServicioVO.getNombre()%></h4>
                                        <p>$ <%=tipoServicioVO.getPrecio()%></p>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <%
                                } // cierre while    
                            } // cierre if
                        %>

                    </div>
                </div> <!-- End row -->

            </div> <!-- end container -->
        </div> 
 
        <script type="text/javascript">
            $(window).on('load', function () {
                var $container = $('.portfolioContainer');
                $container.isotope({
                    filter: '*',
                    animationOptions: {
                        duration: 750,
                        easing: 'linear',
                        queue: false
                    }
                });

                $('.portfolioFilter a').click(function(){
                    $('.portfolioFilter .current').removeClass('current');
                    $(this).addClass('current');

                    var selector = $(this).attr('data-filter');
                    $container.isotope({
                        filter: selector,
                        animationOptions: {
                            duration: 750,
                            easing: 'linear',
                            queue: false
                        }
                    });
                    return false;
                });
            });
            $(document).ready(function() {
                $('.image-popup').magnificPopup({
                    type: 'image',
                    closeOnContentClick: true,
                    mainClass: 'mfp-fade',
                    gallery: {
                        enabled: true,
                        navigateByImgClick: true,
                        preload: [0,1] // Will preload 0 - before current, and 1 after the current image
                    }
                });
            });
        </script>        
   <%@include file="../templates/footerCliente.jsp" %>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/waves.js"></script>
    <script src="assets/js/jquery.slimscroll.js"></script>

    <script type="text/javascript" src="plugins/isotope/js/isotope.pkgd.min.js"></script>
    <script type="text/javascript" src="plugins/magnific-popup/js/jquery.magnific-popup.min.js"></script>

    <!-- App js -->
    <script src="assets/js/jquery.core.js"></script>
    <script src="assets/js/jquery.app.js"></script>

    <script type="text/javascript">
        $(window).on('load', function () {
            var $container = $('.portfolioContainer');
            $container.isotope({
                filter: '*',
                animationOptions: {
                    duration: 750,
                    easing: 'linear',
                    queue: false
                }
            });

            $('.portfolioFilter a').click(function(){
                $('.portfolioFilter .current').removeClass('current');
                $(this).addClass('current');

                var selector = $(this).attr('data-filter');
                $container.isotope({
                    filter: selector,
                    animationOptions: {
                        duration: 750,
                        easing: 'linear',
                        queue: false
                    }
                });
                return false;
            });
        });
        $(document).ready(function() {
            $('.image-popup').magnificPopup({
                type: 'image',
                closeOnContentClick: true,
                mainClass: 'mfp-fade',
                gallery: {
                    enabled: true,
                    navigateByImgClick: true,
                    preload: [0,1] // Will preload 0 - before current, and 1 after the current image
                }
            });
        });
    </script>
   
</body>

</html>