<%-- 
    Document   : ingresarComentario
    Created on : 19/03/2018, 08:58:14 AM
    Author     : Carolina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>COMENTARIOS</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="javaScript/jquery-3.2.2.min.js" type="text/javascript"></script>
    </head>
    <body>
      
        <div class="row">
            <div class="col-sm-1"></div>
            <div class="col-sm-9">
                <form action="servletComentario" method="POST" class="form-horizontal" >
                    <input type="hidden" id="opcion" name="opcion" value="3">
                    <div class="tab-content">
                        <div id="comentarios" class="tab-pane fade in active">
                            <div class="panel panel-primary">
                                <div class="panel-heading">INGRESAR COMENTARIOS</div>
                                <div class="panel-body">
                        
                                    <div class="row">
                                        <div class="col-sm-11" >

                                            <div class="form-group">
                                                <label for="comentario" class="control-label col-sm-2">Comentario: </label>
                                                <div class="col-sm-10">
                                                    <textarea class="form-control" id="comentario" name="comentario"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-2"></label>
                                                <div class="col-sm-10">
                                                    <input  type="submit" value="confirmar"  class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-sm-2"></div>
      
    </body>
</html>
