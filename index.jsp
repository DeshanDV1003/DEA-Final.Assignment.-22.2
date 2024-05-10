
<%-- 
    Document   : index
    Created on : Apr 15, 2024, 12:26:07 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOC<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfume Lanka</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/indexbody.css">
    <script src="https://kit.fontawesome.com/1165876da6.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<header>
      <%@ include file="header.jsp" %>
</header>
<body>
     <!--nav bar start-->
  
<!--nav bar ends-->

<!--slides starting -->
<main>
    <body>
        
        <div class="slide-container">
            
            <div class="slides">
                <img src="images\slide1.jpg" class="active">
                <img src="images\slide2.jpg">
                <img src="images\slide4.jpg">
                <img src="images\slide3.jpg">
                <img src="images\slide5.jpg">
            </div>
        
            <div class="buttons">
                <span class="next">&#10095;</span>
                <span class="prev">&#10094;</span>
            </div>
        
            <div class="dotsContainer">
                <div class="dot active" attr='0' onclick="switchImage(this)"></div>
                <div class="dot" attr='1' onclick="switchImage(this)"></div>
                <div class="dot" attr='2' onclick="switchImage(this)"></div>
                <div class="dot" attr='3' onclick="switchImage(this)"></div>
                <div class="dot" attr='4' onclick="switchImage(this)"></div>
            </div>
        
        </div>
        
        <script type="text/javascript">
            
            // Access the Images
            let slideImages = document.querySelectorAll('img');
            // Access the next and prev buttons
            let next = document.querySelector('.next');
            let prev = document.querySelector('.prev');
            // Access the indicators
            let dots = document.querySelectorAll('.dot');
        
            var counter = 0;
        
            // Code for next button
            next.addEventListener('click', slideNext);
            function slideNext(){
            slideImages[counter].style.animation = 'next1 0.5s ease-in forwards';
            if(counter >= slideImages.length-1){
                counter = 0;
            }
            else{
                counter++;
            }
            slideImages[counter].style.animation = 'next2 0.5s ease-in forwards';
            indicators();
            }
        
            // Code for prev button
            prev.addEventListener('click', slidePrev);
            function slidePrev(){
            slideImages[counter].style.animation = 'prev1 0.5s ease-in forwards';
            if(counter == 0){
                counter = slideImages.length-1;
            }
            else{
                counter--;
            }
            slideImages[counter].style.animation = 'prev2 0.5s ease-in forwards';
            indicators();
            }
        
            // Auto slideing
            function autoSliding(){
                deletInterval = setInterval(timer, 3000);
                function timer(){
                    slideNext();
                    indicators();
                }
            }
            autoSliding();
        
            // Stop auto sliding when mouse is over
            const container = document.querySelector('.slide-container');
            container.addEventListener('mouseover', function(){
                clearInterval(deletInterval);
            });
        
            // Resume sliding when mouse is out
            container.addEventListener('mouseout', autoSliding);
        
            // Add and remove active class from the indicators
            function indicators(){
                for(i = 0; i < dots.length; i++){
                    dots[i].className = dots[i].className.replace(' active', '');
                }
                dots[counter].className += ' active';
            }
        
            // Add click event to the indicator
            function switchImage(currentImage){
                currentImage.classList.add('active');
                var imageId = currentImage.getAttribute('attr');
                if(imageId > counter){
                slideImages[counter].style.animation = 'next1 0.5s ease-in forwards';
                counter = imageId;
                slideImages[counter].style.animation = 'next2 0.5s ease-in forwards';
                }
                else if(imageId == counter){
                    return;
                }
                else{
                slideImages[counter].style.animation = 'prev1 0.5s ease-in forwards';
                counter = imageId;
                slideImages[counter].style.animation = 'prev2 0.5s ease-in forwards';	
                }
                indicators();
            }
        
        </script>
        
        </body>
