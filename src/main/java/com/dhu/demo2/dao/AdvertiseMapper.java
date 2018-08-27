package com.dhu.demo2.dao;

import com.dhu.demo2.pojo.Advertise;
import com.dhu.demo2.pojo.AdvertiseExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AdvertiseMapper {
    int countByExample(AdvertiseExample example);

    int deleteByExample(AdvertiseExample example);

    int deleteByPrimaryKey(Integer advertiseid);

    int insert(Advertise record);

    int insertSelective(Advertise record);

    List<Advertise> selectByExampleWithBLOBs(AdvertiseExample example);

    List<Advertise> selectByExample(AdvertiseExample example);

    Advertise selectByPrimaryKey(Integer advertiseid);

    int updateByExampleSelective(@Param("record") Advertise record, @Param("example") AdvertiseExample example);

    int updateByExampleWithBLOBs(@Param("record") Advertise record, @Param("example") AdvertiseExample example);

    int updateByExample(@Param("record") Advertise record, @Param("example") AdvertiseExample example);

    int updateByPrimaryKeySelective(Advertise record);

    int updateByPrimaryKeyWithBLOBs(Advertise record);

    int updateByPrimaryKey(Advertise record);
}