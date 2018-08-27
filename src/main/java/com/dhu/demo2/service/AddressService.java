package com.dhu.demo2.service;

import com.dhu.demo2.dao.AddressMapper;
import com.dhu.demo2.pojo.Address;
import com.dhu.demo2.pojo.AddressExample;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("addressService")
public class AddressService {

    @Autowired(required = false)
    AddressMapper addressMapper;

    public int countByExample(AddressExample example){
        return addressMapper.countByExample(example);
    }

    public void  deleteByExample(AddressExample example){
        addressMapper.deleteByExample(example);
    }

    public void deleteByPrimaryKey(Integer addressid){
        addressMapper.deleteByPrimaryKey(addressid);
    }

    public void insert(Address record){
        addressMapper.insert(record);
    }

    public void insertSelective(Address record){
        addressMapper.insertSelective(record);
    }

    public List<Address> selectByExample(AddressExample example){
        return addressMapper.selectByExample(example);
    }

    public Address selectByPrimaryKey(Integer addressid){
        return addressMapper.selectByPrimaryKey(addressid);
    }

    void updateByExampleSelective(@Param("record") Address record, @Param("example") AddressExample example){
        addressMapper.updateByExampleSelective(record,example);
    }

    public void updateByExample(@Param("record") Address record, @Param("example") AddressExample example){
        addressMapper.updateByExample(record,example);
    }

    public void updateByPrimaryKeySelective(Address record){
        addressMapper.updateByPrimaryKeySelective(record);
    }

    public void updateByPrimaryKey(Address record){
        addressMapper.updateByPrimaryKey(record);
    }

}
