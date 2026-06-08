<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8">
        <title>Register | Evergreen Clinic</title>
        <link rel="stylesheet" href="css/frmRegister_doctor.css">
        <link href="assets/img/health.png" rel="icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script>
            function validate() {
                // declare untuk login
                let login = document.forms["registerForm"]["login"].value;
                let pass = document.forms["registerForm"]["password"].value;
                let companyName = document.forms["registerForm"]["buyerName"].value;
                let address = document.forms["registerForm"]["buyerAddress"].value;
                let tel = document.forms["registerForm"]["buyerTelephone"].value;
                let buyerId = document.forms["registerForm"]["buyerId"].value;

                //if user not input any character

                if (login === "") {
                    alert("No Kad Pengenalan must be filled out");
                    document.forms["registerForm"]["login"].select();
                    document.forms["registerForm"]["login"].focus();
                    return false;
                }

                if (pass === "") {
                    alert("Password must be filled out");
                    document.forms["registerForm"]["password"].select();
                    document.forms["registerForm"]["password"].focus();
                    return false;
                }

                if (tel === "") {
                    alert("Telephone number must be filled out");
                    document.forms["registerForm"]["buyerTelephone"].select();
                    document.forms["registerForm"]["buyerTelephone"].focus();
                    return false;
                }

                if (companyName === "") {
                    alert("Company Name must be filled out");
                    document.forms["registerForm"]["buyerName"].select();
                    document.forms["registerForm"]["buyerName"].focus();
                    return false;
                }

                if (address === "") {
                    alert("Address must be filled out");
                    document.forms["registerForm"]["buyerAddress"].select();
                    document.forms["registerForm"]["buyerAddress"].focus();
                    return false;
                }

                if (buyerId === "") {
                    alert("SupplierId must be filled out");
                    document.forms["registerForm"]["buyerId"].select();
                    document.forms["registerForm"]["buyerId"].focus();
                    return false;
                }

                if (companyName.length <= 2) {
                    alert("Company Name must be more than 2 chars");
                    document.forms["registerForm"]["buyerName"].select();
                    document.forms["registerForm"]["buyerName"].focus();
                    return false;
                }
                let letters = /^[a-zA-Z\s]+$/;
                if (!(companyName.match(letters))) {
                    alert("Input not valid, Please input alphabet characters");
                    document.forms["registerForm"]["buyerName"].select();
                    document.forms["registerForm"]["buyerName"].focus();
                    return false;
                }

                if (isNaN(tel)) {
                    alert("Input is not valid, please insert a Number");
                    document.forms["registerForm"]["buyerTelephone"].select();
                    document.forms["registerForm"]["buyerTelephone"].focus();
                    return false;
                }

                if (tel.length < 10) {
                    alert("Length of telephone number not enough,\n\
                            telephone number should be more than 10 numbers " + tel.length);
                    document.forms["registerForm"]["buyerTelephone"].select();
                    document.forms["registerForm"]["buyerTelephone"].focus();
                    return false;
                }

                let combine = /^[A-Z]+{3}\d{5}$/;
                if (!(buyerId.match(combine))) {
                    alert("Please input three capital letters and five number");
                    document.forms["registerForm"]["buyerId"].focus();
                    document.forms["registerForm"]["buyerId"].select();
                    return false;
                }

                return true;

            }
        </script>

    </head>
    <body>
        <div class="container">
            <div class="title">Register Doctor New Account</div>
            <div class="content">

                <form name="frmRegister" action="insertRegister_doctor.jsp" method="post">

                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Full Name</span>
                            <input type="text" name="fullname" placeholder="Enter your name" >
                        </div>
                        <div class="input-box">
                            <span class="details">Identification Card Number</span>
                            <input type="text" name="icnumber" placeholder="Enter your ic number" >
                        </div>
                        <div class="input-box">
                            <span class="details">Phone Number</span>
                            <input type="tel" name="phonenumber" placeholder="Enter your number" >
                        </div>
                        <div class="input-box">
                            <span class="details">Birth Date</span>
                            <input type="date" name="birthdate" placeholder="Enter your birth date" >
                        </div>
                        <div class="input-box">
                            <span class="details">Address</span>
                            <input type="text" name="address" placeholder="Enter your address" >
                        </div>
                        <div class="input-box">
                            <span class="details">Gender</span>
                            <select name="gender">
                                <option value="Gender">Gender</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                        </div>
                        <div class="input-box">
                            <span class="details">Login ID</span>
                            <input type="text" name="loginid" placeholder="Enter your login id">
                        </div>
                        <div class="input-box">
                            <span class="details">Password</span>
                            <input type="password" name="password" placeholder="Confirm your password">
                        </div>
                        
                        </div>
                        
                        <div class="button">
                            <input type="submit" onclick="return validate()" name="submitregister" value="Register">
                        </div>

                </form>

            </div>
    </body>
</html>