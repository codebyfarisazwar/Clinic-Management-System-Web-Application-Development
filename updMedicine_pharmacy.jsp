<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<%
    String code = request.getParameter("code");
    String name = "";
    String category = "";
    String Mquantity = "";
    
    boolean recordFound = false;
    
    if (code != null && !code.isEmpty()) {
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost/sql_farisazwar", "sql_farisazwar", "iaYDPDhJftCsDexk");
                String sql = "SELECT * FROM Medication WHERE medication_Code = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, code);
                rs = stmt.executeQuery();

                if (rs.next()) {
                    recordFound = true;
                    code = rs.getString("medication_Code");
                    name = rs.getString("medication_Name");
                    category = rs.getString("medication_Category");
                    Mquantity = rs.getString("medication_Quantity");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
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
        <link href="css/updMedicine_pharmacy.css" rel="stylesheet">

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
                        <li><a class="nav-link scrollto active" href="pgMenu_pharmacy.jsp">Home</a></li>
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
                    <p>Check Medicine Information Here</p>
                    <!--search form-->
                    <div class="search-box">
                        <form action="updMedicine_pharmacy.jsp" method="get">
                            <div>
                                <input type="text" name="code" id="input-box" placeholder="Enter medicine code" autocomplete="off">
                                <button type="submit" name="searchmedicine"><i class="bx bx-search-alt-2"></i></button>
                            </div>
                        </form>
                    </div>

                    <br>
                    
                    <% if (code != null && !code.isEmpty() && recordFound) { %>

                    <div class="retrieve-box">

                        <form action="updpMedicine_pharmacy.jsp" method="post">

                            <input type="hidden" name="code" value="<%= code %>">

                            <div class="data">
                                <br>
                                <input type="hidden" name="code" value="<%= code %>" readonly>
                                <%    out.println("<p>Medicine Code :  " + code + "</p>");%>
                                <p>Medicine Name : <input type="name" id="name" name="name" value="<%= name %>" required></p>
                                <p>Medicine Category :
                                    <select id="category" name="category" required>
                                        <option value="<%= category %>"><%= category %></option>
                                        <option value="D">Fever</option>
                                        <option value="A">Antibiotic</option>
                                        <option value="S">Cold</option>
                                        <option value="SF">Nervous</option>
                                        <option value="TS">Pain Relief</option>
                                    </select>
                                </p>
                                <p>Add Quantity : <input type="text" id="Mquantity" name="Mquantity" placeholder="Quantity Now: <%= Mquantity %>"  required></p>
                                
                                <button class="btn" type="submit" name="updatePatient">Update</button>

                            </div>

                        </form>

                        <% } else if (code != null) { %>
                        <p style="font-size: 20px; color: red;">Record not found for Medicine Code <%= code %></p>
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