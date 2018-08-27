package com.dhu.demo2.service;

import com.dhu.demo2.dao.ImagePathMapper;
import com.dhu.demo2.pojo.ImagePath;
import com.dhu.demo2.pojo.ImagePathExample;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class ImagePathService {
    @Autowired(required =  false)
    ImagePathMapper imagePathMapper;

   public  int countByExample(ImagePathExample example){
        return imagePathMapper.countByExample(example);
    }

    public  int deleteByExample(ImagePathExample example){
        return imagePathMapper.deleteByExample(example);
    }

    public  int deleteByPrimaryKey(Integer pathid){
        return imagePathMapper.deleteByPrimaryKey(pathid);
    }

    public int insert(ImagePath record){
        return imagePathMapper.insert(record);
    }

    public int insertSelective(ImagePath record){
        return imagePathMapper.insertSelective(record);
    }

    public List<ImagePath> selectByExample(ImagePathExample example){
        return imagePathMapper.selectByExample(example);
    }

    public ImagePath selectByPrimaryKey(Integer pathid){
        return imagePathMapper.selectByPrimaryKey(pathid);
    }

    public int updateByExampleSelective(@Param("record") ImagePath record, @Param("example") ImagePathExample example){
        return imagePathMapper.updateByExampleSelective(record, example);
    }

    public int updateByExample(@Param("record") ImagePath record, @Param("example") ImagePathExample example){
        return imagePathMapper.updateByExample(record,example);
    }


}
