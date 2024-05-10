<%-- 
    Document   : header
    Created on : Apr 15, 2024, 11:39:42 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Header</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/headercss.css">
    <script src="https://kit.fontawesome.com/c32adfdcda.js" crossorigin="anonymous"></script>

    </head>
 <!--nav bar start-->
 <header>
    <div class="first">
        <nav>
            <h2 class="logo">Perfume Lanka</h2>
            <ul>

                <li><a href="index.jsp" class="home">Home</a></li>
                <li><a href="men.jsp">Men</a></li>
                <li><a href="women.jsp">Women</a></li>
                <li><a href="unisex.jsp">Unisex</a></li>
                <li><a href="Log.jsp">Account</a></li>
                <li><a href="contactUs.jsp">Contact Us</a></li>
                <li><a href=""><i class="fa-solid fa-cart-plus"></i></a></li>
            </ul>
            <div class="menu">
                <div class="menu-line"></div>
                <div class="menu-line"></div>
                <div class="menu-line"></div>
            </div>
        </nav>
    </div>
    
<script>
    const menu = document.querySelector('.menu')
    const menulist = document.querySelector('nav ul')
    menu.addEventListener('click',()=>{
           menulist.classList.toggle('showmenu')
    })
</script>
</header>
<!--nav bar ends-->

</html>
