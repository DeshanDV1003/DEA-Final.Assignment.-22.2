<%-- 
    Document   : deleteProfile
    Created on : May 1, 2024, 7:10:07 PM
    Author     : HP
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Profile</title>
    </head>
    <body>
        <%
            Connection conn = null;
            PreparedStatement pstmt = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/perfumelanka", "root", "root");

    String custid = request.getParameter("cust_id");

    if (custid != null && !custid.isEmpty()) {
        // Prepare the SQL statement to delete the comment with the provided ID
        String sql = "DELETE FROM comment WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, custid);

        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
            response.sendRedirect("profile_view.jsp");
        } else {
            out.println("<p>Error: User not found.</p>");
        }
    } else {
        out.println("<p>Error: Invalid user ID.</p>");
    }

} catch (Exception e) {
    // Handle any exceptions
    out.println("<p>Error: " + e.getMessage() + "</p>");
    e.printStackTrace();
} finally {
    // Close resources in finally block
    try {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
    </body>
</html>
