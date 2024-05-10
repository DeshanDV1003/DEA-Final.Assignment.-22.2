/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author ACER
 */
public class Order {

    private int OrderID;
    private  String OrderDate;
    private String RequiredDate;
    private float total_amount;
    private String shippedDate;
    private float ShippingCost;
    private String ShipAddress;
    private int ShipPostalCode;
    private int quantity;
    private boolean OrderStatus;
    private int cartId;
    private int AdminId;
    private int CustomerId;
    private int BillingId;
    private int ShipperId;
    private int productId;

    public Order() {
    }

    public Order(String OrderDate, String RequiredDate, float total_amount, String shippedDate, float ShippingCost, String ShipAddress, int ShipPostalCode, int quantity, boolean OrderStatus, int cartId, int AdminId, int CustomerId, int BillingId, int ShipperId, int productId) {
        this.OrderDate = OrderDate;
        this.RequiredDate = RequiredDate;
        this.total_amount = total_amount;
        this.shippedDate = shippedDate;
        this.ShippingCost = ShippingCost;
        this.ShipAddress = ShipAddress;
        this.ShipPostalCode = ShipPostalCode;
        this.quantity = quantity;
        this.OrderStatus = OrderStatus;
        this.cartId = cartId;
        this.AdminId = AdminId;
        this.CustomerId = CustomerId;
        this.BillingId = BillingId;
        this.ShipperId = ShipperId;
        this.productId = productId;
    }

    public Order(int OrderID, String OrderDate, String RequiredDate, float total_amount, String shippedDate, float ShippingCost, String ShipAddress, int ShipPostalCode, int quantity, boolean OrderStatus, int cartId, int AdminId, int CustomerId, int BillingId, int ShipperId, int productId) {
        this.OrderID = OrderID;
        this.OrderDate = OrderDate;
        this.RequiredDate = RequiredDate;
        this.total_amount = total_amount;
        this.shippedDate = shippedDate;
        this.ShippingCost = ShippingCost;
        this.ShipAddress = ShipAddress;
        this.ShipPostalCode = ShipPostalCode;
        this.quantity = quantity;
        this.OrderStatus = OrderStatus;
        this.cartId = cartId;
        this.AdminId = AdminId;
        this.CustomerId = CustomerId;
        this.BillingId = BillingId;
        this.ShipperId = ShipperId;
        this.productId = productId;
    }

    public Order(int OrderID, String orderDate, int quantity, float total_amount, String requiredDate, boolean OrderStatus, int cartId, int CustomerId, int BillingId, int ShipperId, int productId) {
        this.OrderID = OrderID;
        this.OrderDate = orderDate;
        this.quantity = quantity;
        this.total_amount = total_amount;
        this.RequiredDate = requiredDate;
        this.OrderStatus = OrderStatus;
        this.cartId = cartId;
        this.CustomerId = CustomerId;
        this.BillingId = BillingId;
        this.ShipperId = ShipperId;
        this.productId = productId;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public String getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(String OrderDate) {
        this.OrderDate = OrderDate;
    }

    public String getRequiredDate() {
        return RequiredDate;
    }

    public void setRequiredDate(String RequiredDate) {
        this.RequiredDate = RequiredDate;
    }

    public float getTotal_amount() {
        return total_amount;
    }

    public void setTotal_amount(float total_amount) {
        this.total_amount = total_amount;
    }

    public String getShippedDate() {
        return shippedDate;
    }

    public void setShippedDate(String shippedDate) {
        this.shippedDate = shippedDate;
    }

    public float getShippingCost() {
        return ShippingCost;
    }

    public void setShippingCost(float ShippingCost) {
        this.ShippingCost = ShippingCost;
    }

    public String getShipAddress() {
        return ShipAddress;
    }

    public void setShipAddress(String ShipAddress) {
        this.ShipAddress = ShipAddress;
    }

    public int getShipPostalCode() {
        return ShipPostalCode;
    }

    public void setShipPostalCode(int ShipPostalCode) {
        this.ShipPostalCode = ShipPostalCode;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean getOrderStatus() {
        return OrderStatus;
    }

    public void setOrderStatus(boolean OrderStatus) {
        this.OrderStatus = OrderStatus;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getAdminId() {
        return AdminId;
    }

    public void setAdminId(int AdminId) {
        this.AdminId = AdminId;
    }

    public int getCustomerId() {
        return CustomerId;
    }

    public void setCustomerId(int CustomerId) {
        this.CustomerId = CustomerId;
    }

    public int getBillingId() {
        return BillingId;
    }

    public void setBillingId(int BillingId) {
        this.BillingId = BillingId;
    }

    public int getShipperId() {
        return ShipperId;
    }

    public void setShipperId(int ShipperId) {
        this.ShipperId = ShipperId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

        
}
