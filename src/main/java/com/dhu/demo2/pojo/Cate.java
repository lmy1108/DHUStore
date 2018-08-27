package com.dhu.demo2.pojo;

import java.util.List;

public class Cate {
    private Integer cateid;

    private String catename;


    private List<String> Top5CateGoods;
    private List<String> Top5CateGoodsPrice;

    public Integer getCateid() {
        return cateid;
    }

    public void setCateid(Integer cateid) {
        this.cateid = cateid;
    }

    public String getCatename() {
        return catename;
    }

    public void setCatename(String catename) {
        this.catename = catename == null ? null : catename.trim();
    }
}