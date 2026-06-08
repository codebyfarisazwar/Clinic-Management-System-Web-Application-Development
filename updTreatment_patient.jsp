<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@include file="connectionDB.jsp" %> 
<!DOCTYPE html> 
<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Update Treatment in MySQL Process</title> 
    </head> 
    <body> 
        <%            
                try {
                PreparedStatement psUpdateTreatment = null;

                String tID = request.getParameter("treatment_IdTreatment");
                String tpIC = request.getParameter("treatment_PatientIC");
                String tIllness = request.getParameter("treatment_Illness");
                String pName = request.getString("patient_Name");
                String tEmployee = request.getString("treatment_EmployeeIC");
                
                session.setAttribute("treatment_PatientIC", tpIC);

                String updateTreatmentSQL = "UPDATE Treatment SET treatment_Illness = ? "
                        + "WHERE treatment_PatientIC = '" + tpIC + "'";
                psUpdateTreatment = connection.prepareStatement(updateTreatmentSQL);
                psUpdateTreatment.setString(1, tDisease);

                int i = psUpdateTreatment.executeUpdate();

                if (i >= 1) {
                    out.println("<script>alert('Sucessfull update and go to dispense medicine'); "
                            + "window.location.href='insertMedicine_doctor.jsp';</script>");
                } else {
                    out.println("<script>alert('Cannot be updated'); "
                            + "window.location.href='frmTreatment_doctor.jsp';</script>");
                }
            } catch (SQLException sqlExp) {
                request.setAttribute("error", sqlExp);
                out.println(sqlExp);
            } finally {
                if (connection != null) {
                    connection.close();
                }
            }
        %> 
        <br> 
    </body> 
</html>