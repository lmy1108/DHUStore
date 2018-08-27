package com.dhu.demo2.service;

import com.dhu.demo2.dao.UserMapper;
import com.dhu.demo2.pojo.User;
import com.dhu.demo2.pojo.UserExample;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserService {
    @Autowired(required = false)
    UserMapper userMapper;


    public int deleteByExample(UserExample example){
       return userMapper.deleteByExample(example);
    }

    public int deleteByPrimaryKey(Integer userid){
        return userMapper.deleteByPrimaryKey(userid);
    }

    public int insert(User record){
        return userMapper.insert(record);
    }

    public int insertSelective(User record){
        return userMapper.insertSelective(record);
    }

    public List<User> selectByExample(UserExample example){
        return userMapper.selectByExample(example);
    }

    public User selectByPrimaryKey(Integer userid){
        return userMapper.selectByPrimaryKey(userid);
    }

    public  int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example){
        return userMapper.updateByExampleSelective(record,example);
    }

    public int updateByExample(@Param("record") User record, @Param("example") UserExample example){
        return userMapper.updateByExample(record,example);
    }

    public int updateByPrimaryKeySelective(User record){
        return userMapper.updateByPrimaryKey(record);
    }

    public int updateByPrimaryKey(User record){
        return userMapper.updateByPrimaryKey(record);
    }
}
