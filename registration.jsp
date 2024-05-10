<%-- 
    Document   : registation
    Created on : Apr 28, 2024, 12:13:37 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registration</title>
        <style>
        .container1.form{
            position: relative;
            width: 100%;
            height: 100%;
            margin: 0 auto;
            padding: 50px;
            border: 1px solid #ccc;
            border-radius: 5px;
            text-align: center;
        }
        input[type="text"], input[type="password"], input[type="submit"], input[type="reset"] {
            width: 100%;
            height: 100%;
            margin: 5px 0;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 15px;
            box-sizing: border-box;
        }
    </style>

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <script src="https://kit.fontawesome.com/1165876da6.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <main>
            <body>
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
                        <td>Address</td>
                        <td><input type="text" name="addressLine1" value="" /></td>
                    </tr>
                     <tr>
                        <td>City</td>
                        <td><input type="text" name="city" value="" /></td>
                    </tr>
                     <tr>
                        <td>Postal Code</td>
                        <td><input type="text" name="pcode" value="" /></td>
                    </tr>

                        <td><input type="submit" value="Register" /></td>
                        <td><input type="reset" value="Clear" /></td>
                    </tr>
                    
                    
                    
                </tbody>
            </table>
            <div class="sub">Already have an account <a href="Log.jsp">Login Here</a></div>

        </form>
                
    </center>
    </div>
        </body>
    </main>
        <%@include file="footer.jsp" %>
    </body>
</html>
