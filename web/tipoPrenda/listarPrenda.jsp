<%-- 
    Document   : listarPrenda
    Created on : 3/02/2018, 05:09:25 PM
    Author     : Kevin
--%>


<%@page import="modeloVO.TipoPrendaVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TIPO PRENDA</title>
          <script src="javaScript/jquery-3.2.2.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.11/css/jquery.dataTables.css">
      
    </head>
    <body>
        <% ArrayList tipoPrenda = (ArrayList) request.getAttribute("tipoPrenda");

        %>
        <%@include file="../templates/header.jsp" %>
         <div class="content">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">      

<div class="card-box">

        <br>
        <h1>LISTAR TIPOS DE PRENDAS</h1>
        <br>
         <form action="servletTipoPren" method="POST" >
             
        <input type="hidden" name="opcion" value="2">
        <input type="submit" id="inicio" name="inicio" value="INGRESAR TIPO DE PRENDAS" class="form-control" >
    </form>
        <br>
        <% String resp = (String) request.getAttribute("mensaje");

                    if (resp != null) {%>

                <div class="alert alert-success">
                    <strong>PROCESO EXITOSO!</strong> <%=resp%>
                </div>

                <%
                    } 
                %>
                <br>
        
      


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
                <%                                if (tipoPrenda != null) {
                        Iterator iterator = tipoPrenda.listIterator();
                        while (iterator.hasNext()) {
                            TipoPrendaVO tipoPrendaVO = (TipoPrendaVO) iterator.next();
                %>
                <tr style="border: 1px solid;">

                    <td><%=tipoPrendaVO.getIdTipoPrenda()%></td>
                    <td><%=tipoPrendaVO.getNombre()%></td>
                    <td><%=tipoPrendaVO.getDescripcion()%></td>

                    <td>
                        <form method="POST" action="servletTipoPren" id="<%="form"+tipoPrendaVO.getIdTipoPrenda()%>">
                            <input type="hidden" name="opcion" value="4">
                            <input type="hidden" name="idPrenda"  value="<%=tipoPrendaVO.getIdTipoPrenda()%>">
                            <a class="send" data="<%=tipoPrendaVO.getIdTipoPrenda()%>" href="#"><i class="fi-repeat"></i></a>

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
