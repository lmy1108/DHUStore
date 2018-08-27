package com.dhu.demo2.pojo;

public class CollectKey {
    public CollectKey(Integer userid, Integer productid) {
        this.userid = userid;
        this.productid = productid;
    }

    public CollectKey() {
    }

    private Integer userid;

    private Integer productid;

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