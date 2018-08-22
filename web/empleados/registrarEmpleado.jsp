<%-- 
    Document   : registrarEmpleado
    Created on : 6/12/2017, 12:14:43 PM
    Author     : kev_i
--%>

<%@page import="java.lang.String"%>
<%@page import="modeloDAO.AgenciaDAO"%>
<%@page import="modeloDAO.BarrioDAO"%>
<%@page import="modeloVO.upz"%>
<%@page import="modeloVO.BarrioVO"%>
<%@page import="modeloVO.AgenciaVO"%>
<%@page import="modeloVO.PersonaVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="modeloDAO.conexioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EMPLEADOS</title>
    </head>
    <body>
        <%@include file="../templates/header.jsp" %>
       <div class="content">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">      

          <div class="card-box">
                <h1>REGISTRAR EMPLEADO</h1>

                <form id="formEmpleado" action="servletEmpleado" method="POST" class="form-horizontal">
                    <div class="form-group">

                        <input type="hidden" name="opcion" value="3" >

                        <label for="nombreEmpl" class="control-label col-sm-2">Nombres: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="nombreEmpl" name="nombreEmpl" >
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="apellidos" class="control-label col-sm-2">Apellidos: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="apellidos" name="apellidos" >
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="documento" class="control-label col-sm-2">Documento: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="documento" name="documento" >
                            <br>
                            <div id="respDoc" class="alert-danger" ></div>
                        </div>
                    </div>

                    <br>


                    <div class="form-group">
                        <label for="genero" class="control-label col-sm-2">Genero: </label>
                        <div class="col-sm-10">
                            <input type="radio" class="radio-inline form-control" name="genero" value="Masculino" checked>Masculino
                            <input type="radio" class="radio-inline form-control" name="genero" value="Femenino">Femenino
                            <input type="radio" class="radio-inline form-control" name="genero" value="Otro">Otro

                        </div>
                    </div>

                    <div class="form-group">

                        <label for="direccion" class="control-label col-sm-2">Direccion: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="direccion" name="direccion" >
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
                    <!-- Lista desplegable de barrios -->
                    <div id="muestraBarrio">
                    
                    </div>


                    <div class="form-group">

                        <label for="celular" class="control-label col-sm-2">Celular: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="celular" name="celular" >
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="fijo" class="control-label col-sm-2">Telefono: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="fijo" name="fijo" >
                        </div>
                    </div>




                    <div class="form-group">
                        <label for="correo" class="control-label col-sm-2">Correo: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="correo" name="correo" >
                            <br>
                            <div id="respCorreo" class="alert-danger" ></div>
                        </div>
                    </div>


                    <!-- Lista desplegable de agencia -->
                    <div class="form-group">
                        <label for="agencia" class="control-label col-sm-2">Agencia: </label>
                        <div class="col-sm-10">
                            <select name="agencia" class="form-control">
                                <%
                                 /*   ArrayList agencia = (ArrayList) request.getAttribute("agencia");

                                    if (agencia != null) {
                                        Iterator iterator = agencia.listIterator();
                                        while (iterator.hasNext()) {
                                            AgenciaVO agenciaVO = (AgenciaVO) iterator.next();*/
                               
                                 AgenciaVO ag = new AgenciaVO();
                                            AgenciaDAO ad = new AgenciaDAO();
                               
                                            ArrayList<AgenciaVO> nombres = ad.consultaActivo();
                                          
                                            for(int  i = 0;i < nombres.size();i++){
                                           ag = nombres.get(i);
                                %>

                                <option  value="<%=ag.getIdAgencia()%>"><%=ag.getNombreAgen()%> </option>
                                <%
                                        
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <br>






                    <input type="submit" class="form-control" value="aceptar" >


                    <br>
                    <br>


                </form>
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
        
        <script type="text/javascript">
            
            $(document).ready(function(){
               
               $("#muestraBarrios").hide();
               
               $("#upz").change(function(){
                  var idUpz  = $(this).find(":selected").val() ;
                  console.log(idUpz);
        
                  $.ajax({
                      url:'muestraBarrios',
                      method:'POST',
                      data:'idupz='+idUpz,
                     success: function (resultado) {
                            $('#muestraBarrio').html(resultado);
                        }});
            
            
                  });
        
               });
        
        
        
           
            
            
            
            </script>
        
  
        <script src="javaScript/jquery.validate_1.js" type="text/javascript"></script>
        <script src="javaScript/additional-methods.js" type="text/javascript"></script>

        <script type="text/javascript">

            $(document).ready(function () {


                $("#formEmpleado").validate({
                    rules: {
                        nombreEmpl: {
                            required: true,
                            minlength: 3,
                            maxlength: 50
                        },
                        apellidos: {
                            required: true,
                            minlength: 4,
                            maxlength: 20
                        },
                        documento: {
                            required: true,
                            minlength: 8,
                            maxlength: 30
                        },
                        celular: {
                            required: true,
                            minlength: 9,
                            maxlength: 12
                        },
                        fijo: {
                            required: true,
                            maxlength: 7
                        },
                        direccion: {
                            required: true,
                            minlength: 10,
                            maxlength: 20
                        },
                        correo: {
                            required: true,
                            minlength: 15,
                            maxlength: 200
                        }
                    },
                    messages: {
                        nombreEmpl: {
                            required: "Campo obligatorio",
                            minlength: "Muy corto",
                            maxlength: "Excede el limite"
                        },
                        apellidos: {
                            required: "Campo obligatorio",
                            minlength: "Muy corto",
                            maxlength: "Excede el limite"
                        },
                        documento: {
                            required: "Campo obligatorio",
                            minlength: "Muy corto",
                            maxlength: "Excede el limite"
                        },
                        celular: {
                            required: "Campo obligatorio",
                            minlength: "Muy corto",
                            maxlength: "Excede el limite"
                        },
                        fijo: {
                            required: "Campo obligatorio",
                            minlength: "no valido",
                            maxlength: "Excede el limite"
                        },
                        direccion: {
                            required: "Campo obligatorio",
                            minlength: "Muy corto.",
                            maxlength: "Excede el limite"
                        },
                        correo: {
                            required: "Campo obligatorio",
                            minlength: "Muy corto",
                            maxlength: "Excede el limite"
                        }
                    }

                });
            });


            // Validar si hay datos en la base de datos
            $(function () {
                $('#documento').change(function () {
                    var doc = $('#documento').val();
                    $.ajax({
                        url: 'datosRegistrados',
                        type: 'POST',
                        data: 'doc=' + doc,
                        success: function (resultado) {
                            $('#respDoc').html(resultado);
                        }});
                });
            });
            $(function () {
                $('#correo').change(function () {
                    var correo = $('#correo').val();
                    $.ajax({
                        url: 'datosRegistrados',
                        type: 'POST',
                        data: 'correo=' + correo,
                        success: function (resultado) {
                            $('#respCorreo').html(resultado);
                        }});
                });
            });


        </script>
         <%@include file="../templates/footer.jsp" %>
    </body>
</html>
