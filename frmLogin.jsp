<%-- 
    Document   : frmLogin.jsp
    Created on : 6 July 2024, 11:55:43 AM
    Author     : farisazwar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login | Evergreen Clinic</title>
        <link rel="stylesheet" href="css/frmLogin.css">
        <link href="assets/img/health.png" rel="icon">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <div class="wrapper">

            <form class="form-signin" name="loginForm" action="login.jsp" method="post">

                <h2 class="form-signin-heading">Login</h2>

                <input type="text" class="form-control" name="username" placeholder="Username" 
                       value="<%if(session.getAttribute("username") != null){
                                        out.print(session.getAttribute("username"));
                                        }%>">

                <input type="password" class="form-control" name="password" placeholder="Password">

                <div align="center">
                <button class="btn btn-link" type="reset" name="reset">Reset</button>
                </div>
                
                <button class="btn btn-lg btn-primary btn-block" type="submit" name="submitLogin">Login</button>
                
            </form>

        </div>

    </body>
</html>