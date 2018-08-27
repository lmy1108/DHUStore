package com.dhu.demo2.dao;

import com.dhu.demo2.pojo.StoreCart;
import com.dhu.demo2.pojo.StoreCartExample;
import com.dhu.demo2.pojo.StoreCartKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

@Service
public interface StoreCartMapper {
    int countByExample(StoreCartExample example);

    int deleteByExample(StoreCartExample example);

    int deleteByPrimaryKey(StoreCartKey key);

    int insert(StoreCart record);

    int insertSelective(StoreCart record);

    List<StoreCart> selectByExample(StoreCartExample example);

    StoreCart selectByPrimaryKey(StoreCartKey key);

    int updateByExampleSelective(@Param("record") StoreCart record, @Param("example") StoreCartExample example);

    int updateByExample(@Param("record") StoreCart record, @Param("example") StoreCartExample example);

    int updateByPrimaryKeySelective(StoreCart record);

    int updateByPrimaryKey(StoreCart record);
}