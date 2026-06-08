<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link href="css/pgMenu_pharmacy.css" rel="stylesheet">

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
                        <li><a class="nav-link scrollto" href="updProfile_pharmacy.jsp">Profile</a></li>
                        <li><a class="getstarted scrollto" href="logout.jsp"onclick="return confirmLogout();">Logout<i class="bi bi-door-closed"></i></a></li>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav><!-- .navbar -->

            </div>
        </header><!-- End Header -->

        <!-- ======= Hero Section ======= -->
        <section>

            <div class="container">

                <div class="content">
                    <h3>hi, <span>pharmacy</span></h3>
                    <h1>welcome <span><%=session.getAttribute("Name")%></span></h1>
                    <p>this is an pharmacy page</p>
                    
                    <div class="dropbtn">
                        <button>Medicine <i class="bx bx-plus-circle"></i></button>
                        <div class="dcontent">
                            <a href="frmRegister_medicine.jsp">Add Medicine</a>
                            <a href="updMedicine_pharmacy.jsp">Update Medicine</a>
                                <a href="frmDelete_medicine.jsp">Delete Medicine</a>
                        </div>
                    </div>
                    
                    <div class="dropbtn">
                        <button>Payment <i class="bx bx-money-withdraw"></i></button>
                        <div class="dcontent">
                            <a href="frmPayment_pharmacy.jsp">Add Payment</a>
                            <a href="updPayment_pharmacy.jsp">Approve payment</a>
                        </div>
                    </div>
                    
                    <div class="dropbtn">
                        <button>Report <i class="bx bx-task"></i></button>
                        <div class="dcontent">
                            <a href="tabMedicine_pharmacy.jsp">All Medicine</a>
                            <a href="tabMedicineC_pharmacy.jsp">Medicine By Category</a>
                            <a href="tabMedicineS_pharmacy.jsp">Medicine Stock</a>
                            <a href="tabMedicineP_pharmacy.jsp">Payment By Date</a>
                        </div>
                    </div>
                </div>
                
            </div>

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