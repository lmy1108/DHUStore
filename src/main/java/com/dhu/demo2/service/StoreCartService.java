package com.dhu.demo2.service;

import com.dhu.demo2.dao.StoreCartMapper;
import com.dhu.demo2.pojo.StoreCart;
import com.dhu.demo2.pojo.StoreCartExample;
import com.dhu.demo2.pojo.StoreCartKey;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StoreCartService {

    @Autowired
    StoreCartMapper storeCartMapper;

   public int countByExample(StoreCartExample example){
        return storeCartMapper.countByExample(example);
    }

    public int deleteByExample(StoreCartExample example){
        return storeCartMapper.deleteByExample(example);
    }

    public int deleteByPrimaryKey(StoreCartKey key){
        return storeCartMapper.deleteByPrimaryKey(key);
    }

    public int insert(StoreCart record){
        return storeCartMapper.insert(record);
    }

    public int insertSelective(StoreCart record){
        return storeCartMapper.insertSelective(record);
    }

    public List<StoreCart> selectByExample(StoreCartExample example){
        return  storeCartMapper.selectByExample(example);
    }

    public StoreCart selectByPrimaryKey(StoreCartKey key){
        return storeCartMapper.selectByPrimaryKey(key);
    }

    public int updateByExampleSelective(@Param("record") StoreCart record, @Param("example") StoreCartExample example){
        return storeCartMapper.updateByExampleSelective(record, example);
    }

    public int updateByPrimaryKeySelective(StoreCart record){
       return storeCartMapper.updateByPrimaryKeySelective(record);
    }


}
