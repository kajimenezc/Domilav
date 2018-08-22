<%-- 
    Document   : insertarSolicitud
    Created on : 11/02/2018, 12:04:14 PM
    Author     : Kevin
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SOLICITUD</title>
    </head>
    <body>
        <%

            DateFormat formato = new SimpleDateFormat("dd/MM/yyyy");

        %>
        <%@include file="../templates/header.jsp" %>
        <div class="panel-group" id="accordion">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#solicitudUno">
                            SOLICITUD LOGUEADO</a>
                    </h4>
                </div>
                <div id="solicitudUno" class="panel-collapse collapse in">
                    <div class="panel-body">
                        <form action="servletSolicitud" method="POST" class="form-horizontal" >

                           // <input type="hidden" id="documento" name="documento" value="1">
                            <input type="hidden" id="opcion" name="opcion" value="3">
                            <input type="hidden" id="estado" name="estado" value="activo">



                            <div class="panel panel-primary">
                                <div class="panel-heading">RECOLECCIÓN</div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="recoger">Fecha de recoleccion:</label>
                                        <div class="col-sm-10">

                                            <input type="date" id="recoger" name="recoger" class="form-control" min="<%=formato.format(new Date())%>"  step="3" >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="entrega">Fecha de entrega:</label>
                                        <div class="col-sm-10">
                                            <input type="date" id="entrega" name="entrega" min="<%=formato.format(new Date())%>" step="3" class="form-control" >
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-md-6" >
                                            <input type="button" value="HORA DE RECOLECCIÓN" class="form-control btn btn-succes" data-toggle="modal" data-target="#inicio">
                                        </div>

                                        <div class="col-md-6" >
                                            <input type="button" value="HORA DE ENTREGA" class="form-control btn btn-success" data-toggle="modal" data-target="#final">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="descripcion">Descripción:</label>
                                        <div class="col-sm-10">

                                            <input type="text" id="descripcion" name="descripcion" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-10">

                                            <input  type="submit" value="confirmar"  class="form-control">
                                        </div>
                                    </div>   
                                         </div>
                            </div>
                                    </form>

                               
                    </div>
                </div>
                                        <!-- Modal -->
                            <div id="inicio" class="modal fade" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                                <h2 class="modal-title">ASIGNAR HORAS</h2>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        
                                        </div>
                                        <div class="modal-body">
                                            <h5>Seleccione la hora en la cual se realize la recolección.</h5>
                                            <div class="radio">
                                                <label><input type="radio" id="horaInicio" name="horaInicio" value="09:00:00">9:00 AM</label>
                                            </div>
                                            <div class="radio">
                                                <label><input type="radio" id="horaInicio" name="horaInicio" value="14:00:00">2:00 PM</label>
                                            </div>
                                            <div class="radio">
                                                <label><input type="radio" id="horaInicio" name="horaInicio" value="17:00:00">5:00 PM</label>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>

                                </div>
                            </div>

                                  <!-- Modal -->
                            <div id="final" class="modal fade" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                             <h2 class="modal-title">ASIGNAR HORAS</h2>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                           
                                        </div>
                                        <div class="modal-body">
                                            <h5>Seleccione la hora en la cual se realize la entrega.</h5>
                                            <div class="radio">
                                                <label><input type="radio" id="horaEntrega" name="horaEntrega" value="09:00:00">9:00 AM</label>
                                            </div>
                                            <div class="radio">
                                                <label><input type="radio" id="horaEntrega" name="horaEntrega" value="14:00:00">2:00 PM</label>
                                            </div>
                                            <div class="radio">
                                                <label><input type="radio" id="horaEntrega" name="horaEntrega" value="17:00:00">5:00 PM</label>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#solicitudDos">
                                SOLICITUD SIN LOGEAR</a>
                        </h4>
                    </div>
                    <div id="solicitudDos" class="panel-collapse collapse">
                        <div class="panel-body">
                            <form action="servletSolicitud" method="POST" class="form-horizontal" >


                                <input type="hidden" id="opcion" name="opcion" value="5">


                                <div class="form-group">
                                    <label for="nombre" class="control-label col-sm-2">Nombre: </label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="nombre" name="nombre" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="direccion" class="control-label col-sm-2">direccion: </label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="direccion" name="direccion" >
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="documento" class="control-label col-sm-2">Documento: </label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="documento" name="documento" >
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="correo" class="control-label col-sm-2">correo: </label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="correo" name="correo" >
                                    </div>
                                </div>



                                <div class="form-group">
                                    <label for="tel" class="control-label col-sm-2">Telefono: </label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="tel" name="tel" >
                                    </div>
                                </div>

                                <!-- <input type="date" id="crear" name="crear"  --> 

                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="recoger">Fecha de recoleccion:</label>
                                    <div class="col-sm-10">

                                        <input type="date" id="recoger" name="recoger" class="form-control" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="entrega">Fecha de entrega:</label>
                                    <div class="col-sm-10">
                                        <input type="date" id="entrega" name="entrega" class="form-control" >
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="horaInicio">Hora recoge:</label>
                                    <div class="col-sm-10">

                                        <input type="time" id="horaInicio" name="horaInicio" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="horaEntrega">Hora entrega:</label>
                                    <div class="col-sm-10">

                                        <input type="time" id="horaEntrega" name="horaEntrega" class="form-control">
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="descripcion">Descripción:</label>
                                    <div class="col-sm-10">

                                        <input type="text" id="descripcion" name="descripcion" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <div class="col-sm-10">

                                        <input type="submit" value="confirmar"  class="form-control">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    </div>
                </div>
        </div>

                <%@include file="../templates/footer.jsp" %>
                </body>
                </html>
