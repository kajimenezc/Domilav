

<%@page import="modeloDAO.RolDAO"%>
<%@page import="modeloVO.RolVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    
  </head>
  <body>
   
    <%  
          RolDAO rolDAO = new RolDAO();
          RolVO rolVO = new RolVO();
         
          int id = Integer.parseInt(request.getParameter("idRol"));
          
           rolVO.setIdRol(id);
           rolVO = rolDAO.consultaId();
           
           //    <form action="servletRol" method="POST"  class="form-horizontal" >
        
       // RolVO rolVO = (RolVO) request.getAttribute("rolVO");
               

    %>

    <form action="servletRol" method="POST" class="form-horizontal" >
 
      <div class="form-group">
        <input type="hidden" name="opcion" value="5">
        <input type="hidden" name="idRol" id="idRol" value="<%=rolVO.getIdRol()%>" > 
        <label for="nombre" class="control-label col-sm-2">Nombre: </label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="nombre" name="nombre" value="<%=rolVO.getNombre()%>" required >
        </div>
      </div>

      <div class="form-group">
        <label for="descripcion" class="control-label col-sm-2">Descripcion: </label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="descripcion" name="descripcion" value="<%=rolVO.getDescripcion()%>" required >

        </div>
      </div>
      <input type="submit" value="enviar" name="guardar">
    </form>
  
  </body>
</html>
