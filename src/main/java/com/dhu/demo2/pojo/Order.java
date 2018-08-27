package com.dhu.demo2.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;
import java.util.List;

public class Order {
    private Integer orderid;

    private Integer userid;

    private Date ordertime;

    private Float oldprice;

    private Float newprice;

    public Order(Integer orderid, Integer userid, Date ordertime, Float oldprice, Float newprice, Boolean ispay, Boolean issend, Boolean isreceive, Boolean iscomplete, Integer addressid, Integer sellerid, String note, Integer productid) {
        this.orderid = orderid;
        this.userid = userid;
        this.ordertime = ordertime;
        this.oldprice = oldprice;
        this.newprice = newprice;
        this.ispay = ispay;
        this.issend = issend;
        this.isreceive = isreceive;
        this.iscomplete = iscomplete;
        this.addressid = addressid;
        this.sellerid = sellerid;
        this.note = note;
        this.productid = productid;
    }

    public Order() {

    }

    private Boolean ispay;

    private Boolean issend;

    private Boolean isreceive;

    private Boolean iscomplete;

    private Integer addressid;

    private Integer sellerid;

    private String note;

    private Integer productid;

    private List<Product> productInfo;

    public List<Product> getProductInfo() {
        return productInfo;
    }

    public void setProductInfo(List<Product> productInfo) {
        this.productInfo = productInfo;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    private Address address;
    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    public Date getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    public Float getOldprice() {
        return oldprice;
    }

    public void setOldprice(Float oldprice) {
        this.oldprice = oldprice;
    }

    public Float getNewprice() {
        return newprice;
    }

    public void setNewprice(Float newprice) {
        this.newprice = newprice;
    }

    public Boolean getIspay() {
        return ispay;
    }

    public void setIspay(Boolean ispay) {
        this.ispay = ispay;
    }

    public Boolean getIssend() {
        return issend;
    }

    public void setIssend(Boolean issend) {
        this.issend = issend;
    }

    public Boolean getIsreceive() {
        return isreceive;
    }

    public void setIsreceive(Boolean isreceive) {
        this.isreceive = isreceive;
    }

    public Boolean getIscomplete() {
        return iscomplete;
    }

    public void setIscomplete(Boolean iscomplete) {
        this.iscomplete = iscomplete;
    }

    public Integer getAddressid() {
        return addressid;
    }

    public void setAddressid(Integer addressid) {
        this.addressid = addressid;
    }

    public Integer getSellerid() {
        return sellerid;
    }

    public void setSellerid(Integer sellerid) {
        this.sellerid = sellerid;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }
}