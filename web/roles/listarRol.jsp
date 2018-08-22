<%-- 
    Document   : listarRol
    Created on : 30/11/2017, 05:57:32 PM
    Author     : kev_i
--%>

<%@page import="modeloDAO.RolDAO"%>
<%@page import="modeloVO.RolVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ROLES</title>
        <%

            ArrayList rol = (ArrayList) request.getAttribute("rol");
        %>

    </head>
    <body>
        <%@include file="../templates/header.jsp" %>


    <div class="table-responsive">
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
                         if (rol != null) {
                            Iterator iterator = rol.listIterator();
                            while (iterator.hasNext()) {
                                RolVO rolVO = (RolVO) iterator.next();

                %>

                <tr >

                    <td><%=rolVO.getIdRol()%></td>
                    <td><%=rolVO.getNombre()%></td>
                    <td><%=rolVO.getDescripcion()%></td>

                    <td>
                       <form method="POST" action="servletRol">
                            <input type="hidden" name="opcion" value="4">
                            <input type="hidden" name="idRol" class="btn btn-info" value="<%=rolVO.getIdRol()%>">
                            <input type="submit"  value="actualizar">
                        </form>
                              <form method="POST" action="servletRol">
                            <input type="hidden" name="opcion" value="6">
                            <input type="hidden" name="idRol" class="btn btn-danger" value="<%=rolVO.getIdRol()%>">
                            <input type="submit"  value="eliminar">
                        </form>
                            
                    </td>
                </tr>
                <%
                    }
                }
                %>

            </tbody>
        </table>
    </div>
    




        <form method="POST" action="servletRol">
            <input type="hidden" name="opcion" value="2">

            <input type="submit" name="insertar"
                   value="Insertar Rol" >
        </form>
  
  <% String resp = (String) request.getAttribute("mensaje");

                    if (resp != null) {%>

                <div class="alert alert-success">
                    <strong>PROCESO EXITOSO!</strong> <%=resp%>
                </div>

                <%
                    } 
                %>


        <%@include file="../templates/footer.jsp" %>
    </body>
</html>
