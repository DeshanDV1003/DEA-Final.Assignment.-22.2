<%-- 
    Document   : admin
    Created on : Apr 14, 2024, 11:04:11 PM
    Author     : ACER
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Page</title>
</head>
<body>
    <h1>Welcome to the Admin Page</h1>
    
    <%-- Check if the user is authenticated --%>
    <% if (session.getAttribute("loggedInUser") != null) { %>
        <p>Hello, <%= session.getAttribute("loggedInUser") %>!</p>
        <a href="logout.jsp">Logout</a>
        
        <%-- Admin functionality goes here --%>
        <!-- Add/Edit/Delete functionality -->
    <% } else { %>
        <p>You are not logged in as an admin. Please <a href="login.jsp">login</a>.</p>
    <% } %>
</body>
</html>
