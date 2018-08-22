<%-- 
    Document   : vistaRecibo
    Created on : 4/03/2018, 08:17:03 AM
    Author     : Kevin
--%>

<%@page import="modeloDAO.HorariosDAO"%>
<%@page import="modeloVO.HorariosVO"%>
<%@page import="modeloVO.DetallePrendaVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="modeloVO.SolicitudVO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RECIBO</title>

    </head>
    <body>
        <%@include file="../templates/headerCliente.jsp" %>
        <% ArrayList recibo = (ArrayList) request.getAttribute("recibo");
            HorariosDAO hd = new HorariosDAO();
            if (recibo != null) {
                Iterator iterator = recibo.listIterator();

                while (iterator.hasNext()) {
                    SolicitudVO reciboVO = (SolicitudVO) iterator.next();

        %>

        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
                <div class="bg-faded p-4 my-4">
                    <div class="panel panel-success">
                        <div class="panel-heading">

                            <strong><h1>RECIBO SOLICITUD </h1></strong>
                        </div>

                        <div class="panel-body ">

                            <div class="form-group">
                                <label class="control-label">NOMBRE:   </label>
                                <label value="<%=reciboVO.getNombre()%>" class="control-label"><%=reciboVO.getNombre()%></label>
                            </div>
                            <div class="form-group">
                                <label class="control-label">NUMERO DOCUMENTO:   </label>
                                <label value="<%=reciboVO.getNumDoc()%>" class="control-label"><%=reciboVO.getNumDoc()%></label>
                            </div>
                            <div class="form-group">
                                <label class="control-label">NUMERO CELULAR:   </label>
                                <label value="<%=reciboVO.getNumCel()%>" class="control-label"><%=reciboVO.getNumCel()%></label>
                            </div>
                            <div class="form-group">
                                <label class="control-label">DIRECCION:   </label>
                                <label value="<%=reciboVO.getDireccion()%>" class="control-label"><%=reciboVO.getDireccion()%></label>
                            </div>
                            <div class="form-group">
                                <label class="control-label">CORREO:   </label>
                                <label value="<%=reciboVO.getCorreo()%>" class="control-label"><%=reciboVO.getCorreo()%></label>
                            </div>
                            <div class="form-group">
                                <label class="control-label">RECOLECCION SOLICITUD:   </label>
                                <label value="<%=reciboVO.getFechaRecoleccion()%>" class="control-label"><%=reciboVO.getFechaRecoleccion()%></label>
                            </div>
                            <div class="form-group">
                                <label class="control-label">ENTREGA SOLICITUD:   </label>
                                <label value="<%=reciboVO.getFechaEntrega()%>" class="control-label"><%=reciboVO.getFechaEntrega()%></label>
                            </div>
                            <div class="form-group">
                                <label class="control-label">HORA RECOLECCION:   </label>
                                <%
                                    ArrayList<HorariosVO> lista = hd.consultaId(reciboVO.getHoraRecoge());
                                    HorariosVO hv = new HorariosVO();
                                    for (int i = 0; i < lista.size(); i++) {
                                        hv = lista.get(i);
                                %>
                                <label value="<%=hv.getIdHorario()%>" class="control-label"><%=hv.getInicioHora()%> - <%=hv.getFinalHora()%></label>
                                <%}%>
                            </div>
                            <div class="form-group">
                                <label class="control-label">RANGO ENTREGA:   </label>
                                <%
                                    ArrayList<HorariosVO> listaEn = hd.consultaId(reciboVO.getHoraEntrega());
                                    HorariosVO hvo = new HorariosVO();
                                    for (int i = 0; i < listaEn.size(); i++) {
                                        hvo = listaEn.get(i);
                                %>
                                <label value="<%=hvo.getIdHorario()%>" class="control-label"><%=hvo.getInicioHora()%> - <%=hvo.getFinalHora()%></label>
                                <%}%>
                            </div>
                            <div class="form-group">
                                <label class="control-label">SERVICIO SOLICITADO:   </label>
                                <label value="<%=reciboVO.getNombreServicio()%>" class="control-label"><%=reciboVO.getNombreServicio()%></label>
                            </div>

                            <div class="form-group">
                                <label class="control-label">RECARGO:   </label>
                                <label class="control-label"><%=reciboVO.getPrecio() %></label>
                            </div>   
                            
                            <%
                                    } // cierre while    
                                } // cierre if
                            %>

                            <div class="form-group">
                                <label class="control-label">COSTO DEL SERVICIO:   </label>
                                <label class="control-label">${id}</label>
                            </div>     

                        </div>
                        <div class="panel-footer">


                            <div class="alert-success">DETALLE SOLICITUD: </div>
                            <div class="table-responsive">

                                <table class="table table-striped" >
                                    <thead >
                                        <tr>

                                            <th >TIPO </th>
                                            <th >TIPO PRENDA</th>

                                            <th>COLOR</th>
                                            <th >MATERIAL</th>
                                            <th >SERVICIO</th>
                                            <th >PRECIO</th>
                                            <th >DESCRIPCION</th>

                                        </tr>
                                    </thead>
                                    <!--Se recorre el listado para mostrarlo en la tabla -->
                                    <tbody>
                                        <%
                                            ArrayList prenda = (ArrayList) request.getAttribute("prendas");
                                        
                                            
                                            if (prenda != null) {
                                                Iterator iteratorP = prenda.listIterator();

                                                while (iteratorP.hasNext()) {
                                                    DetallePrendaVO prendaVO = (DetallePrendaVO) iteratorP.next();
                                        %>

                                        <tr style="border: 1px solid;">


                                            <td ><%=prendaVO.getIdDetalle()%></td>
                                            <td ><%=prendaVO.getNombrePrenda()%></td>
                                            <td><%=prendaVO.getNombreColor()%></td>

                                            <td><%=prendaVO.getNombreMaterial()%></td>
                                            <td><%=prendaVO.getNombreServicio()%></td>
                                            <td><%=prendaVO.getPrecdio()%></td>
                                            <td><%=prendaVO.getDescripcion()%></td>

                                        </tr>
                                        <%

                                            } // cierre while    %>
                                    </tbody>
                                </table>
                            </div>
                            <% }else if (prenda == null){ // cierre if%>

                            <div class="alert-warning">NO SE HAN REGISTRADO DETALLES</div>
                            <%}%>




                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../templates/footerCliente.jsp" %>
    </body>
</html>
