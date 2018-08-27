package com.dhu.demo2.pojo;

import java.util.Date;

public class Collect extends CollectKey {
    public Collect(Integer userid, Integer productid, Date collecttime) {
        super(userid, productid);
        this.collecttime = collecttime;
    }

    public Collect() {
    }


    private Date collecttime;

    public Date getCollecttime() {
        return collecttime;
    }

    public void setCollecttime(Date collecttime) {
        this.collecttime = collecttime;
    }
}