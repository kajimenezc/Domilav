<%@page import="modeloDAO.TipoServicioDAO"%>
<%@page import="modeloVO.TipoServicioVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="modeloDAO.ColorDAO"%>
<%@page import="modeloVO.ColorVO"%>
<%@page import="modeloVO.ComentarioVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.ComentarioDAO"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <title>Domilav</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="utf-8">
        <meta name="keywords" content="Immerse a Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <link href="rec_index/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
        <link href="rec_index/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
        <link href="rec_index/css/owl.carousel.css" rel="stylesheet">
        <link rel="stylesheet" href="rec_index/css/lightbox.css">
        <link type="text/css" rel="stylesheet" href="rec_index/css/cm-overlay.css" />
        <link href="rec_index/css/style.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="//fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Sintony:400,700&amp;subset=latin-ext" rel="stylesheet">        
        <link rel="shortcut icon" href="img/favicon.png"/>
    </head>

    <body>

        <%@include file="templates/headerIndex.jsp" %>
        <img src="rec_index/images/lavador.jpg" style="width: 100%;">
        <div class="container">
            <%@include file="templates/mensajes.jsp" %>

            <!-- /features -->
            <div class="about" id="about">
                <div class="features" id="features">
                    <div class="container">
                        <h3>DOMILAV</h3>
                        <div class="tittle_head_w3layouts">
                            <h4>¿Quiénes somos?</h4>

                            <!--<P>Lavanderia ubicada en la localidad de Enngativá. Cuenta con 2 agencias ubicados estrategicamente en los puntos con mas demanda del sector. 
                                <br>Tiene más de 10 años de experiencia tratando con ropa y bla bla bla... </p>
                            -->
                            <P>Somos una empresa colombiana, fabricante de softwares dirigido a compañias dandoles soluciones tecnologicas 
                                para estar a la vanguardia y prestar un mejor servicio a sus clientes.</p>


                        </div>
                        <div class="inner_sec_info_agileits_w3">
                            <!-- <div class="border1"> -->
                            <div class="w3_banup">
                                <div class="col-md-4 w3_ret">
                                    <div class="col-md-10 w3_txt">
                                        <h4>¿Qué es Domilav?</h4>
                                        <p>Es un software que está diseñado para facilitar la labor en las lavanderías, ofreciendo un mejor servicio a sus clientes.</p>
                                    </div>
                                    <div class="col-md-2 w3ls_ic">
                                        <i class="fa fa-comment-o" aria-hidden="true"></i>
                                    </div>

                                    <div class="clearfix"></div>

                                    <div class="col-md-10 w3_txt">

                                        <h4>¿Como funciona?</h4>
                                        <p>Registrate y agenda pedidos las veces que necesites sin cobro alguno por el domicilio desde la comodidad de tu hogar. </p>
                                    </div>
                                    <div class="col-md-2 w3ls_ic">
                                        <i class="fa fa-microphone" aria-hidden="true"></i>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-4 w3l_mid">
                                    <div class="bulb">
                                        <img src="rec_index/images/pic.jpg" alt="" />
                                    </div>
                                </div>
                                <div class="col-md-4 wthree_r">
                                    <div class="col-md-2 w3ls_ic">
                                        <i class="fa fa-street-view" aria-hidden="true"></i>
                                    </div>
                                    <div class="col-md-10 w3_txt">
                                        <h4>¿Cómo implementarlo en tu empresa?</h4>
                                        <p class="move">Contactese con nosotros por medio del numero 000-555-412 o mediante el correo domilavservicio@gmail.com.</p>
                                    </div>-
                                    <div class="clearfix"></div>

                                    <div class="col-md-2 w3ls_icr">
                                        <i class="fa fa-futbol-o" aria-hidden="true"></i>
                                    </div>
                                    <div class="col-md-10 w3_txt">
                                        <h4>¿Cómo nace Domilav?</h4>
                                        <!--<p class="move">Nace debido a la carencia de tiempo que poseen las persoans para poder realizar actividades cotidianas.
                                            En vista a esto, surgió un software que supliera dichas necesidades.</p> -->
                                        <p class="move">Nace como una solucion a la falta de tiempo que tienen las personas para llevar su ropa a las lavanderias.</p>
                                    </div>          

                                    <div class="clearfix"></div>
                                </div>

                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <!-- </div> -->
                    </div>
                </div>
            </div>
        
        <!-- //features -->
        <!-- Order Form-->
        <!-- <div class="w3ls_frmrt" id="booking">
             <div class="container">
                 <h3>Agenda tu pedido</h3>
                 <div class="book-form">
                     

        <br>



        <!--<ul class="nav nav-tabs">
            <li ><a data-toggle="tab" href="#datos"> DATOS </a></li>
            <li class="active"><a data-toggle="tab"> &nbsp</a></li>
            <li class="active"><a data-toggle="tab"> &nbsp</a></li>
            <li class="active"><a data-toggle="tab"> &nbsp</a></li>
            <li><a data-toggle="tab" id="solicitud" href="#solicitud"> SOLICITUD </a></li>

        </ul>-->
        <!--         <form action="servletSolicitud" method="POST" id="formSoli" class="form-horizontal" >
                     <input type="hidden" id="opcion" name="opcion" value="5">
        <!--   <div class="tab-content">-->
        <!--     <div id="datos" >

                 <div >
                     <div style="color: white; font-family: 'Roboto Condensed', sans-serif; font-weight:600;
                          letter-spacing:2px;">DATOS SOLICITUD</div><br>
                     <div >

                         <div class="row">
                             <div class="col-md-6" >
                                 <div class="form-group">
                                     <label for="nombre" class="control-label col-sm-2">Nombre: </label>
                                     <div class="col-sm-10">
                                         <input type="text" class="form-control" id="nombre" name="nombre" placeholder="KEVIN ANDRES" style=""><span id="valNombre"></span>
                                     </div>
                                 </div>
                             </div>
                             <div class="col-md-6" >
                                 <div class="form-group">
                                     <label for="documento" class="control-label col-sm-2">Documento: </label>
                                     <div class="col-sm-10">
                                         <input type="text" class="form-control" id="documento" name="documento" placeholder="123389364"  style="" ><span id="valDoc"></span>
                                         <div id="respDoc" class="alert-danger" ></div>
                                     </div>
                                 </div>
                             </div>
                         </div>
                         <br>

                         <div class="form-group">
                             <label for="direccion" class="control-label col-sm-2">Direccion: </label>
                             <div class="col-sm-10">
                                 <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Cll 133 # 127 - 20" ><span id="valDirec"></span>
                             </div>
                         </div>


                         <div class="row">
                             <div class="col-md-6" >
                                 <div class="form-group">
                                     <label for="correo" class="control-label col-sm-2">Correo: </label>
                                     <div class="col-sm-10">
                                         <input type="text" class="form-control" id="correo" name="correo" placeholder="domilav@gmail.com" ><span id="valcorreo"></span><br>
                                         <br><br><div id="respCorreo" class="alert-danger"></div>
                                     </div>
                                 </div>

                             </div>
                             <div class="col-md-6" >
                                 <div class="form-group">
                                     <label for="tel" class="control-label col-sm-2">Telefono: </label>
                                     <div class="col-sm-10">
                                         <input type="text" class="form-control" id="tel" name="tel" placeholder="3223016500" ><span id="valTel"></span>
                                     </div>
                                 </div>
                             </div>

                         </div> 

        <!-- <li><a data-toggle="tab" href="#solicitud"> SOLICITUD </a></li>
    </div>

    <div id="mensajeVal" class="alert-danger">  </div>



        <!--<div id="solicitud" class="tab-pane fade">

        <br>
        <div style="color: white; font-family: 'Roboto Condensed', sans-serif; font-weight:600;
             letter-spacing:2px;">RECOLECCIÓN</div><br>

         <div class="form-group">
            <label class="control-label col-sm-2" for="servicio">Servicio:</label>
            <div class="col-sm-10">
        <%
            /*  TipoServicioVO ts = new TipoServicioVO();
             TipoServicioDAO td = new TipoServicioDAO();
                                
             ArrayList<TipoServicioVO>  listaServ = td.listarArray();*/

        %>
        <select name="servicio" id ="servicio"  style="height: 40px;" class="form-control" >
        <%                                                        /* for(int i = 0;i < listaServ.size();i++){
             ts = listaServ.get(i);*/
        %>
        <option value="//ts.getIdTipoServicio()%>" >//</option>

        <%                                                           // }

        %>

    </select>
