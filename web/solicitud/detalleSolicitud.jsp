<%-- 
    Document   : detalleSolicitud
    Created on : 28/02/2018, 01:23:49 PM
    Author     : Kevin
--%>


<%@page import="modeloVO.TipoServicioVO"%>
<%@page import="modeloVO.ColorVO"%>
<%@page import="modeloVO.MaterialVO"%>
<%@page import="modeloVO.SolicitudVO"%>
<%@page import="modeloVO.TipoPrendaVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DETALLE</title>
    </head>
    <body> 
        <% SolicitudVO solicitudVO = (SolicitudVO) request.getAttribute("solicitud");
        
        %>


        <%@include file="../templates/header.jsp" %>
       <div class="content">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">      

          <div class="card-box">
        <h1>PRENDAS DE LA SOLICITUD</h1>
        <br>
         <%
               String mensaje = (String) request.getAttribute("mensaje");

               if (mensaje != null) {%>

        <div class="alert alert-success">
            <strong>¡PROCESO EXITOSO!<%=mensaje%></strong> 
        </div>
 
        <%
            }
        %>          
        <br>
        
        
        <form   action="servletDetalle" method="POST" class="form-horizontal" >

            <input type="hidden" name="opcion" value="3">
            <input type="hidden" name="idSolicitud" value="<%=solicitudVO.getIdSolicitud()%>" >
            <div class="form-group">
                <label for="idSolicitud" class="control-label col-sm-2">ID solicitud: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="idSolicitud" name="idSolicitud" value="<%=solicitudVO.getIdSolicitud()%>" disabled="" title="">

                </div>
            </div>

            <div class="form-group">
                <%
                    ArrayList prenda = (ArrayList) request.getAttribute("prenda");
                    if (prenda != null) {
                        Iterator iterator = prenda.listIterator();

                %>


                <label for="prenda" class="control-label col-sm-2">PRENDA: </label>
                <div class="col-sm-10">
                    <select name="prenda" class="form-control">
                        <%                    while (iterator.hasNext()) {
                                TipoPrendaVO tipoPrendaVO = (TipoPrendaVO) iterator.next();
                        %>

                        <option value="<%=tipoPrendaVO.getIdTipoPrenda()%>"><%=tipoPrendaVO.getNombre()%></option>
                        <% }
                            }%>
                    </select>
                </div>
            </div>

                     <div class="form-group">
                <%
                    ArrayList color = (ArrayList) request.getAttribute("color");
                    if (color != null) {
                        Iterator iterator = color.listIterator();

                %>


                <label for="color" class="control-label col-sm-2">COLOR: </label>
                <div class="col-sm-10">
                    <select name="color" class="form-control">
                        <%                    while (iterator.hasNext()) {
                                ColorVO colorVO = (ColorVO) iterator.next();
                        %>

                        <option value="<%=colorVO.getIdColor()%>"><%=colorVO.getNombre()%></option>
                        <% }
                            }%>
                    </select>
                </div>
            </div>
                    
                     <div class="form-group">
                <%
                    ArrayList material = (ArrayList) request.getAttribute("material");
                    if (material != null) {
                        Iterator iterator = material.listIterator();

                %>


                <label for="material" class="control-label col-sm-2">MATERIAL: </label>
                <div class="col-sm-10">
                    <select name="material" class="form-control">
                        <%                    while (iterator.hasNext()) {
                                MaterialVO materialVO = (MaterialVO) iterator.next();
                        %>

                        <option value="<%=materialVO.getIdMaterial()%>"><%=materialVO.getNombre()%></option>
                        <% }
                            }%>
                    </select>
                </div>
            </div>
                     <div class="form-group">
                <%
                    ArrayList servicio = (ArrayList) request.getAttribute("servicio");
                    if (servicio != null) {
                        Iterator iterator = servicio.listIterator();

                %>


                <label for="servicio" class="control-label col-sm-2">SERVICIO: </label>
                <div class="col-sm-10">
                    <select name="servicio" class="form-control">
                        <%                    while (iterator.hasNext()) {
                               TipoServicioVO servicioVO = (TipoServicioVO) iterator.next();
                        %>

                        <option value="<%=servicioVO.getIdTipoServicio() %>"><%=servicioVO.getNombre()%></option>
                        <% }
                            }%>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="precio" class="control-label col-sm-2">PRECIO: </label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" id="precio" name="precio" required >
                </div>
            </div>
            <div class="form-group">
                <label for="descripcion" class="control-label col-sm-2">DESCRIPCIÓN: </label>
                <div class="col-sm-10">
                     <textarea class="form-control" id="descripcion" name="descripcion"  ></textarea>
                </div>
            </div>
            <div class="form-group">    
                <div class="col-sm-offset-2 col-sm-10">

                    <input type="submit" class="form-control" id="enviar" name="guardar" value="confirmar">

                </div>
            </div>
        </form>
                
                    
                     <form action="servletSolicitud" method="POST">
                    <input type="hidden" name="opcion" value="1">
                    <input type="submit" class=" form-control" name="listar" value="VOLVER">
                </form>          
                    

       
            </div>
            </div>
            </div>
            </div>
            </div>
    <%@include file="../templates/footer.jsp" %>
    </body>
</html>
