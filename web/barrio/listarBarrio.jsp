<%-- 
    Document   : listarBarrio
    Created on : 19/12/2017, 11:38:58 AM
    Author     : Kevin
--%>

<%@page import="modeloVO.BarrioVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BARRIOS</title>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.11/css/jquery.dataTables.css">
      
    </head>
    <body >
        <%@include file="../templates/header.jsp" %>

        <% ArrayList barrio = (ArrayList) request.getAttribute("barrio");
        %>

        <div class="content">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">      
  <div class="card-box">
                <br>
                <h1>BARRIOS</h1>
                <br>

                <form action="servletBarrio" method="POST">
                    <input type="hidden" name="opcion" value="2">
                    <input type="submit" class="btn btn-default btn-lg" value="Ingresar Barrio">
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



                <div class="table-responsive">
                    <table id="my" class="table table-striped" >
                        <thead >
                            <tr>
                                <th >ID</th>
                                <th >NOMBRE</th>
                          
                                <th></th>
                           

                            </tr>
                        </thead>
                        <!--Se recorre el listado para mostrarlo en la tabla -->
                        <tbody>
                            <%
                                if (barrio != null) {
                                    Iterator iterator = barrio.listIterator();
                                    while (iterator.hasNext()) {
                                        BarrioVO barrioVO = (BarrioVO) iterator.next();
                            %>
                            <tr style="border: 1px solid;">

                                <td ><%=barrioVO.getIdBarrio()%></td>
                                <td><%=barrioVO.getNombre()%></td>
                              

                                <td>
                                    <form method="POST" action="servletBarrio"  id="<%="form"+barrioVO.getIdBarrio()%>">
                                        <input type="hidden" name="opcion" value="4">
                                        <input type="hidden" name="idBarrio" value="<%=barrioVO.getIdBarrio()%>">
                                         <a class="send" data="<%=barrioVO.getIdBarrio()%>" href="#"><i class="fi-repeat"></i></a> 
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
