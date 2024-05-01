<%-- 
    Document   : deletePerfume
    Created on : May 1, 2024, 7:33:17 PM
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
        <title>Delete Order</title>
    </head>
    <body>
 <%
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/perfumelanka", "root", "root");

        String orderId = request.getParameter("order_id");

        if (orderId != null && !orderId.isEmpty()) {
           String sql = "DELETE FROM perfume WHERE order_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, orderId);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
               response.sendRedirect("order_view.jsp");
            } else {
               out.println("<p>Error: Order not found.</p>");
            }
        } else {
               out.println("<p>Error: Invalid order ID.</p>");
        }

    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
        e.printStackTrace();
    } finally {
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
