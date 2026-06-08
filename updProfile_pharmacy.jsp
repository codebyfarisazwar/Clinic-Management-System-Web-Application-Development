<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connectionDB.jsp" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8">
        <title>Edit Profile | Evergreen Clinic</title>
        <link rel="stylesheet" href="css/updProfile_pharmacy.css">
        <link href="assets/img/health.png" rel="icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%
            // Convert session to exact value and display value 
            String Name = (String) session.getAttribute("Name");
            if (Name != null) {
        %>
        <div class="container">
            <div class="title">Update Profile <%out.println(Name);%></div>
            <div class="content">
                <%
                    }
                %>

                <form name="updProfile" action="updpProfile_pharmacy.jsp" method="get">
                    <%
                    try {
                        Statement statement = connection.createStatement();
                        String clearkLoginUsername = (String) session.getAttribute("username");
                        String querySelectCleark = "SELECT e.*, l.login_loginID, l.login_password "
                                                  + "FROM Employee e "
                                                  + "JOIN Login l ON e.employee_loginID = l.login_loginID "
                                                  + "WHERE e.employee_loginID = '" + clearkLoginUsername + "'";

                        ResultSet rsCleark = statement.executeQuery(querySelectCleark);
                        if (rsCleark.next()) {
                            // Declare and get value from attribute in table Employee and Login
                            String eIdentity = rsCleark.getString("employee_IC");
                            String eName = rsCleark.getString("employee_Name");
                            String eAddress = rsCleark.getString("employee_Address");
                            String eTelephone = rsCleark.getString("employee_PhoneNumber");
                            String eDate = rsCleark.getString("employee_DateOfBirth");
                            String eGender = rsCleark.getString("employee_Gender");
                            String loginID = rsCleark.getString("login_loginID");
                            String loginPassword = rsCleark.getString("login_password");
                    %>
                    <input type="hidden" name="employee_IC" value="<%= eIdentity %>">
                    
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Full Name</span>
                            <input type="text" name="employee_Name" value="<%= eName %>" readonly>
                        </div>
                        <div class="input-box">
                            <span class="details">Identification Card Number</span>
                            <input type="text" name="employee_IC" value="<%= eIdentity %>" readonly>
                        </div>
                        <div class="input-box">
                            <span class="details">Phone Number</span>
                            <input type="tel" name="employee_PhoneNumber" value="<%= eTelephone %>">
                        </div>
                        <div class="input-box">
                            <span class="details">Birth Date</span>
                            <input type="date" name="employee_DateOfBirth" value="<%= eDate %>">
                        </div>
                        <div class="input-box">
                            <span class="details">Address</span>
                            <input type="text" name="employee_Address" value="<%= eAddress %>">
                        </div>
                        <div class="input-box">
                            <span class="details">Gender</span>
                            <select name="employee_Gender">
                                <option value="<%= eGender %>"><%= eGender %></option>
                                <option value="Gender">Gender</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                        </div>
                        <div class="input-box">
                            <span class="details">Login ID</span>
                            <input type="text" name="login_loginID" value="<%= loginID %>" readonly>
                        </div>
                        <div class="input-box">
                            <span class="details">Password</span>
                            <input type="password" name="login_password" value="<%= loginPassword %>">
                        </div>
                    </div>
                    <div class="button">
                        <input type="submit" name="submitregister" value="Update">
                    </div>

                    <% 
                        }
                    } catch (SQLException sqlExp) { 
                        request.setAttribute("error", sqlExp); 
                        out.println(sqlExp); 
                    }
                    %> 
                </form>
            </div>
        </div>
    </body>
</html>
