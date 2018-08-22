<%-- 
    Document   : listarPersona
    Created on : 8/12/2017, 12:05:14 PM
    Author     : kev_i
--%>

<%@page import="modeloVO.PersonaVO"%>
<%@page import="modeloVO.RolVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente</title>
    </head>
     
   
    <body>
        <%@include file="../templates/header.jsp" %>
        <% ArrayList persona = (ArrayList) request.getAttribute("persona");

            // ArrayList rol = (ArrayList) request.getAttribute("rol");
        %>
       <div class="content">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">      
          <div class="card-box">
            <h1>LISTA DE CLIENTES</h1>
       

            <table id="myTable" class="table table-striped" >
                <thead >
                    <tr>
                        <th >ID</th>
                        <th >NOMBRE</th>
                        <th>TIPO DOCUMENTO</th>
                        <th>DOCUMENTO</th>
                        <th>DIRECCIÓN</th>
                        <th>CELULAR</th>
                        <th>ESTADO</th>

                    </tr>
                </thead>
                <!--Se recorre el listado para mostrarlo en la tabla -->
                <tbody>
                    <%                                if (persona != null) {
                            Iterator iterator = persona.listIterator();
                            //   Iterator iteratorR = rol.listIterator();
                            while (iterator.hasNext()) {
                                PersonaVO personaVO = (PersonaVO) iterator.next();
                                //   RolVO rolVO = (RolVO) iteratorR.next();
%>
                    <tr style="border: 1px solid;">

                        <td><%=personaVO.getIdPersona()%></td>
                        <td><%=personaVO.getNombres()%> <%=personaVO.getApellidos()%></td>
                        <td><%=personaVO.getTipoDoc()%></td>
                        <td><%=personaVO.getDocumento() %></td>
                        <td><%=personaVO.getDireccion()%></td>
                        <td><%=personaVO.getNumCelular() %></td>
                        <td><%=personaVO.getNombreEstado()%></td>

                        <td>
                                         
                       <!--<form method="POST" action="servletCliente">
                            <input type="hidden" name="opcion" value="9">
                            <input type="hidden" name="idPersona" value="ID">
                            <input type="submit" value="DETALLE">
                        </form>-->
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
