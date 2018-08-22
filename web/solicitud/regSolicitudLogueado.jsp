<%-- 
    Document   : regSolicitudLogueado
    Created on : 17/03/2018, 08:32:46 PM
    Author     : Kevin
--%>

<%@page import="modeloDAO.ColorDAO"%>
<%@page import="modeloVO.ColorVO"%>
<%@page import="modeloVO.HorariosVO"%>
<%@page import="modeloVO.TipoServicioVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SOLICITUD</title>
        <script src="javaScript/jquery-3.3.1.min.js" type="text/javascript"></script>

        <link rel="shortcut icon" href="img/favicon.png"/> 




    </head>
    <body>
        <%@include file="../templates/headerCliente.jsp" %>

        <%                ArrayList servicio = (ArrayList) request.getAttribute("servicio");

            /*HttpSession misesion = (HttpSession) request.getSession();
            PersonaVO pv = (PersonaVO) misesion.getAttribute("persona");*/

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
                                    <li class="breadcrumb-item active">Registrar Solicitud</li>
                                </ol>
                            </div>
                            <h4 class="page-title">Registrar Solicitud</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title end breadcrumb -->
                <% String resp = (String) request.getAttribute("mensaje");
                    if (resp != null) {%>
                    <div class="alert alert-success">
                        <strong>EXITO!</strong> <%=resp%>
                    </div>
                <%  }%>
                <!-- Form row -->
                <div class="row">
                    <div class="col-md-12">
                        <%  if (pv.getEstado() == 3) {  %>

                        <div class="card-box">
                            <div class="alert-danger">Su estado es DEUDOR, hable con la empresa para mas información.</div>
                            <div class="bg-faded p-4 my-4">

                                <div class="panel-group">
                                    <div class="panel panel-default">
                                        <div class="panel-heading"><h2> <strong>Contactenos</strong></h2></div>
                                        <div class="panel-body">Llámenos al numero fijo 2521314 o el numero celular 318-627-6570<br>
                                            <!--(Lunes a viernes de 7:00 am a 07:00 pm, Sábados y Domingos de 08:00 am a 02:00 pm)-->
                                        </div>
                                        <div class="panel-body">Escribanos a: domilavservicio@gmail.com</div>
                                        <div class="panel-body">Encuentrenos en: Carrera 80 # 68B - 12</div>
                                        <div class="panel-body">Engativá</div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <%} else{%>
                            <div class="card-box">
                                <h4 class="m-t-0 header-title">Información del Cliente</h4>
                                <p class="text-muted m-b-30 font-13">
                                    Información del cliente que realiza la solicitud:
                                </p>
                                <form id="formSoli" action="servletSolcitudCliente" method="POST" class="form-horizontal" >
                                    <input type="hidden" id="opcion" name="opcion" value="6">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="nombre" class="col-form-label">Nombre: </label>
                                            <input type="text" class="form-control" id="nombre" name="nombre" value="<%=pv.getNombres()%>" readonly="">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="documento" class="col-form-label">Documento: </label>
                                            <input type="text" class="form-control" id="documento" name="documento" value="<%=pv.getDocumento()%>" readonly="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="direccion" class="col-form-label">Dirección: </label>
                                        <input type="text" class="form-control" id="direccion" name="direccion" value="<%=pv.getDireccion()%>" readonly="">
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="correo" class="col-form-label">Correo: </label>
                                            <input type="text" class="form-control" id="correo" name="correo" value="<%=pv.getCorreo()%>" readonly="">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="tel" class="col-form-label">Telefono: </label>
                                            <input type="text" class="form-control" id="tel" name="tel" value="<%=pv.getNumCelular()%>" readonly="">
                                        </div>
                                    </div>
                                    <br>
                                    <h4 class="m-t-0 header-title">Información de la Solicitud</h4>
                                    <p class="text-muted m-b-30 font-13">
                                        Información para la recolección de la Ropa:
                                    </p>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="servicio" class="col-form-label">Servicio </label>
                                            <% if (servicio != null) {
                                                Iterator iterator = servicio.listIterator();
                                            %>
                                            <select name="servicio" id ="servicio" class="form-control" >
                                                <% while (iterator.hasNext()) {
                                                    TipoServicioVO servicioVO = (TipoServicioVO) iterator.next();
                                                %>
                                                <option value="<%=servicioVO.getIdTipoServicio()%>" ><%=servicioVO.getNombre().toUpperCase() %></option>
                                            <%
                                                    }
                                                }
                                            %>
                                            </select>
                                        </div>
                                    </div>
                                    <!-- Solicitud estandar -->
                                    <div id="solicitudStandar">
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label class="control-label" for="recoger">Fecha de recoleccion:</label>
                                                <input type="text" id="recoger" name="recoger"  class="form-control" readonly="" >
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="control-label" for="entrega">Fecha de entrega:</label>
                                                <input type="text" id="entrega" name="entrega" class="form-control" readonly="" >
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label class="control-label" >Rango Recoleccion:</label>
                                                <div id="horaIniciar" ></div>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="control-label" >Rango Entrega:</label>
                                                <div id="horaFin" ></div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-12">
                                                <label class="control-label" for="descripcion">Descripción: </label>
                                                <textarea id="descripcion" name="descripcion" class="form-control">
                                                </textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Fin solicitud estandar -->
                                    <!-- solicitud especial -->
                                    <div id="solicitudEspecial" >
                                        <div class="form-row">
                                            <div class="form-group col-md-12">
                                                <label class="control-label" for="color">Color:</label>
                                                <select name="color" id ="color" class="form-control" >
                                                    <%
                                                        ColorVO cv = new ColorVO();
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
                                    <button type="submit" class="btn btn-primary">Enviar</button>
                                </form>
                            </div>
                        <%
                        }%>
                    </div>
                </div>
                <!-- end row -->

            </div> <!-- end container -->
        </div>        

        <%@include file="../templates/footerCliente.jsp" %>

        <link href="javaScript/jquery-ui/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
        <link href="javaScript/jquery-ui/jquery-ui.theme.min.css" rel="stylesheet" type="text/css"/>
        <script src="javaScript/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
        <script>


            $(function () {

                $("#recoger").datepicker({minDate: 0, maxDate: "+2D", dateFormat: 'yy-mm-dd'});

                $("#entrega").hide();



                $("#recoger").change(function () {
                    //fecha=$(this).val();
                    $("#entrega").show();
                    fecha = $(this).datepicker('getDate');
                    fechan = new Date(fecha.getTime());
                    fechan.setDate(fechan.getDate() + 2);
                    $(function () {


                        //$("#endDate").datepicker("option", "minDate", testm);
                        $("#entrega").datepicker({minDate: fecha, maxDate: fechan, dateFormat: 'yy-mm-dd'});


                    });
                });
            });
        </script>
        <script type="text/javascript" >
            /*  $('#recoger').datepicker({dateFormat:'yy-mm-dd'});
             $('#entrega').datepicker({dateFormat:'yy-mm-dd'});*/







            $(document).ready(function () {

                $("#solicitudEspecial").hide();
                $('#servicio').change(function () {




                    var opcion = $(this).find(":selected").val();

                    console.log("Hola cambie" + opcion);

                    switch (opcion) {
                        /* case "1":
                         break;*/
                        case "2":

                            $("#solicitudEspecial").show();

                            break;
                        default:
                            $("#solicitudEspecial").hide();

                    }




                });

                var recoge = $('#recoger').val();
                var entrega = $('#entrega').val();
                $('#entrega').change(function () {
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
                        //var hora = 7;
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
                                    data: 'opc=' + 3,
                                    success: function (resultado) {
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
                                url: 'validacionRecoger',
                                type: 'POST',
                                data: 'fecha=' + fecha + 'recoge=' + recoge + 'valor=' + valor,
                                success: function (resultado) {
                                    $('#horaFin').html(resultado);
                                }
                            });
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
                $('#documento').change(function () {
                    var doc = $('#documento').val();
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
                $('#correo').change(function () {
                    var correo = $('#correo').val();
                    $.ajax({
                        url: 'datosRegistrados',
                        type: 'POST',
                        data: 'correo=' + correo,
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
                         minlength: 3,
                         maxlength: 20
                     },
                     documento: {
                         required: true,
                         minlength: 8,
                         maxlength: 18
                     },
                     tel: {
                         required: true,
                         minlength: 9,
                         maxlength: 12
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
                     descripcion: {
                         required: true,
                         minlength: 10,
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
                         minlength: "Muy corto.",
                         maxlength: "Excede el limite"
                     },
                     correo: {
                         required: "Campo obligatorio",
                         minlength: "Muy corto",
                         maxlength: "Excede el limite"

                     },
                     descripcion: {
                         required: "Campo obligatorio",
                         minlength: "Muy corto",
                         maxlength: "Excede el limite"
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
