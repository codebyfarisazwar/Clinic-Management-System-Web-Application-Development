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
        <title>Insert Treatment Data Into Database</title>
    </head>
    <body>
        <h1>Register Treatment</h1>
        <%@include file="connectionDB.jsp"%>
        <%           
            
            Statement stmtSQLtreatment = null;

            try {

                //statement used to create a statement on object in jdbc
                stmtSQLtreatment = connection.createStatement();

                // step 1 : declare variable
                String treatmentid;
                String icnumber;
                String treatmentdate;
                String treatmenttime;
                String illness;
                String icdoctor;

                //step 2 : request element
                treatmentid = request.getParameter("treatmentid");
                icnumber = request.getParameter("icnumber");
                treatmentdate = request.getParameter("treatmentdate");
                treatmenttime = request.getParameter("treatmenttime");
                illness = request.getParameter("illness");
                icdoctor = request.getParameter("icdoctor");

                // step 3 : declare sql query
                String sqlInsertTreatment = "INSERT INTO Treatment" + "(treatment_IdTreatment, treatment_PatientIC, treatment_Date, treatment_Time, treatment_Illness, treatment_EmployeeIC)"
                        + "VALUES" + "('"+treatmentid+"', '"+icnumber+"', '"+treatmentdate+"' , '"+treatmenttime+"' , '"+illness+"' , '"+icdoctor+"')";

                //execute sqlInsertTreatment
                int rowTreatment = stmtSQLtreatment.executeUpdate(sqlInsertTreatment);

                if (rowTreatment > 0) {
                    out.println("<br>Treatment successfully inserted into table Treatment");
                    out.println("<br>Treatment ID : " + treatmentid);
                    out.println("<br>Patient IC : <b>" + icnumber);
                    out.println("<br>Treatment Date : " + treatmentdate);
                    out.println("<br>Treatment Time : " + treatmenttime);
                    out.println("<br>Illness : " + illness);
                    out.println("<br>Doctor IC : " + icdoctor);
                } else {
                    out.println("<br>Treatment fail inserted into table Treatment");
                }

            } catch (SQLException sqlError) {
                request.setAttribute("Error;", sqlError);
                out.println(sqlError);
            } finally {
                if (stmtSQLtreatment != null) {
                    stmtSQLtreatment.close();
                }
                if (connection != null) {
                    connection.close();
                }
            }


        %>
        <br><a href="pgMenu_cleark.jsp">Done</a>
    </body>
</html>