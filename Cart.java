
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author hmkoo
 */

public class Cart {
    private int cartId;
    private int numOfProducts;
    private float totalPrice;
    private int Customer_Id;
    private int productId;

    public Cart() {
    }
    

    public Cart(int numOfProducts, float totalPrice, int cutomerId, int productId) {
        this.numOfProducts = numOfProducts;
        this.totalPrice = totalPrice;
        this.Customer_Id = cutomerId;
        this.productId = productId;
    }

    public Cart(int cartId, int numOfProducts, float totalPrice, int cutomerId, int productId) {
        this.cartId = cartId;
        this.numOfProducts = numOfProducts;
        this.totalPrice = totalPrice;
        this.Customer_Id = cutomerId;
        this.productId = productId;
    }

  public Cart(int numOfProducts, int productId) {
        this.numOfProducts = numOfProducts;
        this.productId = productId;
    }
    
    
    
    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getNumOfProducts() {
        return numOfProducts;
    }

    public void setNumOfProducts(int numOfProducts) {
        this.numOfProducts = numOfProducts;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getCustomer_Id() {
        return Customer_Id;
    }

    public void setCustomer_Id(int Customer_Id) {
        this.Customer_Id = Customer_Id;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }
    
    
}
