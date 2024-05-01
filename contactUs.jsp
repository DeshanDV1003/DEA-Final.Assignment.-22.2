<%-- 
    Document   : contactUs
    Created on : Apr 18, 2024, 10:41:57 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
   <link rel="stylesheet" type="text/css" href="styles.css">
  <meta name="viewport" content="width=device-width, initial-scale=">
  
</head>
<body>
<%@ include file="header.jsp" %>
<main>
<body class="contact">
  
  <section>
    
    <div class="section-header">
      <div class="container">
        <h2>Contact Us</h2>
        <p>Sri Lanka’s biggest online perfume store chain offers a wide range of perfumeries for Men and Women. The retail store houses a range of perfumes products to compliment a comprehensive family shopping experience for all our customers.
        </p>
      </div>
    </div>
    
    <div class="container">
      <div class="row">
        
        <div class="contact-info">
          <div class="contact-info-item">
            <div class="contact-info-icon">
              <i class="fas fa-home"></i>
            </div>
            
            <div class="contact-info-content">
              <h4>Address</h4>
              <p>NO 245, Havelock Road<br/> Bambalapitiya, <br/>Colombo-05</p>
            </div>
          </div>
          
          <div class="contact-info-item">
            <div class="contact-info-icon">
              <i class="fas fa-phone"></i>
            </div>
            
            <div class="contact-info-content">
              <h4>Phone</h4>
              <p>021-223 4750</p>
              <p>077-4972 929</p>
            </div>
          </div>
          
          <div class="contact-info-item">
            <div class="contact-info-icon">
              <i class="fas fa-envelope"></i>
            </div>
            
            <div class="contact-info-content">
              <h4>Email</h4>
             <p>perfumeLanka@gmail.com</p>
            </div>
          </div>
        </div>
        
        <div class="contact-form">
          <form action="" id="contact-form">
            <h2>Send Message</h2>
            <div class="input-box">
              <input type="text" required="true" name="">
              <span>Full Name</span>
            </div>
            
            <div class="input-box">
              <input type="email" required="true" name="">
              <span>Email</span>
            </div>
            
            <div class="input-box">
              <textarea required="true" name=""></textarea>
              <span>Type your Message...</span>
            </div>
            
            <div class="input-box">
              <input type="submit" value="Send" name="">
            </div>
          </form>
        </div>
        
      </div>
    </div>
  </section>
  </body>
</main>
<%@ include file="footer.jsp" %>
</body>
</html>