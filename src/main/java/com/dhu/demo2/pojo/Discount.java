package com.dhu.demo2.pojo;

public class Discount {
    private Integer discountid;

    private String discountname;

    private String discountdes;

    private Float discountval;

    private Integer fullprice;

    private Integer reduceprice;

    private Integer fullnum;

    private Integer reducenum;

    public Integer getDiscountid() {
        return discountid;
    }

    public void setDiscountid(Integer discountid) {
        this.discountid = discountid;
    }

    public String getDiscountname() {
        return discountname;
    }

    public void setDiscountname(String discountname) {
        this.discountname = discountname == null ? null : discountname.trim();
    }

    public String getDiscountdes() {
        return discountdes;
    }

    public void setDiscountdes(String discountdes) {
        this.discountdes = discountdes == null ? null : discountdes.trim();
    }

    public Float getDiscountval() {
        return discountval;
    }

    public void setDiscountval(Float discountval) {
        this.discountval = discountval;
    }

    public Integer getFullprice() {
        return fullprice;
    }

    public void setFullprice(Integer fullprice) {
        this.fullprice = fullprice;
    }

    public Integer getReduceprice() {
        return reduceprice;
    }

    public void setReduceprice(Integer reduceprice) {
        this.reduceprice = reduceprice;
    }

    public Integer getFullnum() {
        return fullnum;
    }

    public void setFullnum(Integer fullnum) {
        this.fullnum = fullnum;
    }

    public Integer getReducenum() {
        return reducenum;
    }

    public void setReducenum(Integer reducenum) {
        this.reducenum = reducenum;
    }
}