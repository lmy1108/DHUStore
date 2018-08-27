package com.dhu.demo2.service;

import com.dhu.demo2.dao.ShippingMapper;
import com.dhu.demo2.pojo.Shipping;
import com.dhu.demo2.pojo.ShippingExample;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class ShippingService {
    @Autowired(required = false)
    ShippingMapper shippingMapper;


    public int deleteByExample(ShippingExample example){
        return shippingMapper.deleteByExample(example);
    }

    public int deleteByPrimaryKey(Integer shippingid){
        return shippingMapper.deleteByPrimaryKey(shippingid);
    }

    public int insert(Shipping record){
        return shippingMapper.insert(record);
    }

    public int insertSelective(Shipping record){
        return shippingMapper.insertSelective(record);
    }

    public List<Shipping> selectByExample(ShippingExample example){
        return shippingMapper.selectByExample(example);
    }

    public Shipping selectByPrimaryKey(Integer shippingid){
        return shippingMapper.selectByPrimaryKey(shippingid);
    }



    public int updateByExample(@Param("record") Shipping record, @Param("example") ShippingExample example){
        return shippingMapper.updateByExample(record,example);
    }

//    int updateByPrimaryKeySelective(Shipping record);
//
//    int updateByPrimaryKey(Shipping record);
}
