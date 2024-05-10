
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
public class Shipper {

    public static void add(Shipper shipper) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    private int ShipperId;
    private String Phone;
    private String CompanyName;
    private int AdminId;

    public Shipper() {
    }

    public Shipper(String Phone, String CompanyName, int AdminId) {
        this.Phone = Phone;
        this.CompanyName = CompanyName;
        this.AdminId = AdminId;
    }

    public Shipper(int ShipperId, String Phone, String CompanyName, int AdminId) {
        this.ShipperId = ShipperId;
        this.Phone = Phone;
        this.CompanyName = CompanyName;
        this.AdminId = AdminId;
    }

    public int getShipperId() {
        return ShipperId;
    }

    public void setShipperId(int ShipperId) {
        this.ShipperId = ShipperId;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getCompanyName() {
        return CompanyName;
    }

    public void setCompanyName(String CompanyName) {
        this.CompanyName = CompanyName;
    }

    public int getAdminId() {
        return AdminId;
    }

    public void setAdminId(int AdminId) {
        this.AdminId = AdminId;
    }
    
    
}
