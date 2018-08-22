<%-- 
    Document   : registroSolicitud
    Created on : 24/02/2018, 09:34:02 PM
    Author     : Kevin
--%>

<%@page import="modeloDAO.ColorDAO"%>
<%@page import="modeloVO.ColorVO"%>
<%@page import="modeloDAO.HorariosDAO"%>
<%@page import="modeloDAO.SolicitudDAO"%>
<%@page import="modeloVO.PersonaVO"%>
<%@page import="modeloDAO.PersonaDAO"%>
<%@page import="modeloVO.HorariosVO"%>
<%@page import="modeloVO.TipoServicioVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>registro</title>


        <link rel="shortcut icon" href="img/favicon.png"/> 
        <script src="javaScript/jquery-3.3.1.min.js" type="text/javascript"></script>




    </head>

    <body>

        <%
            HttpSession misesion = (HttpSession) request.getSession();
            PersonaVO pvo = (PersonaVO) misesion.getAttribute("pers");
        %>


        ${existe}

        <%
            ArrayList servicio = (ArrayList) request.getAttribute("servicio");


        %>

        <div class="row">
            <div class="col-sm-1"></div>
            <div class="col-sm-9">
                <br>
                <% String resp = (String) request.getAttribute("mensaje");

                    if (resp != null) {%>

                <div class="alert alert-info">
                    <strong>Success!</strong> <%=resp%>
                </div>

                <%
                    }
                %>
                <br>

                <div class="card-box">

                    <!--<ul class="nav nav-tabs">
                        <li ><a data-toggle="tab" href="#datos"> DATOS </a></li>
                        <li class="active"><a data-toggle="tab"> &nbsp</a></li>
                        <li class="active"><a data-toggle="tab"> &nbsp</a></li>
                        <li class="active"><a data-toggle="tab"> &nbsp</a></li>
                        <li><a data-toggle="tab" id="solicitud" href="#solicitud"> SOLICITUD </a></li>

                    </ul>-->
                    <form action="servletSolicitud" method="POST" id="formSoli" class="form-horizontal" >
      <input type="hidden" id="opcion" name="opcion" value="5">
                        <!--   <div class="tab-content">-->
                        <div id="datos" >

                            <div class="panel panel-primary">
                                <div class="panel-heading">DATOS SOLICITUD</div>
                                <div class="panel-body">

                                    <div class="row">
                                        <div class="col-md-6" >

                                            <div class="form-group">
                                                <label for="nombre" class="control-label col-sm-2">Nombre: </label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="KEVIN ANDRES"  ><span id="valNombre"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6" >
                                            <div class="form-group">
                                                <label for="documento" class="control-label col-sm-2">Documento: </label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="documento" name="documento" placeholder="123389364" ><span id="valDoc"></span>
                                                    <div id="respDoc" class="alert-danger" ></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="direccion" class="control-label col-sm-2">direccion: </label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Cll 133 # 127 - 20" ><span id="valDirec"></span>
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="col-md-6" >
                                            <div class="form-group">
                                                <label for="correo" class="control-label col-sm-2">correo: </label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="correo" name="correo" placeholder="domilav@gmail.com" ><span id="valcorreo"></span><br>
                                                    <div id="respCorreo" class="alert-danger"></div>
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

                                    <!-- <li><a data-toggle="tab" href="#solicitud"> SOLICITUD </a></li>-->
                                </div>
                                <div class="panel panel-footer">
                                    <div id="mensajeVal" class="alert-danger">  </div>
                                </div>
                            </div>
                        </div>
                        <!--<div id="solicitud" class="tab-pane fade">-->

                        <div class="panel panel-primary">
                            <div class="panel-heading">RECOLECCIÓN</div>
                            <div class="panel-body">

                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="servicio">Servicio:</label>
                                    <div class="col-sm-10">
                                        <%                                                if (servicio != null) {
                                                Iterator iterator = servicio.listIterator();
                                        %>
                                        <select name="servicio" id ="servicio"  style="height: 40px;" class="form-control" >
                                            <%
                                                while (iterator.hasNext()) {
                                                    TipoServicioVO servicioVO = (TipoServicioVO) iterator.next();
                                            %>
                                            <option value="<%=servicioVO.getIdTipoServicio()%>" ><%=servicioVO.getNombre()%></option>

                                            <%
                                                    }
                                                }
                                            %>

                                        </select>
                                    </div>
                                </div>

                                <!-- Solicitud estandar -->
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

                                <!-- solicitud especial -->
                                <div id="solicitudEspecial" >

                                    

                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="color">Color:</label>
                                        <div class="col-sm-10">

                                            <select name="color" id ="color"  style="height: 40px;" class="form-control" >
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
               
                      $("#solicitudEspecial").hide();
                      //$("#solicitudStandar").sw();
                    $('#servicio').change(function () {
                        
                      
 
        
                        var opcion = $(this).find(":selected").val() ;
                
                        console.log("Hola cambie" + opcion);

                        switch (opcion) {
                           /* case "1":
                                break;*/
                            case "2":
                                
                               // $("#solicitudStandar").show();
                                $("#solicitudEspecial").show();
                        
                                break;
                            default:
                                 $("#solicitudEspecial").hide();
                                 $("#solicitudStandar").show();
                               
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
                                minlength: 15,
                                maxlength: 255
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
