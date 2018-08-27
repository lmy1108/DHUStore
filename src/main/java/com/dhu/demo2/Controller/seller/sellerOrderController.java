package com.dhu.demo2.Controller.seller;


import com.dhu.demo2.pojo.*;
import com.dhu.demo2.service.OrderService;
import com.dhu.demo2.service.SellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class sellerOrderController {

    @Autowired
    private OrderService orderService;


    @RequestMapping("sellerOrder")
    public String sellerOrder(HttpSession session){
        Seller seller = (Seller)session.getAttribute("seller");
        if(seller == null){
            return "redirect:/sellerLogin";
        }
        return "sellerOrder";
    }

    @RequestMapping("/sellerOrderjson")
    @ResponseBody
    public Map<String,Object> sellerOrderjson(HttpSession session, String minTime,String maxTime, String itemName, Integer priceMin, Integer priceMax, Integer itemId, Integer itemCate, String itemDes, Integer done){
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
        Seller seller = (Seller)session.getAttribute("seller");

        Integer sellerId = seller.getSellerid();

        System.out.println(itemName+" "+priceMin+" "+priceMax );

        OrderExample orderExample = new OrderExample();
        OrderExample.Criteria criteria = orderExample.createCriteria();

        criteria.andSelleridEqualTo(sellerId);
        criteria.andIssendEqualTo(false);
//        if(itemName!=null) {
//            criteria.andProductnameLike("%" + itemName + "%");
//        }
//        if(priceMax!=null){
//            criteria.andPriceBetween(priceMin, priceMax);
//        }
//        if(itemCate!=null) {
//            criteria.andCateEqualTo(itemCate);
//        }
//        if(itemId!=null){
//            criteria.andProductidEqualTo(itemId);
//        }
//        if(itemDes!=null){
//            criteria.andDescriptionLike("%" + itemDes + "%");
//        }
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

    @RequestMapping("/sellerOrderjson2")
    @ResponseBody
    public Map<String,Object> sellerOrderjson2(HttpSession session,String minTime,String maxTime, String itemName, Integer priceMin, Integer priceMax, Integer itemId, Integer itemCate, String itemDes, Integer done){
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
        Seller seller = (Seller)session.getAttribute("seller");

        Integer sellerId = seller.getSellerid();

        System.out.println(itemName+" "+priceMin+" "+priceMax );

        OrderExample orderExample = new OrderExample();
        OrderExample.Criteria criteria = orderExample.createCriteria();

        criteria.andSelleridEqualTo(sellerId);
        criteria.andIssendEqualTo(true);
        criteria.andIsreceiveEqualTo(false);
//        if(itemName!=null) {
//            criteria.andProductnameLike("%" + itemName + "%");
//        }
//        if(priceMax!=null){
//            criteria.andPriceBetween(priceMin, priceMax);
//        }
//        if(itemCate!=null) {
//            criteria.andCateEqualTo(itemCate);
//        }
//        if(itemId!=null){
//            criteria.andProductidEqualTo(itemId);
//        }
//        if(itemDes!=null){
//            criteria.andDescriptionLike("%" + itemDes + "%");
//        }
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
    @RequestMapping("/sellerOrderjson3")
    @ResponseBody
    public Map<String,Object> sellerOrderjson3(HttpSession session,String minTime,String maxTime, String itemName, Integer priceMin, Integer priceMax, Integer itemId, Integer itemCate, String itemDes, Integer done){
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
        Seller seller = (Seller)session.getAttribute("seller");

        Integer sellerId = seller.getSellerid();

        System.out.println(itemName+" "+priceMin+" "+priceMax );

        OrderExample orderExample = new OrderExample();
        OrderExample.Criteria criteria = orderExample.createCriteria();

        criteria.andSelleridEqualTo(sellerId);
        criteria.andIssendEqualTo(true);
        criteria.andIsreceiveEqualTo(true);
//        if(itemName!=null) {
//            criteria.andProductnameLike("%" + itemName + "%");
//        }
//        if(priceMax!=null){
//            criteria.andPriceBetween(priceMin, priceMax);
//        }
//        if(itemCate!=null) {
//            criteria.andCateEqualTo(itemCate);
//        }
//        if(itemId!=null){
//            criteria.andProductidEqualTo(itemId);
//        }
//        if(itemDes!=null){
//            criteria.andDescriptionLike("%" + itemDes + "%");
//        }
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

    @RequestMapping("/launchOrder")
    @ResponseBody
    public Map<String,Object> launchOrder(Integer orderId){

        Order order =  orderService.selectByPrimaryKey(orderId);
        order.setIssend(true);
        orderService.updateByPrimaryKeySelective(order);
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        return map;
    }

    @RequestMapping("/finishOrder")
    @ResponseBody
    public Map<String,Object> finishOrder(Integer orderId){

        Order order =  orderService.selectByPrimaryKey(orderId);
        order.setIscomplete(true);
        orderService.updateByPrimaryKeySelective(order);
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        return map;
    }

    @RequestMapping("/deleteOrder")
    @ResponseBody
    public Map<String,Object> deleteOrder(Integer orderId){

        orderService.deleteById(orderId);
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        return map;
    }

}
