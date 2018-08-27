package com.dhu.demo2.service;

import com.dhu.demo2.dao.CollectMapper;
import com.dhu.demo2.pojo.Collect;
import com.dhu.demo2.pojo.CollectExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CollectService {

    @Autowired
    private CollectMapper collectMapper;
    public List<Collect> selectByExample(CollectExample example){
        return collectMapper.selectByExample(example);
    }

}

