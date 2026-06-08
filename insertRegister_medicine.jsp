<%@ include file="connectionDB.jsp" %>
<%
    // Declare variables
    String medication_Code = request.getParameter("medication_Code");
    String medication_Name = request.getParameter("medication_Name");
    String medication_Category = request.getParameter("medication_Category");
    int medication_Quantity = Integer.parseInt(request.getParameter("medication_Quantity"));

    Statement stmtSQLMedicine = null;
    Statement stmtSQLMedicineStock = null;

    try {
        // Insert medication data into Medication table
        stmtSQLMedicine = connection.createStatement();
        String sqlInsertMedicine = "INSERT INTO Medication (medication_Code, medication_Name, medication_Category, medication_Quantity) VALUES "
                + "('" + medication_Code + "', '" + medication_Name + "', '" + medication_Category + "', " + medication_Quantity + ")";
        int rowMedicine = stmtSQLMedicine.executeUpdate(sqlInsertMedicine);

        if (rowMedicine > 0) {
            out.println("<br>Data ubat berjaya dimasukkan!<br>");

            // Check if the medication already exists in StockMedication
            stmtSQLMedicineStock = connection.createStatement();
            String sqlCheckStock = "SELECT stockMedication_id, stockMedication_Quantity FROM StockMedication WHERE stockMedication_medicationCode = '" + medication_Code + "'";
            ResultSet rsCheckStock = stmtSQLMedicineStock.executeQuery(sqlCheckStock);

            if (rsCheckStock.next()) {
                // Update the quantity for the existing medication
                int currentQuantity = rsCheckStock.getInt("stockMedication_Quantity");
                int newQuantity = currentQuantity + medication_Quantity;
                String sqlUpdateStock = "UPDATE StockMedication SET stockMedication_Quantity = " + newQuantity 
                        + " WHERE stockMedication_id = " + rsCheckStock.getInt("stockMedication_id");
                int rowUpdateStock = stmtSQLMedicineStock.executeUpdate(sqlUpdateStock);

                if (rowUpdateStock > 0) {
                    out.println("<script>alert('Successful add new medicine');" 
                                 + "window.location.href='pgMenu_pharmacy.jsp';</script>");
                } else {
                    out.println("<script>alert('Failed to add new medicine');" 
                                  + "window.location.href='frmRegister_medicine.jsp';</script>");
                }
            } else {
                // Insert a new record for the medication in StockMedication
                String sqlInsertMedicineStock = "INSERT INTO StockMedication (stockMedication_medicationCode, stockMedication_Quantity) VALUES "
                        + "('" + medication_Code + "', " + medication_Quantity + ")";
                int rowInsertStock = stmtSQLMedicineStock.executeUpdate(sqlInsertMedicineStock);

                if (rowInsertStock > 0) {
                    out.println("<script>alert('Successful add new medicine');" 
                                 + "window.location.href='pgMenu_pharmacy.jsp';</script>");
                } else {
                    out.println("<script>alert('Failed to add new medicine');" 
                                  + "window.location.href='frmRegister_medicine.jsp';</script>");
                }
            }
        } else {
            out.println("<br>Maaf data tidak berjaya dimasukkan.");
        }
    } catch (SQLException sqlError) {
        out.println("SQL Error: " + sqlError.getMessage());
    } finally {
        if (stmtSQLMedicine != null) stmtSQLMedicine.close();
        if (stmtSQLMedicineStock != null) stmtSQLMedicineStock.close();
        if (connection != null) connection.close();
    }
%>
