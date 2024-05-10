<%-- 
    Document   : admin_register
    Created on : May 10, 2024, 4:05:55 PM
    Author     : HP
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

        <h1 class="col-12">Admin Register</h1>
        <form method="post" action="LogInServlet?action=registerAdmin" enctype="multipart/form-data">
            <div class="row mb-3">
                <div class="col-md-4">
                    <label for="title">Admin First Name:</label>
                    <input type="text" class="form-control" id="fname" name="AdminFname" required>
                </div>
                <div class="row mb-3">
                <div class="col-md-12">
                    <label for="description_2">Admin Last Name:</label>
                    <input type="text" class="form-control" id="lname" name="AdminLname" rows="2" required></input>
                </div>
            </div>
                <div class="row mb-3">
                <div class="col-md-12">
                    <label for="description_2">Admin Email:</label>
                    <input type="text" class="form-control" id="email" name="AdminEmail" rows="2" required></input>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-4">
                    <label for="title">Admin Password:</label>
                    <input type="text" class="form-control" id="password" name="Password" required>
                </div>
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