</main>
<!--slides ending--> 
<!--logo slides start-->
<div class="logos">
    <div class="logos-slide">
      <img src= "images\Adidas-Logo.wine.svg"/>
      <img src= "images\Armani-Logo.wine.svg"/>
      <img src= "images\Bulgari-Logo.wine.svg"/>
      <img src= "images\Burberry-Logo.wine.svg"/>
      <img src= "images\Cartier_(jeweler)-Logo.wine.svg"/>
      <img src= "images\Chanel-Logo.wine.svg" />
      <img src= "images\Christian_Dior_(fashion_house)-Logo.wine.svg"/>
      <img src= "images\Dolce_&_Gabbana-Logo.wine.svg"/>
      <img src= "images\Gucci-Logo.wine.svg"/>
      <img src= "images\Hermès-Logo.wine.svg"/>
      <img src= "images\Hugo_Boss-Logo.wine.svg"/>
      <img src= "images\Kenzo_(brand)-Logo.wine.svg"/>
      <img src= "images\Lacoste-Logo.wine.svg"/>
      <img src= "images\Louis_Vuitton-Logo.wine.svg"/>
      <img src= "images\Ralph_Lauren_Corporation-Logo.wine.svg"/>
      
    </div>

    <div class="logos-slide">
        <img src= "images\Adidas-Logo.wine.svg"/>
      <img src= "images\Armani-Logo.wine.svg"/>
      <img src= "images\Bulgari-Logo.wine.svg"/>
      <img src= "images\Burberry-Logo.wine.svg"/>
      <img src= "images\Cartier_(jeweler)-Logo.wine.svg"/>
      <img src= "images\Chanel-Logo.wine.svg" />
      <img src= "images\Christian_Dior_(fashion_house)-Logo.wine.svg"/>
      <img src= "images\Dolce_&_Gabbana-Logo.wine.svg"/>
      <img src= "images\Gucci-Logo.wine.svg"/>
      <img src= "images\Hermès-Logo.wine.svg"/>
      <img src= "images\Hugo_Boss-Logo.wine.svg"/>
      <img src= "images\Kenzo_(brand)-Logo.wine.svg"/>
      <img src= "images\Lacoste-Logo.wine.svg"/>
      <img src= "images\Louis_Vuitton-Logo.wine.svg"/>
      <img src= "images\Ralph_Lauren_Corporation-Logo.wine.svg"/>
    </div>
  </div>
<!--logo slides End-->

<!--Grid part starting-->
<div class="Grid">

    <h1 class="heading">Our Perfumes</h1>

    <div class="box-container">

        <div class="box">
            <img src="images\grid2.jpg" alt="">
            <h3>Perfume for Womens</h3>
            <a href="women.jsp" class="btn">Shop Now</a>
        </div>

        <div class="box">
            <img src="images\grid1.jpg" alt="">
            <h3>Perfume for Mens</h3>
            <a href="men.jsp" class="btn">Shop Now</a>
        </div>

        <div class="box">
            <img src="images\unisex.jpg" alt="">
            <h3>Unisex Perfume</h3>
            <a href="unisex.jsp" class="btn">Shop Now</a>
        </div>

    </div>

</div>
<!--Grid part ending-->

<!--Top selling products start-->
<html class="abi">
    
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
   <!-- font awesome cdn link  -->
   <link class="rare" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

   

</head>

<body class="abi1">

<div class="top-selling">

   <h3 class="title"> Top selling products </h3>

   <div class="products-container">

      <div class="product" data-name="p-1">
         <img src="images\unisex6.webp" alt="">
         <h3>
            Club de nuit</h3>
         <div class="price">21,000.00</div>
      </div>

      <div class="product" data-name="p-2">
         <img src="images\unisex15.jpg" alt="">
         <h3>Dior women</h3>
         <div class="price">15,000.00</div>
      </div>

      <div class="product" data-name="p-3">
         <img src="images\club.jpg" alt="">
         <h3>Lacoste</h3>
         <div class="price">18,000.00</div>
      </div>

      <div class="product" data-name="p-4">
        <img src="images\Channelwomen3.webp" alt="">
        <h3>Club de nuit</h3>
        <div class="price">21,000.00</div>
     </div>

     <div class="product" data-name="p-5">
        <img src="images\docewomen3.jpg"alt="">
        <h3>Dior women</h3>
        <div class="price">15,000.00</div>
     </div>

     <div class="product" data-name="p-6">
        <img src="images\lvwomen1.avif" alt="">
        <h3>Lacoste</h3>
        <div class="price">18,000.00</div>
     </div>

    

   </div>

</div>

