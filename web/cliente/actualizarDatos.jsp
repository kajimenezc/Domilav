<%-- 
    Document   : actualizarDatos
    Created on : 8/03/2018, 01:58:05 PM
    Author     : prueva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Domilav</title>
         <script src="javaScript/jquery-3.2.2.min.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
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
            });
        </script>
        
        
        
    </head>
    <body>
        <%@include file="../templates/headerCliente.jsp" %>
       <%
            String exito = (String) request.getAttribute("exito");
            String error = (String) request.getAttribute("error");

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
                                    <li class="breadcrumb-item active">Actualización de Datos</li>
                                </ol>
                            </div>
                            <h4 class="page-title">Actualización de Datos</h4>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card-box">
                            <h4 class="m-t-0 header-title">Actualización de Datos</h4>
                            <p class="text-muted m-b-30 font-14">
                                Ingrese la información a Actualizar:
                            </p>
                            <form id="formAct"  action="servletCliente" method="POST" class="form-horizontal" >
                                <input type="hidden" name="opcion" value="5">
                                <input type="hidden" name="idPersona" id="idPersona" value="<%=pv.getIdPersona()%>" > 
                                <div class="form-group">
                                    <label for="nombres" class="control-label col-sm-2">Nombres: </label>
                                    <input type="text" class="form-control" id="nombres" name="nombres" value="<%=pv.getNombres().toUpperCase()%>" disabled title="Este campo no se puede modificar">
                                </div>
                                <div class="form-group">
                                    <label for="apellidos" class="control-label col-sm-2">Apellidos: </label>
                                    <input type="text" class="form-control" id="apellidos" name="apellidos" value="<%=pv.getApellidos().toUpperCase()%>" disabled title="Este campo no se puede modificar">
                                </div>
                                <div class="form-group">
                                    <input type="hidden" name="opcion" value="5">
                                    <label for="documento" class="control-label col-sm-2">Documento: </label>
                                    <input type="text" class="form-control" id="documento" name="documento" value="<%=pv.getDocumento()%>" disabled title="Este campo no se puede modificar">
                                </div>
                                <div class="form-group">
                                    <label for="celular" class="control-label col-sm-2">Celular: </label>
                                    <input type="text" class="form-control" id="celular" name="celular" value="<%=pv.getNumCelular()%>">
                                </div>
                                <div class="form-group">
                                    <label for="NumFijo" class="control-label col-sm-2">Num Fijo: </label>
                                    <input type="text" class="form-control" id="NumFijo" name="fijo" value="<%=pv.getNumFijo()%>">
                                </div>
                                <div class="form-group">
                                    <label for="direccion" class="control-label col-sm-2">Direccion: </label>
                                    <input type="text" class="form-control" id="direccion" name="direccion" value="<%=pv.getDireccion()%>">
                                </div>
                                <div class="form-group">
                                    <label for="correo" class="control-label col-sm-2">Correo: </label>
                                    <input type="text" class="form-control" id="correo" name="correo" value="<%=pv.getCorreo()%>">
                                </div>
                                <button type="submit" name="guardar" class="btn btn-outline-info waves-light waves-effect">Actualizar</button>
                            </form>
                        </div>
                        <div class="panel-footer">
                            <% if (exito != null) {%>
                                <div id="msg" class="alert-success">${exito}</div>
                            <%} else if (error != null) {%>
                                <div class="alert-danger">${error}</div>
                            <% }%>
                        </div>
                        <div class="card-box">
                            <h4 class="m-t-0 header-title"><a data-toggle="collapse" href="#pass">Cambiar Contraseña</a></h4>
                            <div id="pass" class="panel-collapse collapse">
                                <form id="formAct" action="servletCliente" method="POST"  >
                                    <input type="hidden" name="idPersona" value="<%=pv.getIdPersona()%>" > 
                                    <input type="hidden" value="6" name="opcion">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <label for="actual" class="control-label col-sm-2">Actual: </label>
                                            <input type="password" class="form-control" id="actual" name="actual" >
                                        </div>
                                        <div class="form-group">
                                            <label for="nueva" class="control-label col-sm-2">Contraseña nueva: </label>
                                            <input type="password" class="form-control" id="nueva" name="nueva">
                                        </div>
                                        <div class="form-group">
                                            <label for="confirma" class="control-label col-sm-2">Cofirme contraseña: </label>
                                            <input type="password" class="form-control" id="confirma" name="confirma" >
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <div class="alert-danger" id="resp" ></div>
                                    </div>
                                    <br>
                                    <button type="submit" id="valida" class="btn btn-outline-info waves-light waves-effect">Actualizar</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end page title end breadcrumb -->
            </div>
        </div>

        <%@include file="../templates/footerCliente.jsp" %>
        
        <style>
            .error{color:red}
        </style>
        
         <script src="javaScript/jquery.validate_1.js" type="text/javascript"></script>
        <script src="javaScript/additional-methods.js" type="text/javascript"></script>

        <script>
              $(document).ready(function () {
                  
                    // Validar si hay datos en la base de datos
               /* $(function () {
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
                });*/
                  



                $("#formAct").validate({
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
                            minlength: 8,
                            maxlength: 18
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
                            maxlength: 30
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
                        }
                    }

                });
                });
            
        </script>
    </body>
</html>
