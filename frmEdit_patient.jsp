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
        <link href="css/frmEdit_patient.css" rel="stylesheet">

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
                        <li><a class="nav-link scrollto active" href="pgMenu_cleark.jsp">Home</a></li>
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
                    <p>Update Patient Information</p>

                    <form name="searchic" action="frmEdit_patient.jsp" method="get">
                        <div class="search-box">
                            <div>
                                <input type="text" name="patient_IC" id="input-box" placeholder="Enter patient ic number" autocomplete="off">
                                <button type="submit" name="searchpatient"><i class="bx bx-search-alt-2"></i></button>
                            </div>
                        </div>
                    </form>

                    <br>
                    <%@include file="connectionDB.jsp" %>
                    <%
                    if (request.getParameter("searchpatient") !=null  
                   &&!(request.getParameter("patient_IC").equals("")))  
                    { 
                    Statement sSelectPatientIC=null;
                    try {
                    String patientIC = request.getParameter("patient_IC");
                    sSelectPatientIC = connection.createStatement();
                    
                    String querySelectPatientIC = "SELECT * FROM Patient "
                                                                + "WHERE patient_IC= '" + patientIC + "'";
                    
                    ResultSet rsPatientIC = sSelectPatientIC.executeQuery(querySelectPatientIC);
                    
                    if (rsPatientIC.next()){
                    
                    String pIC = rsPatientIC.getString("patient_IC");
                    String pName = rsPatientIC.getString("patient_Name");
                    String pGender = rsPatientIC.getString("patient_Gender");
                    String pNumber = rsPatientIC.getString("patient_PhoneNumber");
                    String pAddress = rsPatientIC.getString("patient_Address");
                    String pAllergy = rsPatientIC.getString("patient_Allergy");
                    
                    %>
                    <div class="retrieve-box">

                        <form name="updPatient" action="updEdit_patient.jsp" method="post">
                            
                            <div class="data">
                                <br>
                                
                                <input type="hidden" name="patient_IC" value="<%=pIC%>">
                                <%    out.println("<p>Patient IC :  " + pIC + "</p>");%>
                                <p>Patient Name : <input type="text" name="patient_Name" value="<%=pName%>"></p>
                                <p>Gender : <input type="text" name="patient_Gender" value="<%=pGender%>"></p>
                                <p>Phone Number: <input type="text" name="patient_PhoneNumber" value="<%=pNumber%>"></p>
                                <p>Address : <input type="text" name="patient_Address" value="<%=pAddress%>"></p>
                                <p>Allergy : <input type="text" name="patient_Allergy" value="<%=pAllergy%>"></p>
                                
                                <button class="btn" type="submit" name="updatePatient">Update</button>
                                
                            </div>
                        </form>

                    </div>
                    <%
                        }
                            }
                            catch(SQLException sqlExp) 
                            { 
                            request.setAttribute("error", sqlExp); 
                            out.println(sqlExp); 
                            }
                        }
                    %>
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