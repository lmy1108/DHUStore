package com.dhu.demo2.Controller.front;

import com.dhu.demo2.dao.AdvertiseMapper;
import com.dhu.demo2.dao.CateMapper;
import com.dhu.demo2.dao.ProductMapper;
import com.dhu.demo2.dao.UserMapper;
import com.dhu.demo2.pojo.*;
import com.dhu.demo2.service.ProductService;
import com.dhu.demo2.service.SellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class SellerMainController {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private CateMapper cateMapper;
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private ProductService productService;
    @Autowired
    private SellerService sellerService;
    @Autowired
    private AdvertiseMapper advertiseMapper;

    public ModelAndView showseller(HttpSession session){
        ModelAndView mav = new ModelAndView();
        User user = (User)session.getAttribute("user");
        Integer userId;
        if(user == null){
            userId = null;
        }else{
            userId = user.getUserid();
        }
        mav.setViewName("main");
        return mav;
    }

    @RequestMapping("sellerMain")
    public ModelAndView sellerProducts( HttpSession session, Model model ,Integer sellerId){
        ModelAndView mav = new ModelAndView();
        if(sellerId==null){
            mav.setViewName("main");
            return mav;
        }
        System.out.println("in sellerMain");
        User user = (User)session.getAttribute("user");
        Integer userId;
        if(user!=null){
            userId = user.getUserid();
        }else{
            userId = null;
        }

        List<Product> digitalGoods = getSellerCateGood("电子",userId,sellerId);
        mav.addObject("digGoods",digitalGoods);

        List<Product> houseGoods = getSellerCateGood("生活用品",userId,sellerId);
        mav.addObject("houseGoods",houseGoods);

        List<Product> clothGoods = getSellerCateGood("化妆品",userId,sellerId);
        mav.addObject("colGoods",clothGoods);

        List<Product> bookGoods = getSellerCateGood("书籍",userId,sellerId);
        mav.addObject("bookGoods",bookGoods);

        List<Product> dressGoods = getSellerCateGood("服装",userId,sellerId);
        mav.addObject("dressGoods",dressGoods);

        List<Product> snackGoods = getSellerCateGood("零食小吃",userId,sellerId);
        mav.addObject("snackGoods",snackGoods);

        List<Product> studyGoods = getSellerCateGood("学习用品",userId,sellerId);
        mav.addObject("studyGoods",studyGoods);


        AdvertiseExample advertiseExample = new AdvertiseExample();
        advertiseExample.or().andSelleridEqualTo(sellerId);
        List<Advertise> advertiseList = advertiseMapper.selectByExampleWithBLOBs(advertiseExample);
        mav.addObject("advertiseList",advertiseList);
        Seller seller = sellerService.selectByPrimaryKey(sellerId);

        mav.addObject("seller",seller);
        mav.setViewName("sellerMain");



        return mav;
    }


    public List<Product> getSellerCateGood(String cate, Integer userId,Integer sellerId){
        CateExample cateEx = new CateExample();
        cateEx.or().andCatenameLike(cate);
        List<Cate> cateList = cateMapper.selectByExample(cateEx);

        if(cateList.size() == 0){
            return null;
        }
        ProductExample goodsEx = new ProductExample();
        List<Integer> cateIds = new ArrayList<>();
        for(Cate temp : cateList){
            cateIds.add(temp.getCateid());
        }
        //通过and**In来传入一个List，同时选择list中所有元素的值来查询
        goodsEx.or().andCateIn(cateIds) .andSelleridEqualTo(sellerId);

        List<Product> goodsList = productMapper.selectByExample (goodsEx);

        List<Product> goodsAndImage = new ArrayList<>();

        for(Product goods :goodsList){
            if(userId == null){
                goods.setFav(false);

            }else{
                Collect collect = productService.selectFavByKey(new CollectKey(userId, goods.getProductid()));
                if(collect == null){
                    goods.setFav(false);
                }else{
                    goods.setFav(true);
                }
            }
            goodsAndImage.add(goods);
        }
        return goodsAndImage;
    }

}
