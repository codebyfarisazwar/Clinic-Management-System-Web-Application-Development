<%-- 
    Document   : connectionDB
    Created on : 21 Apr 2024, 5:01:23 PM
    Author     : farisazwar
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Connection DB</title>
    </head>
    <body>
        <% 
            Connection connection=null;
            try{
                //declaration and connection to database MySQL
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                String url = "jdbc:mysql://localhost/sql_farisazwar";
                String username ="sql_farisazwar";
                String passwordMySQL ="iaYDPDhJftCsDexk";
                connection = DriverManager.getConnection(url,username,passwordMySQL);
            }
            catch (Exception e){
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                out.println(e.getMessage());
            }
          
     %>
    </body>
</html>
