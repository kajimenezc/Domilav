<%-- 
    Document   : actualizarEmpl
    Created on : 26/02/2018, 10:15:18 PM
    Author     : Kevin
--%>

<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="modeloVO.PersonaVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACTUALIZAR EMPLEADO</title>

        <script src="javaScript/jquery-3.2.2.min.js" type="text/javascript"></script>

        <script>


            $(document).ready(function () {
                //variables
                var pass1 = $('[name=nueva]');
                var pass2 = $('[name=confirma]');
                var confirmacion = "Las contraseñas si coinciden";
                var longitud = "La contraseña debe estar formada entre 6-10 carácteres (ambos inclusive)";
                var negacion = "No coinciden las contraseñas";
                var vacio = "La contraseña no puede estar vacía";
                //oculto por defecto el elemento span
                var span = $('<div class="alert alert-info"></div>').insertAfter(pass2);
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
        <%@include file="../templates/header.jsp" %>

        <div class="content">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">      

  <div class="card-box">
                <center> <h1>ACTUALIZACION DE PERFIL</h1></center><br><br>
                    <%
                        /*  HttpSession sesion = (HttpSession) request.getSession();
                         PersonaVO empl = (PersonaVO) sesion.getAttribute("persona");*/
                        String exito = (String) request.getAttribute("exito");
                        String error = (String) request.getAttribute("error");


                    %>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <form id="formAct"  action="servletEmpleado" method="POST" class="form-horizontal" >
                            <input type="hidden" name="opcion" value="5">
                            <input type="hidden" name="idPersona" id="idPersona" value="<%=pv.getIdPersona()%>" > 
                            <div class="form-group">
                                <label for="nombres" class="control-label col-sm-2">Nombres: </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="nombres" name="nombres" value="<%=pv.getNombres()%>" disabled title="Este campo no se puede modificar">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="apellidos" class="control-label col-sm-2">Apellidos: </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="apellidos" name="apellidos" value="<%=pv.getApellidos()%>" disabled title="Este campo no se puede modificar">
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="hidden" name="opcion" value="6">

                                <label for="documento" class="control-label col-sm-2">Documento: </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="documento" name="documento" value="<%=pv.getDocumento()%>" disabled title="Este campo no se puede modificar">
                                </div>
                            </div>


                            <div class="form-group">
                                <label for="celular" class="control-label col-sm-2">Celular: </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="celular" name="celular" value="<%=pv.getNumCelular()%>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="NumFijo" class="control-label col-sm-2">Num Fijo: </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="NumFijo" name="fijo" value="<%=pv.getNumFijo()%>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="direccion" class="control-label col-sm-2">Direccion: </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="direccion" name="direccion" value="<%=pv.getDireccion()%>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="correo" class="control-label col-sm-2">Correo: </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="correo" name="correo" value="<%=pv.getCorreo()%>">
                                </div>
                            </div>
                            <input type="submit" value="ACTUALIZAR" class="btn btn-default" name="guardar">
                        </form>
                    </div>   <div class="panel-footer">
                        <% if (exito != null) {%>


                        <div class="alert-success">${exito}</div>


                        <%} else if (error != null) {%>
                        <div class="alert-danger">${error}</div>
                        <% }%>



                    </div>
                </div>
                <br>



                <div class="panel-group">
                    <div class="panel-panel-default">
                        <div class="panel-heading">
                            <div class="panel-title">
                                <h3>
                                    <a data-toggle="collapse" href="#pass">CAMBIAR CONTRASEÑA</a>
                                </h3>
                                <p>SE RECOMIENDA UNA CONTRASEÑA QUE NO USE EN OTRO SITIO.</p>

                            </div>

                            <div id="pass" class="panel-collapse collapse">
                                <form action="servletEmpleado" method="POST"  >
                                    <input type="hidden" name="idPersona" value="<%=pv.getIdPersona()%>" > 
                                    <input type="hidden" value="6" name="opcion">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <label for="actual" class="control-label col-sm-2">Actual: </label>
                                            <div class="col-sm-10">
                                                <input type="password" class="form-control" id="actual" name="actual" >
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="nueva" class="control-label col-sm-2">Contraseña nueva: </label>
                                            <div class="col-sm-10">
                                                <input type="password" class="form-control" id="nueva" name="nueva">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="confirma" class="control-label col-sm-2">Cofirme contraseña: </label>
                                            <div class="col-sm-10">
                                                <input type="password" class="form-control" id="confirma" name="confirma" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <div class="alert-danger" id="resp" ></div>
                                    </div>
                                    <br>
                                    <input type="submit" id="valida" class="btn btn-default" value="ACTUALIZAR">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        </div>
        </div>
        </div>

        <%@include file="../templates/footer.jsp" %>
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
                });
        </script>
    </body>
</html>
