<%-- 
    Document   : profile_view
    Created on : Apr 30, 2024, 1:20:00 PM
    Author     : ACER
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.stream.*" %>
<%@ page import="java.util.function.*" %>
<%@ page import="java.util.concurrent.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    String admin_config_path = "/WEB-INF/admin_config.jsp";
    RequestDispatcher admin_config_dispatcher = application.getRequestDispatcher(admin_config_path);
    admin_config_dispatcher.include(request, response);
%>
<%
Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/perfumelanka", "root", "root");

    String sql = "SELECT * FROM Customer_Order";
    stmt = conn.prepareStatement(sql);
    rs = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>

<head>
    <title>Order View</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<body>
    <br><br>
<div class="container"><a href="admin_panel.jsp" class="btn btn-primary">Go Back</a></div><br><br>
<h3>Order View</h3>
<div class="container">
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Order ID</th>
            <th>Quantity</th>
            <th>Total Amount</th>
            <th>Order Date</th>
            <th>Payment ID</th>
            <th>Customer ID</th>
            <th>Delete</th>
        </tr>
        </thead>
        
            <% while(rs.next()){ %>
            <tr>
                <td>
                    <%= rs.getString("order_id") %>
                </td>
                <td>
                    <%= rs.getString("quantity") %>
                </td>
                <td>
                    <%= rs.getString("total_amount") %>
                </td>
                <td>
                    <%= rs.getString("order_date") %>
                </td>
                <td>
                    <%= rs.getString("payment_id ") %>
                </td>
                <td>
                    <%= rs.getString("cust_id") %>
                </td>
                <td><a class="btn btn-danger" href="deleteOrder.jsp?id=<%= rs.getString("order_id") %>">Delete</a></td>
            </tr>
        <% } %>
        
    </table>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
