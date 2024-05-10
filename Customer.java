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
public class Customer {

  
    private int CustomerId;
    private String ContactName;
    private String PhoneNumber;
    private String email;
    private String city;
    private String Address;
    private int PostalCode;
    private String Password;
    private int AdminId;

    public Customer() {
    }

    public Customer(String ContactName, String PhoneNumber, String email, String city, String Address, int PostalCode, String Password) {
        this.ContactName = ContactName;
        this.PhoneNumber = PhoneNumber;
        this.email = email;
        this.city = city;
        this.Address = Address;
        this.PostalCode = PostalCode;
        this.Password = Password;
    }
    
    public Customer(String ContactName, String PhoneNumber, String email, String city, String Address, int PostalCode, String Password, int AdminId) {
        this.ContactName = ContactName;
        this.PhoneNumber = PhoneNumber;
        this.email = email;
        this.city = city;
        this.Address = Address;
        this.PostalCode = PostalCode;
        this.Password = Password;
        this.AdminId = AdminId;
    }

    public Customer(String email, String Password) {
        this.email = email;
        this.Password = Password;
    }

    public Customer(int CustomerId, String ContactName, String PhoneNumber, String email, String city, String Address, int PostalCode, String Password, int AdminId) {
        this.CustomerId = CustomerId;
        this.ContactName = ContactName;
        this.PhoneNumber = PhoneNumber;
        this.email = email;
        this.city = city;
        this.Address = Address;
        this.PostalCode = PostalCode;
        this.Password = Password;
        this.AdminId = AdminId;
    }
    
    
    public int getCustomerId() {
        return CustomerId;
    }

    public void setCustomerId(int CustomerId) {
        this.CustomerId = CustomerId;
    }

    public String getContactName() {
        return ContactName;
    }

    public void setContactName(String ContactName) {
        this.ContactName = ContactName;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public int getPostalCode() {
        return PostalCode;
    }

    public void setPostalCode(int PostalCode) {
        this.PostalCode = PostalCode;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public int getAdminId() {
        return AdminId;
    }

    public void setAdminId(int AdminId) {
        this.AdminId = AdminId;
    }
    
    
    
}
