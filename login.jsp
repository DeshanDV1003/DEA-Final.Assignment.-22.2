<%-- 
    Document   : login
    Created on : Apr 14, 2024, 11:07:42 PM
    Author     : ACER
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        

<head>
    <meta charset="UTF-8">
    <title>Login</title>
     <link rel="stylesheet" type="text/css" href="styles.css">
</head>
</head>
<body>
    <div class="background">
        <div class="shape"></div>
        <div class="shape"></div>
    </div>
    <form action="LogInServlet" method="post">
        <h3>Login Here</h3>

        <label for="username">Email</label>
        <input type="text" placeholder="Email" id="username">

        <label for="password">Password</label>
        <input type="password" placeholder="Password" id="password">

        <button>Log In</button>
        <div class="social">
          <div class="go"><i class="fab fa-google"><img src="images\google.png" width=25 height=25><a href="https://www.google.com/"></i>  Google</div>
          <div class="fb"><i class="fab fa-facebook"><img src="images\facebook.png" width=25 height=25><a href="https://www.facebook.com/"></i>  Facebook</div>
        </div>
    </form>
</body>
</html>


