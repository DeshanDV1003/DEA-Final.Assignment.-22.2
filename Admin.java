/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author ACER
 */
public class Admin {

   
    private int AdminId;
    private String AdminFname;
    private String AdminLname;
    private String AdminEmail;
    private String Password;

    public Admin() {
    }
    
    public Admin(String AdminFname, String AdminLname, String AdminEmail, String Password) {
        this.AdminFname = AdminFname;
        this.AdminLname = AdminLname;
        this.AdminEmail = AdminEmail;
        this.Password = Password;
    }
    
    public Admin(int AdminId, String AdminFname, String AdminLname, String AdminEmail, String Password) {
        this.AdminId = AdminId;
        this.AdminFname = AdminFname;
        this.AdminLname = AdminLname;
        this.AdminEmail = AdminEmail;
        this.Password = Password;
    }
    
    public int getAdminId() {
        return AdminId;
    }

    public void setAdminId(int AdminId) {
        this.AdminId = AdminId;
    }

    public String getAdminFname() {
        return AdminFname;
    }

    public void setAdminFname(String AdminFname) {
        this.AdminFname = AdminFname;
    }

    public String getAdminLname() {
        return AdminLname;
    }

    public void setAdminLname(String AdminLname) {
        this.AdminLname = AdminLname;
    }

    public String getAdminEmail() {
        return AdminEmail;
    }

    public void setAdminEmail(String AdminEmail) {
        this.AdminEmail = AdminEmail;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

   
    
    
}