<div class="products-preview">

   <div class="preview" data-target="p-1">
      <i class="fas fa-times"></i>
      <img src="images\unisex6.webp" alt="">
      <h3>Club de nuit</h3>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur, dolorem.</p>
      <div class="price">21,000.00</div>
      <div class="buttons">
         <a href="#" class="buy">buy now</a>
         <a href="#" class="cart">add to cart</a>
      </div>
   </div>

   <div class="preview" data-target="p-2">
    <i class="fas fa-times"></i>
    <img src="images\unisex15.jpg" alt="">
    <h3>Club de nuit</h3>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur, dolorem.</p>
    <div class="price">21,000.00</div>
    <div class="buttons">
       <a href="#" class="buy">buy now</a>
       <a href="#" class="cart">add to cart</a>
    </div>
 </div>

 <div class="preview" data-target="p-3">
    <i class="fas fa-times"></i>
    <img src="images\club.jpg" alt="">
    <h3>Club de nuit</h3>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur, dolorem.</p>
    <div class="price">21,000.00</div>
    <div class="buttons">
       <a href="#" class="buy">buy now</a>
       <a href="#" class="cart">add to cart</a>
    </div>
 </div>

 <div class="preview" data-target="p-4">
    <i class="fas fa-times"></i>
    <img src="images\Channelwomen3.webp" alt="">
    <h3>Club de nuit</h3>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur, dolorem.</p>
    <div class="price">21,000.00</div>
    <div class="buttons">
       <a href="#" class="buy">buy now</a>
       <a href="#" class="cart">add to cart</a>
    </div>
 </div>

 <div class="preview" data-target="p-5">
    <i class="fas fa-times"></i>
    <img src="images\docewomen3.jpg" alt="">
    <h3>Club de nuit</h3>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur, dolorem.</p>
    <div class="price">21,000.00</div>
    <div class="buttons">
       <a href="#" class="buy">buy now</a>
       <a href="#" class="cart">add to cart</a>
    </div>
 </div>

 <div class="preview" data-target="p-6">
    <i class="fas fa-times"></i>
    <img src="images\lvwomen1.avif" alt="">
    <h3>Club de nuit</h3>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur, dolorem.</p>
    <div class="price">21,000.00</div>
    <div class="buttons">
       <a href="#" class="buy">buy now</a>
       <a href="#" class="cart">add to cart</a>
    </div>
 </div>

</div>

</body>

</html>
<script>
    let preveiwContainer = document.querySelector('.products-preview');
let previewBox = preveiwContainer.querySelectorAll('.preview');

document.querySelectorAll('.products-container .product').forEach(product =>{
  product.onclick = () =>{
    preveiwContainer.style.display = 'flex';
    let name = product.getAttribute('data-name');
    previewBox.forEach(preview =>{
      let target = preview.getAttribute('data-target');
      if(name == target){
        preview.classList.add('active');
      }
    });
  };
});

previewBox.forEach(close =>{
  close.querySelector('.fa-times').onclick = () =>{
    close.classList.remove('active');
    preveiwContainer.style.display = 'none';
  };
});
</script>

<!--Top selling products end-->
<!--Us start-->
<div class="All">
       <div class="about">
             <div class="row">
                  <div class="service">
                    <i class="fa-solid fa-truck-fast"></i>
                    <h2>Island Wide Shipping</h2>
                    <p>we will deliver island wide</p>
                  </div>
                  <div class="service">
                    <i class="fa-solid fa-spray-can-sparkles"></i>
                    <h2>Passionate About Perfume</h2>
                    <p>Dive into a world where scent becomes an art form</p>
                  </div>
                  <div class="service">
                    <i class="fa-solid fa-gift"></i>
                    <h2>Best Price</h2>
                    <p>Best price in srilanka</p>
                  </div>
             </div>
       </div>

</div>
<!--us ends-->

<!-- Dashboard Section -->
<%
    // Check if the user is logged in (you might need to modify this condition based on your authentication logic)
    boolean isLoggedIn = false; // For demonstration purpose, assuming user is not logged in
    if (isLoggedIn) {
%>
    <!-- Your dashboard HTML code here -->
    <div class="dashboard">
        <h2>Welcome to Your Dashboard</h2>
        <!-- Add more dashboard elements as needed -->
        <a href="#">View Orders</a>
        <a href="#">Edit Profile</a>
        <a href="#">Logout</a>
    </div>
<%
    }
%>

<!--footer part starting-->
<%@ include file="footer.jsp" %>
<!--footer part ending-->
</html>

