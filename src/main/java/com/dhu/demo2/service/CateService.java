package com.dhu.demo2.service;

import com.dhu.demo2.dao.CateMapper;
import com.dhu.demo2.pojo.Cate;
import com.dhu.demo2.pojo.CateExample;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CateService {
    @Autowired(required = false)
    CateMapper cateMapper;


    public int countByExample(CateExample example){
        return cateMapper.countByExample(example);
    }

    public int deleteByExample(CateExample example){
        return cateMapper.deleteByExample(example);
    }

    public int deleteByPrimaryKey(Integer cateid){
        return cateMapper.deleteByPrimaryKey(cateid);
    }

    public int insert(Cate record){
        return cateMapper.insert(record);
    }

    public int insertSelective(Cate record){
        return cateMapper.insertSelective(record);
    }

    public List<Cate> selectByExample(CateExample example){
        return cateMapper.selectByExample(example);
    }

    public Cate selectByPrimaryKey(Integer cateid){
        return cateMapper.selectByPrimaryKey(cateid);
    }


    public int updateByExample(@Param("record") Cate record, @Param("example") CateExample example){
        return cateMapper.updateByExample(record,example);
    }

    public int updateByPrimaryKeySelective(Cate record){
        return cateMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Cate record){
        return cateMapper.updateByPrimaryKey(record);
    }
}
