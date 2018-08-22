<%-- 
    Document   : nuevaContra
    Created on : 12/04/2018, 10:37:47 AM
    Author     : prueva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reestablecer contraseña</title>
        <link href="estilo.css" rel="stylesheet" type="text/css"/>
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
        <%@include file="templates/headerIndex.jsp" %>
       <%
            String exito = (String) request.getAttribute("exito");
            String error = (String) request.getAttribute("error");
        %>
        <div class="container">
            <div class="bg-faded p-4 my-4">
                <div class="panel-group">
                    <div class="panel-panel-default">
                        <div class="panel-heading">
                            <div class="panel-title">
                                <h3>
                                    <a>RECUPERACION DE CONTRASEÑA</a>
                                </h3>

                            </div>

                            <div id="pass">
                                <form action="servletContra" method="POST"  >
                                    <input type="hidden" value="3" name="opcion">
                                    <div class="panel-body">
                                        <div class="form-group">
                                           <label for="doc">Documento: </label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="doc" name="doc">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                           <label for="nueva">Contraseña nueva: </label>
                                            <div class="col-sm-10">
                                                <input type="password" class="form-control" id="nueva" name="nueva">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="confirma" class="control-label col-sm-2">Confirme contraseña: </label>
                                            <div class="col-sm-10">
                                                <input type="password" class="form-control" id="confirma" name="confirma" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <div class="alert-danger" id="resp" ></div>
                                    </div>
                                    <br>
                                    <input type="submit" id="valida" class="btn btn-default" value="Enviar">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                                    <div class="panel-footer">
                <% if (exito != null) {%>


                <div id="msg" class="alert-success">${exito}</div>


                <%} else if (error != null) {%>
                <div class="alert-danger">${error}</div>
                <% }%>



            </div>
        </div>
 <%@include file="/templates/footerIndex.jsp" %>
    </body>
</html>
