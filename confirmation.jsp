<%-- 
    Document   : confirmation
    Created on : Apr 29, 2024, 8:21:37 PM
    Author     : ACER
--%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation</title>
    <!-- Add your CSS stylesheets or inline styles here -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css">
    <link rel="stylesheet" href="styles.css">
    <style>
       
    </style>
</head>
  
<body>
    <div class="confirmation-container">
        <h1>Order Confirmation</h1>
        <div class="order-details">
            <h2>Your Order Details:</h2>
            <ul>
                <li>Item: Nike Free Run 3.0 Women</li>
                <li>Price: $99.95</li>
                <!-- Add more details here using JSP EL -->
            </ul>
        </div>
        <div class="payment-details">
            <h2>Payment Details:</h2>
            <ul>
                <li>Card Type: Visa</li>
                <li>Card Holder: John Doe</li>
                <!-- Add more payment details here using JSP EL -->
            </ul>
        </div>
        <p>Thank you for your order!</p>
    </div>
</body>
</html>

