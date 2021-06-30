/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Thuan
 */
public class OrderDetail {

    private int id;
    private int orderID;
    private int productID;
    private String productName;
    private int productPrice;
    private String status;

    @Override
    public String toString() {
        return "OrderDetail{" + "id=" + id + ", "
                + "orderID=" + orderID + ", "
                + "productID=" + productID + ", "
                + "productName=" + productName + ", "
                + "productPrice=" + productPrice + ", "
                + "status=" + status + '}';
    }

    public OrderDetail() {

    }

    public OrderDetail(int id, int orderID, int productID, 
            String productName, int productPrice, String status) {
        this.id = id;
        this.orderID = orderID;
        this.productID = productID;
        this.productName = productName;
        this.productPrice = productPrice;
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

}
