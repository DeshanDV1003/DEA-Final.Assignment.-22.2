/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HP
 */
class Register {
 Statement st;
    void insertCustomer(String fname, String email, String pwd, String uname, String tele) throws SQLException {
        connectToDB();
        String query="INSERT INTO Profile (full name,username,email,password,phone number) VALUES ('"+fname+"','"+uname+"','"+email+"','"+pwd+"','"+tele+"')";
        st.executeUpdate(query);
        
    }

    private void connectToDB() {
        String driver="com.mysql.cj.jdbc.Driver";
        String url="jdbc:mysql://localhost:3306/librarydb";
        
     try {
         Class.forName(driver);
         Connection con = DriverManager.getConnection(url,"root","root");
        st = con.createStatement();
     } catch (ClassNotFoundException | SQLException ex) {
         Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
     }
        
    }
    
}
