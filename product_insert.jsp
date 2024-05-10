<%-- 
    Document   : product_insert
    Created on : Apr 30, 2024, 1:12:32 PM
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
        <form method="post" action="ProductServlet?action=insertProduct" enctype="multipart/form-data">
            <div class="row mb-3">
                <div class="col-md-4">
                    <label for="title">Perfume Name:</label>
                    <input type="text" class="form-control" id="Product_Name" name="Product_Name" required>
                </div>
                <div class="col-md-8">
                    <label for="sdescription">Description:</label>
                    <textarea class="form-control" id="Product_description" name="Product_description" rows="2" required></textarea>
                </div>
                <div class="col-md-6">
                    <label for="limage_2">Full Image:</label>
                    <input type="file" class="form-control" id="picture" name="picture" accept="image/*" required>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-12">
                    <label for="description_1">Unit Price</label>
                    <input type="number" class="form-control" id="Unit_Price" name="Unit_Price" rows="2" required></input>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-12">
                    <label for="description_2">Unit Weight</label>
                    <input type="number" class="form-control" id="Unit_weight" name="Unit_weight" rows="2" required></input>
                </div>
            </div>
            
            <div class="row mb-3">
                <div class="col-md-4">
                    <label for="title">Category_id:</label>
                    <input type="number" class="form-control" id="Category_id" name="Category_id" required>
                </div>
            </div>
            <!-- Add more rows as needed -->

            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    <!-- Include Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>

