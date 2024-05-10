<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Customer" %>
<!DOCTYPE html>
<html>

<head>
    <title>Customer View</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<body>
    <br><br>
    <div class="container"><a href="admin_dashboard.jsp" class="btn btn-primary">Go Back</a></div><br><br>
    <center>
        <h3>Customer View</h3>
    </center>
    <div class="container">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Customer ID</th>
                    <th>Contact Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Address</th>
                    <th>City</th>
                    <th>Postal Code</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listCustomer}" var="customer">
                    <tr>
                        <td>${customer.customerId}</td>
                        <td>${customer.contactName}</td>
                        <td>${customer.email}</td>
                        <td>${customer.phoneNumber}</td>
                        <td>${customer.address}</td>
                        <td>${customer.city}</td>
                        <td>${customer.postalCode}</td>
                        <td><a class="btn btn-danger" href="deleteCustomer.jsp?CustomerId=${customer.customerId}">Delete</a></td>
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
