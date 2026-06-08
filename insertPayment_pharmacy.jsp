<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Payment Data Into Database</title>
    </head>
    <body>
        <h1>Payment</h1>
        <%@include file="connectionDB.jsp"%>
        <%           
            
            Statement stmtSQLtreatment = null;

            try {

                //statement used to create a statement on object in jdbc
                stmtSQLtreatment = connection.createStatement();

                // step 1 : declare variable
                String treatmentid;
                String pStatus;
                String paymentdate;
                String paymenttime;
                String tPayment;

                //step 2 : request element
                treatmentid = request.getParameter("treatmentid");
                pStatus = request.getParameter("pStatus");
                paymentdate = request.getParameter("paymentdate");
                paymenttime = request.getParameter("paymenttime");
                tPayment = request.getParameter("tPayment");

                // step 3 : declare sql query
                String sqlInsertPayment = "INSERT INTO Payment" + "(payment_IdTreatment, payment_Status, payment_Date, payment_Time, payment_TotalPayment)"
                        + "VALUES" + "('"+treatmentid+"', '"+pStatus+"', '"+paymentdate+"' , '"+paymenttime+"' , '"+tPayment+"')";

                //execute sqlInsertPayment
                int rowPayment = stmtSQLtreatment.executeUpdate(sqlInsertPayment);

                if (rowPayment > 0) {
                    out.println("<br>Treatment successfully inserted into table Treatment");
                    out.println("<br>Treatment ID : " + treatmentid);
                    out.println("<br>Status : <b>" + pStatus);
                    out.println("<br>Payment Date : " + paymentdate);
                    out.println("<br>Payment Time : " + paymenttime);
                    out.println("<br>Total Payment : " + tPayment);
                } else {
                    out.println("<br>Payment fail inserted into table Payment");
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
        <br><a href="pgMenu_pharmacy.jsp">Done</a>
    </body>
</html>