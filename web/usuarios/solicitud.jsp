<%-- 
    Document   : solicitud
    Created on : 18/01/2018, 01:17:24 PM
    Author     : Kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PERMATEX</title>
    </head>
    <body>
        <div class="row">
            <div class="col-sm-10">
                

                
                <div class="panel-group" id="accordion">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#solicitudUno">
        SOLICITUD SIN LOGEAR</a>
      </h4>
    </div>
    <div id="solicitudUno" class="panel-collapse collapse in">
        <div class="panel-body">
                <form action="Empresa" method="POST">
                    
                    <input type="hidden" id="documento" name="documento" value="1">
                    <input type="hidden" id="opcion" name="opcion" value="31">
                    <input type="hidden" id="estado" name="estado" value="activo">
                    
                   <!-- <input type="date" id="crear" name="crear"  > -->
                    <input type="date" id="recoger" name="recoger" >
                    <input type="date" id="entrega" name="entrega" >
                    
                    <input type="time" id="horaInicio" name="horaInicio">
                    <input type="time" id="horaEntrega" name="horaEntrega">
                    
                    <input type="text" id="descripcion" name="descripcion" >
                    
                    <input type="submit" value="confirmar" >
                    
                </form>
            
        </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#solicitudDos">
        SOLICITUD LOGEADO</a>
      </h4>
    </div>
    <div id="solicitudDos" class="panel-collapse collapse">
        <div class="panel-body">
            
        </div>
    </div>
  </div>
                
            
                
                
                
                
            </div>
        </div>
        </div>
    </body>
</html>
