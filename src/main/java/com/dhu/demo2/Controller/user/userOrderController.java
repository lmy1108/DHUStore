package com.dhu.demo2.Controller.user;


import com.dhu.demo2.pojo.Order;
import com.dhu.demo2.pojo.OrderExample;
import com.dhu.demo2.pojo.Seller;
import com.dhu.demo2.pojo.User;
import com.dhu.demo2.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.jws.Oneway;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class userOrderController {
    @Autowired
    private OrderService orderService;
@RequestMapping("userOrder")
    public String getUserOrder (HttpSession session){
        User user = (User)session.getAttribute("user");
        if(user==null){
            return "login";
        }
        return "userList";
    }

    @RequestMapping("/userOrderjson")
    @ResponseBody
    public Map<String,Object> userOrderjson(HttpSession session,  String minTime,String maxTime,String itemName, Integer priceMin, Integer priceMax, Integer itemId, Integer itemCate, String itemDes, Integer done){
        System.out.println("in orderjson");
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

        User user = (User)session.getAttribute("user");

        Integer userId = user.getUserid();

        System.out.println(itemName+" "+priceMin+" "+priceMax );

        OrderExample orderExample = new OrderExample();
        OrderExample.Criteria criteria = orderExample.createCriteria();

        if(minTime!=null&&maxTime!=null&&!minTime.equals("")&&!maxTime.equals("")){
            criteria.andOrdertimeBetween (date1,date2);
        }

        criteria.andUseridEqualTo(userId);

        List<Order> orderList = orderService.selectOrderByExample(orderExample);
        Map<String,Object> map = new HashMap<>();
        map.put("data",orderList);
        map.put("count",orderList.size());
        map.put("msg","hello");
        map.put("code","0");
        return map;

    }
    @RequestMapping("/userOrderjson2")
    @ResponseBody
    public Map<String,Object> userOorderjson2(HttpSession session, String itemName, String minTime,String maxTime,Integer priceMin, Integer priceMax, Integer itemId, Integer itemCate, String itemDes, Integer done){
        System.out.println("in orderjson");
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
        User user = (User)session.getAttribute("user");

        Integer userId = user.getUserid();

        System.out.println(itemName+" "+priceMin+" "+priceMax );

        OrderExample orderExample = new OrderExample();
        OrderExample.Criteria criteria = orderExample.createCriteria();

        criteria.andUseridEqualTo(userId);
        criteria.andIssendEqualTo(true);
        if(minTime!=null&&maxTime!=null&&!minTime.equals("")&&!maxTime.equals("")){
            criteria.andOrdertimeBetween (date1,date2);
        }
        List<Order> orderList = orderService.selectOrderByExample(orderExample);
        Map<String,Object> map = new HashMap<>();
        map.put("data",orderList);
        map.put("count",'6');
        map.put("msg","hello");
        map.put("code","0");
        return map;

    }

    @RequestMapping("/userAdmitRecieve")
    @ResponseBody
    public Map<String,Object> userAdmitRecieve(Integer orderId){
    System.out.println("in recieve");
    Order order = orderService.selectByPrimaryKey(orderId);
    order.setIsreceive(true);
    orderService.updateByPrimaryKeySelective(order);

        Map<String,Object> map = new HashMap<>();
        map.put("data","");
        map.put("count",'6');
        map.put("msg","hello");
        map.put("code",0);
        return map;
    }



}
