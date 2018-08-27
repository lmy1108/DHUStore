package com.dhu.demo2.Controller.front;


import com.dhu.demo2.dao.AdvertiseMapper;
import com.dhu.demo2.pojo.*;
import com.dhu.demo2.service.SellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AdvertiseController {

    @Autowired
    private AdvertiseMapper advertiseMapper;
    @Autowired
    private SellerService sellerService;

    @RequestMapping(value = "/advertise" )
    public String detailAdvertise(Integer advertiseid, Model model, HttpSession session) {

        if(advertiseid == null) {
            return "redirect:/main";
        }

        User user = (User) session.getAttribute("user");

        //要传回的数据存在HashMap中
        Map<String,Object> productInfo = new HashMap<String,Object>();


        //查询广告的基本信息
        Advertise advertise = advertiseMapper.selectByPrimaryKey(advertiseid);

        Integer sellerId = advertise.getSellerid();

        Seller seller =  sellerService.selectByPrimaryKey(sellerId);

        model.addAttribute("advertise",advertise);
        model.addAttribute("seller",seller);



        //查询卖家数据



        return "advertise";
    }

}
