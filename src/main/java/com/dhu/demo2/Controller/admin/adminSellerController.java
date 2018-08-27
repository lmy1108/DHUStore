package com.dhu.demo2.Controller.admin;

import com.dhu.demo2.pojo.Seller;
import com.dhu.demo2.pojo.SellerExample;
import com.dhu.demo2.pojo.User;
import com.dhu.demo2.pojo.UserExample;
import com.dhu.demo2.service.SellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Controller
public class adminSellerController {

    @Autowired
    private SellerService sellerService;

    @RequestMapping("/adminSellerjson")
    @ResponseBody
    public Map<String,Object> adminSellerjson(Model model, String minTime, String maxTime, String itemName, String realName, Integer itemId) {
        System.out.println("in");
        //时间格式转换String转Date
        SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
        Date date1 = null;
        Date date2 = null;
        if(minTime!=null&&maxTime!=null&&!minTime.equals("")&&!maxTime.equals("")) {
            try {
                date1 = sdf.parse(minTime);
                date2 = sdf.parse(maxTime);

            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        //添加选择约束
        System.out.println(minTime);
        SellerExample sellerExample = new SellerExample();
        SellerExample.Criteria criteria = sellerExample.createCriteria();
        if(minTime!=null&&maxTime!=null&&!minTime.equals("")&&!maxTime.equals("")){
            criteria.andRegtimeBetween(date1,date2);
        }
        if(itemName!= null){
            criteria.andSellernameLike("%" + itemName + "%");
        }
        if(itemId!= null){
            criteria.andSelleridEqualTo(itemId);
        }
        if(realName!=null){
            criteria.andRealnameEqualTo(realName);
        }



        List<Seller> sellerList = sellerService.selectByExample(sellerExample);
        Map<String,Object> map = new HashMap<>();
        map.put("data",sellerList);
        map.put("count",sellerList.size());
        map.put("msg","hello");
        map.put("code","0");

        return map;

    }

    @RequestMapping(value = "/deleteSeller")
    @ResponseBody
    public String deleteUser(Seller seller){
        sellerService.deleteByPrimaryKey(seller.getSellerid());
        System.out.println(seller.getSellerid());

        return "succeed";
    }


    @RequestMapping("selectSeller")
    public String selectSeller(Integer sellerid, Model model){
        System.out.println(sellerid);
        model.addAttribute("sellerid",sellerid);
        return "layer/editSellerLayer";
    }

    @RequestMapping("updateSeller")
    @ResponseBody
    public String updateUser(Seller seller){
        sellerService.updateByPrimaryKeySelective(seller);
        System.out.println(seller);
        return "modify success!";
    }
}
