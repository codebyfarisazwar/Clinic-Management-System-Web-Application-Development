<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connectionDB.jsp" %>

<%
    // Get form parameters
    String employee_IC = request.getParameter("employee_IC");
    String employee_Address = request.getParameter("employee_Address");
    String employee_PhoneNumber = request.getParameter("employee_PhoneNumber");
    String employee_DateOfBirth = request.getParameter("employee_DateOfBirth");
    String employee_Gender = request.getParameter("employee_Gender");
    String login_loginID = request.getParameter("login_loginID");
    String login_password = request.getParameter("login_password");

    Statement statement = null;
    try {
        statement = connection.createStatement();

        // Update Employee table
        String queryUpdateEmployee = "UPDATE Employee SET " +
                                     "employee_Address = ?, " +
                                     "employee_PhoneNumber = ?, " +
                                     "employee_DateOfBirth = ?, " +
                                     "employee_Gender = ? " +
                                     "WHERE employee_IC = ?";
        PreparedStatement psEmployee = connection.prepareStatement(queryUpdateEmployee);
        psEmployee.setString(1, employee_Address);
        psEmployee.setString(2, employee_PhoneNumber);
        psEmployee.setString(3, employee_DateOfBirth);
        psEmployee.setString(4, employee_Gender);
        psEmployee.setString(5, employee_IC);
        int resultEmployee = psEmployee.executeUpdate();

        // Update Login table
        String queryUpdateLogin = "UPDATE Login SET " +
                                  "login_password = ? " + // Only updating password, assuming login ID cannot be changed
                                  "WHERE login_loginID = ?";
        PreparedStatement psLogin = connection.prepareStatement(queryUpdateLogin);
        psLogin.setString(1, login_password);
        psLogin.setString(2, login_loginID);
        int resultLogin = psLogin.executeUpdate();

        if (resultEmployee > 0 && resultLogin > 0) {
            out.println("<script>alert('Update profile and password successful'); window.location.href='pgMenu_pharmacy.jsp';</script>");
        } else {
            out.println("<script>alert('Failed to update'); window.location.href='updProfile_pharmacy.jsp';</script>");
        }
    } catch (SQLException sqlExp) {
        out.println("SQL Exception: " + sqlExp);
    } finally {
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
