package com.dhu.demo2.pojo;

import java.util.Date;

public class StoreCart extends StoreCartKey {
    private Date catedate;

    private Integer productnum;

    public StoreCart() {
    }

    private Integer sellerid;

    public StoreCart(Date catedate, Integer productnum, Integer sellerid) {
        this.catedate = catedate;
        this.productnum = productnum;
        this.sellerid = sellerid;
    }

    public Date getCatedate() {
        return catedate;
    }

    public void setCatedate(Date catedate) {
        this.catedate = catedate;
    }

    public Integer getProductnum() {
        return productnum;
    }

    public void setProductnum(Integer productnum) {
        this.productnum = productnum;
    }

    public Integer getSellerid() {
        return sellerid;
    }

    public void setSellerid(Integer sellerid) {
        this.sellerid = sellerid;
    }
}