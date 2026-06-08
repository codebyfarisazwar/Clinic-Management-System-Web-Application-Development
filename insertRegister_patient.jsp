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
        <title>Insert Patient Data Into Database</title>
    </head>
    <body>
        <h1>Register Patient</h1>
        <%@include file="connectionDB.jsp"%>
        <%           
            
            Statement stmtSQLpatient = null;

            try {

                //statement used to create a statement on object in jdbc
                stmtSQLpatient = connection.createStatement();

                // step 1 : declare variable
                String icnumber;
                String fullname;
                String address;
                String phonenumber;
                String registerdate;
                String birthdate;
                String gender;
                String allergy;

                //step 2 : request element
                icnumber = request.getParameter("icnumber");
                fullname = request.getParameter("fullname");
                address = request.getParameter("address");
                phonenumber = request.getParameter("phonenumber");
                registerdate = request.getParameter("registerdate");
                birthdate = request.getParameter("birthdate");
                gender = request.getParameter("gender");
                allergy = request.getParameter("allergy");

                // step 3 : declare sql query
                String sqlInsertPatient = "INSERT INTO Patient" + "(patient_IC, patient_Name, patient_Gender, patient_PhoneNumber, patient_DateOfBirth, patient_RegistrationDate, patient_Address, patient_Allergy, patient_RegistrationTime)"
                        + "VALUES" + "('"+icnumber+"', '"+fullname+"', '"+gender+"' , '"+phonenumber+"' , '"+birthdate+"' , '"+registerdate+"' , '"+address+"' , '"+allergy+"' , CURRENT_TIMESTAMP)";

                //execute sqlInsertPatient
                int rowPatient = stmtSQLpatient.executeUpdate(sqlInsertPatient);

                if (rowPatient > 0) {
                    out.println("<br>Patient successfully inserted into table Patient");
                    out.println("<br>Ic Number : " + icnumber);
                    out.println("<br>Full Name : <b>" + fullname);
                    out.println("<br>Gender : " + gender);
                    out.println("<br>Telephone Number : " + phonenumber);
                    out.println("<br>Birthday : " + birthdate);
                    out.println("<br>Register Date : " + registerdate);
                    out.println("<br>Address : " + address);
                    out.println("<br>Allergy : " + allergy);
                } else {
                    out.println("<br>Patient fail inserted into table Patient");
                }

            } catch (SQLException sqlError) {
                request.setAttribute("Error;", sqlError);
                out.println(sqlError);
            } finally {
                if (stmtSQLpatient != null) {
                    stmtSQLpatient.close();
                }
                if (connection != null) {
                    connection.close();
                }
            }


        %>
        <br><a href="pgMenu_cleark.jsp">Done</a>
    </body>
</html>