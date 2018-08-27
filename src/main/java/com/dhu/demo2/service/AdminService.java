package com.dhu.demo2.service;

import com.dhu.demo2.dao.AdminMapper;
import com.dhu.demo2.pojo.Admin;
import com.dhu.demo2.pojo.AdminExample;
import com.dhu.demo2.pojo.Seller;
import com.dhu.demo2.pojo.SellerExample;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AdminService {
    @Autowired
    AdminMapper adminMapper;

    public List<Admin> selectByExample(AdminExample example){
        return adminMapper.selectByExample(example);
    }

    public Admin selectByName(String name){
        AdminExample example = new AdminExample();
        example.or().andAdminnameEqualTo(name);
        List<Admin> adminList = adminMapper.selectByExample(example);
        if (adminList.size()==0){
            return null;
        }else{
            return adminList.get(0);
        }
    }

}
