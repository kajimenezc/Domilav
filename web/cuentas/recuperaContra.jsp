<%-- 
    Document   : login
    Created on : 18/12/2017, 11:29:46 AM
    Author     : Kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recuperar Contraseña</title>
        <link href="login/css/style.css" rel='stylesheet' type='text/css' media="all">
        <script src='https://www.google.com/recaptcha/api.js'></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.2.3/jquery.min.js"></script>
        <script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

    </head>
    <body>
        <h1 class="header-w3ls"></h1>
        <div class="mid-cls">
            <div class="swm-right-w3ls">
                <div class="main">
                    <form action="servletContra" method="POST">
                        <input type="hidden" name="opcion" value="2">
                        <div class="icon-head-wthree">
                            <a href="index.jsp"><img src="login/altlogo_1.png"/><BR><br><br></a>
                            <h1 style="font-family:'Montserrat', sans-serif; font-weight:600;
                                letter-spacing:2px; font-size: 150%; color: white;"> Reestablecer Contraseña</h1><br><br>
                                <p style="color: white;">Podemos ayudarle a restablecer su contraseña. 
                                    Por favor ingrese la siguiente información.</p><br><br>
                        </div>
                        <div class="form-left-w3l">
                            <input type="text" name="correo" id="correo" placeholder="Correo" required="">
                            <div class="clear"></div> 
                        </div> 		   

                        <div class="form-right-w3ls ">
                            <input type="password" name="documento" id="documento" placeholder="Documento" required="">
                            <div class="clear"></div>
                        </div>

                        <button type="submit" id="conti">Ingresar</button><br>
                        <%@include file="../templates/mensajes.jsp" %>

                    </form>	
                </div>
            </div>
        </div>	

        <div class="copy">          
            <p>&copy;2018 Domilav. Todos los derechos reservados.</p>
        </div>
    </body>
</html>

