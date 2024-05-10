<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Order" %>
<%@ page import="controller.OrderServlet" %>
<%@ page import="dao.CustomerOrderDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String admin_config_path = "/WEB-INF/admin_config.jsp";
    RequestDispatcher admin_config_dispatcher = application.getRequestDispatcher(admin_config_path);
    admin_config_dispatcher.include(request, response);
%>

<!DOCTYPE html>
<html>

<head>
    <title>Order View</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<body>
    <br><br>
    <div class="container"><a href="admin_dashboard.jsp" class="btn btn-primary">Go Back</a></div><br><br>
    <h3>Order View</h3>
    <div class="container">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Quantity</th>
                    <th>Total Amount</th>
                    <th>Order Date</th>
                    <th>Customer ID</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${listOrder}">
                    <tr>
                        <td>${order.orderID}</td>
                        <td>${order.quantity}</td>
                        <td>${order.total_amount}</td>
                        <td>${order.orderDate}</td>
                        <td>${order.customerId}</td>
                        <td><a class="btn btn-danger" href="deleteOrder.jsp?id=${order.orderID}">Delete</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
