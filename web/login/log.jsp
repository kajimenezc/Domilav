<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Permatex</title>
        <!-- Meta tags -->
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Stunning sign up & login Form Responsive Widget, Audio and Video players, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design"
              />
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
        <link rel="stylesheet" href="css/font-awesome.min.css" />
        <!-- //font-awesome icons -->
        <!--stylesheets-->
        <link href="css/style.css" rel='stylesheet' type='text/css' media="all">
        <!--//style sheet end here-->

        <link href="//fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">
        <script src="../javaScript/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../javaScript/jquery-3.2.2.min.js" type="text/javascript"></script>
        <script src="../javaScript/jquery-3.3.1.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script> 
        <script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    </head>

    <body>
        <h1 class="header-w3ls">
            <a href="../index.jsp" style="color: white;"><img src="9.png" alt=""/>
            </a></h1>

        <div class="mid-cls">
            <!-- <div class="swm-left-w3ls" id="registra" style="display: none;" >
                 <form action="#" method="post">
                     <div class="main">
                         <div class="icon-head-wthree">
                             <h2><span class="fa fa-diamond t-w3" aria-hidden="true"></span></h2>
                             <h4>Registrate</h4>
                         </div>
                         <div class="form-left-to-w3l">
 
                             <input type="text" name="name" placeholder="Name" required="">
                             <div class="clear"></div>
                         </div>
                         <div class="form-left-to-w3l">
 
                             <input type="text" name="name" placeholder="Last Name" required="">
                             <div class="clear"></div>
                         </div>
                         <div class="form-left-w3l">
 
                             <input type="email" name="email" placeholder="Email" required="">
                         </div>
                         <div class="form-right-w3ls ">
 
                             <input type="password" name="password" placeholder="Password" required="">
 
                             <div class="clear"></div>
                         </div>
                         <div class="btnn">
                             <button type="submit">Aceptar</button><br>
                             <center><a href="#" class="for" id="inicia">¿Ya tienes cuenta?<br>Incia Sesion</a>  </center>
                             <div class="clear"></div>
                         </div>
                     </div>
 
                 </form>-->
            <!--      <div class="swm-left-w3ls" id="registra" style="display: none;" >
                      <form action="#" method="post">
                          <div class="main">
                              <div class="icon-head-wthree">
                                  <h2><span class="fa fa-diamond t-w3" aria-hidden="true"></span></h2>
                                  <h4>Registrate</h4>
                              </div>
                              <div class="form-right-w3ls">
      
                                  <input type="text" name="name" placeholder="Name" required="">
                                  <div class="clear"></div>
                              </div>
                              <div class="form-left-w3l">
      
                                  <input type="text" name="name" placeholder="Last Name" required="">
                                  <div class="clear"></div>
                              </div>
      
                              <div class="form-left-w3l">
      
                                  <input type="email" name="email" placeholder="Email" required="">
                              </div>
                              <div class="form-right-w3ls ">
      
                                  <input type="password" name="password" placeholder="Password" required="">
      
                                  <div class="clear"></div>
                              </div>
                              <div class="btnn">
                                  <button type="submit">Aceptar</button><br>
                                  <center><a href="#" class="for" id="inicia">¿Ya tienes cuenta?<br>Incia Sesion</a>  </center>
                                  <div class="clear"></div>
                              </div>
                          </div>
      
                      </form>
      
                  </div>-->
            <div class="swm-left-w3ls" style="display: none;">

                <div class="icon-head-wthree">
                    <h2><span class="fa fa-diamond t-w3" aria-hidden="true"></span></h2>
                    <h4>Registrate</h4>
                </div>

                <div class="main">
                    <form action="../servletCliente" id="formCliente" method="POST" class="form-horizontal">
                        <input type="hidden" name="opcion" value="2" >                       

                        <div class="form-left-w3l" style="width:500px; padding:3px;">
                            <input type="text" name="nombres" id="nombres" placeholder="Nombres" required="" style="width:245px; float:left;">
                            <input type="text" name="apellidos" placeholder="Apellidos" id="apellidos" required="" style="width:245px; float:right;">

                            <div class="clear"></div>
                        </div>


                        <div class="form-left-w3l">
                            <input type="text" name="documento" placeholder="Documento" id="documento" required=""><br><span id="valDoc"></span>
                            <div class="clear"></div>
                        </div>



                        <div class="form-left-w3l" style="border: 1px solid white; 
                             width: 280px; background-color: white; ">
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
                            <div class="clear"></div>
                        </div>                                                                               


                        <div class="form-left-w3l">
                            <input type="text" name="usuario" placeholder="Usuario" id="user" required="">
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
                        <div class="btnn">
                            <button type="submit">Aceptar</button><br>
                            <center><a href="#" class="for" id="inicia">¿Ya tienes cuenta?<br>Incia Sesion</a>  </center>
                            <div class="clear"></div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="swm-right-w3ls">
                <div class="main">
                    <form action="../loginServlet" method="POST">
                        <input type="hidden" name="opcion" value="2" >
                        <div class="icon-head-wthree">
                            <h2><span class="fa fa-diamond t-w3" aria-hidden="true"></span></h2>
                            <h4>Iniciar Sesion</h4>
                        </div>
                        <div class="form-left-w3l">

                            <input type="text" name="user" id="user" placeholder="Usuario" required="">

                            <div class="clear"></div> 
                        </div> 		   
                        <div class="form-right-w3ls ">

                            <input type="password" name="pass" id="pass" placeholder="Password" required="">

                            <div class="clear"></div>
                        </div>

                        <button type="submit">Ingresar</button><br>
                    </form>
                    <div class="btnn">

                        <a href="#" class="for" >¿Olvidó su contraseña?</a>  
                        <center><a href="#" class="for" id="registrar">¿Aún no tienes cuenta?<br>Registrate.</a>  </center>


                    </div>	
                </div>

            </div>
        </div>

        <div class="copy">
            <script>
            $(document).ready(function () {

                $("#registrar").click(function () {
                    $('.swm-left-w3ls').slideDown(2000);
                    $('.swm-right-w3ls').slideUp(2000);
                });
                $("#inicia").click(function () {
                    $('.swm-left-w3ls').slideUp(2000);
                    $('.swm-right-w3ls').slideDown(2000);
                });
            });
            </script>
            <p>&copy;2018 Domilav. Todos los derechos reservados.</p>


        </div>
    </body>
</html>