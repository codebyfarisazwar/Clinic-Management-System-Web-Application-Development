<%--  
    Document   : doctorTreatmentUpdate.jsp 
    Created on : 8 July 2024, 6:15:56 AM 
    Author     : Iqbal
--%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@include file = "connectionDB.jsp" %> 
<!DOCTYPE html> 
<html> 
<head> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    <title>Add New Medicine</title> 
</head>
<body>
<%  
    if (request.getParameter("updateIllness") != null )
    {
        String illness = request.getParameter("illness"); 
        String Id = request.getParameter("Id"); 
        
        PreparedStatement psUpdate = null; 

        String updateSQL = "UPDATE Treatment SET Treatment_illness = ? WHERE Treatment_IdTreatment = ?"; 
        psUpdate = connection.prepareStatement(updateSQL); 
        psUpdate.setString(1, illness);
        psUpdate.setString(2, Id);

        int i = psUpdate.executeUpdate(); 

        if (i >= 1) 
        {
            out.println("<script>alert('Update Illness Success')</script>"); 

            // Retrieve the updated treatment record
            String querySQL = "SELECT * FROM Treatment WHERE treatment_IdTreatment = ?";
            PreparedStatement psQuery = connection.prepareStatement(querySQL);
            psQuery.setString(1, Id);
            ResultSet rs = psQuery.executeQuery();
            if(rs.next())
            {
                %>
                <h2>Treatment Information</h2>
                <p>Id Treatment: <%= Id %></p>
                <p>Patient IC: <%= rs.getString("treatment_PatientIC") %></p>
                <p>Date: <%= rs.getDate("treatment_Date") %></p>
                <p>Time: <%= rs.getTime("treatment_Time") %></p>
                <p>Illness: <%= rs.getString("treatment_Illness") %></p>
                <p>Employee IC: <%= rs.getString("treatment_EmployeeIC") %></p>
                
                <form name="addMedicineForm" action="doctorTreatmentDispenseInsert.jsp" method="get">
                    <table id="tableMedicine"> 
                        <tr> 
                            <th>Medicine Code & Name</th> 
                            <th>Medicine Quantity</th> 
                            <th>Usage Method</th> 
                            <th>Total Price(RM)</th> 
                            <th>Action</th> 
                        </tr> 
                        <tr> 
                            <td>
                                <select name="code">
                                    <%
                                        Statement statementSQL = connection.createStatement();
                                        String select = "SELECT medication_Code, medication_Name FROM Medication";
                                        ResultSet rs2 = statementSQL.executeQuery(select);
                                        while (rs2.next()) {
                                            String code = rs2.getString("medication_Code");
                                            String name = rs2.getString("medication_Name");
                                    %>
                                        <option value="<%= code %>"><%= code + " " + name %></option>
                                    <%
                                        }
                                        rs2.close();
                                        statementSQL.close();
                                    %>
                                </select>
                            </td> 
                            <td><input type="number" name="quantity"></td> 
                            <td><textarea name="usage" rows="4" cols="50"></textarea></td> 
                            <td><input type="number" name="total"></td> 
                            <td><button type="button" onclick="deleteRow(this)">Delete Row</button></td> 
                        </tr> 
                    </table> 
                    <input type="hidden" name="treatmentId" value="<%=Id%>">
                    <button type="button" onclick="addRow()">Add New Product (Row)</button> 
                    <input type="submit" value="Save All Product (Save All-Insert into Table product)">
                    <input type="button" value="Back To Treatment Menu" onclick="window.location.href='doctorTreatmentDispense.jsp'">
                </form> 
                <%
            }
                else {
                    out.println("<script>alert('Fail to Update Illness'); window.location.href='doctorTreatmentDispense.jsp';</script>"); 
                }
        }
    } 
        
%>
<script>
    function addRow() { 
        var table = document.getElementById("tableMedicine"); 
        var row = table.insertRow(); 
        var codeCell = row.insertCell(0); 
        var quantityCell = row.insertCell(1); 
        var usageCell = row.insertCell(2); 
        var totalCell = row.insertCell(3); 
        var deleteCell = row.insertCell(4); 

        codeCell.innerHTML = `
            <select name="code">
                <%
                    Statement statementSQL = connection.createStatement();
                    String select = "SELECT medication_Code, medication_Name FROM Medication";
                    ResultSet rs = statementSQL.executeQuery(select);
                    while (rs.next()) {
                        String code = rs.getString("medication_Code");
                        String name = rs.getString("medication_Name");
                %>
                    <option value="<%= code %>"><%= code + " " + name %></option>
                <%
                    }
                    rs.close();
                    statementSQL.close();
                %>
            </select>`;
        quantityCell.innerHTML = '<input type="number" name="quantity">'; 
        usageCell.innerHTML = '<textarea name="usage" rows="4" cols="50"></textarea>'; 
        totalCell.innerHTML = '<input type="number" name="total">'; 
        deleteCell.innerHTML = '<button type="button" onclick="deleteRow(this)">Delete Row</button>'; 
    } 

    function deleteRow(button) { 
        var row = button.parentNode.parentNode; 
        row.parentNode.removeChild(row); 
    } 
</script>
</body>
</html>