</div>
</div>


        <!-- Solicitud estandar 
        <div id="solicitudStandar" >
            <div class="form-group">
                <label class="control-label col-sm-2" for="recoger">Fecha de recoleccion:</label>
                <div class="col-sm-10">

                    <input type="text" id="recoger" name="recoger"  class="form-control" >
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="entrega">Fecha de entrega:</label>
                <div class="col-sm-10">
                    <input type="text" id="entrega" name="entrega" class="form-control" >
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" >Rango Recoleccion:</label>
                <div class="col-sm-10">

                    <div id="horaIniciar" >

                    </div>

                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" >Rango Entrega:</label>
                <div class="col-sm-10">

                    <div id="horaFin" >

                    </div>

                </div>
            </div>



        </div>
        <!-- Fin solicitud estandar -->

        <!-- solicitud especial 
        <div id="solicitudEspecial" >



            <div class="form-group">
                <label class="control-label col-sm-2" for="color">Color:</label>
                <div class="col-sm-10">

                    <select name="color" id ="color"  style="height: 40px;" class="form-control" >
        <%
        %>
        <option value="" ></option>

        <%
        %>

    </select>
</div>
</div>


</div>
        <!-- fin solicitud especial 


    </div>   



    <div class="form-group">
        <label class="control-label col-sm-2" for="descripcion">Descripción:</label>
        <div class="col-sm-10">

            <textarea id="descripcion" name="descripcion" placeholder="¿Algo que agregar?" class="form-control"></textarea>
        </div>
    </div>
    <input  type="submit" id="confirmar" value="confirmar"   class="form-control">
