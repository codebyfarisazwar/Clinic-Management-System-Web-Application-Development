<%@ page import="java.sql.*, javax.sql.*" %>
<%@ include file="connectionDB.jsp" %>
<%
    String url = "jdbc:mysql://localhost/sql_farisazwar";
    String user = "sql_farisazwar";
    String password = "iaYDPDhJftCsDexk";

    String noIC = request.getParameter("noIC");
    String code = request.getParameter("code");
    String tICEmployee = request.getParameter("tICEmployee");
    String tDate = request.getParameter("tDate");
    String tTime = request.getParameter("tTime");
    String tIll = request.getParameter("tIll");
    String medication = request.getParameter("medication");
    int dispenseQuantity = 0;
    String usageMethod = request.getParameter("dispenseMedication_UsageMethod");
    int price = 0;
    int totalPrice = 0;

    try {
        dispenseQuantity = Integer.parseInt(request.getParameter("dispenseMedication_Quantity"));
        price = Integer.parseInt(request.getParameter("price"));
        totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
    } catch (NumberFormatException e) {
        e.printStackTrace();
        out.println("Invalid input for quantity, price, or total price. Please ensure all are valid integers.");
        return;
    }

    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    try {
        conn = DriverManager.getConnection(url, user, password);

        // Fetch the current quantity of the selected medication
        String fetchQuantitySql = "SELECT medication_Quantity FROM Medication WHERE medication_Code = ?";
        pst = conn.prepareStatement(fetchQuantitySql);
        pst.setString(1, medication);
        rs = pst.executeQuery();

        if (rs.next()) {
            int currentQuantity = rs.getInt("medication_Quantity");

            // Subtract the dispensed quantity from the current quantity
            int updatedQuantity = currentQuantity - dispenseQuantity;

            // Update the medication quantity in the Medication table
            String updateQuantitySql = "UPDATE Medication SET medication_Quantity = ? WHERE medication_Code = ?";
            pst = conn.prepareStatement(updateQuantitySql);
            pst.setInt(1, updatedQuantity);
            pst.setString(2, medication);
            int i = pst.executeUpdate();
            
            if (i >= 1) {
                // Insert the new record into DispenseMedication table
                String insertSql = "INSERT INTO DispenseMedication (dispenseMedication_IdTreatment, dispenseMedication_medicationCode, dispenseMedication_UsageMethod, dispenseMedication_Quantity, dispenseMedication_TotalPrice) VALUES (?, ?, ?, ?, ?)";
                pst = conn.prepareStatement(insertSql);
                pst.setInt(1, Integer.parseInt(code));
                pst.setString(2, medication);
                pst.setString(3, usageMethod);
                pst.setInt(4, dispenseQuantity);
                pst.setInt(5, totalPrice);
                i = pst.executeUpdate();
                
                if (i >= 1) {
                    out.println("<script>alert('Successful insert dispense medicine to patient'); "
                            + "window.location.href='pgMenu_doctor.jsp';</script>");
                } else {
                    out.println("<script>alert('Cannot be updated'); "
                            + "window.location.href='frmTreatment_doctor.jsp';</script>");
                }
            } else {
                out.println("<script>alert('Cannot be updated'); "
                        + "window.location.href='frmTreatment_doctor.jsp';</script>");
            }
        }
        
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("Database error: " + e.getMessage());
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pst != null) try { pst.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
