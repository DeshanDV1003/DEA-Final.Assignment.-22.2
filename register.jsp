<%-- 
    Document   : registation
    Created on : Apr 28, 2024, 12:13:37 AM
    Author     : Deshan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registration</title>
        <style>
         .form-container  {
            margin-top: 50px; /* Adjust this value as needed */
        }
        .container1 {
            width: 300px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            text-align: center;
        }
        input[type="text"], input[type="password"], input[type="submit"] {
            width: 100%;
            margin: 5px 0;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
    </style>

        <link rel="stylesheet" type="text/css" href="styles.css">
        <script src="https://kit.fontawesome.com/1165876da6.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <main>
            <body>
                <div class="form-container">
                <div class="container1"> 
            <center>
        <form name="registrationForm" action="RegistrationServlet" method="POST">
            <table border="0">
                <h3>Register Here</h3>
                <tbody>
                    <tr>
                        <td>Full Name</td>
                        <td><input type="text" name="fullname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Username</td>
                        <td><input type="text" name="username" value="" /></td>
                    </tr>
                    <tr>
                        <td>email</td>
                        <td><input type="text" name="email" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" value="" /></td>
                    </tr>
                    <tr>
                        <td>Phone Number</td>
                        <td><input type="text" name="telephone" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Register" /></td>
                        <td><input type="reset" value="Clear" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>

        </form>
    </center>
    </div>
                </div>
        </body>
    </main>
        <%@include file="footer.jsp" %>
        
    <script>
         document.addEventListener("DOMContentLoaded", function() {
    const registrationForm = document.getElementById("registrationForm");
    const registrationSuccessMessage = document.getElementById("registrationSuccessMessage");
    
    registrationForm.addEventListener("submit", function() {
        registrationSuccessMessage.textContent = "Registration successful. Please go to the login tab to continue.";
        registrationForm.reset(); // Clear the form fields
    });
});
    </script>
    </body>
</html>
