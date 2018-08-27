package com.dhu.demo2.pojo;

public class StoreCartKey {
    private Integer userid;

    private Integer productid;

    public StoreCartKey(Integer userid, Integer productid) {
        this.userid = userid;
        this.productid = productid;
    }

    public StoreCartKey() {
    }

    public Integer getUserid() {

        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }
}