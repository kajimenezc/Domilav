<%-- 
    Document   : prueba
    Created on : 21/04/2018, 01:17:56 PM
    Author     : Kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <script src="javaScript/jquery-3.3.1.min.js" type="text/javascript"></script>
          <script>
            
                  $('#mostrar').hide();
                  
                  $('#vista').click(function(){
                     
                     $('#mostrar').show();
        
                  });
                  
                  
                  
                  
                  
        
              
              
          </script>
          
          
    </head>
    <body>
        <h1>Hello World!</h1>
        <br>
        <input type="button" id="vista" value="mostrar" >
        
        
        <div id="mostrar" >
            
            <p>soy yo</p>
            
        </div>
        
    </body>
</html>
