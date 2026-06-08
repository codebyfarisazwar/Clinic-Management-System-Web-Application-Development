<%@ page import="java.sql.*, java.util.*, java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Pharmacy | Evergreen Clinic</title>
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
        <link href="css/tabMedicineC_pharmacy.css" rel="stylesheet">

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
            <h3>Medicine List by Category</h3><br>

            <form action="tabMedicineC_pharmacy.jsp" method="get">

                <label for="mCategory">Medicine Category : </label>
                <select id="mCategory" name="mCategory" required>
                    <option value="">-Select option-</option>
                    <option value="D">Fever</option>
                    <option value="A">Antibiotic</option>
                    <option value="S">Cold</option>
                    <option value="SF">Nervous</option>
                    <option value="TS">Pain Relief</option>
                </select>

                <button type="submit">Search</button>
            </form>
            
            <br>

            <%
        String medicineCategory = request.getParameter("mCategory");
        
        if (medicineCategory != null) {
            
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost/sql_farisazwar", "sql_farisazwar", "iaYDPDhJftCsDexk");
                stmt = conn.createStatement();
                
                String query = "SELECT * FROM Medication WHERE medication_Category = '"+medicineCategory+"'";
                rs = stmt.executeQuery(query);
            %>

            <table class="table">
                <thead>
                    <tr>
                        <th>Medicine Code</th>
                        <th>Medicine Name</th>
                        <th>Medicine Category</th>
                        <th>Medicine Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                while(rs.next()) {
            
                String mCode = rs.getString("medication_Code"); 
                String mName = rs.getString("medication_Name"); 
                String meCategory = rs.getString("medication_Category"); 
                String mQuantity = rs.getString("medication_Quantity");
            
                    %>
                    <tr>
                        <td><%= mCode %></td>
                        <td><%= mName %></td>
                        <td><%= meCategory %></td>
                        <td><%= mQuantity %></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <%
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                } else {
            %>
            <p style="font-size: 20px;">Please provide medicine category.</p>
            <%
                }
            %>

        </section><!-- End Hero -->
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