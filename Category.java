/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Blob;

/**
 *
 * @author HP
 */
public class Category {
    private int category_id;
    private String category_name;
    private String category_description;
    private String image;
    private int admin_id;

    public Category() {
    }

    public Category(String category_name, String category_description, String image, int admin_id) {
        this.category_name = category_name;
        this.category_description = category_description;
        this.image = image;
        this.admin_id = admin_id;
    }

    public Category(int category_id, String category_name, String category_description, String image, int admin_id) {
        this.category_id = category_id;
        this.category_name = category_name;
        this.category_description = category_description;
        this.image = image;
        this.admin_id = admin_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public String getCategory_description() {
        return category_description;
    }

    public void setCategory_description(String category_description) {
        this.category_description = category_description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }
    
    
}