</div>

</form>

</div>
</div>
</div>
</div>
</div>

        <!-- /Order Form-->
        <!-- Order Form-->
        <div class="w3ls_frmrt" id="booking">
            <div class="container">
                <h3>Agenda tu pedido</h3>
                <div class="book-form">
                    <%                    ArrayList servicio = (ArrayList) request.getAttribute("servicio");
                    %>


                    <% String resp = (String) request.getAttribute("mensaje");

                        if (resp != null) {%>

                    <div class="alert alert-info">
                        <strong>Success!</strong> <%=resp%>
                    </div>

                    <%
                        }
                    %>
                    <form action="servletSolicitud" method="POST" id="formSoli" class="form-horizontal" >
                        <input type="hidden" id="opcion" name="opcion" value="5">
                        <div class="col-md-3 form-time-w3layouts">

                            <label for="nombre"><i class="fa fa-user" aria-hidden="true"></i> Nombre</label>
                            <input type="text" placeholder="Name" required="" name="nombre">
                            <br>
                            <label for="tel"><i class="fa fa-user" aria-hidden="true"></i> Telefono</label>
                            <input type="text" placeholder="correo" required="" name="tel">
                        </div>
                        <div class="col-md-3 form-left-agileits-w3layouts ">
                            <label for="documento"><i class="fa fa-user" aria-hidden="true"></i> Documento</label>
                            <input type="text" placeholder="Documento" required="" name="documento">
                            <br><div id="respDoc" class="alert-danger" ></div>
                            <label for="correo"><i class="fa fa-user" aria-hidden="true"></i> Correo</label>
                            <input type="text" placeholder="correo" required="" name="correo">
                            <br><br><div id="respCorreo" class="alert-danger"></div>
                            
                        </div>
                        <div class="col-md-3 form-date-w3-agileits">
                            <label for="direccion"><i class="fa fa-user" aria-hidden="true"></i> Direccion</label>
                            <input type="text" placeholder="correo" required="" name="direccion">
                            <label for="servicio"><i class="fa fa-map-marker" aria-hidden="true"></i>Servicios</label>

                            <%                                      TipoServicioVO ts = new TipoServicioVO();
                                TipoServicioDAO td = new TipoServicioDAO();

                                ArrayList<TipoServicioVO> listaServ = td.listarArray();

                            %>
                            <select name="servicio" id ="servicio"  style="height: 40px;" class="form-control">
                                <option value="none" >Seleccione Servicio</option>
                                <%                                                        for (int i = 0; i < listaServ.size(); i++) {
                                        ts = listaServ.get(i);
                                %>
                                <option value="<%=ts.getIdTipoServicio()%>" ><%=ts.getNombre()%></option>

                                <%
                                    }

                                %>
                            </select>

                        </div>
                            <div id="botones">
                            <div class="col-md-3 form-date-w3-agileits">
                                <label><i class="fa fa-calendar" aria-hidden="true"></i>Datos solicitud</label>
                            <a href type="hidden" id="boton" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal"><i class="fa fa-eye" aria-hidden="true"></i></a>
                           
                                <input type="submit" class="form-control" value="Agendar">
                                           
                            </div>
                                </div>

                        <div class="container">             
                            <!-- Trigger the modal with a button -->
                            
                            <!-- Modal -->
                            <div class="modal fade" id="myModal" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Detalles de solicitud</h4>
                                        </div>
                                        <div class="modal-body">
                                            <!-- Solicitud estandar -->
                                            <div id="solicitudStandar" >
                                                <div class="form-group">
                                                    <label class="control-label col-sm-2" for="recoger" style="color: #000;">Fecha de recoleccion:</label>
                                                    <div class="col-sm-10">

                                                        <input type="text" id="recoger" name="recoger"  class="form-control" >
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-sm-2" for="entrega" style="color: #000;">Fecha de entrega:</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" id="entrega" name="entrega" class="form-control" >
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label col-sm-2" style="color: #000;" >Rango Recoleccion:</label>
                                                    <div class="col-sm-10">

                                                        <div id="horaIniciar" >

                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-sm-2" style="color: #000;">Rango Entrega:</label>
                                                    <div class="col-sm-10">

                                                        <div id="horaFin" >

                                                        </div>

                                                    </div>
                                                </div>



                                            </div>
                                            <!-- Fin solicitud estandar -->
                                            <!-- solicitud especial--> 
                                            <div id="solicitudEspecial" >
                                                <div class="form-group">
                                                    <label class="control-label col-sm-2" for="color">Color:</label>
                                                    <div class="col-sm-10">

                                                        <select name="color" id ="color"  style="height: 40px;" class="form-control" >
                                                            <%                                                            ColorVO cv = new ColorVO();
                                                                ColorDAO cd = new ColorDAO();

                                                                ArrayList<ColorVO> listaColor = cd.colorArray();

                                                                for (int i = 0; i < listaColor.size(); i++) {
                                                                    cv = listaColor.get(i);

                                                            %>
                                                            <option value="<%=cv.getIdColor()%>" ><%=cv.getNombre()%></option>

                                                            <%
                                                                }


                                                            %>

                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- fin solicitud especial -->

                                            <div class="form-group">
                                                <label class="control-label col-sm-2" for="descripcion" style="color: #000;">Descripción:</label>
                                                <div class="col-sm-10">
                                                    <textarea id="descripcion" name="descripcion" placeholder="¿Algo que agregar?" class="form-control"></textarea>
                                                </div>
                                            </div>
                                           
                                           
                                            
                                            
                                            
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>


                        <div class="clearfix"></div>


                    </form>
                </div>
            </div>
        </div>


        <!-- /Order Form-->
        <!-- Services-->
        <div class="services" id="services">
            <div class="container">
                <h3>Servicios</h3>
                <div class="col-md-4 hhh">
                    <div class="wthree_rt">
                        <img src="rec_index/images/laundry.png" alt="" aria-hidden="true"/><br>                        
                        <h4>Lavado</h4>
                        <p>$3.000 por prenda.</p>
                    </div>
                </div>
                <div class="col-md-4 hhh">
                    <div class="wthree_rt">
                        <img src="rec_index/images/ironing.png" alt=""/><br>
                        <h4>Planchado</h4>
                        <p>$1.500 por prenda.</p>
                    </div>
                </div>
                <div class="col-md-4 hhh">
                    <div class="wthree_rt">                                              
                        <img src="rec_index/images/fabric-paint.png" alt=""/>
                        <h4>Tintorería</h4>
                        <p>$25.000 por prenda.</p>
                    </div>
                </div>                
                <center>
                    <br>
                    <br>
                    <br>
                    <input type="button" value="ver más" class="btn" style="padding: 30px 50px; font-family: 'Roboto Condensed', sans-serif; font-weight: 600;"/>
                </center>                                                                  
            </div>
        </div>

        <!-- /Services-->

        <!-- Testimonials-->
        <div class="testimonials" id ="testimonials">

            <div class="container">
                <h3>Comentarios</h3>
                <%      ComentarioDAO cod = new ComentarioDAO();
                    ComentarioVO cov = new ComentarioVO();

                    ArrayList<ComentarioVO> lista = cod.listar();%>






                <div class="tittle-agileinfo">

                    <div class="sreen-gallery-cursual">

                        <div id="owl-demo" class="owl-carousel">
                           
                               
                              
 <%
                                    for (int i = 0; i < lista.size(); i++) {

                                        cov = lista.get(i);

                                %>
                                 <form  class="form-inline" >
                                  <div class="item-owl">
                                        <div class="test-review">
                                        <h5><%=cov.getNombre().toUpperCase() %></h5>
                                        <span>Cliente</span>
                                        <p style="text-align: center;"><%=cov.getDescripcion().toUpperCase() %></p>
                                          </div>
                                </div>
                                             </form>
                               
 <%}%> 
    

                         
                            
                        </div>
                    </div>


                </div>
            </div>
        </div>
        </div>

        <%@include file="templates/footerIndex.jsp" %>
        <!-- flexSlider -->
        <script src="rec_index/js/owl.carousel.js"></script>
        <script>
            $(document).ready(function () {
                $("#owl-demo").owlCarousel({
                    items: 2,
                    itemsDesktop: [800, 2],
                    itemsDesktopSmall: [414, 1],
                    lazyLoad: true,
                    autoPlay: true,
                    navigation: true,
                    navigationText: false,
                    pagination: true
                });

            });
        </script>

        <!-- //flexSlider -->
        <!-- /gallery -->
        <script src="rec_index/js/jquery.tools.min.js"></script>
        <script src="rec_index/js/jquery.mobile.custom.min.js"></script>
        <script src="rec_index/js/jquery.cm-overlay.js"></script>

        <script>
            $(document).ready(function () {
                $('.cm-overlay').cmOverlay();
            });
        </script>
        <!-- //gallery -->

        <!-- Move-to-top-->
        <script type="text/javascript">
            $(document).ready(function () {
                var defaults = {
                    containerID: 'toTop', // fading element id
                    containerHoverID: 'toTopHover', // fading element hover id                     scrollSpeed: 1200,
                    easingType: 'linear'
                };
                $().UItoTop({easingType: 'easeOutQuart'});
            });
        </script>
        <!--/Move-to-top-->


        <style>
            .error{
                color: red
            }


        </style>



        <link href="javaScript/jquery-ui/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
        <link href="javaScript/jquery-ui/jquery-ui.theme.min.css" rel="stylesheet" type="text/css"/>
        <script src="javaScript/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
        <script>
            $(function () {
                $("#entrega").hide();
                $("#recoger").datepicker({minDate: 0, maxDate: "+2D", dateFormat: 'yy-mm-dd'});
                $("#recoger").change(function () {
                    //fecha=$(this).val();

                    fecha = $(this).datepicker('getDate');
                    fechan = new Date(fecha.getTime());
                    fechan.setDate(fechan.getDate() + 2);
                    $("#entrega").show();
                    $(function () {
                        //$("#endDate").datepicker("option", "minDate", testm);
                        $("#entrega").datepicker({minDate: fecha, maxDate: fechan, dateFormat: 'yy-mm-dd'});
                    });
                });
            });</script>



        <script type="text/javascript" >
            /*  $('#recoger').datepicker({dateFormat:'yy-mm-dd'});
             $('#entrega').datepicker({dateFormat:'yy-mm-dd'});*/







            $(document).ready(function () {
                $("#solicitudStandar").hide();
                $("#solicitudEspecial").hide();
                $("#botones").hide();
                
                
                
                $('#servicio').change(function () {
                   

                    var opcion = $(this).find(":selected").val();

                    console.log("Hola cambie" + opcion);

                    if(opcion !== "none"){
                 
                 $("#boton").click();
                         $("#botones").show();
                    switch (opcion) {
                        /* case "1":
                         break;*/                         case "2":

                            $("#solicitudStandar").show();
                            $("#solicitudEspecial").show();

                            break;
                        default:
                            $("#solicitudEspecial").hide();
                            $("#solicitudStandar").show();

                    }

        }else{
            $("#botones").hide();
        }// Fin deiferente a none


                });

                var recoge = $('#recoger').val();
                var entrega = $('#entrega').val();
                $('#entrega').change(function () {
                    console.log("Entre a entrega");
                    recoge = $('#recoger').val();
                    entrega = $('#entrega').val();
                    //Condicion de mismo dia                     
                    if (recoge === entrega) {// var date = Date.getHours();

                        // Declaracion de fecha actual
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
                        // var hora = 7;
                        var fullfecha = anio + "-" + mes + "-" + dia;

                        //var hora = +date.getHours();
                        confirm("Si selecciona el mismo dia tiene un cobro adicional. " + hora);
                        var fecha = $('#recoger').val();
                        //alert(fullfecha+"  "+fecha);  
                        // Condicion si el dia de recogida es el mismo en que se agenda
                        if (fecha === fullfecha) {


                            var hora = +date.getHours();
                            if (hora <= 9) {
                                $.ajax({
                                    url: 'condicion',
                                    type: 'POST',
                                    data: 'opc=' + 6,
                                    success: function (resultado) {
                                        $('#horaIniciar').html(resultado);
                                    }
                                });
                                $.ajax({
                                    url: 'condicion',
                                    type: 'POST',
                                    data: 'opc=' + 7,
                                    success: function (resultado) {
                                        $('#horaFin').html(resultado);
                                    }
                                });
                                // cuando cambie el select
                                $("#horaIniciar").change(function () {
                                    var opcion = $(this).find(":selected").val();
                                    console.log(opcion);
                                    $.ajax({
                                        url: 'condicionSelect',
                                        type: 'POST',
                                        data: {'opc': opcion},
                                        success: function (resultado) {
                                            console.log(resultado);
                                            $('#horaFin').html(resultado);
                                        }

                                    });
                                });


                                $("#horaIniciar").show();
                                $("#horaFin").show();
                            } else if (hora <= 13) {
                                // Mismo dia despues de la 1
                                $.ajax({
                                    url: 'condicion',
                                    type: 'POST',
                                    data: 'opc=' + 2,
                                    success: function (resultado) {
                                        $('#horaIniciar').html(resultado);
                                    }
                                });
                                $.ajax({
                                    url: 'condicion',
                                    type: 'POST',
                                    data: 'opc=' + 3, success: function (resultado) {
                                        $('#horaFin').html(resultado);
                                    }
                                });
                                $("#horaIniciar").show();
                                $("#horaFin").show();
                            } else if (hora <= 15) {
                                // Mismo dia despues de la 4
                                $.ajax({
                                    url: 'condicion',
                                    type: 'POST',
                                    data: 'opc=' + 5,
                                    success: function (resultado) {
                                        $('#horaIniciar').html(resultado);
                                    }
                                });
                                $.ajax({
                                    url: 'condicion',
                                    type: 'POST',
                                    data: 'opc=' + 4,
                                    success: function (resultado) {
                                        $('#horaFin').html(resultado);
                                    }
                                });
                                $("#horaIniciar").show();
                                $("#horaFin").show();
                            } else {
                                confirm("No hay mas solicitudes por el dia de hoy.");
                            }
                        } else {

                            // mismo dia pero no el dia actual 

                            $.ajax({
                                url: 'condicion',
                                type: 'POST',
                                data: 'opc=' + 6, success: function (resultado) {
                                    $('#horaIniciar').html(resultado);
                                }
                            });
                            $.ajax({
                                url: 'condicion',
                                type: 'POST',
                                data: 'opc=' + 7,
                                success: function (resultado) {
                                    $('#horaFin').html(resultado);
                                }
                            });
                            // cuando cambie el select
                            $("#horaIniciar").change(function () {
                                var opcion = $(this).find(":selected").val();
                                console.log(opcion);
                                $.ajax({
                                    url: 'condicionSelect',
                                    type: 'POST',
                                    data: {'opc': opcion},
                                    success: function (resultado) {
                                        console.log(resultado);
                                        $('#horaFin').html(resultado);
                                    }

                                });
                            });

                        }


                    } else {
                        /*$("#horaIniciar").show();
                         $("#horaFin").show();*/

                        $(function () {
                            //  $('#recoger').change(function () {
                            var fecha = $('#recoger').val();
                            $.ajax({
                                url: 'validacionFecha_',
                                type: 'POST',
                                data: 'fecha=' + fecha,
                                success: function (resultado) {
                                    $('#horaIniciar').html(resultado);
                                }
                            });
                            // });
                        });
                        $(function () {
                            // $('#entrega').change(function () {
                            var fecha = $('#entrega').val();
                            var recoge = $('#recoger').val();
                            var valor = $('#horaInicio').val();
                            $.ajax({
                                url: 'validacionRecoger', type: 'POST',
                                data: 'fecha=' + fecha + 'recoge=' + recoge + 'valor=' + valor,
                                success: function (resultado) {
                                    $('#horaFin').html(resultado);
                                }});
                            //});
                        });
                    }
                });
            });

            // cuando cambie el select
            /*$("#horaIniciar").change(function(){
             var opcion = $(this).find(":selected").val();
             $("#horaFin").hide();
             console.log(opcion);
             $.ajax({
             url: 'condicion',
             type: 'POST',
             data: 'opc= '+ 1,
             success: function (resultado) {
             $('#horaFin').html(resultado);
             }
             });
             
             $("#horaFin").show();
             
             });*/


            // Validar si hay datos en la base de datos            
            $(function () {
                $('input[name=documento]').change(function () {
                    var doc = $('input[name=documento]').val();
                    $.ajax({
                        url: 'datosRegistrados',
                        type: 'POST',
                        data: 'doc=' + doc,
                        success: function (resultado) {
                            $('#respDoc').html(resultado);
                        }});
                });
            });
            $(function () {
                $('input[name=correo]').change(function () {
                    var correo = $('input[name=correo]').val();
                    $.ajax({
                        url: 'datosRegistrados', type: 'POST', data: 'correo=' + correo,
                        success: function (resultado) {
                            $('#respCorreo').html(resultado);
                        }});
                });
            });</script>                    




        <!-- validate  -->

        <script src="javaScript/jquery.validate_1.js" type="text/javascript"></script>
        <script src="javaScript/additional-methods.js" type="text/javascript"></script>


        <script>
            $(document).ready(function () {

                $("#formSoli").validate({
                    rules: {
                        nombre: {
                            required: true,
                            minlength: 3, maxlength: 20
                        },
                        documento: {
                            required: true,
                            minlength: 8,
                            maxlength: 100
                        },
                        tel: {
                            required: true,
                            minlength: 7, maxlength: 10
                        },
                        direccion: {
                            required: true,
                            minlength: 10,
                            maxlength: 20
                        },
                        correo: {
                            required: true,
                            minlength: 15,
                            maxlength: 50
                        },
                        descripcion: {required: true,
                            minlength: 15,
                            maxlength: 200
                        },
                        recoger: {
                            required: true
                        },
                        entrega: {
                            required: true

                        }
                    },
                    messages: {
                        nombre: {
                            required: "Campo obligatorio",
                            minlength: "Muy corto",
                            maxlength: "Excede el limite"
                        },
                        documento: {
                            required: "Campo obligatorio",
                            minlength: "Muy corto",
                            maxlength: "Excede el limite"
                        },
                        tel: {
                            required: "Campo obligatorio",
                            minlength: "Muy corto",
                            maxlength: "Excede el limite"
                        },
                        direccion: {
                            required: "Campo obligatorio",
                            minlength: "Muy corto.", maxlength: "Excede el limite"
                        },
                        correo: {
                            required: "Campo obligatorio",
                            minlength: "Muy corto",
                            maxlength: "Excede el limite"

                        },
                        descripcion: {
                            required: "Campo obligatorio",
                            minlength: "Muy corto", maxlength: "Excede el limite"
                        },
                        recoger: {
                            required: "Campo obligatorio"


                        },
                        entrega: {
                            required: "Campo obligatorio"

                        }
                    }

                });
            });
        </script>


    </body>
</html>
