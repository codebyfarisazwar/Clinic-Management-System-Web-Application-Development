<%-- 
    Document   : EmployeeRegisterInsert
    Created on : 21 Apr 2024, 4:55:46 PM
    Author     : farisazwar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Cleark Data Into Database</title>
    </head>
    <body>
        <h1>Register Cleark</h1>
        <%@include file="connectionDB.jsp"%>
        <%           
            
            Statement stmtSQLloginid = null;
            Statement stmtSQLcleark = null;

            try {

                //statement used to create a statement on object in jdbc
                stmtSQLloginid = connection.createStatement();
                stmtSQLcleark = connection.createStatement();

                // step 1 : declare variable
                String loginid;
                String password;
                String icnumber;
                String fullname;
                String address;
                String phonenumber;
                String position;
                String birthdate;
                String gender;

                //step 2 : request element
                loginid = request.getParameter("loginid");
                password = request.getParameter("password");
                icnumber = request.getParameter("icnumber");
                fullname = request.getParameter("fullname");
                address = request.getParameter("address");
                phonenumber = request.getParameter("phonenumber");
                position = request.getParameter("position");
                birthdate = request.getParameter("birthdate");
                gender = request.getParameter("gender");

                // step 3 : declare sql query
                String sqlInsertLogin = "INSERT INTO Login" + "(login_loginID, login_password)"
                        + "VALUES" + "('"+loginid+"', '"+password+"')";

                //execute sqlInsertLogin
                int rowLogin = stmtSQLloginid.executeUpdate(sqlInsertLogin);

                if (rowLogin > 0) {
                    out.println("<br>Login successfully inserted into table Login");
                    out.println("Login ID : <b>" + loginid + "<br>");
                    out.println("Password : <b>" + password + "<br>");
                } else {
                    out.println("<br>Login fail inserted into table Login");
                }

                String sqlInsertCleark = "INSERT INTO Employee" + "(employee_IC, employee_Name, employee_Address, employee_PhoneNumber, employee_Position, employee_DateOfBirth, employee_Gender, employee_loginID)"
                        + "VALUES" + "('"+icnumber+"', '"+fullname+"', '"+address+"' , '"+phonenumber+"' , 'C' , '"+birthdate+"' , '"+gender+"' , '"+loginid+"')";

                //execute sqlInsertCleark
                int rowCleark = stmtSQLcleark.executeUpdate(sqlInsertCleark);

                if (rowCleark > 0) {
                    out.println("<br>Cleark successfully inserted into table Login" + "table Employee");
                    out.println("<br>Ic Number : " + icnumber);
                    out.println("<br>Full Name : <b>" + fullname);
                    out.println("<br>Address : " + address);
                    out.println("<br>Telephone Number : " + phonenumber);
                    out.println("<br>Position : " + position);
                    out.println("<br>Birthday : " + birthdate);
                    out.println("<br>Gender : " + gender);
                    out.println("<br>Login ID : " + loginid);
                } else {
                    out.println("<br>Cleark fail inserted into table Employee");
                }

            } catch (SQLException sqlError) {
                request.setAttribute("Error;", sqlError);
                out.println(sqlError);
            } finally {
                if (stmtSQLloginid != null) {
                    stmtSQLloginid.close();
                }
                if (stmtSQLcleark != null) {
                    stmtSQLcleark.close();
                }
                if (connection != null) {
                    connection.close();
                }
            }


        %>
        <br><a href="pgMenu_cleark.jsp">Done</a>
    </body>
</html>