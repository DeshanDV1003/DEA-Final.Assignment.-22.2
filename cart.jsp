<%-- 
    Document   : cart
    Created on : May 1, 2024, 6:43:11 PM
    Author     : hmkoo
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .container {
            display: flex;
            justify-content: center; /* Center the cart horizontally */
            align-items: center;
            height: 100vh;
        }
        .cartTab {
            width: 500px; /* Adjusted width for a bigger cart */
            background-color: #353432;
            color: #eee;
            padding: 20px;
            transition: .5s;
            text-align: center; /* Center the content inside the cart */
        }
        .cartTab h1 {
            margin: 0 0 10px;
            font-size: 24px;
        }
        .listCart {
            overflow-y: auto;
            padding: 10px 0;
        }
        .listCart .item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 5px 0;
            border-bottom: 1px solid #eee;
        }
        .listCart .item:last-child {
            border-bottom: none;
        }
        .listCart .item .name {
            flex-grow: 1;
            font-size: 16px;
        }
        .btn {
            display: flex;
            justify-content: center; /* Center the buttons horizontally */
            margin-top: 20px;
        }
        .btn button {
            border: none;
            font-family: Poppins;
            font-weight: 500;
            cursor: pointer;
            padding: 10px 20px;
            border-radius: 5px;
            margin: 5px;
            width: 150px; /* Adjusted button width */
        }
        .close {
            background-color: #E8BC0E;
            color: #353432;
        }
        .checkOut {
            background-color: #6FB98F;
            color: #353432;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="cartTab">
            <h1>Shopping Cart</h1>
            <div class="listCart">
                <table border="1">
                    <tr>
                        <th>Perfume Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                    </tr>
                    <c:forEach var="item" items="${cartItems}">
                        <tr>
                            <td>${item.perfumeName}</td>
                            <td>${item.quantity}</td>
                            <td>${item.price}</td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="2"><strong>Total:</strong></td>
                        <td>
                            <c:set var="totalPrice" value="0" />
                            <c:forEach var="item" items="${cartItems}">
                                <c:set var="totalPrice" value="${totalPrice + item.price}" />
                            </c:forEach>
                            ${totalPrice}
                        </td>
                    </tr>
                </table>
                <!-- Items in the shopping cart will be dynamically added here -->
            </div>
            <div class="btn">
                <button class="close" onclick="goBack()">CLOSE</button>
                <button class="checkOut">Check Out</button>
            </div>
        </div>
    </div>
    <script>
        function goBack() {

