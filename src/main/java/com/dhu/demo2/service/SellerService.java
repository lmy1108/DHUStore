package com.dhu.demo2.service;


import com.dhu.demo2.dao.SellerMapper;
import com.dhu.demo2.pojo.Seller;
import com.dhu.demo2.pojo.SellerExample;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SellerService {

    @Autowired(required = false)
    SellerMapper sellerMapper;

    public int countByExample(SellerExample example){
        return sellerMapper.countByExample(example);
    }

    public int deleteByExample(SellerExample example){
        return sellerMapper.deleteByExample(example);
    }

    public int deleteByPrimaryKey(Integer sellerid){
        return sellerMapper.deleteByPrimaryKey(sellerid);
    }

    public int insert(Seller record){
        return sellerMapper.insert(record);
    }

    public int insertSelective(Seller record){
        return sellerMapper.insertSelective(record);
    }

    public List<Seller> selectByExample(SellerExample example){
        return sellerMapper.selectByExample(example);
    }

    public Seller selectByPrimaryKey(Integer sellerid){
        return sellerMapper.selectByPrimaryKey(sellerid);
    }

    public int updateByExampleSelective(@Param("record") Seller record, @Param("example") SellerExample example){
        return sellerMapper.updateByExampleSelective(record,example);
    }

    public int updateByExample(@Param("record") Seller record, @Param("example") SellerExample example){
        return sellerMapper.updateByExample(record,example);
    }

    public int updateByPrimaryKeySelective(Seller record){
        return sellerMapper.updateByPrimaryKeySelective(record);
    }

    public  int updateByPrimaryKey(Seller record){
        return sellerMapper.updateByPrimaryKey(record);
    }
    public Seller selectByName(String name){
        SellerExample example = new SellerExample();
        example.or().andSellernameEqualTo(name);
        List<Seller> sellerList = sellerMapper.selectByExample(example);
        if (sellerList.size()==0){
            return null;
        }else{
            return sellerList.get(0);
        }
    }
}
