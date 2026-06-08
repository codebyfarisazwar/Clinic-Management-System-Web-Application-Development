<%@ include file="connectionDB.jsp" %> 
<%@ page contentType="text/html" pageEncoding="UTF-8"%> 

<% 
    try {
        // Prepare SQL statement
        PreparedStatement psUpdateMedicine = null;
        PreparedStatement psUpdateStock = null;
        PreparedStatement psGetTotalStock = null;

        // Retrieve parameters from request
        String medication_Code = request.getParameter("code");
        String medication_Name = request.getParameter("name");
        String medication_Category = request.getParameter("category");
        int medication_Quantity = Integer.parseInt(request.getParameter("Mquantity"));

        // Update Medication table
        String updateMedicineSQL = "UPDATE Medication SET "
            + "medication_Name = ?, "
            + "medication_Category = ?, "
            + "medication_Quantity = ? "
            + "WHERE medication_Code = ?";

        psUpdateMedicine = connection.prepareStatement(updateMedicineSQL);
        psUpdateMedicine.setString(1, medication_Name);
        psUpdateMedicine.setString(2, medication_Category);
        psUpdateMedicine.setInt(3, medication_Quantity);
        psUpdateMedicine.setString(4, medication_Code);

        int i = psUpdateMedicine.executeUpdate();

        if (i >= 1) {
            // Update StockMedication table
            String insertStockSQL = "INSERT INTO StockMedication (stockMedication_medicationCode, stockMedication_Quantity) "
                                    + "VALUES (?, ?)";
            psUpdateStock = connection.prepareStatement(insertStockSQL);
            psUpdateStock.setString(1, medication_Code);
            psUpdateStock.setInt(2, medication_Quantity);
            psUpdateStock.executeUpdate();

            // Calculate total stock quantity
            String getTotalStockSQL = "SELECT SUM(stockMedication_Quantity) AS totalStock FROM StockMedication WHERE stockMedication_medicationCode = ?";
            psGetTotalStock = connection.prepareStatement(getTotalStockSQL);
            psGetTotalStock.setString(1, medication_Code);
            ResultSet rsTotalStock = psGetTotalStock.executeQuery();

            int totalStockQuantity = 0;
            if (rsTotalStock.next()) {
                totalStockQuantity = rsTotalStock.getInt("totalStock");
            }

            // Update total stock in Medication table
            String updateTotalStockSQL = "UPDATE Medication SET medication_Quantity = ? WHERE medication_Code = ?";
            psUpdateMedicine = connection.prepareStatement(updateTotalStockSQL);
            psUpdateMedicine.setInt(1, totalStockQuantity);
            psUpdateMedicine.setString(2, medication_Code);
            psUpdateMedicine.executeUpdate();

            out.println("<script>alert('Successfull Update!'); "
                    + "window.location.href='pgMenu_pharmacy.jsp';</script>");
        } else {
            out.println("<script>alert('Failed Update'); "
                    + "window.location.href='updMedicine_pharmacy.jsp';</script>");
        }
    } catch (SQLException sqlExp) {
        request.setAttribute("error", sqlExp);
        out.println(sqlExp);
    } finally {
        // Close the database connection
        if (connection != null) {
            connection.close();
        }
    }
%>