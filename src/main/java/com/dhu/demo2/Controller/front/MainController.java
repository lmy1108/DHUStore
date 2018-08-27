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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private CateMapper cateMapper;
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private ProductService productService;
    @Autowired
    private AdvertiseMapper advertiseMapper;
    @Autowired
    private SellerService sellerService;

    public ModelAndView showGoods(HttpSession session){
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
    @RequestMapping("/main")
    public ModelAndView showAllGoods(HttpSession session){
        ModelAndView mav = new ModelAndView();

        User user = (User)session.getAttribute("user");
        Integer userId;
        if(user!=null){
        userId = user.getUserid();
        }else{
            userId = null;
        }
        List<Product> digitalGoods = getCateGood("电子",userId);
        mav.addObject("digGoods",digitalGoods);

        List<Product> houseGoods = getCateGood("生活用品",userId);
        mav.addObject("houseGoods",houseGoods);

        List<Product> clothGoods = getCateGood("化妆品",userId);
        mav.addObject("colGoods",clothGoods);

        List<Product> bookGoods = getCateGood("书籍",userId);
        mav.addObject("bookGoods",bookGoods);

        List<Product> dressGoods = getCateGood("服装",userId);
        mav.addObject("dressGoods",dressGoods);

        List<Product> snackGoods = getCateGood("零食小吃",userId);
        mav.addObject("snackGoods",snackGoods);

        List<Product> studyGoods = getCateGood("学习用品",userId);
        mav.addObject("studyGoods",studyGoods);



        List<Advertise> advertiseList = advertiseMapper.selectByExampleWithBLOBs( new AdvertiseExample());
        List<Advertise> mainAdvertise = new ArrayList<>();
        List<Seller> sellerList = sellerService.selectByExample(new SellerExample());
        mav.addObject("sellerList",sellerList);

//        for(int t = advertiseList.size()-1;t > advertiseList.size()-6; t--){
//            mainAdvertise.add(advertiseList.get(t));
//        }
        for(int t = 0;t <5; t++){
            mainAdvertise.add(advertiseList.get(t));
        }
        mav.addObject("advertiseList",mainAdvertise);
        mav.setViewName("main");
        return mav;
    }

    public List<Product> getCateGood(String cate, Integer userId){
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
        goodsEx.or().andCateIn(cateIds);

        List<Product> goodsList = productMapper.selectByExample(goodsEx);

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
            List<ImagePath> imagepath  = productService.findImagePath(goods.getProductid());
            goods.setImagePaths(imagepath);
            goodsAndImage.add(goods);
        }
        return goodsAndImage;
    }
}


