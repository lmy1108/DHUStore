package com.dhu.demo2.Controller.user;
import com.dhu.demo2.pojo.*;
import com.dhu.demo2.service.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * Created by lmy on 2018/5/22.
 */
@Controller
public class CustomerController {

    @RequestMapping("/login")
    public String loginView(){
        return "login";
    }

    @Autowired
    private UserService userService;
    @Autowired
    private CollectService collectService;


    @RequestMapping("/register")
    public String register(){
        return "register";
    }

    @RequestMapping("/registerresult")
    public String registerResult(User user, Model registerResult){
        List<User> userList=new ArrayList<>();
        UserExample userExample=new UserExample();
        userExample.or().andUsernameLike(user.getUsername());
        userList=userService.selectByExample(userExample);
        if (!userList.isEmpty())
        {
            registerResult.addAttribute("errorMsg","用户名被占用");
            return "register";
        }
        else {
            Date RegTime=new Date();
            user.setRegtime(RegTime);
            userService.insertSelective(user);
            return  "redirect:/login";
        }
    }


    @RequestMapping("/confirmlogin")
    @ResponseBody
    public Map<String,Object> loginConfirm(User user,Model loginResult,HttpServletRequest request){

        Map<String,Object> map = new HashMap<>();
        System.out.println(user.getUsername()+user.getPassword());
        try {
            user.setUsername(DESUtil.decryption(user.getUsername(),"12345678"));
            user.setPassword(DESUtil.decryption(user.getPassword(),"12345678"));

        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println(user.getUsername()+user.getPassword());
        if(user.getUsername().equals("")||user.getUsername()==null||user.getPassword().equals("")){
            map.put("code",1);
            map.put("msg","用户名和密码不能为空！");
            return map;
        }
        HttpSession session=request.getSession();
//        String verificationCode = (String) session.getAttribute("certCode");
//        if (!confirmlogo.equals(verificationCode))
//        {
//            loginResult.addAttribute("errorMsg","验证码错误");
//            return "login";
//
//        }
        List<User> userList=new ArrayList<User>();
        UserExample userExample=new UserExample();
        userExample.or().andUsernameEqualTo(user.getUsername()).andPasswordEqualTo(user.getPassword());
        userList=userService.selectByExample(userExample);
        if (!userList.isEmpty())
        {
            session.setAttribute("user",userList.get(0));
            map.put("code",0);
            map.put("msg","加密登录成功！");
            return map;
        }
        else {
            loginResult.addAttribute("errorMsg","用户名与密码不匹配");
            map.put("code",1);
            map.put("msg","用户名和密码不匹配！");
            return map ;
        }
    }

    @RequestMapping("/information")
    public String information(Model userModel,HttpServletRequest request){
        HttpSession session=request.getSession();
        User user;
        Integer userId;
        user=(User) session.getAttribute("user");
        if (user==null)
        {
            return "redirect:/login";
        }
        userId=user.getUserid();
        user=userService.selectByPrimaryKey(userId);
        userModel.addAttribute("user",user);
        return "userInformation";
    }

    @RequestMapping("/saveInfo")
    @ResponseBody
    public Msg saveInfo(String name, String email, String telephone, HttpServletRequest request){
        HttpSession session=request.getSession();
        UserExample userExample=new UserExample();
        User user,updateUser=new User();
        List<User> userList=new ArrayList<>();
        Integer userid;
        user=(User)session.getAttribute("user");
        userid= user.getUserid();
        userExample.or().andUsernameEqualTo(name);
        userList=userService.selectByExample(userExample);
        if (userList.isEmpty())
        {
            updateUser.setUserid(userid);
            updateUser.setUsername(name);
            updateUser.setEmail(email);
            updateUser.setTelephone(telephone);
            userService.updateByPrimaryKeySelective(updateUser);
            return Msg.success("更新成功");
        }
        else  {return Msg.fail("更新失败");}
    }

    @Autowired
    private AddressService addressService;

    @RequestMapping("/info/address")
    public String address(HttpServletRequest request,Model addressModel){
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        if (user==null)
        {
            return "redirect:/login";
        }
        AddressExample addressExample=new AddressExample();
        addressExample.or().andUseridEqualTo(user.getUserid());
        List<Address> addressList=addressService.selectByExample(addressExample);
        addressModel.addAttribute("addressList",addressList);
        return "userAddress";
    }

    @RequestMapping("/saveAddr")
    @ResponseBody
    public Msg saveAddr(Address address){

        addressService.updateByPrimaryKeySelective(address);
        return Msg.success("修改成功");
    }

    @RequestMapping("/deleteAddr")
    @ResponseBody
    public Msg deleteAddr(Address address){
        addressService.deleteByPrimaryKey(address.getAddressid());
        return Msg.success("删除成功");
    }

    @RequestMapping("/insertAddr")
    @ResponseBody
    public Msg insertAddr(Address address,HttpServletRequest request){
        HttpSession session=request.getSession();
        User user=new User();
        user=(User) session.getAttribute("user");
        address.setUserid(user.getUserid());
        addressService.insertSelective(address);
        return Msg.success("添加成功");
    }

    @Autowired
    private OrderService orderService;

    @Autowired
    private ProductService productService;

    @RequestMapping("/info/list")
    public String list(HttpServletRequest request,Model orderModel){

        HttpSession session=request.getSession();
        User user;
        user=(User)session.getAttribute("user");

        if (user==null)
        {
            return "redirect:/login";
        }

        OrderExample orderExample=new OrderExample();
        orderExample.or().andUseridEqualTo(user.getUserid());
        List<Order> orderList=orderService.selectOrderByExample(orderExample);
        orderModel.addAttribute("orderList",orderList);
        Order order;
        OrderItem orderItem;
        List<OrderItem> orderItemList=new ArrayList<>();
        Product product;
        Address address;
        for (Integer i=0;i<orderList.size();i++)
        {
            order=orderList.get(i);
            OrderItemExample orderItemExample=new OrderItemExample();
            orderItemExample.or().andOrderidEqualTo(order.getOrderid());
            orderItemList=orderService.getOrderItemByExample(orderItemExample);
            List<Product> productList=new ArrayList<>();
            List<Integer> productIdList=new ArrayList<>();
            for (Integer j=0;j<orderItemList.size();j++)
            {
                orderItem=orderItemList.get(j);
                productIdList.add(orderItem.getProductid());
            }
            ProductExample productExample=new ProductExample();
            productExample.or().andProductidIn(productIdList);
            productList=productService.selectByExample(productExample);
            order.setProductInfo(productList);
            address=addressService.selectByPrimaryKey(order.getAddressid());
            order.setAddress(address);
            orderList.set(i,order);
        }



        orderModel.addAttribute("orderList",orderList);

        return "userList";
    }

   /* @RequestMapping("/info/list")
    public String list(HttpServletRequest request,Model orderModel,
                       @RequestParam(value = "pageIssend",defaultValue = "1") Integer pnIssend,
                       @RequestParam(value = "pageIsrecive",defaultValue = "1") Integer pnIsrecive,
                       @RequestParam(value = "pageIscompelete",defaultValue = "1") Integer pnIscompelete

    ){
        //一页显示几个数据
        PageHelper.startPage(pnIssend, 3);
        PageHelper.startPage(pnIsrecive, 3);
        PageHelper.startPage(pnIscompelete, 3);
        HttpSession session=request.getSession();
        User user;
        user=(User)session.getAttribute("user");

        if (user==null)
        {
            return "redirect:/login";
        }

        OrderExample orderExample=new OrderExample();
        orderExample.or().andUseridEqualTo(user.getUserid());
        List<Order> orderList=orderService.selectOrderByExample(orderExample);
       *//* orderModel.addAttribute("orderList",orderList);*//*
        Order order;
        OrderItem orderItem;
        List<OrderItem> orderItemList=new ArrayList<>();
        Product product;
        Address address;
        for (Integer i=0;i<orderList.size();i++)
        {
            order=orderList.get(i);
            OrderItemExample orderItemExample=new OrderItemExample();
            orderItemExample.or().andOrderidEqualTo(order.getOrderid());
            orderItemList=orderService.getOrderItemByExample(orderItemExample);
            List<Product> productList=new ArrayList<>();
            List<Integer> productIdList=new ArrayList<>();
            for (Integer j=0;j<orderItemList.size();j++)
            {
                orderItem=orderItemList.get(j);
                productIdList.add(orderItem.getProductid());
            }
            ProductExample productExample=new ProductExample();
            productExample.or().andProductidIn(productIdList);
            productList=productService.selectByExample(productExample);
            order.setProductInfo(productList);
            address=addressService.selectByPrimaryKey(order.getAddressid());
            order.setAddress(address);
            orderList.set(i,order);
        }



        //显示几个页号
        PageInfo pageIssend = new PageInfo(orderList,2);

        PageInfo pageIsrecive = new PageInfo(orderList,2);

        PageInfo pageIscompelete = new PageInfo(orderList,2);

        orderModel.addAttribute("pageInfoIssend", pageIssend);

        orderModel.addAttribute("pageInfoIsrecive", pageIsrecive);

        orderModel.addAttribute("pageInfoIscompelete", pageIscompelete);

        return "list";
    }*/

    @RequestMapping("/deleteList")
    @ResponseBody
    public Msg deleteList(Order order){
        orderService.deleteById(order.getOrderid());
        return Msg.success("删除成功");
    }


    @RequestMapping("/info/favorite")
    public String showFavorite(@RequestParam(value = "page",defaultValue = "1") Integer pn, HttpServletRequest request,Model model){
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        //一页显示几个数据
        PageHelper.startPage(pn, 16);

        CollectExample collectExample = new CollectExample();
        collectExample.or().andUseridEqualTo(user.getUserid());
        List<Collect> collectList = collectService.selectByExample(collectExample);

        List<Integer> productIdList = new ArrayList<Integer>();
        for (Collect tmp:collectList) {
            productIdList.add(tmp.getProductid());
        }

        ProductExample productExample = new ProductExample();
        List<Product> productList = new ArrayList<>();
        if (!productIdList.isEmpty()) {
            productExample.or().andProductidIn(productIdList);
            productList = productService.selectByExample(productExample);
        }

        //获取图片地址
        for (int i = 0; i < productList.size(); i++) {
            Product product = productList.get(i);


            //判断是否收藏
            product.setFav(true);

            productList.set(i, product);
        }

        //显示几个页号
        PageInfo page = new PageInfo(productList,5);
        model.addAttribute("pageInfo", page);

        return "userCollect";
    }

    @RequestMapping("/savePsw")
    @ResponseBody
    public Msg savePsw(String Psw,HttpServletRequest request)
    {
        HttpSession session=request.getSession();
        User user=(User) session.getAttribute("user");
        user.setPassword(Psw);
        userService.updateByPrimaryKeySelective(user);
        return Msg.success("修改密码成功");
    }

    @RequestMapping("/finishList")
    @ResponseBody
    public Msg finishiList(Integer orderid){
        Order order=orderService.selectByPrimaryKey(orderid);
        order.setIsreceive(true);
        order.setIscomplete(true);
        orderService.updateOrderByKey(order);
        return Msg.success("完成订单成功");
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session=request.getSession();
        session.removeAttribute("user");
        return "redirect:/login";
    }

}
