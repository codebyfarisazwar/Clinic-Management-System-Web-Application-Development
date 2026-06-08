<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%@include file="connectionDB.jsp" %>

        <%
            //create session for username
            if(request.getParameter("submitLogin") != null){
                String username = request.getParameter("username");
                session.setAttribute("username", username);
            }
            //get usrname&pw from login.jsp
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            try{
                Statement statementSQL = connection.createStatement();
                
                //check username&pw value from table Login from database
                String querySelectLogin = "SELECT login_loginID, login_password "
                        + "FROM Login "
                        + "WHERE login_loginID = '"+username+"' "
                        + "AND login_password = '"+password+"' ";
                        
                //to execute query SQL statement as a result set
                //hanya select guna Resultset
                ResultSet rowLogin = statementSQL.executeQuery(querySelectLogin);
                
                //declare variable to assign value from table login to this variable
                String loginUsername ="";
                String loginPassword ="";
                
                //Resultset+WHERE perlu guna if
                if(rowLogin.next())
                {
                    //retrieve value from table login and assign to declared variable
                    loginUsername = rowLogin.getString("login_loginID");
                    loginPassword = rowLogin.getString("login_password");
                    
                    //get value from table employee from database
                    String querySelectEmployee = "SELECT employee_Name, employee_Position "
                        + "FROM Employee "
                        + "WHERE employee_loginID = '"+loginUsername+"' ";

                    //execute query to find the specific data in table employee
                    ResultSet rowEmployee = statementSQL.executeQuery(querySelectEmployee);

                    String Name = "";
                    String Type = "";

                    if(rowEmployee.next())
                    {
                        Name = rowEmployee.getString("employee_Name");
                        Type = rowEmployee.getString("employee_Position");
                        //set session to Name
                        session.setAttribute("Name", Name);
                        
                        if(Type.equals("C")){
                            //display directly to clerkMenu.jsp
                            response.sendRedirect("pgMenu_cleark.jsp");
                        }//end if(Type.equals("C"))
                        else if(Type.equals("D")){
                            response.sendRedirect("pgMenu_doctor.jsp");
                        }//end if(Type.equals("D"))
                        else if(Type.equals("P")){
                            response.sendRedirect("pgMenu_pharmacy.jsp");
                        }//end if(Type.equals("P"))

                    }//end if(rowEmployee)
                }// end (rowLogin.next())
                else
                    out.println("<script>alert('username/Password Incorrect!'); " 
                            + "window.history.back();</script>"); 
                    
            }//end try
            catch(SQLException sqlExp)
            {
                request.setAttribute("Error : ", sqlExp);
                out.println(sqlExp);
            }//end catch
            finally
            {
                if(connection != null)
                    connection.close();
            }//end finally
        %>
    </body>
</html>