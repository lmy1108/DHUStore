package com.dhu.demo2.Controller.user;

import com.dhu.demo2.pojo.*;
import com.dhu.demo2.service.OrderItemService;
import com.dhu.demo2.service.OrderService;
import com.dhu.demo2.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import static java.lang.Integer.parseInt;


@Controller
public class userInfoController {
    @Autowired
    private UserService userService;


    @Autowired
    private OrderItemService orderItemService;

    @Autowired
    private OrderService orderService;

    @RequestMapping("getUserInfo")
    public String usershowInformation(HttpSession session, Model model){
//        Seller seller1 = sellerMapper.selectByPrimaryKey(901);
//
//        session.setAttribute("seller",seller1);
        User user = (User)session.getAttribute("user");
        if(user==null){
            return "login";
        }
        Double totalPrice = 0.0;
        Integer totalBuy = 0;
        OrderExample orderExample= new OrderExample();
        orderExample.or().andUseridEqualTo(user.getUserid());

        List<Order> orderList =  orderService.selectOrderByExample(orderExample);

        for(Order o : orderList){
            totalBuy++;
            totalPrice += o.getNewprice();
        }




        model.addAttribute("user",user);
        model.addAttribute("userAmount",totalBuy);
        model.addAttribute("userPrice",totalPrice);


        return "userInformation";
    }
    @RequestMapping("userEditInfo")
    public String userEditInfo(Model model, HttpSession session){
        User user = (User)session.getAttribute("user");
        if(user==null){
            return "login";

        }
        model.addAttribute("user",user);

        return "userEditInfo";
    }

    @RequestMapping("userConfirmEditInfo")
    @ResponseBody
    public Map<String,Object> confirmEditInfo(HttpSession session, String username, String password, String alipay,String wechat,String telephone, String email, String realname,String imageName){
        User user = (User)session.getAttribute("user");
        Map<String,Object> map= new HashMap<>();
        if(user==null){
            return map;
        }
        System.out.println(username);
        user.setUsername(username);
        user.setPassword(password);
        user.setImagepath(imageName);
        user.setAlipay(parseInt(alipay));
        user.setWechat(parseInt(wechat));
        user.setEmail(email);
        user.setPassword(password);
        user.setRealname(realname);
        user.setTelephone(telephone);

        userService.updateByPrimaryKeySelective(user);
        map.put("code",0);
        return map;
    }

}
