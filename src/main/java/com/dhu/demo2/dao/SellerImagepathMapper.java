package com.dhu.demo2.dao;

import com.dhu.demo2.pojo.SellerImagepath;
import com.dhu.demo2.pojo.SellerImagepathExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

@Service
public interface SellerImagepathMapper {
    int countByExample(SellerImagepathExample example);

    int deleteByExample(SellerImagepathExample example);

    int deleteByPrimaryKey(Integer pathid);

    int insert(SellerImagepath record);

    int insertSelective(SellerImagepath record);

    List<SellerImagepath> selectByExample(SellerImagepathExample example);

    SellerImagepath selectByPrimaryKey(Integer pathid);

    int updateByExampleSelective(@Param("record") SellerImagepath record, @Param("example") SellerImagepathExample example);

    int updateByExample(@Param("record") SellerImagepath record, @Param("example") SellerImagepathExample example);

    int updateByPrimaryKeySelective(SellerImagepath record);

    int updateByPrimaryKey(SellerImagepath record);
}