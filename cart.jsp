<%-- 
    Document   : cart
    Created on : May 10, 2024, 10:36:24 PM
    Author     : hmkoo
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shopping Cart</title>
    <style>
        body {
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
        }

        .container {
            background-color: yellow;
            padding: 20px;
            margin: 0 auto;
            width: 80%;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: darkred;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background-color: black;
            color: white;
            font-size: 18px;
            padding: 15px;
            text-align: left;
            border: 2px solid white;
        }

        tr.product-row td {
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }

        tr.product-row:first-child th {
            font-size: 20px;
            border-bottom: 2px solid white;
        }

        td {
            font-size: 16px;
        }

        .total-price {
            
            font-weight: bold;
            font-size: 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: darkred;
            float: right;
            margin-top: 20px;
        }
        
        
        
  
    </style>
    <script>
        function removeFromCart(cartId) {
        if (confirm("Are you sure you want to remove this item from the cart?")) {
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        // Handle success, maybe refresh the cart content on the page
                        alert("Product removed from the cart!");
                        // Example: Refresh cart content on the page
                        window.location.reload();
                    } else {
                        // Handle error
                        alert("Error removing product from the cart!");
                    }
                }
            };
            xhr.open("POST", "${contextPath}/cart", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.send("action=remove&cartId=" + cartId);
        }
    }
        
        function increaseQuantity(productId) {
            var quantityField = document.getElementById("quantity_" + productId);
            var quantity = parseInt(quantityField.value);
            quantity++;
            quantityField.value = quantity;
            updatePrice(productId, quantity);
        }

        function decreaseQuantity(productId) {
            var quantityField = document.getElementById("quantity_" + productId);
            var quantity = parseInt(quantityField.value);
            if (quantity > 1) {
                quantity--;
                quantityField.value = quantity;
                updatePrice(productId, quantity);
            }
        }

        function updatePrice(productId, quantity) {
            var unitPrice = parseFloat(document.getElementById("unitPrice_" + productId).innerText);
            var priceField = document.getElementById("price_" + productId);
            var totalPriceField = document.getElementById("totalPrice");

            if (quantity === 1) {
            priceField.innerText = unitPrice.toFixed(2);
        } else {
            var price = unitPrice * quantity;
            priceField.innerText = price.toFixed(2);
        }
            // Update total price
            var totalPrice = 0;
            var productRows = document.querySelectorAll(".product-row");
            productRows.forEach(function(row) {
                var rowPrice = parseFloat(row.querySelector(".price").innerText);
                totalPrice += rowPrice;
            });
            totalPriceField.innerText = totalPrice.toFixed(2);
        }

        function buyNow(productId) {
           var quantity = document.getElementById("quantity_" + productId).value;
           var price = document.getElementById("price_" + productId).innerText;
    
    
          window.location.href = "Checkout.jsp?productId=" + productId + "&quantity=" + quantity + "&price=" + encodeURIComponent(price);
        }
       
      function removeFromCart(cartId) {
        if (confirm("Are you sure you want to remove this item from the cart?")) {
            window.location.href = "cart?action=remove&cartId=" + cartId;
        }
        }

    function removeAndAlert(productId) {
        if (confirm("Are you sure you want to remove this item from the cart?")) {
        
            removeFromCart(productId);
            
            alert("Product removed from the cart!");
        }
        }

        function checkout() {
         var totalPrice = document.getElementById("totalPrice").innerText; // Get total price
         window.location.href = "Checkout.jsp?totalPrice=" + encodeURIComponent(totalPrice); // Redirect with total price

        }

        function continueShopping() {
            window.location.href = "index.jsp";
        }
    </script>
</head>
<body>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    <h1>Shopping Cart</h1>
    <table border="1">
        <tr>
            <th>Product Name</th>
            <th>Product Description</th>
            <th>Unit Price</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${cartItems}" var="item">
            <tr class="product-row">
                <td>${item.product.productName}</td>
                <td>${item.product.productDescription}</td>
                <td><span id="unitPrice_${item.product.productId}">${item.product.unitPrice}</span></td>
                <td>
                    <button onclick="decreaseQuantity(${item.product.productId})">-</button>
                    <input type="number" id="quantity_${item.product.productId}" value="${item.quantity}" min="1" onchange="updatePrice(${item.product.productId}, this.value)">
                    <button onclick="increaseQuantity(${item.product.productId})">+</button>
                </td>
                <td><span class="price" id="price_${item.product.productId}">${item.product.unitPrice}</span></td>
                <td>
                    <button onclick="buyNow(${item.product.productId})">Buy Now</button>
                    <button onclick="removeAndAlert(${item.product.productId})">Remove</button>
                </td>
            </tr>
        </c:forEach>
    </table>
    <p><h2>Total Price: <span id="totalPrice">0.00</span></p></h2>
    <div class="btn" style="text-align: center;">
    <button onclick="checkout()" style="background-color: yellow; color: black; font-size: larger; padding: 10px 20px;">Checkout</button>
    <button onclick="continueShopping()" style="background-color: black; color: white; font-size: larger; padding: 10px 20px;">Continue Shopping</button>
    </div>


</body>
</html>
