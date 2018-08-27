package com.dhu.demo2.Controller.admin;

import com.dhu.demo2.dao.UserMapper;
import com.dhu.demo2.pojo.Product;
import com.dhu.demo2.pojo.ProductExample;
import com.dhu.demo2.pojo.User;
import com.dhu.demo2.pojo.UserExample;
import com.dhu.demo2.service.UserService;
import org.apache.taglibs.standard.lang.jstl.NullLiteral;
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
public class UserController {

    @Autowired
    UserMapper userMapper;

    @RequestMapping("/userjson")
    @ResponseBody
    public Map<String,Object> userjson(Model model, String minTime,String maxTime,String itemName,String userEmail, String telephone,Integer itemId) {
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
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        if(minTime!=null&&maxTime!=null&&!minTime.equals("")&&!maxTime.equals("")){
            criteria.andRegtimeBetween(date1,date2);
        }
        if(itemName!= null){
            criteria.andUsernameLike("%" + itemName + "%");
        }
        if(itemId!= null){
            criteria.andUseridEqualTo(itemId);
        }
        if(userEmail!= null){
            criteria.andEmailLike("%" + userEmail + "%");
        }
        if(telephone!= null){
            criteria.andTelephoneEqualTo("%" + telephone + "%");
        }


        List<User> userList = userMapper.selectByExample(userExample);
        Map<String,Object> map = new HashMap<>();
        map.put("data",userList);
        map.put("count",userList.size());
        map.put("msg","hello");
        map.put("code","0");

        return map;

    }

    @RequestMapping(value = "/deleteUser")
    @ResponseBody
    public String deleteUser(User user){
        userMapper.deleteByPrimaryKey(user.getUserid());
        System.out.println(user.getUserid());

        return "succeed";
    }

    @RequestMapping("selectUser")
    public String selectProduct(Integer userid, Model model){
        System.out.println(userid);
        model.addAttribute("userid",userid);
        return "layer/editUserLayer";
    }

    @RequestMapping("updateUser")
    @ResponseBody
    public String updateUser(User user){
        userMapper.updateByPrimaryKeySelective(user);
        System.out.println(user);
        return "modify success!";
    }
}
