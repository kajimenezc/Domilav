<%-- 
    Document   : ingresarBarrio
    Created on : 19/12/2017, 11:39:12 AM
    Author     : Kevin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.BarrioDAO"%>
<%@page import="modeloVO.upz"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INGRESAR</title>

    </head>
    <body >
        <%@include file="../templates/header.jsp" %>

       <div class="content">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">      
  <div class="card-box">
                <br>
                <h1>INGRESAR BARRIO</h1>
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



                <form id="formBarrio"  action="servletBarrio" method="POST" class="form-horizontal" >
                    <div class="form-group">
                        <input type="hidden" name="opcion" value="3">
                        <label for="nombre" class="control-label col-sm-2">Nombre: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="nombre" name="nombre"  required >
                        </div>
                    </div>

                    <!-- Lista desplegable de upz -->
                    
                    <div class="form-group">
                        <label for="upz" class="control-label col-sm-2">Upz: </label>
                        <div class="col-sm-10">
                           <%  upz up = new  upz();
                               BarrioDAO bv  = new BarrioDAO();
                               
                               ArrayList<upz> lista = bv.upzArray();
                           %>
                           
                           <select id="upz" name="upz" class="form-control">
                               <option value="a" >Seleccione zona</option>
                               <%for(int i = 0;i < lista.size();i++){ 
                                   up = lista.get(i);
                               %>
                               <option value="<%=up.getIdUpz()%>"><%=up.getNombre()%></option>
                               
                               <%}%>
                           </select>
                           
                        </div> 
                    </div>
                
                    <input type="submit" class="form-control" value="enviar" name="guardar">
                </form>

                <br>
            </div>
                   
        </div>
        </div>
        </div>
        </div>


            
                <style>
         .error{
             color: red;
         }
     </style>
     <script src="javaScript/jquery.validate_1.js" type="text/javascript"></script>
        <script src="javaScript/additional-methods.js" type="text/javascript"></script>
     <script>
     $(document).ready(function () {
    $("#formBarrio").validate({
        rules: {
            nombre: {
                required: true,
                minlength: 3,
                maxlength: 20
            },
            descripcion: {
                required: true,
                minlength: 10,
                maxlength: 220
            }
        },
        messages: {
            nombre: {
                required: "Campo obligatorio",
                minlength: "Muy corto",
                maxlength: "Excede el limite"
            },
            descripcion: {
                required: "Campo obligatorio",
                minlength: "Muy corto",
                maxlength: "Excede el limite"
            }
        }

    });
});
     </script>
    
                   <%@include file="../templates/footer.jsp" %>
                </body>
                </html>
