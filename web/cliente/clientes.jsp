<%--
    Document   : listarPersona
    Created on : 8/12/2017, 12:05:14 PM
    Author     : kev_i
--%>


<%@page import="modeloDAO.PersonaDAO"%>
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
         <script src="javaScript/jquery-3.2.2.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.11/css/jquery.dataTables.css">
      
    </head>
    <body>
        <%@include file="../templates/header.jsp" %>

        <div class="content">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12"> 
                        <div class="card-box">
                <h1>LISTA DE CLIENTES</h1>
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

                
                
                
                
                <script>

            $(document).ready(function () {
                $.noConflict();
                var table = $('#my').DataTable();
              //  $('#my').DataTable();
            });
        </script> 

        
        <% if(pv.getRol() != 3 ){ %>
        
        
                <div class="table table-responsive">
                    <table id="my" class="table table-striped" >
                        <thead >
                            <tr>
                                <th >ID</th>
                                <th >NOMBRE</th>
                                <th>TIPO DOCUMENTO</th>
                                <th>DOCUMENTO</th>
                                <th>DIRECCIÓN</th>
                                <th>CELULAR</th>
                                <th>ESTADO</th>
                                <th></th>
                               

                            </tr>
                        </thead>
                        <!--Se recorre el listado para mostrarlo en la tabla -->
                        <tbody>
                            <%
                                PersonaVO pev = new PersonaVO();

                                PersonaDAO sd = new PersonaDAO();

                                ArrayList<PersonaVO> lista = sd.listarCliente();
                                for (int i = 0; i < lista.size(); i++) {
                                    pev = lista.get(i);

                            %>
                            <tr style="border: 1px solid;">

                                <td><%=pev.getIdPersona()%></td>
                                <td><%=pev.getNombres()%> <%=pev.getApellidos()%></td>
                                <td><%=pev.getTipoDoc()%></td>
                                <td><%=pev.getDocumento()%></td>
                                <td><%=pev.getDireccion()%></td>
                                <td><%=pev.getNumCelular()%></td>
                                <td><%=pev.getNombreEstado()%></td>

                               <%if (pev.getEstado() == 1) {%>
                                <td>
                                    <!-- desabilitar -->
                                    <form action="servletCliente" method="POST"  id="<%="formDel"+pev.getIdPersona()%>">

                                        <input type="hidden" name="opcion" value="9">
                                        <input type="hidden" name="idPersona" value="<%=pev.getIdPersona()%>">
                                        <input type="hidden" name="cambio" value="2">
                                        <a class="sendDel" data="<%=pev.getIdPersona()%>" href="#"><i class="fa  fa-trash"></i></a> 

                                    </form>
                                <!-- deudor -->
                                    <form action="servletCliente" method="POST"  id="<%="formEnt"+pev.getIdPersona()%>">
                                        <input type="hidden" name="opcion" value="9">
                                        <input type="hidden" name="idPersona" value="<%=pev.getIdPersona()%>">
                                        <input type="hidden" name="cambio" value="3">
                                    <a class="sendEnt" data="<%=pev.getIdPersona()%>" href="#"><i class="fa  fa-code"></i></a> 

                                    </form>
                                </td>
                                <%} else if(pev.getEstado() == 2){%>
                                <td>
                                    <!-- habilitar -->
                                    <form action="servletCliente" method="POST"  id="<%="form"+pev.getIdPersona()%>">
                                        <input type="hidden" name="opcion" value="9">
                                        <input type="hidden" name="idPersona" value="<%=pev.getIdPersona()%>">
                                        <input type="hidden" name="cambio" value="1">
                                       <a class="send" data="<%=pev.getIdPersona()%>" href="#"><i class="fa  fa-play-circle"></i></a> 

                                    </form>
                                </td>
                                
                                <%}else if (pev.getEstado() == 3) {%>
                                <td>
                                    <!-- no debe -->
                                     <form action="servletCliente" method="POST"  id="<%="form"+pev.getIdPersona()%>">
                                        <input type="hidden" name="opcion" value="9">
                                        <input type="hidden" name="idPersona" value="<%=pev.getIdPersona()%>">
                                        <input type="hidden" name="cambio" value="1">
                                        <a class="send" data="<%=pev.getIdPersona()%>" href="#"><i class="fa  fa-upload"></i></a> 

                                    </form>
                                </td>
                               
                                
                                
                                <%
                                    } // cierre   
                                }
                                %>
                            </tr>
                        </tbody>
                    </table>
                </div>
                            
                    <%}else{%>
                            
                    
                    <div class="table table-responsive">
                    <table id="my" class="table table-striped" >
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
                            <%
                                PersonaVO pev = new PersonaVO();

                                PersonaDAO sd = new PersonaDAO();

                                ArrayList<PersonaVO> lista = sd.listarCliente();
                                for (int i = 0; i < lista.size(); i++) {
                                    pev = lista.get(i);

                            %>
                            <tr style="border: 1px solid;">

                                <td><%=pev.getIdPersona()%></td>
                                <td><%=pev.getNombres()%> <%=pev.getApellidos()%></td>
                                <td><%=pev.getTipoDoc()%></td>
                                <td><%=pev.getDocumento()%></td>
                                <td><%=pev.getDireccion()%></td>
                                <td><%=pev.getNumCelular()%></td>
                                <td><%=pev.getNombreEstado()%></td>

                               
                               
                                
                                
                                <%
                                    } // cierre   
                                
                                %>
                            </tr>
                        </tbody>
                    </table>
                </div>
                    
                    
                    
                    
                    
                    
                            <%  }%>
            </div>
       
        </div>
        </div>
        </div>
        </div>
        <%@include file="../templates/footer.jsp" %>
    </body>
</html>

