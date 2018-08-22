 <%-- 
    Document   : contacto
    Created on : 22/03/2018, 07:33:43 PM
    Author     : prueva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contactenos</title>
          <link rel="shortcut icon" href="img/favicon.png"/> 
    
    </head>
    <body>
        <%@include file="templates/headerIndex.jsp" %>
        <div class="container">
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
            <br>
            <div class="bg-faded p-4 my-4">
                <center>  
                    <div class="table table-responsive">
                    <div id="mapa" style="width: 700px;height:400px"> </div>
                    </div>
                
                </center>
                 <script>
      function initMap() {
        var uluru = {lat: 4.688655, lng: -74.104511};
        var mapa = new google.maps.Map(document.getElementById('mapa'), {
          zoom: 4,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: mapa
        });
      }
    </script>
    
            </div>
            
        </div>
         <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAB4fY8gJ6UhNNlrV-yTMWd-sTevCFg_Gw&callback=initMap">
    </script>
        <%@include file="templates/footerCliente.jsp" %>
    </body>
</html>
