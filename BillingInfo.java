/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author HP
 */
public class BillingInfo {
    private int billingId;
    private String date;
    private String billinAddress;
    private int postalCode;
    private String billingCity;
    private int creditCardId;
    private int customerId;

    public BillingInfo() {
    }

    public BillingInfo(String date, String billinAddress, int postalCode, String billingCity, int creditCardId, int customerId) {
        this.date = date;
        this.billinAddress = billinAddress;
        this.postalCode = postalCode;
        this.billingCity = billingCity;
        this.creditCardId = creditCardId;
        this.customerId = customerId;
    }

    public BillingInfo(int billingId, String date, String billinAddress, int postalCode, String billingCity, int creditCardId, int customerId) {
        this.billingId = billingId;
        this.date = date;
        this.billinAddress = billinAddress;
        this.postalCode = postalCode;
        this.billingCity = billingCity;
        this.creditCardId = creditCardId;
        this.customerId = customerId;
    }
    
    public int getBillingId() {
        return billingId;
    }

    public void setBillingId(int billingId) {
        this.billingId = billingId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getBillinAddress() {
        return billinAddress;
    }

    public void setBillinAddress(String billinAddress) {
        this.billinAddress = billinAddress;
    }

    public int getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(int postalCode) {
        this.postalCode = postalCode;
    }

    public String getBillingCity() {
        return billingCity;
    }

    public void setBillingCity(String billingCity) {
        this.billingCity = billingCity;
    }

    public int getCreditCardId() {
        return creditCardId;
    }

    public void setCreditCardId(int creditCardId) {
        this.creditCardId = creditCardId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getString() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
