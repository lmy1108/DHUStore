package com.dhu.demo2.Controller;


import com.dhu.demo2.dao.ProductMapper;
import com.dhu.demo2.pojo.Msg;
import com.dhu.demo2.pojo.Product;
import com.dhu.demo2.pojo.ProductExample;
import com.dhu.demo2.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class testController {
    @Autowired
    private ProductService productService;
    @Autowired
    private ProductMapper productMapper;
    @RequestMapping("/test")
    public String test(){
        return "test";
    }
    @RequestMapping("admin")
    public String admin(){
        return "adminAllGoods";
    }
    @RequestMapping("seller")
    public String seller(){
        return "sellerAllGoods";
    }

    @RequestMapping("mall")
    public String mall(){
        return "mall";
    }
    @RequestMapping("index")
    public String front(){
        return "front";
    }
//    @RequestMapping("detail")
//    public String detail(){
//        return "shop/detail";
//    }
    @RequestMapping("adminManage")
    public String adminManage(){
        return "adminManage";
    }
    @RequestMapping("userManage")
    public String userManage(){
        return "adminUser";
    }
    @RequestMapping("adminComment")
    public String adminComment(){
        return"adminComment";
    }
    @RequestMapping("sellerSidebar")
    public String sellerSidebar(){
        return"sellerSideBar";
    }
    @RequestMapping("sellerManageProduct")
    public String sellerProductManage(){
        return"sellerProductManage";
    }
//    @RequestMapping("sellerAddProduct")
//    public String sellerAdd(){
//        return"sellerAddProduct";
//    }
    @RequestMapping("sellerInfo")
    public String sellerInfo(){
        return"sellerInformation";
    }
//    @RequestMapping("sellerEditInfo")
//    public String sellerEditInfo(){
//        return"sellerEditInfo";
//    }
//    @RequestMapping("sellerOrder")
//    public String sellerOrder(){
//        return"sellerOrder";
//    }
    @RequestMapping("sellerAddInner")
    public String sellerAddIn(){
        return "iframe/sellerAddProdut_inner";
    }
//    @RequestMapping("advertise")
//    public String advertise(){
//        return "advertise";
//    }
    @RequestMapping("adminOrder")
    public String adminOrder(){
        return"adminOrder";
    }

    @RequestMapping("adminSeller")
    public String adminSeller(){
        return"adminSeller";
    }
    @RequestMapping("chatrobot")
    public String chatRobot(){
        return"chatrobot";
    }

    @RequestMapping("sellerRegister")
    public String sellerRegister(){
        return "sellerRegister";
    }
}
