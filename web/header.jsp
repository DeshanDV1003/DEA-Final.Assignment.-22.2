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
                <li><a href="">Register</a></li>
                <li><a href="">Contact Us</a></li>
                <li><a href=""><i class="fa-solid fa-cart-plus"></i></a></li>
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
