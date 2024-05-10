<%-- 
    Document   : Log
    Created on : May 8, 2024, 9:40:06 PM
    Author     : kanna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Login</title> 
    <link rel="stylesheet" href=" ${pageContext.request.contextPath}/css/log.css"
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
  </head>
<%@include file="header.jsp" %>
  <body>
    <div class="container">
      <div class="wrapper">
        <div class="title"><span>Login Form</span></div>
        <form action="LogInServlet?action=loginUser" method="POST">
          <div class="row">
            <i class="fas fa-user"></i>
            <input type="text" placeholder="Email" name="email" required>
          </div>
          <div class="row">
            <i class="fas fa-lock"></i>
            <input type="password" placeholder="Password" name="password" required>
          </div>
          <div class="pass"><a href="#">Forgot password?</a></div>
          <div class="row button">
            <input type="submit" value="Login">
          </div>
          <div class="signup-link">Not a member? <a href="WEB-INF/views/registration.jsp">Register now</a></div>
          <div class="signup-link"> Admin member? <a href="WEB-INF/admin/admin.jsp"> Log In here</a></div>
        </form>
      </div>
    </div>

  </body>
    
  
  
</html>