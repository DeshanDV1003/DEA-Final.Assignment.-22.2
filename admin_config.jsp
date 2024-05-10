<%-- 
    Document   : admin_config
    Created on : Apr 30, 2024, 1:25:01 PM
    Author     : ACER
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String servername = "localhost";
String username = "root";
String password = "";
String dbname = "perfumelanka";

Connection conn = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/perfumelanka://" + servername + "/" + dbname, username, password);
    
    if (conn != null && !conn.isClosed()) {
        // Connection is successful
        out.println("Connection successful.");
    } else {
        // Connection failed
        out.println("Connection failed.");
    }
} catch (ClassNotFoundException e) {
    out.println("Error: MySQL JDBC driver not found.");
    e.printStackTrace();
} catch (SQLException e) {
    out.println("Error: " + e.getMessage());
    e.printStackTrace();
} finally {
    try {
        if (conn != null && !conn.isClosed()) {
            conn.close();
        }
    } catch (SQLException e) {
        out.println("Error while closing the connection: " + e.getMessage());
        e.printStackTrace();
    }
}
%>
