<%-- 
    Document   : regisstraaaa
    Created on : 6/06/2018, 09:35:17 AM
    Author     : Sena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Domilav</title>
        <link rel="shortcut icon" href="img/favicon.png"/> 

        <!-- Meta tags -->
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <meta name="keywords" content="Stunning sign up & login Form Responsive Widget, Audio and Video players, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design"/>
        <script>
            addEventListener("load", function () {
                setTimeout(hideURLbar, 0);
            }, false);
            function hideURLbar() {
                window.scrollTo(0, 1);
            }
        </script>
        <!-- Meta tags -->
        <!-- font-awesome icons -->
        <link rel="stylesheet" href="login/css/font-awesome.min.css" />
        <!-- //font-awesome icons -->
        <!--stylesheets-->
        <link href="login/css/style.css" rel='stylesheet' type='text/css' media="all">
        <!--//style sheet end here-->

        <link href="../fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">
        <script src="javaScript/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="javaScript/jquery-3.2.2.min.js" type="text/javascript"></script>
        <script src="javaScript/jquery-3.3.1.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script> 
        <script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    </head>
    <body>

        <div class="mid-cls">
            <div class="swm-right-w3ls">

                <div class="icon-head-wthree">
<%
                String mensaje = (String) request.getAttribute("mensaje");

                if (mensaje != null) {%>

            <div class="alert alert-success">
                <strong>Exito!</strong> <%=mensaje%>
            </div>
            <%
                }
            %>
                    <a href="index.jsp"><img src="login/altlogo_1.png"/><BR></a><br>
                    <h4>Registrate</h4><br><br>
                </div>
               
                <div class="main">
                    <form action="servletCliente" id="formCliente" method="POST" class="form-horizontal">
                        <input type="hidden" name="opcion" value="2" >                       
                        
                        <div class="form-left-w3l" style="width:500px; padding:3px;">
                            <input type="text" name="nombres" id="nombres" placeholder="Nombres" required="" style="width:245px; float:left;">
                            <input type="text" name="apellidos" placeholder="Apellidos" id="apellidos" required="" style="width:245px; float:right;">

                            <div class="clear"></div>
                        </div>


                        <div class="form-left-w3l">
                            <input type="text" name="documento" placeholder="Documento" id="documento" required=""><br><span id="valDoc"></span>
                             <div id="respDoc" class="alert-danger" >${doc}</div>
                            <div class="clear"></div>
                        </div>



                        <div class="form-left-w3l" style="border: 1px solid white; 
                             width: 500px; background-color: white; ">
                            <label for="genero" class="control-label col-sm-2">Genero: </label>
                            <div class="col-sm-10">
                                <input type="radio" class="radio-inline" name="genero"  value="Masculino" checked>Masculino
                                <input type="radio" class="radio-inline" name="genero"  value="Femenino">Femenino
                                <input type="radio" class="radio-inline" name="genero"  value="Otro">Otro
                                <div id="valGen" class="alert-warning"></div>
                            </div>
                        </div> <BR>
                        <div class="form-left-w3l" style="width:500px; padding:3px;">                            
                            <input type="text" name="celular" placeholder="Celular" id="celular" required="" style="width:245px; float:left;"><span id="valCel"></span>
                            <input type="text" name="fijo" placeholder="Telefono" id="fijo" required="" style="width:245px; float:right;"><span id="valTel"></span>                            

                            <div class="clear"></div>
                        </div>

                        <div class="form-left-w3l">
                            <input type="text" name="direccion" placeholder="Direccion" id="direccion" required="" pattern="[/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/]{10,25}"><span id="valDirecc"></span>
                            <div class="clear"></div>
                        </div>                                                      

                        <div class="form-left-w3l">
                            <input type="text" name="correo" placeholder="Correo" id="correo" required="" pattern="[/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/]{10,25}">
                            <div class="alert-danger" id="respCorreo" >${correo}</div>
                            <div class="clear"></div>
                        </div>                                                                               


                        <div class="form-left-w3l">
                            <input type="text" name="user" placeholder="Usuario" id="user" required="">
                            <div class="clear"></div>
                        </div>    

                        <div class="form-right-w3ls">
                            <input type="password" name="nueva" placeholder="Contraseña" id="nueva" required="">
                            <div class="clear"></div>
                        </div>    

                        <div class="form-right-w3ls">
                            <input type="password" name="confirma" placeholder="Confirme contraseña" id="confirma" required="">
                            <div class="clear"></div>
                        </div>                        
                        <button type="submit">Aceptar</button><br>
                    </form>
                    <div class="btnn">
                        <form action="loginServlet" method="POST">
                            <input type="hidden" name="opcion" value="1">
                            <center><input type="submit" class="for" name="inicia" id="inicia" style="background: none; border: none; box-shadow: none; margin: 0px;" value="¿Ya tienes cuenta? Inicia Sesion"></center>                        
                        </form>

                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>
                            
                            <style>
                                .error{
                                    color:white;
                                }
                                
                                .alert-danger{
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
                            minlength: "<br><br><br>Muy corto",
                            maxlength: "Excede el limite"
                        },
                        apellidos: {
                            required: "Campo obligatorio",
                            minlength: "<br><br><br>Muy corto",
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
