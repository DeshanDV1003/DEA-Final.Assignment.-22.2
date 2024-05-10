<%-- 
    Document   : admin
    Created on : Apr 14, 2024, 11:04:11 PM
    Author     : ACER
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
 <title>Product Insert</title> 
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
</head>

<body>

    <div class="container mt-4">
        <div class="container"><a href="admin_dashboard.jsp" class="btn btn-primary">Go Back</a></div><br><br>

        <h1 class="col-12">Perfume Insert</h1>
        <form method="post" action="LogInServlet?action=loginAdmin" enctype="multipart/form-data">
            <div class="row mb-3">
                <div class="col-md-4">
                    <label for="title">Perfume Name:</label>
                    <input type="text" class="form-control" id="Product_Name" name="Product_Name" required>
                </div>
                <div class="row mb-3">
                
            </div>
           <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    <!-- Include Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>