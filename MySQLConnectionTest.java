/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypackage;

/**
 *
 * @author hmkoo
 */
import java.sql.*;

public class MySQLConnectionTest {
    public static void main(String[] args) {
        Connection conn = null;
        try {
            // Connect to MySQL database
            String url = "jdbc:mysql://localhost:3306/perfumelanka";
            String username = "root";
            String password = "hiruni";
            conn = DriverManager.getConnection(url, username, password);
            
            // Test connection
            if (conn != null) {
                System.out.println("Connected to the database!");
                // You can perform database operations here
            }
        } catch (Exception e) {
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
            }
        }
    }
}



