<%@ include file="connectionDB.jsp" %> 
<%@ page contentType="text/html" pageEncoding="UTF-8"%> 

<% 
    try {
        // Retrieve parameters from request
        String treatID = request.getParameter("code");
        String pstatus = request.getParameter("status");

        // Update Payment table
        String updateMedicineSQL = "UPDATE Payment SET payment_Status = ? WHERE payment_IdTreatment = ?";

        PreparedStatement psUpdatePayment = connection.prepareStatement(updateMedicineSQL);
        psUpdatePayment.setString(1, pstatus);
        psUpdatePayment.setString(2, treatID);

        int i = psUpdatePayment.executeUpdate();
        
        if (i >= 1) {
            out.println("<script>alert('Approve successful'); window.location.href='pgMenu_pharmacy.jsp';</script>");
        } else {
            out.println("<script>alert('Failed to approve'); window.location.href='updPayment_pharmacy.jsp';</script>");
        }
                
    } catch (SQLException sqlExp) {
        request.setAttribute("error", sqlExp);
        out.println(sqlExp);
    } finally {
        // Close the database connection
        if (connection != null) {
            try { connection.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
%>
