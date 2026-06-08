<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8">
        <title>Payment | Evergreen Clinic</title>
        <link rel="stylesheet" href="css/frmPayment_pharmacy.css">
        <link href="assets/img/health.png" rel="icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="container">
            <div class="title">Payment Information</div>
            <div class="content">

                <form name="frmRegister" action="insertPayment_pharmacy.jsp" method="post">

                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Treatment ID</span>
                            <input type="text" name="treatmentid" placeholder="Enter your treatment id">
                        </div>
                        <div class="input-box">
                            <span class="details">Payment Status</span>
                            <select name="pStatus">
                                <option value="">-Select option-</option>
                                <option value="INPROGRESS">INPROGRESS</option>
                                <option value="PAID">PAID</option>
                            </select>
                        </div>
                        <div class="input-box">
                            <span class="details">Payment Date</span>
                            <input type="date" name="paymentdate" placeholder="Enter your payment date">
                        </div>
                        <div class="input-box">
                            <span class="details">Payment Time</span>
                            <input type="time" name="paymenttime" placeholder="Enter your payment time">
                        </div>
                        <div class="input-box">
                            <span class="details">Total Payment (RM)</span>
                            <input type="number" name="tPayment" placeholder="Enter total payment">
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