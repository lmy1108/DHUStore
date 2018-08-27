package com.dhu.demo2.Controller.admin;

import com.dhu.demo2.dao.UserMapper;
import com.dhu.demo2.pojo.Order;
import com.dhu.demo2.pojo.OrderExample;
import com.dhu.demo2.pojo.User;
import com.dhu.demo2.pojo.UserExample;
import com.dhu.demo2.service.OrderService;
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
public class AdminOrderController {

    @Autowired
    UserMapper userMapper;


    @Autowired
    OrderService orderService;

    @RequestMapping("/adminOrderjson")
    @ResponseBody
    public Map<String,Object> adminOrderjson(Model model, String minTime,String maxTime,String itemName, Integer itemId) {
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
        //添加选择约束
        OrderExample orderExample = new OrderExample();//Example类是生成器中的关键
        OrderExample.Criteria criteria = orderExample.createCriteria();//criteria指从数据库增删改查约束条件
        if(minTime!=null&&maxTime!=null&&!minTime.equals("")&&!maxTime.equals("")){
            criteria.andOrdertimeBetween (date1,date2);//通过（and***）增加约束条件
        }
        List<Order> orderList = orderService.selectOrderByExample(orderExample);//通过service层调用DAO层进行查询
        Map<String,Object> map = new HashMap<>();
        map.put("data",orderList);
        map.put("count",orderList.size());
        map.put("msg","hello");
        map.put("code","0");

        return map;

    }

    @RequestMapping(value = "/adminDeleteOrder")
    @ResponseBody
    public String deleteOrder(Order order){
        orderService.deleteById(order.getOrderid());
//        userMapper.deleteByPrimaryKey(user.getUserid());
//        System.out.println(user.getUserid());

        return "succeed";
    }

//    @RequestMapping("selectUser")
//    public String selectProduct(Integer userid, Model model){
//        System.out.println(userid);
//        model.addAttribute("userid",userid);
//        return "layer/editUserLayer";
//    }
//
//    @RequestMapping("updateUser")
//    @ResponseBody
//    public String updateUser(User user){
//        userMapper.updateByPrimaryKeySelective(user);
//        System.out.println(user);
//        return "modify success!";
//    }
}
