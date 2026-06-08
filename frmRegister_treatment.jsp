<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8">
        <title>Register Treatment | Evergreen Clinic</title>
        <link rel="stylesheet" href="css/frmRegister_treatment.css">
        <link href="assets/img/health.png" rel="icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="container">
            <div class="title">Register Treatment Information</div>
            <div class="content">

                <form name="frmRegister" action="insertRegister_treatment.jsp" method="post">

                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Treatment ID</span>
                            <input type="text" name="treatmentid" placeholder="Enter your treatment id">
                        </div>
                        <div class="input-box">
                            <span class="details">Patient Identification Card</span>
                            <input type="text" name="icnumber" placeholder="Enter your patient ic number">
                        </div>
                        <div class="input-box">
                            <span class="details">Treatment Date</span>
                            <input type="date" name="treatmentdate" placeholder="Enter your treatment date">
                        </div>
                        <div class="input-box">
                            <span class="details">Treatment Time</span>
                            <input type="time" name="treatmenttime" placeholder="Enter your treatment time">
                        </div>
                        <div class="input-box">
                            <span class="details">Illness Experienced by Patient</span>
                            <input type="text" name="illness" placeholder="Enter your illness">
                        </div>
                        <div class="input-box">
                            <span class="details">Doctor Identity Card</span>
                            <input type="text" name="icdoctor" placeholder="Enter your doctor ic">
                        </div>
                    </div>
                    <div class="button">
                        <input type="submit" name="submitregister" value="Register">
                    </div>

                </form>

            </div>
        </div>
    </body>
</html>