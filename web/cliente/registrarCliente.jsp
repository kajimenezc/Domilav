<%-- 
  Document   : registrarCliente
  Created on : 6/12/2017, 12:14:43 PM
  Author     : kev_i
--%>

<%@page import="modeloVO.AgenciaVO"%>
<%@page import="modeloVO.PersonaVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="modeloDAO.conexioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Permatex</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
     
        <meta name="keywords" content="Immerse a Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <link href="../rec_index/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
        <link href="../rec_index/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
        <link href="../rec_index/css/owl.carousel.css" rel="stylesheet">
        <link rel="stylesheet" href="../rec_index/css/lightbox.css">
        <link type="text/css" rel="stylesheet" href="../rec_index/css/cm-overlay.css" />
        <link href="../rec_index/css/style.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="//fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Sintony:400,700&amp;subset=latin-ext" rel="stylesheet">     

    </head>
    <body>

        <%@include file="../templates/headerIndex.jsp" %>


        <div class="container">
            <br>
            <%
                String mensaje = (String) request.getAttribute("mensaje");

                if (mensaje != null) {%>

            <div class="alert alert-success">
                <strong>Exito!</strong> <%=mensaje%>
            </div>
            <%
                }
            %>

            <div class="bg-faded p-4 my-4">
                <h1>Registrar Cliente</h1>

                <form action="servletCliente" id="formCliente" method="POST" class="form-horizontal">
                    <div class="form-group">

                        <input type="hidden" name="opcion" value="2" >

                        <label for="nombres" class="control-label col-sm-2">Nombres: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="nombre" name="nombres" placeholder="ingrese su nombre" ><span id="valNombre" class="alert-warning" ></span>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="apellidos" class="control-label col-sm-2">Apellidos: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="apellido" name="apellidos" placeholder="ingrese sus apellidos" ><span id="valApellido"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="documento" class="control-label col-sm-2">Documento: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="documento" name="documento" placeholder="ingrese su numero de documento" ><br><span id="valDoc"></span>

                            <div id="respDoc" class="alert-danger" >${doc}</div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="genero" class="control-label col-sm-2">Genero: </label>
                        <div class="col-sm-10">
                            <input type="radio" class="radio-inline" name="genero"  value="Masculino" checked>Masculino
                            <input type="radio" class="radio-inline" name="genero"  value="Femenino">Femenino
                            <input type="radio" class="radio-inline" name="genero"  value="Otro">Otro
                            <div id="valGen" class="alert-warning"></div>
                        </div>
                    </div>

                    <div class="form-group">

                        <label for="celular" class="control-label col-sm-2">Celular: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="celular" name="celular" placeholder="ingrese su numero Celular"  ><span id="valCel"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="fijo" class="control-label col-sm-2">Telefono: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="fijo" name="fijo" placeholder="ingrese su telefono"  ><span id="valTel"></span>
                        </div>
                    </div>

                    <div class="form-group">

                        <label for="direccion" class="control-label col-sm-2">Direccion: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="direccion" name="direccion" placeholder="ingrese su direccion" required="" pattern="[/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/]{10,25}"><span id="valDirecc"></span>
                            <br>
                            <div id="respCorreo" class="alert-danger"></div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="correo" class="control-label col-sm-2">Correo: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="correo" name="correo" placeholder="ingrese su correo electronico" required="" pattern="[/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/]{10,25}">
                            <div class="alert-danger" id="respCorreo" >${correo}</div>
                        </div>
                    </div>



                    <br>
                    <div class="panel-group">
                        <div class="panel-panel-default">
                            <div class="panel-heading">
                                <div id="pass">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <label for="usuario" class="control-label col-sm-2">usuario: </label>
                                            <div class="col-sm-10">
                                                <input type="user" class="form-control" id="user" name="user" required="" placeholder="ingrese usuario" ><span id="valUser"></span><br>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="nueva" class="control-label col-sm-2">Contraseña: </label>
                                            <div class="col-sm-10">
                                                <input type="password" class="form-control" id="nueva" required="" name="nueva"><span id="valpass"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="confirma" class="control-label col-sm-2">Cofirme contraseña: </label>
                                            <div class="col-sm-10">
                                                <input type="password" class="form-control" id="confirma" required="" name="confirma" ><span id="valconfirm"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <div class="alert-danger" id="resp" ></div>
                                    </div>
                                    <br>

                                </div>
                            </div>
                        </div>
                    </div>






                    <!--
                                        <div class="form-group">
                                            <label for="usuario" class="control-label col-sm-2">usuario: </label>
                                            <div class="col-sm-10">
                                                <input type="user" class="form-control" id="user" name="user" placeholder="ingrese su contraseña" >
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="pass" class="control-label col-sm-2">password: </label>
                                            <div class="col-sm-10">
                                                <input type="password" class="form-control" id="pass" name="pass" placeholder="ingrese su contraseña" pattern="[/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/]{6,15}">
                                            </div>
                                        </div>-->



                    <input type="submit" id="enviar" class="btn btn-default" value="aceptar" >
                </form>
            </div>
        </div>


        <%@include file="../templates/footerIndex.jsp" %>



        <style> 
            .error{
                color:red;
            }
        </style>

        <script src="javaScript/jquery-3.3.1.js" type="text/javascript"></script>
              <script src="javaScript/jquery.validate_1.js" type="text/javascript"></script>
        <script src="javaScript/additional-methods.js" type="text/javascript"></script>

        <script type="text/javascript">
            $(document).ready(function () {


                $("#formCliente").validate({
                    rules: {
                        nombres: {
                            required: true,
                            minlength: 3,
                            maxlength: 20
                        },
                        apellidos: {
                            required: true,
                            minlength: 4,
                            maxlength: 20
                        },
                        documento: {
                            required: true,
                            minlength: 10,
                            maxlength: 15
                        },
                        celular: {
                            required: true,
                            minlength: 9,
                            maxlength: 12
                        },
                        fijo: {
                            required: true,
                            maxlength: 7
                        },
                        direccion: {
                            required: true,
                            minlength: 10,
                            maxlength: 20
                        },
                        correo: {
                            required: true,
                            minlength: 15,
                            maxlength: 25
                        },
                        user: {
                            required: true,
                            minlength: 6,
                            maxlength: 20
                        },
                        nueva: {
                            required: true,
                            minlength: 6,
                            maxlength: 20
                        },
                        confirma: {
                            required: true,
                           minlength: 6,
                            maxlength: 20
                        }
                    },
                    messages: {
                        nombres: {
                            required: "Campo obligatorio",
                            minlength: "Muy corto",
                            maxlength: "Excede el limite"
                        },
                        apellidos: {
                            required: "Campo obligatorio",
                            minlength: "Muy corto",
                            maxlength: "Excede el limite"
                        },
                        documento: {
                            required: "Campo obligatorio",
                            minlength: "Muy corto",
                            maxlength: "Excede el limite"
                        },
                        celular: {
                            required: "Campo obligatorio",
                            minlength: "Muy corto",
                            maxlength: "Excede el limite"
                        },
                        fijo: {
                            required: "Campo obligatorio",
                            minlength: "no valido",
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
                        user: {
                            required: "Campo obligatorio",
                            minlength: "Muy corto",
                            maxlength: "Excede el limite"
                        },
                        nueva: {
                            required: "Campo obligatorio",
                            minlength: "Muy corto",
                            maxlength: "Excede el limite"
                        },
                        confirma: {
                            required: "Campo obligatorio",
                            minlength: "Muy corto",
                            maxlength: "Excede el limite"
                        }
                    }

                });
                //variables
                var pass1 = $('[name=nueva]');
                var pass2 = $('[name=confirma]');
                var confirmacion = "Las contraseñas si coinciden";
                var longitud = "La contraseña debe estar formada entre 6-10 carácteres (ambos inclusive)";
                var negacion = "No coinciden las contraseñas.";
                var vacio = "La contraseña no puede estar vacía";
                //oculto por defecto el elemento span
                var span = $('<div class="alert-info"></div>').insertAfter(pass2);
                span.hide();
                //función que comprueba las dos contraseñas
                function coincidePassword() {
                    var valor1 = pass1.val();
                    var valor2 = pass2.val();
                    //muestro el span
                    span.show().removeClass();
                    //condiciones dentro de la función
                    if (valor1 != valor2) {
                        span.text(negacion).addClass('negacion');
                    }
                    if (valor1.length == 0 || valor1 == "") {
                        span.text(vacio).addClass('negacion');
                    }
                    if (valor1.length < 6 || valor1.length > 10) {
                        span.text(longitud).addClass('negacion');
                    }
                    if (valor1.length != 0 && valor1 == valor2) {
                        span.text(confirmacion).removeClass("negacion").addClass('confirmacion');
                    }
                }
                //ejecuto la función al soltar la tecla
                pass2.keyup(function () {
                    coincidePassword();
                });
            });</script>
        <script>
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
                $('#user').change(function () {
                    var user = $('#user').val();
                    $.ajax({
                        url: 'datosRegistrados',
                        type: 'POST',
                        data: 'user=' + user,
                        success: function (resultado) {
                            $('#respUser').html(resultado);
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
            });
        </script>





    </body>
</html>
