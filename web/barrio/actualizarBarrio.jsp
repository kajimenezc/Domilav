<%-- 
    Document   : actualizarBarrio
    Created on : 19/12/2017, 11:39:51 AM
    Author     : Kevin
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.BarrioDAO"%>
<%@page import="modeloVO.upz"%>
<%@page import="modeloVO.BarrioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BARRIO</title>
    </head>
    <body>
        <%@include file="../templates/header.jsp" %>


        <%     BarrioVO barrioVO = (BarrioVO) request.getAttribute("barrioVO");
        %>

         <div class="content">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">      
                          <div class="card-box">
                <br>
                <h1>ACTUALIZAR BARRIO</h1>
                <br>
                <form action="servletBarrio" method="POST" >
                    <input type="hidden" name="opcion" value="1">
                    <input type="submit" id="inicio" name="inicio" value="LISTAR BARRIO" class="form-control" >
                </form>
                <br>
                <% String resp = (String) request.getAttribute("mensaje");

                    if (resp != null) {%>

                <div class="alert alert-success">
                    <strong>EXITO!</strong> <%=resp%>
                </div>

                <%
                    }
                %>
                <br>


                <form id="forRol"  action="servletBarrio" method="POST" class="form-horizontal" >
                    <div class="form-group">
                        <input type="hidden" name="opcion" value="5">
                        <input type="hidden" name="idBarrio" id="idBarrio" value="<%=barrioVO.getIdBarrio()%>" > 
                        <label for="nombre" class="control-label col-sm-2">Nombre: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="nombre" name="nombre" value="<%=barrioVO.getNombre()%>" required >
                        </div>
                    </div>

                  
                         <!-- Lista desplegable de upz -->
                    
                    <div class="form-group">
                        <label for="upz" class="control-label col-sm-2">Upz: </label>
                        <div class="col-sm-10">
                           <%  upz up = new  upz();
                               BarrioDAO bv  = new BarrioDAO();
                               String nombreUpz = bv.nombre(barrioVO.getIdupz());
                               
                               ArrayList<upz> lista = bv.upzArray();
                           %>
                           
                           <select id="upz" name="upz" class="form-control">
                              <option value="<%=barrioVO.getIdupz()%>" ><%=nombreUpz%></option>
                          
                               <%for(int i = 0;i < lista.size();i++){ 
                                   up = lista.get(i);
                               %>
                               <option value="<%=up.getIdUpz()%>"><%=up.getNombre()%></option>
                               
                               <%}%>
                           </select>
                           
                        </div> 
                    </div>
                        
                    <input type="submit" value="enviar" class="btn btn-default" name="guardar">
                </form>

            </div>
            </div>
            
        </div>
        </div>
        </div>
        <%@include file="../templates/footer.jsp" %>
    </body>
</html>
