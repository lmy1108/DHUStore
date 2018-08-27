package com.dhu.demo2.pojo;

public class OrderItem {
    private Integer itemid;

    private Integer orderid;

    private Integer productid;

    private Integer num;

    public OrderItem(Integer itemid, Integer orderid, Integer productid, Integer num) {
        this.itemid = itemid;
        this.orderid = orderid;
        this.productid = productid;
        this.num = num;
    }

    public Integer getItemid() {
        return itemid;
    }

    public void setItemid(Integer itemid) {
        this.itemid = itemid;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }
}