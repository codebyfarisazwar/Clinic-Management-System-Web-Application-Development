<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8">
        <title>Add Medicine | Evergreen Clinic</title>
        <link rel="stylesheet" href="css/frmRegister_medicine.css">
        <link href="assets/img/health.png" rel="icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script>
            function validate() {
                // declare untuk code
                let code = document.forms["frmRegister"]["medication_Code"].value;
                let name = document.forms["frmRegister"]["medication_Name"].value;
                let companyName = document.forms["frmRegister"]["medication_Category"].value;
                let address = document.forms["frmRegister"]["medication_Quantity"].value;
                let tel = document.forms["frmRegister"]["buyerTelephone"].value;
                let buyerId = document.forms["frmRegister"]["buyerId"].value;

                //if user not input any character

                if (code === "") {
                    alert("No Kad Pengenalan must be filled out");
                    document.forms["frmRegister"]["medication_Code"].select();
                    document.forms["frmRegister"]["medication_Code"].focus();
                    return false;
                }

                if (name === "") {
                    alert("Password must be filled out");
                    document.forms["frmRegister"]["medication_Name"].select();
                    document.forms["frmRegister"]["medication_Name"].focus();
                    return false;
                }

                if (companyName === "") {
                    alert("Category Name must be filled out");
                    document.forms["frmRegister"]["medication_Category"].select();
                    document.forms["frmRegister"]["medication_Category"].focus();
                    return false;
                }

                if (address === "") {
                    alert("Address must be filled out");
                    document.forms["frmRegister"]["medication_Quantity"].select();
                    document.forms["frmRegister"]["medication_Quantity"].focus();
                    return false;
                }

                return true;

            }
        </script>
    </head>
    <body>
        <%@page contentType="text/html" pageEncoding="UTF-8"%> 
        <%@include file = "connectionDB.jsp" %> 
        <div class="container">
            <div class="title">Add Medicine</div>
            <div class="content">

                <form name="frmRegister" action="insertRegister_medicine.jsp" method="post">

                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Medicine Code</span>
                            <input type="text" id="medication_Code" name="medication_Code" placeholder="Enter medicine code" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Medicine Name</span>
                            <input type="text" id="medication_Name" name="medication_Name" placeholder="Enter medicine name" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Medicine Category</span>
                            <select id="medication_Category" name="medication_Category" required>
                                <option value="">-Select option-</option>
                                <option value="D">Fever</option>
                                <option value="A">Antibiotic</option>
                                <option value="S">Cold</option>
                                <option value="SF">Nervous</option>
                                <option value="TS">Pain Relief</option>
                            </select>
                        </div>
                        <div class="input-box">
                            <span class="details">Medicine Quantity</span>
                            <input type="number" id="medication_Quantity" name="medication_Quantity" placeholder="Enter medicine quantity" required>
                        </div>
                    </div>
                    <div class="button">
                        <input type="submit" onclick="return validate()" name="submitregister" value="Add Medicine">
                    </div>

                </form>

            </div>
        </div>
    </body>
</html>