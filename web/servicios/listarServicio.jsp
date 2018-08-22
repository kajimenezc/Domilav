<%-- 
    Document   : listarServicio
    Created on : 30/11/2017, 05:56:54 PM
    Author     : kev_i
--%>

<%@page import="modeloVO.TipoServicioVO"%>
<%@page import="modeloVO.AgenciaVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SERVICIOS</title>
    
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.11/css/jquery.dataTables.css">

      
    </head>
    <body>
        <%@include file="../templates/header.jsp" %>
        <% ArrayList servicio = (ArrayList) request.getAttribute("servicio");
        %>

 <div class="content">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">      

                <br>
                <h1>SERVICIOS</h1>
                <br>

                <form action="servletServicio" method="POST">
                    <input type="hidden" name="opcion" value="2">
                    <input type="submit" class="btn btn-default btn-lg" value="Ingresar servicio">
                </form>

                <br>
                <br>
                <% String resp = (String) request.getAttribute("mensaje");

                    if (resp != null) {%>

                <div class="alert alert-success">
                    <strong>PROCESO EXITOSO!</strong> <%=resp%>
                </div>

                <%
                    }
                %>
      
          
                <div class="table table-responsive">
            <table id="my" class="table table-striped" >
                <thead >
                    <tr>
                        <th >ID</th>
                        <th >NOMBRE</th>
                        <th >TIEMPO</th>
                        <th >PRECIO</th>
                        <th >DESCRIPCIÓN</th>
                        <th >IMAGEN</th>
                        <th>ACTUALIZAR</th>
                        <th>ELIMINAR</th>
                        
                    </tr>
                </thead>
                <!--Se recorre el listado para mostrarlo en la tabla -->
                <tbody>
                    <%
                        if (servicio != null) {
                            Iterator iterator = servicio.listIterator();
                            while (iterator.hasNext()) {
                                TipoServicioVO tipoServicioVO = (TipoServicioVO) iterator.next();
                    %>
                    <tr style="border: 1px solid;">

                        <td><%=tipoServicioVO.getIdTipoServicio()%></td>  
                        <td ><%=tipoServicioVO.getNombre()%></td>
                        <td><%=tipoServicioVO.getPrecio()%></td>
                        <td><%=tipoServicioVO.getTiempo()%></td>
                        <td><%=tipoServicioVO.getDescripcion()%></td>
                        <!--<td><img width="200px" height="100px" src="img/"></td>-->
                        <td><img width="200px" height="100px" src="data:image/png;base64,<%=tipoServicioVO.getImagen()%>"></td>

                        <td>
                          <form method="POST" action="servletTipoServ" id="<%="form"+tipoServicioVO.getIdTipoServicio()%>">
                            <input type="hidden" name="opcion" value="4">
                            <input type="hidden" name="idServicio" value="<%=tipoServicioVO.getIdTipoServicio()%>">
                       
                             <a class="send" data="<%=tipoServicioVO.getIdTipoServicio()%>" href="#"><i class="fi-repeat"></i></a> 
                        </form>  
                        </td>
                        <td>
                              <form method="POST" action="servletTipoServ" id="<%="formDel"+tipoServicioVO.getIdTipoServicio()%>">
                            <input type="hidden" name="opcion" value="6">
                            <input type="hidden" name="idServicio" value="<%=tipoServicioVO.getIdTipoServicio()%>">
                            <a class="sendDel" data="<%=tipoServicioVO.getIdTipoServicio()%>" href="#"><i class="fi-trash"></i></a>
                        </form>
                        </td>
                    </tr>
                    <%
                            } // cierre while    
                        } // cierre if
                    %>

                </tbody>
            </table>
                </div>
            </div>
              
 </div>
 </div>
 </div>


       

      

        <%@include file="../templates/footer.jsp" %>
    </body>

</html>
