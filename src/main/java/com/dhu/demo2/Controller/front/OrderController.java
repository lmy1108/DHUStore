package com.dhu.demo2.Controller.front;

import com.dhu.demo2.dao.DiscountMapper;
import com.dhu.demo2.dao.OrderItemMapper;
import com.dhu.demo2.pojo.*;
import com.dhu.demo2.service.AddressService;
import com.dhu.demo2.service.OrderService;
import com.dhu.demo2.service.ProductService;
import com.dhu.demo2.service.StoreCartService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class OrderController {

    /*@Value("#{addressService}")*/
//保存order的计数
    @Autowired
    private AddressService addressService;

    @Autowired
    private StoreCartService storeCartService;

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private DiscountMapper discountMapper;

    @Autowired
    private OrderItemMapper orderItemMapper;

    @RequestMapping("/order")
    public String showOrder(HttpSession session, Model model) {

        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        //查询当前用户的收货地址
        AddressExample addressExample = new AddressExample();
        addressExample.or().andUseridEqualTo(user.getUserid());
        List<Address> addressList = addressService.selectByExample(addressExample);

        model.addAttribute("address", addressList);

        //订单信息
        //获取当前用户的购物车信息
        StoreCartExample storeCartExample = new StoreCartExample();
        storeCartExample.or().andUseridEqualTo(user.getUserid());
        List<StoreCart> storeCart = storeCartService.selectByExample(storeCartExample);

        //获取购物车中的商品信息
        List<Product> productAndImage = new ArrayList<>();

        Float totalPrice = new Float(0);
        Integer oldTotalPrice = 0;

        for (StoreCart cart:storeCart) {
            Product product = productService.selectByPrimaryKey(cart.getProductid());

            List<ImagePath> imagePathList = productService.findImagePath(product.getProductid());
            product.setImagePaths(imagePathList);
            product.setNum(cart.getProductnum());

            //活动信息
            Discount discount = discountMapper.selectByPrimaryKey(product.getDiscountid());
            product.setDiscount(discount);

            if(discount.getDiscountid() != 0) {
                product.setNewPrice(Float.valueOf(product.getPrice()*product.getNum()* discount.getDiscountid()));
            } else if(discount.getFullnum() != null) {
                if (product.getNum() >= discount.getFullnum()) {
                    product.setNewPrice((float) (product.getPrice()*(product.getNum()-discount.getReducenum())));
                } else {
                    product.setNewPrice((float) (product.getPrice()*product.getNum()));
                }
            } else {
                product.setNewPrice((float) (product.getPrice()*product.getNum()));
            }
            totalPrice = totalPrice + product.getNewPrice();
            oldTotalPrice = oldTotalPrice + product.getNum() * product.getPrice();
            productAndImage.add(product);
        }

        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("oldTotalPrice", oldTotalPrice);
        model.addAttribute("productAndImage", productAndImage);

        return "orderConfirm";
    }

    @RequestMapping("/orderFinish")
    @ResponseBody
    public Msg orderFinish(Float oldPrice, Float newPrice, Boolean isPay, Integer addressid,HttpSession session) {
        User user = (User) session.getAttribute("user");
        System.out.println("in orderfinish");
        //获取订单信息
        StoreCartExample storeCartExample = new StoreCartExample();
        storeCartExample.or().andUseridEqualTo(user.getUserid());
        List<StoreCart> storeCart = storeCartService.selectByExample(storeCartExample);

        Integer sellerId = storeCart.get(0).getSellerid();
        //删除购物车
        for (StoreCart cart : storeCart) {
            storeCartService.deleteByPrimaryKey(new StoreCartKey(cart.getUserid(),cart.getProductid()));
        }

        //把订单信息写入数据库
        Order order = new Order(null, user.getUserid(), new Date(), oldPrice, newPrice, isPay, false, false, false, null,sellerId,null,null);
        orderService.insertOrder(order);
        //插入的订单号
        Integer orderId = order.getOrderid();

        OrderExample orderExample = new OrderExample();
        orderExample.or().andUseridEqualTo(user.getUserid());
        List<Order> selectOrder = orderService.selectOrderByExample(orderExample);


        //把订单项写入orderitem表中
        for (StoreCart cart : storeCart) {
            orderItemMapper.insert(new OrderItem(null, selectOrder.get(selectOrder.size()-1).getOrderid(), cart.getProductid(), cart.getProductnum()));
        }

        return Msg.success("购买成功");
    }

}
