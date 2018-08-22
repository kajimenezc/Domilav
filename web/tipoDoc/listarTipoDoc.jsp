<%-- 
    Document   : listarTipoDoc
    Created on : 8/12/2017, 02:00:05 PM
    Author     : kev_i
--%>

<%@page import="modeloVO.TipoDocVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Permatex</title>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.11/css/jquery.dataTables.css">

    </head>
    <body>
 <%@include file="../templates/header.jsp" %>
        <% ArrayList tipoDoc = (ArrayList) request.getAttribute("tipoDoc");
        %>

       <div class="content">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">      

                        <div class="card-box">
                <br>
                <h1>TIPO DOCUMENTO</h1>
                <br>

                <form action="servletTipoDoc" method="POST">
                    <input type="hidden" name="opcion" value="2">
                    <input type="submit" class="btn btn-default btn-lg" value="Ingresar tipo documento">
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
                    <th >DESCRIPCON</th>
                    <th></th>
         

                </tr>
            </thead>
            <!--Se recorre el listado para mostrarlo en la tabla -->
            <tbody>
                <%
                    if (tipoDoc != null) {
                        Iterator iterator = tipoDoc.listIterator();
                        while (iterator.hasNext()) {
                            TipoDocVO tipoDocVO = (TipoDocVO) iterator.next();
                %>
                <tr style="border: 1px solid;">

                    <td><%=tipoDocVO.getIdTipoDoc()%></td>
                    <td><%=tipoDocVO.getNombre()%></td>
                    <td><%=tipoDocVO.getDescripcion()%></td>

                    <td>
                        <form method="POST" action="servletTipoDoc" id="<%="form"+tipoDocVO.getIdTipoDoc()%>">
                            <input type="hidden" name="opcion" value="4">
                            <input type="hidden" name="idTipoDoc" value="<%=tipoDocVO.getIdTipoDoc()%>">
                           <!-- <input type="submit"  class="btn btn-info" name="enviar" value="actualizar">-->
                         <a class="send" data="<%=tipoDocVO.getIdTipoDoc()%>" href="#"><i class="fi-repeat"></i></a> 
                        
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
        </div>
 <%@include file="../templates/footer.jsp" %>
</body>
</html>
