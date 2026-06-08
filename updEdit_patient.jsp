<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@include file="connectionDB.jsp" %> 
<!DOCTYPE html> 
<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Update Patient in MySQL Process</title> 
    </head> 
    <body> 
        <%            
                try {
                PreparedStatement psUpdatePatient = null;

                String pIC = request.getParameter("patient_IC");
                String pName = request.getParameter("patient_Name");
                String pGender = request.getParameter("patient_Gender");
                String pNumber = request.getParameter("patient_PhoneNumber");
                String pAddress = request.getParameter("patient_Address");
                String pAllergy = request.getParameter("patient_Allergy");

                String updatePatientSQL = "UPDATE Patient SET patient_Name = ?, "
                        + "patient_Gender = ?, patient_PhoneNumber = ?, patient_Address = ?,"
                        + "patient_Allergy = ? "
                        + "WHERE patient_IC = '" + pIC + "'";
                psUpdatePatient = connection.prepareStatement(updatePatientSQL);
                psUpdatePatient.setString(1, pName);
                psUpdatePatient.setString(2, pGender);
                psUpdatePatient.setString(3, pNumber);
                psUpdatePatient.setString(4, pAddress);
                psUpdatePatient.setString(5, pAllergy);

                int i = psUpdatePatient.executeUpdate();

                if (i >= 1) {
                    out.println("<script>alert('Patient Updated!'); "
                            + "window.location.href='pgMenu_cleark.jsp';</script>");
                } else {
                    out.println("<script>alert('Patient cannot be updated'); "
                            + "window.location.href='frmEdit_patient.jsp';</script>");
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