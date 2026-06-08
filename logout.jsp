<%--
    Document   : logout.jsp
    Created on : 24 Mar 2024, 12:40:12 pm
    Author     : Iqbal
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            session.removeAttribute("employee_loginID");
            session.removeAttribute("employee_Name");
            session.removeAttribute("employee_Position");
            
            //return to login form
            response.sendRedirect("index.html");
        %>
    </body>
</html>