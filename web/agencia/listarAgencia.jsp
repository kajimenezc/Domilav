<%-- 
    Document   : listarAgencia
    Created on : 30/11/2017, 05:56:54 PM
    Author     : kev_i
--%>

<%@page import="modeloVO.AgenciaVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AGENCIAS</title>
        <script src="javaScript/jquery-3.2.2.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.11/css/jquery.dataTables.css">

       

    </head>
    <body>
        <%@include file="../templates/header.jsp" %>
        <% ArrayList agencia = (ArrayList) request.getAttribute("agencia"); %>
       
         
         <div class="content">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">      

          <div class="card-box">
                <br>
                <h1>AGENCIAS</h1>
                <br>

                <form action="servletAgencia" method="POST">
                    <input type="hidden" name="opcion" value="2">
                    <input type="submit" name="agencia" class="btn btn-default btn-lg" value="Ingresar Agencia">
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
                                <th >DIRECCION</th>
                                <th >TELEFONO</th>
                                <th >FIJO</th>
                                <th >CORREO</th>
                                <th >ESTADO</th>
                                <th ></th>
                                <th ></th>
                       
                            </tr>
                        </thead>
                        <!--Se recorre el listado para mostrarlo en la tabla -->
                        <tbody>
                            <%
                                if (agencia != null) {
                                    Iterator iterator = agencia.listIterator();
                                    while (iterator.hasNext()) {
                                        AgenciaVO agenciaVO = (AgenciaVO) iterator.next();
                            %>
                            <tr style="border: 1px solid;">

                                <td ><%=agenciaVO.getIdAgencia()%></td>
                                <td><%=agenciaVO.getNombreAgen()%></td>
                                <td><%=agenciaVO.getDireccionAgen()%></td>
                                <td><%=agenciaVO.getTelUno()%></td>
                                <td><%=agenciaVO.getTelDos()%></td>
                                <td><%=agenciaVO.getCorreoAgen()%></td>
                                <td><%=agenciaVO.getNombreEstado().toUpperCase() %></td>
                                <td>
                                    <form method="POST" action="servletAgencia" id="<%="form"+agenciaVO.getIdAgencia()%>">
                                        <input type="hidden" name="opcion" value="4">
                                        
                                        <input type="hidden" name="idAgencia" value="<%=agenciaVO.getIdAgencia()%>">

                                        <a class="send" data="<%=agenciaVO.getIdAgencia()%>" href="#"><i class="fi-repeat"></i></a> 
                                    </form>
                                </td>
                                <%  if(agenciaVO.getNombreEstado().equals("activo") ) { %>
                               <td>
                                   <!-- desactivar -->
                                    <form  id="<%="formDel"+agenciaVO.getIdAgencia()%>" method="POST" action="servletAgencia">
                                        <input type="hidden" name="opcion" value="7">
                                        <input type="hidden" name="mesage" value="inactivo">
                                        <input type="hidden" name="idAgencia" value="<%=agenciaVO.getIdAgencia()%>">
                                        
                                        <a class="sendDel" data="<%=agenciaVO.getIdAgencia()%>" href="#"><i class="fa fa-fw fa-trash"></i></a>
                                    </form>

                                </td>
                                <%}else{%>
                                    
                                 <td>
                                       <!-- activar -->
                                    <form  id="<%="formEnt"+agenciaVO.getIdAgencia()%>" method="POST" action="servletAgencia">
                                        <input type="hidden" name="opcion" value="7">
                                        <input type="hidden" name="mesage" value="activo">
                                        <input type="hidden" name="idAgencia" value="<%=agenciaVO.getIdAgencia()%>">
                                        
                                        <a class="sendEnt" data="<%=agenciaVO.getIdAgencia()%>" href="#"><i class="fa fa-eye"></i></a>
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
                <!--   </form>-->
                <br>


            </div>
            </div>
            </div>
        </div>
        </div>


        <%@include file="../templates/footer.jsp" %>
    </body>

</html>
