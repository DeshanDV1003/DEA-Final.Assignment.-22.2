<%-- 
    Document   : delete
    Created on : Apr 30, 2024, 8:24:44 PM
    Author     : ACER
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
// Include admin_config.jsp
String admin_config_path = "/WEB-INF/admin_config.jsp";
RequestDispatcher admin_config_dispatcher = application.getRequestDispatcher(admin_config_path);
admin_config_dispatcher.include(request, response);

Connection conn = null;

try {
    // Assuming 'id' is passed in the query string
    String id = request.getParameter("id");

    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/perfumelanka", "root", "root");

    String sql = "DELETE FROM products WHERE id = ?";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1, id);

    if (stmt.executeUpdate() > 0) {
        out.println("Data deleted successfully from the column.");
    } else {
        out.println("No data found to delete.");
    }

    // Redirect to product_view.jsp
    response.sendRedirect("product_view.jsp");
} catch (Exception e) {
    out.println("Error deleting data: " + e.getMessage());
    e.printStackTrace();
} finally {
    try {
        if (conn != null && !conn.isClosed()) {
            conn.close();
        }
    } catch (SQLException ex) {
        out.println("Error while closing the connection: " + ex.getMessage());
        ex.printStackTrace();
    }
}
%>


