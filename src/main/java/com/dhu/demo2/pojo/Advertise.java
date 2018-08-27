package com.dhu.demo2.pojo;

import java.util.Date;

public class Advertise {
    private Integer advertiseid;

    private String advertisename;

    private Integer productid;

    private Date uptime;

    private Integer sellerid;

    private String sellername;

    private String imagepath;

    private Date downtime;

    private String addetail;

    public Integer getAdvertiseid() {
        return advertiseid;
    }

    public void setAdvertiseid(Integer advertiseid) {
        this.advertiseid = advertiseid;
    }

    public String getAdvertisename() {
        return advertisename;
    }

    public void setAdvertisename(String advertisename) {
        this.advertisename = advertisename == null ? null : advertisename.trim();
    }

    public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }

    public Date getUptime() {
        return uptime;
    }

    public void setUptime(Date uptime) {
        this.uptime = uptime;
    }

    public Integer getSellerid() {
        return sellerid;
    }

    public void setSellerid(Integer sellerid) {
        this.sellerid = sellerid;
    }

    public String getSellername() {
        return sellername;
    }

    public void setSellername(String sellername) {
        this.sellername = sellername == null ? null : sellername.trim();
    }

    public String getImagepath() {
        return imagepath;
    }

    public void setImagepath(String imagepath) {
        this.imagepath = imagepath == null ? null : imagepath.trim();
    }

    public Date getDowntime() {
        return downtime;
    }

    public void setDowntime(Date downtime) {
        this.downtime = downtime;
    }

    public String getAddetail() {
        return addetail;
    }

    public void setAddetail(String addetail) {
        this.addetail = addetail == null ? null : addetail.trim();
    }
}