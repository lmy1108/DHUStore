package com.dhu.demo2.service;

import com.dhu.demo2.dao.OrderItemMapper;
import com.dhu.demo2.pojo.OrderItem;
import com.dhu.demo2.pojo.OrderItemExample;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class OrderItemService {
    @Autowired(required = false)
    OrderItemMapper orderItemMapper;
    public int countByExample(OrderItemExample example){
        return orderItemMapper.countByExample(example);
    }

    public int deleteByExample(OrderItemExample example){
        return orderItemMapper.deleteByExample(example);
    }

    public int deleteByPrimaryKey(Integer itemid){
        return orderItemMapper.deleteByPrimaryKey(itemid);
    }

    public int insert(OrderItem record){
        return orderItemMapper.insert(record);
    }

    public int insertSelective(OrderItem record){
        return orderItemMapper.insertSelective(record);
    }

    public List<OrderItem> selectByExample(OrderItemExample example){
        return orderItemMapper.selectByExample(example);
    }

    public OrderItem selectByPrimaryKey(Integer itemid){
        return orderItemMapper.selectByPrimaryKey(itemid);
    }


}
