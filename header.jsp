<%-- 
    Document   : header
    Created on : Apr 15, 2024, 11:39:42 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
         <header>
    <div class="first">
        <nav>
            <h2 class="logo">Perfume Lanka</h2>
            <ul>

                <li><a href="index.jsp" class="home">Home</a></li>
                <li><a href="men.jsp">Men</a></li>
                <li><a href="women.jsp">Women</a></li>
                <li><a href="unisex.jsp">Unisex</a></li>
                <li><a href="login.jsp">Log In</a></li>
                <li><a href="registation.jsp">Sign Up</a></li>
                <li><a href="contactUs.jsp">Contact Us</a></li>
                <li><a href="cart.jsp"><i class="fa-solid fa-cart-plus"></i></a></li>
            </ul>
            <div class="menu">
                <div class="menu-line"></div>
                <div class="menu-line"></div>
                <div class="menu-line"></div>
            </div>
        </nav>
    </div>
    
</body>
<script>
    const menu = document.querySelector('.menu')
    const menulist = document.querySelector('nav ul')
    menu.addEventListener('click',()=>{
           menulist.classList.toggle('showmenu')
    })
</script>
</header>
    </body>
</html>
