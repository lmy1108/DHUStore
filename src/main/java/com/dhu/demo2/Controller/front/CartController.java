package com.dhu.demo2.Controller.front;

import com.dhu.demo2.pojo.*;
import com.dhu.demo2.service.ProductService;
import com.dhu.demo2.service.SellerService;
import com.dhu.demo2.service.StoreCartService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by lmy on 2018/5/24.
 */
@Controller
public class CartController {

    @Autowired
    private StoreCartService storeCartService;

    @Autowired
    private ProductService productService;

    @Autowired
    private SellerService sellerService;

    @RequestMapping("/addCart")
    public String addCart(StoreCart storeCart, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if(user == null) {
            return "redirect:/login";
        }

        //判断是否已经加入购物车
        StoreCart storeCart1 = storeCartService.selectByPrimaryKey(new StoreCartKey(user.getUserid(), storeCart.getProductid()));
        //通过联合主键搜索所有的购物车
        if (storeCart1 != null) {
            return "redirect:/showcart";
        }//如果购物车不是空的就跳转到购物车页面
        //用户
        storeCart.setUserid(user.getUserid());
        //加入时间
        storeCart.setCatedate(new Date());
        storeCart.setProductnum(1);
        Integer productid = storeCart.getProductid();

        Product product = productService.selectByPrimaryKey(productid);
        //通过商品的主键搜索

        storeCart.setSellerid(product.getSellerid());

        storeCartService.insertSelective(storeCart);

        //返回到购物车页面
        return "redirect:/showcart";
    }

    @RequestMapping("/showcart")
    public String showCart(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if(user == null) {
            return "redirect:/login";
        }
        return "shopcart";
    }

    @RequestMapping("/cartjson")
    @ResponseBody
    public Msg getCart(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if(user == null) {
            return Msg.fail("请先登录");
        }
        System.out.println("in cartjson");
        //获取当前用户的购物车信息
        StoreCartExample storeCartExample = new StoreCartExample();
        storeCartExample.or().andUseridEqualTo(user.getUserid());
        List<StoreCart> storeCart = storeCartService.selectByExample(storeCartExample);

        //获取购物车中的商品信息
        List<Product> productAndImage = new ArrayList<>();
        for (StoreCart cart:storeCart) {
            Product product = productService.selectByPrimaryKey(cart.getProductid());

            List<ImagePath> imagePathList = productService.findImagePath(product.getProductid());
            product.setImagePaths(imagePathList);
            product.setNum(cart.getProductnum());
            productAndImage.add(product);
        }

        return Msg.success("查询成功").add("shopcart",productAndImage);
    }

    @RequestMapping(value = "/deleteCart/{productid}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteCart(@PathVariable("productid")Integer productid, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if(user == null) {
            return Msg.fail("请先登录");
        }

        storeCartService.deleteByPrimaryKey(new StoreCartKey(user.getUserid(), productid));
        return Msg.success("删除成功");
    }

    @RequestMapping("/update")
    @ResponseBody
    public Msg updateCart(Integer productid, Integer num, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if(user == null) {
            return Msg.fail("请先登录");
        }
        StoreCart storeCart = new StoreCart();
        storeCart.setUserid(user.getUserid());
        storeCart.setProductid(productid);
        storeCart.setProductnum(num);
        storeCartService.updateByPrimaryKeySelective(storeCart);
        return Msg.success("更新购物车成功");
    }
}
