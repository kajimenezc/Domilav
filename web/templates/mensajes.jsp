<%-- 
    Document   : mensajes
    Created on : 19/03/2018, 12:26:46 AM
    Author     : Carolina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  String mensaje = (String) request.getAttribute("mensaje");
            String tipoMsj = (String) request.getAttribute("tipoMsj");
            if(mensaje != null){
                if(tipoMsj != null && tipoMsj.equals("success")){
        %>
            <div class="alert alert-success"><%=mensaje%></div>
        <%
                }
                else if(tipoMsj != null && tipoMsj.equals("error")){
        %>
            <div class="alert alert-danger"><%=mensaje%></div>
        <%
                }
            }
        %>
