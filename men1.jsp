<%-- 
    Document   : men
    Created on : Apr 15, 2024, 6:25:54 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PerfumeLanka</title>
    <link rel="stylesheet" href="styles.css">
    <script src="https://kit.fontawesome.com/1165876da6.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
     <!--nav bar start-->
    <%@ include file="header.jsp" %>
<!--nav bar ends-->
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

<!-- products start-->
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

   <h3 class="title"> Mens Perfumes </h3>

   <div class="products-container">

     <div class="container mt-4">
        <div class="row">
            <% 
            try {
                // Database connection parameters
                String url = "jdbc:mysql://localhost:3306/perfumelanka";
                String username = "root";
                String password = "root";
                
                // Database connection
                Connection connection = DriverManager.getConnection(url, username, password);
                
                // Retrieve products from the database
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM perfume");
                
                // Display products
                while(resultSet.next()) {
                    int id = resultSet.getInt("id");
                    
                    // If id is 0, execute a loop to display additional products
                    if (id<0) {
                        for (int i = 0; i < 3; i++) {
                            %>
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">Additional Product <%= i+1 %></h5>
                                        <p class="card-text">Additional Product description <%= i+1 %></p>
                                        <!-- Display more product details as needed -->
                                    </div>
                                </div>
                            </div>
                            <%
                        }
                    }
                    else {
                        String productName = resultSet.getString("title");
                        String productDescription = resultSet.getString("description");
                        // Display the product card
                        %>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title"><%= productName %></h5>
                                    <p class="card-text"><%= productDescription %></p>
                                    <!-- Display more product details as needed -->
                                </div>
                            </div>
                        </div>
                        <%
                    }
                }
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
                // Handle database errors
            } 
            %>
        </div>
    </div>
    
      <%-- End of product loop --%>

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

<!-- products end-->
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

<!--footer part starting-->
<%@ include file="footer.jsp" %>
<!--footer part ending-->
</html>

