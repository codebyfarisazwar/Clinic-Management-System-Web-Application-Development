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
        <link href="css/tabReport_doctor.css" rel="stylesheet">

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
            <h3>Report Treatment By Patient</h3><br>
            <table class="table">
                <thead>
                    <tr>
                        <th>Treatment ID</th>
                        <th>Patient Name</th>
                        <th>Patient Illness</th>
                        <th>Medicine</th>
                    </tr>
                </thead>
                <tbody>
                    <%@include file="connectionDB.jsp" %>
                    <%
                    try{
                    
                    Statement statementSQL = connection.createStatement();
                    
                    String query = "SELECT " +
                                       "Treatment.treatment_IdTreatment, " +
                                       "Treatment.treatment_Illness, " +
                                       "Patient.patient_Name, " +
                                       "DispenseMedication.dispenseMedication_medicationCode " +
                                       "FROM Treatment " +
                                       "JOIN Patient ON Treatment.treatment_PatientIC = Patient.patient_IC " +
                                       "JOIN DispenseMedication ON Treatment.treatment_IdTreatment = DispenseMedication.dispenseMedication_IdTreatment";
                                  
                    ResultSet resultSet = statementSQL.executeQuery(query);
                    
                    while (resultSet.next()) {
                            String treatID = resultSet.getString("treatment_IdTreatment"); 
                            String pName = resultSet.getString("patient_Name"); 
                            String treatNess = resultSet.getString("treatment_Illness");                     
                            String cMedication = resultSet.getString("dispenseMedication_medicationCode");
                    %>
                    <tr>
                        <td><%= treatID %></td>
                        <td><%= pName %></td>
                        <td><%= treatNess %></td>
                        <td><%= cMedication %></td>
                    </tr>

                    <%
                        }
                    } catch(SQLException sqlExp) { 
                        request.setAttribute("error", sqlExp); 
                        out.println(sqlExp); 
                    } finally { 
                        if (connection != null) 
                            connection.close(); 
                    }
                    %>
                </tbody>
            </table>

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