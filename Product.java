/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.awt.image.BufferedImage;
import java.sql.Blob;

/**
 *
 * @author HP
 */
public class Product {
    private int product_id;
    private String product_name;
    private String product_description;
    private float unit_price;  
    private float unit_weight;
    private int units_inStock;
    private int recorderLevel;
    private String picture;
    private int category_id;
    private int admin_id;

    public Product(){
        
    }

    public Product(String product_name, String product_description, float unit_price, float unit_weight, int units_inStock, int recorderLevel, String picture, int category_id, int admin_id) {
        this.product_name = product_name;
        this.product_description = product_description;
        this.unit_price = unit_price;
        this.unit_weight = unit_weight;
        this.units_inStock = units_inStock;
        this.recorderLevel = recorderLevel;
        this.picture = picture;
        this.category_id = category_id;
        this.admin_id = admin_id;
    }
    
    
    
    public Product(int product_id, String product_name, String product_description, float unit_price, float unit_weight, int units_inStock, int recorderLevel, String picture, int category_id, int admin_id) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.product_description = product_description;
        this.unit_price = unit_price;
        this.unit_weight = unit_weight;
        this.units_inStock = units_inStock;
        this.recorderLevel = recorderLevel;
        this.picture = picture;
        this.category_id = category_id;
        this.admin_id = admin_id;
    }

    public Product(String productName, String productDesc, float unitPrice, float unitWeight, String picture, int categoryId) {
        this.product_name = product_name;
        this.product_description = product_description;
        this.unit_price = unit_price;
        this.unit_weight = unit_weight;
        this.picture = picture;
        this.category_id = category_id;
       
    }

    
    
    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getProduct_description() {
        return product_description;
    }

    public void setProduct_description(String product_description) {
        this.product_description = product_description;
    }

    public float getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(float unit_price) {
        this.unit_price = unit_price;
    }

    public float getUnit_weight() {
        return unit_weight;
    }

    public void setUnit_weight(float unit_weight) {
        this.unit_weight = unit_weight;
    }

    public int getUnits_inStock() {
        return units_inStock;
    }

    public void setUnits_inStock(int units_inStock) {
        this.units_inStock = units_inStock;
    }

    public int getRecorderLevel() {
        return recorderLevel;
    }

    public void setRecorderLevel(int recorderLevel) {
        this.recorderLevel = recorderLevel;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }
    
    
    
}
