package com.dhu.demo2.Controller.seller;

import com.dhu.demo2.dao.SellerMapper;
import com.dhu.demo2.pojo.Seller;
import com.dhu.demo2.pojo.SellerExample;
import com.dhu.demo2.pojo.User;
import com.dhu.demo2.pojo.UserExample;
import com.dhu.demo2.service.SellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class sellerRegister {
    @Autowired
    SellerMapper sellerMapper;
    @Autowired
    SellerService sellerService;

    @RequestMapping("sellerLogin")
    public String sellerLogin(){
        return "sellerLogin";
    }
    @RequestMapping("sellerConfirmLogin")
    public String sellerConfirmLogin(Model model, HttpSession session, String sellerName, String password){
        if(sellerName==null||sellerName.equals("")){
            model.addAttribute("errorMsg", "用户名和密码不能为空");
            return "sellerLogin";
        }
        Seller selectseller = sellerService.selectByName(sellerName);
        if(selectseller==null){
            model.addAttribute("errorMsg", "用户名或密码错误");
            return "sellerLogin";


        }
        if(password==null||password.equals("")){
            model.addAttribute("errorMsg", "用户名和密码不能为空");
            return "sellerLogin";

        }else {
            if (password.equals(selectseller.getPassword())) {

                session.setAttribute("seller", selectseller);
                session.setAttribute("sellerId", selectseller.getSellerid());

                return "redirect:/getSellerInfo";
            }
            else{
                model.addAttribute("errorMsg", "用户名或密码错误");
                return "sellerLogin";

            }
        }

    }


    @RequestMapping("/SellerRegisterResult")
    public String sellerRegesterResult(Seller seller, Model registerResult){
        List<Seller> sellerList=new ArrayList<>();
        SellerExample sellerExample=new SellerExample();
        sellerExample.or().andSellernameLike(seller.getSellername());
        sellerList=sellerService.selectByExample(sellerExample);
        if (!sellerList.isEmpty())
        {
            registerResult.addAttribute("errorMsg","商家名被占用");
            return "register";
        }
        else {
            Date RegTime=new Date();
            seller.setRegtime(RegTime);
            sellerService.insertSelective(seller);
            return  "redirect:/sellerLogin";
        }
    }



}
