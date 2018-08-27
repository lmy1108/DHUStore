package com.dhu.demo2.service;

import com.dhu.demo2.dao.CollectMapper;
import com.dhu.demo2.dao.ImagePathMapper;
import com.dhu.demo2.dao.ProductMapper;
import com.dhu.demo2.pojo.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("productService")
public class ProductService {
    @Autowired(required = false)
    ProductMapper productMapper;
    @Autowired(required = false)
    CollectMapper collectMapper;
    @Autowired(required = false)
    ImagePathMapper imagePathMapper;
    public int countByExample(ProductExample example){
        return productMapper.countByExample(example);
    }

    public int deleteByExample(ProductExample example){
        return productMapper.deleteByExample(example);
    }

    public  int deleteByPrimaryKey(Integer productid){
        return productMapper.deleteByPrimaryKey(productid);
    }

    public  int insert(Product record){
        return productMapper.insert(record);
    }

    public int insertSelective(Product record){
        return productMapper.insertSelective(record);
    }

    public List<Product> selectByExampleWithBLOBs(ProductExample example){
        return productMapper.selectByExampleWithBLOBs(example);
    }

    public List<Product> selectByExample(ProductExample example){
        return productMapper.selectByExampleWithBLOBs(example);
    }

    public  Product selectByPrimaryKey(Integer productid){
        return productMapper.selectByPrimaryKey(productid);
    }

    public  int updateByExampleSelective(@Param("record") Product record, @Param("example") ProductExample example){
        return productMapper.updateByExampleSelective(record,example);
    }

    public  int updateByExampleWithBLOBs(@Param("record") Product record, @Param("example") ProductExample example){
        return productMapper.updateByExample(record,example);
    }

    public  int updateByExample(@Param("record") Product record, @Param("example") ProductExample example){
        return productMapper.updateByExample(record,example);
    }

    public  int updateByPrimaryKeySelective(Product record){
        return productMapper.updateByPrimaryKeySelective(record);
    }

    public  int updateByPrimaryKeyWithBLOBs(Product record){
        return productMapper.updateByPrimaryKey(record);
    }

    public int updateByPrimaryKey(Product record){
        return productMapper.updateByPrimaryKey(record);
    }

    public Collect selectFavByKey(CollectKey collectKey) {
        return collectMapper.selectByPrimaryKey(collectKey);
    }

    public List<ImagePath> findImagePath(Integer productid) {
        ImagePathExample imagePathExample = new ImagePathExample();
        imagePathExample.or().andProductidEqualTo(productid);

        return imagePathMapper.selectByExample(imagePathExample);
    }


}
