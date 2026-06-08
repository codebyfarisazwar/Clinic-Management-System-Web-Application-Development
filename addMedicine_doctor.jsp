<%@page import="java.sql.PreparedStatement"%> 
<%@page import="java.sql.ResultSet"%> 
<%@page import="java.sql.Statement"%> 
<%@page import="java.sql.SQLException"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@include file="connectionDB.jsp" %> 
<%@page import="java.util.Arrays"%>

<!DOCTYPE html> 
<html> 
<head> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    <title>Add New Medicine</title> 
</head>
<body> 
    <% 
        try { 
            Statement stmtSQL = connection.createStatement(); 

            // Declaration and get input
            String treatmentId = request.getParameter("treatmentId"); 
            String[] medicationCode = request.getParameterValues("code"); 
            String[] quantityStr = request.getParameterValues("quantity"); 
            int[] quantity = new int[quantityStr.length]; 
            for (int i = 0; i < quantityStr.length; i++) { 
                quantity[i] = Integer.parseInt(quantityStr[i]); 
            }

            String[] totalPriceStr = request.getParameterValues("total"); 
            Double[] totalPrice = new Double[totalPriceStr.length]; 
            for (int i = 0; i < totalPriceStr.length; i++) { 
                totalPrice[i] = Double.parseDouble(totalPriceStr[i]); 
            }

            String[] usageMethod = request.getParameterValues("usage"); 

            // Prepare statement for inserting dispense medication
            String queryInsertDispense = "INSERT INTO DispenseMedication " 
                    + "(dispenseMedication_IdTreatment, dispenseMedication_MedicationCode, dispenseMedication_UsageMethod, dispenseMedication_Quantity, dispenseMedication_TotalPrice) " 
                    + "VALUES (?, ?, ?, ?, ?)"; 

            // Prepare statement for updating stock
            String updateStockQuery = "UPDATE StockMedication SET stockMedication_Quantity = stockMedication_Quantity - ? WHERE stockMedication_medicationCode = ?";

            // Prepare statement for inserting payment
            String insertPaymentQuery = "INSERT INTO Payment " 
                    + "(payment_IdTreatment, payment_Date, payment_Time, payment_Status, payment_TotalPayment) " 
                    + "VALUES (?, CURDATE(), CURTIME(), 'In Progress', ?)";

            // Initialize total payment
            Double totalPayment = 0.0;

            // Loop through each medication
            for (int i = 0; i < medicationCode.length; i++) { 
                // Insert dispense medication
                PreparedStatement psDispense = connection.prepareStatement(queryInsertDispense);
                psDispense.setInt(1, Integer.parseInt(treatmentId));
                psDispense.setString(2, medicationCode[i]);
                psDispense.setString(3, usageMethod[i]);
                psDispense.setInt(4, quantity[i]);
                psDispense.setDouble(5, totalPrice[i]);
                int rowsInserted = psDispense.executeUpdate();

                if (rowsInserted > 0) {
                    // Update stock quantity 
                    PreparedStatement psUpdateStock = connection.prepareStatement(updateStockQuery);
                    psUpdateStock.setInt(1, quantity[i]);
                    psUpdateStock.setString(2, medicationCode[i]);
                    int stockUpdated = psUpdateStock.executeUpdate();

                    if (stockUpdated > 0) {
                        // Calculate total payment
                        totalPayment += totalPrice[i];

                        // Retrieve the inserted dispense medication record 
                        PreparedStatement psSelect = connection.prepareStatement("SELECT * FROM DispenseMedication WHERE dispenseMedication_IdTreatment = ? AND dispenseMedication_MedicationCode = ?");
                        psSelect.setInt(1, Integer.parseInt(treatmentId));
                        psSelect.setString(2, medicationCode[i]);
                        ResultSet rekod = psSelect.executeQuery();

                        if (rekod.next()) { 
                            // Output: Display the inserted record from the DispenseMedi table 
                            out.println("<br>Medicine Successfully inserted and stock updated<br>"); 
                            out.println("Treatment ID: " + rekod.getInt("dispenseMedication_IdTreatment") + "<br>"); 
                            out.println("Medication Code: " + rekod.getString("dispenseMedication_MedicationCode") + "<br>"); 
                            out.println("Usage Method: " + rekod.getString("dispenseMedication_UsageMethod") + "<br>"); 
                            out.println("Quantity: " + rekod.getInt("dispenseMedication_Quantity") + "<br>"); 
                            out.println("Total Price: " + rekod.getDouble("dispenseMedication_TotalPrice") + "<br>"); 
                        } else {
                            out.println("Failed to retrieve inserted medicine record");
                        }
                    } else {
                        out.println("Failed to update stock quantity");
                    }
                } else {
                    out.println("Medicine insertion failed");
                }
            } // End of loop 

            // Insert payment record after all medications processed
            PreparedStatement psInsertPayment = connection.prepareStatement(insertPaymentQuery);
            psInsertPayment.setInt(1, Integer.parseInt(treatmentId));
            psInsertPayment.setDouble(2, totalPayment);
            int paymentInserted = psInsertPayment.executeUpdate();

            if (paymentInserted > 0) {
                out.println("<br>Payment record inserted successfully<br>");
            } else {
                out.println("<br>Failed to insert payment record<br>");
            }

        } catch (SQLException sqlError) { 
            request.setAttribute("error", sqlError); 
            out.println("SQL Error: " + sqlError.getMessage()); 
        } finally { 
            if (connection != null) connection.close(); 
        } 
    %> 
    <br><input type="button" value="Back To Treatment Menu" onclick="window.location.href='doctorTreatmentDispense.jsp'">
</body> 
</html>