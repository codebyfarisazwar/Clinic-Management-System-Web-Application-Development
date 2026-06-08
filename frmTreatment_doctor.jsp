<%@ page import="java.sql.*, javax.sql.*, java.util.List, java.util.ArrayList, javax.servlet.http.*, javax.servlet.*" %>
<%
    String noIC = request.getParameter("noIC");
    String code = "";
    String tDate = "";
    String tTime = "";
    String tIll = "";
    String tICEmployee = "";
    boolean recordFound = false;

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost/sql_farisazwar", "sql_farisazwar", "iaYDPDhJftCsDexk");

        if (noIC != null && !noIC.isEmpty()) {
            String sql = "SELECT * FROM Treatment WHERE treatment_PatientIC = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, noIC);
            rs = stmt.executeQuery();

            if (rs.next()) {
                recordFound = true;
                noIC = rs.getString("treatment_PatientIC");
                code = rs.getString("treatment_IdTreatment");
                tDate = rs.getString("treatment_Date");
                tTime = rs.getString("treatment_Time");
                tIll = rs.getString("treatment_Illness");
                tICEmployee = rs.getString("treatment_EmployeeIC");
            }
            rs.close();
            stmt.close();
        }

        if (recordFound) {
            List<String[]> medications = new ArrayList<>();
            String sql = "SELECT medication_Code, medication_Name FROM Medication";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                String code2 = rs.getString("medication_Code");
                String name2 = rs.getString("medication_Name");
                medications.add(new String[]{code2, name2});
            }
            rs.close();
            stmt.close();
            request.setAttribute("medications", medications);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Doctor | Evergreen Clinic</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assets/img/health.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="css/frmTreatment_doctor.css" rel="stylesheet">

        <!-- =======================================================
        * Template Name: Appland
        * Template URL: https://bootstrapmade.com/free-bootstrap-app-landing-page-template/
        * Updated: Mar 17 2024 with Bootstrap v5.3.3
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
    </head>

    <body>

        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top  header-transparent ">
            <div class="container d-flex align-items-center justify-content-between">

                <div class="logo">
                    <h1><a href="index.html">Evergreen Clinic  </a><a href="index.html"><img src="assets/img/health.png" alt="" class="img-fluid"></a></h1>
                </div>

                <nav id="navbar" class="navbar">
                    <ul>
                        <li><a class="nav-link scrollto active" href="pgMenu_doctor.jsp">Home</a></li>
                        <li><a class="getstarted scrollto" href="logout.jsp" onclick="return confirmLogout();">Logout<i class="bi bi-door-closed"></i></a></li>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav><!-- .navbar -->

            </div>
        </header><!-- End Header -->

        <!-- ======= Hero Section ======= -->
        <section>

            <div class="container">

                <div class="content">
                    <p>Check Patient Treatment Here</p>
                    <!--search form-->
                    <div class="search-box">
                        <form action="frmTreatment_doctor.jsp" method="get">
                            <div>
                                <input type="text" name="noIC" id="input-box" placeholder="Enter patient ic number" autocomplete="off">
                                <button type="submit" name="searchpatient"><i class="bx bx-search-alt-2"></i></button>
                            </div>
                        </form>
                    </div>

                    <br>
                    <% if (noIC != null && !noIC.isEmpty() && recordFound) { %>

                    <div class="retrieve-box">

                        <form action="insertMedicine_doctor.jsp" method="post">

                            <div class="data">
                                <br>
                                <input type="hidden" name="noIC" value="<%= noIC %>" readonly>
                                <input type="hidden" id="code" name="code" value="<%= code %>" readonly>
                                <%    out.println("<p>Treatment ID :  " + code + "</p>");%>
                                <input type="hidden" id="tICEmployee" name="tICEmployee" value="<%= tICEmployee %>" readonly>
                                <%    out.println("<p>Doctor IC :  " + tICEmployee + "</p>");%>
                                <input type="hidden" id="noIC" name="noIC" value="<%= noIC %>" readonly>
                                <%    out.println("<p>Patient IC Number :  " + noIC + "</p>");%>
                                <input type="hidden" id="tDate" name="tDate" value="<%= tDate %>" readonly>
                                <input type="hidden" id="tTime" name="tTime" value="<%= tTime %>" readonly>
                                <input type="hidden" id="tIll" name="tIll" value="<%= tIll %>" readonly>
                                <%    out.println("<p>Disease :  " + tIll + "</p>");%>
                                
                                <!--dispenser medicine-->
                                <p>Medication :
                                <select id="medication" name="medication">
                                    <%
                                        List<String[]> medications = (List<String[]>) request.getAttribute("medications");
                                        if (medications != null) {
                                            for (String[] medication : medications) {
                                                String code2 = medication[0];
                                                String name2 = medication[1];
                                                out.println("<option value=\"" + code2 + "\">" + code2 + " - " + name2 + "</option>");
                                            }
                                        }
                                    %>
                                </select>
                                </p>
                                
                                <p>Quantity : <input type="text" id="dispenseMedication_Quantity" name="dispenseMedication_Quantity" required></p>
                                <p>Usage Method : <input type="text" id="dispenseMedication_UsageMethod" name="dispenseMedication_UsageMethod" required><p>
                                <p>Price (RM) : <input type="number" id="price" name="price" required></p>
                                <p>Total Price (RM) : <input type="number" id="totalPrice" name="totalPrice" required></p>

                                <button class="btn" type="submit" name="updatePatient">Save all dispense medication</button>

                            </div>

                        </form>

                        <% } else if (noIC != null) { %>
                        <p style="font-size: 20px; color: red;">Record not found for IC number <%= noIC %></p>
                        <% } %>

                    </div>
                </div>

            </div>

        </section>
        <!-- End Hero -->
        <!-- Vendor JS Files -->
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
        <script src="logout.js"></script>

    </body>

</html>