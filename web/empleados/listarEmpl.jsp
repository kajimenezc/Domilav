<%-- 
    Document   : listarEmpl
    Created on : 26/02/2018, 10:14:35 PM
    Author     : Kevin
--%>

<%@page import="modeloVO.PersonaVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EMPLEADO</title>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.11/css/jquery.dataTables.css">



    </head>
    <body>
        <%@include file="../templates/header.jsp" %>
        <% ArrayList persona = (ArrayList) request.getAttribute("empleado");%>

        <div class="content">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">      

          <div class="card-box">
                <br>
                <h1>GESTION DE EMPLEADOS</h1>
                <br>
                <form action="servletEmpleado" method="POST">
                    <input type="hidden" name="opcion" value="2">
                    <input type="submit" class="btn btn-succes btn-lg" name="persona" value="INSERTAR EMPLEADO">
                </form>

                <br>
                <%String error = (String) request.getAttribute("error");
                    String exito = (String) request.getAttribute("exito");
                %>

                <%if (exito != null) {%>
                <div class="alert alert-success"><%=exito%></div>



                <%} else if (error != null) {%>
                <div class="alert alert-warning"><%=error%></div>

                <%} else {%>
                <input type="hidden" value="en proceso">
                <%}%>

                <br>
                <div class="table table-responsive">
                    <table id="my" class="table table-striped" >
                        <thead >
                            <tr>

                                <th>NOMBRES</th>

                                <th>AGENCIA</th>
                                <th>CELULAR</th>
                                <th>CORREO</th>
                                <th>DIRECCIÓN</th>
                                <th>BARRIO</th>
                                <th>ESTADO</th>
                                <th></th>
                            </tr>
                        </thead>
                        <!--Se recorre el listado para mostrarlo en la tabla -->
                        <tbody>
                            <%      if (persona != null) {
                                    Iterator iterator = persona.listIterator();

                                    while (iterator.hasNext()) {
                                        PersonaVO personaVO = (PersonaVO) iterator.next();

                            %>
                            <tr style="border: 1px solid;">


                                <td><%=personaVO.getNombres()%> <%=personaVO.getApellidos()%></td>

                                <td><%=personaVO.getNombreAgen()%></td>

                                <td><%=personaVO.getNumCelular()%></td>
                                <td><%=personaVO.getCorreo()%></td>
                                <td><%=personaVO.getDireccion()%></td>
                                <td><%=personaVO.getNombreBarrio()%></td>
                                <td><%=personaVO.getNombreEstado()%></td>

                                <%if (personaVO.getEstado() != 2) {%>
                                <td>

                                    <form action="servletEmpleado" method="POST">

                                        <input type="hidden" name="opcion" value="7">
                                        <input type="hidden" name="idPersona" value="<%=personaVO.getIdPersona()%>">
                                        <input type="hidden" name="cambio" value="2">
                                        <input type="submit" id="cambio" class="btn btn-danger" value="DESABILITAR">
                                    </form>
                                </td>
                                <%} else {%>
                                <td>
                                    <form action="servletEmpleado" method="POST">
                                        <input type="hidden" name="opcion" value="7">
                                        <input type="hidden" name="idPersona" value="<%=personaVO.getIdPersona()%>">
                                        <input type="hidden" name="cambio" value="1">
                                        <input type="submit" id="cambio" class="btn btn-info" value="HABILITAR">
                                    </form>
                                </td>
                                <%}%>
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
