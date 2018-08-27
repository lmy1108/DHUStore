package com.dhu.demo2.Controller.front;

import com.dhu.demo2.dao.*;
import com.dhu.demo2.pojo.*;
import com.dhu.demo2.service.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class FrontController {
    @Autowired
    private ProductService productService;

    @Autowired
    private CateService cateService;

    @Autowired
    private CommentMapper commentService;

    @Autowired
    private UserService userService;

    @Autowired
    private DiscountMapper discountMapper;


    @Autowired
    private CollectMapper collectMapper;
    @Autowired
    private SellerService sellerService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderItemService orderItemService;
    @RequestMapping(value = "/detail" )
    public String detailProduct(Integer productid, Model model, HttpSession session) {

        if(productid == null) {
            return "redirect:/main";
        }

        User user = (User) session.getAttribute("user");

        //要传回的数据存在HashMap中
        Map<String,Object> productInfo = new HashMap<String,Object>();

        //查询商品的基本信息
        Product product = productService.selectByPrimaryKey(productid);

        if (user == null) {
            product.setFav(false);
        } else {
            Collect collect = productService.selectFavByKey(new CollectKey(user.getUserid(), productid));
            if (collect == null) {
                product.setFav(false);
            } else {
                product.setFav(true);
            }
        }

        //查询商品类别
        Cate cate = cateService.selectByPrimaryKey(product.getCate());

        //商品图片
        List<ImagePath> imagePath = productService.findImagePath(productid);
        //商品评论s

        //商品折扣信息
        Discount discount = discountMapper.selectByPrimaryKey(product.getDiscountid());
        product.setDiscount(discount);

        //返回数据
        System.out.println(product.getProductname());




        //查询卖家数据
       Seller seller =  sellerService.selectByPrimaryKey(product.getSellerid());



        productInfo.put("seller", seller);

        productInfo.put("product", product);
        productInfo.put("cate", cate);
        productInfo.put("image", imagePath);
        model.addAttribute("productInfo",productInfo);
//        model.addAllAttributes(productInfo);

        //评论信息
        CommentExample commentExample=new CommentExample();
        commentExample.or().andProductidEqualTo(product.getProductid());
        List<Comment> commentList=commentService.selectByExample(commentExample);
        for (Integer i=0;i<commentList.size();i++)
        {
            Comment comment=commentList.get(i);
            User commentUser=userService.selectByPrimaryKey(comment.getUserid());
            comment.setUsername(commentUser.getUsername());
            comment.setUserImage(commentUser.getImagepath());
            commentList.set(i,comment);
        }
        model.addAttribute("commentList",commentList);


        /**
         *查询当前用户是否购买过此产品
         */
        Boolean hasbought = false;

        if(user == null){
            hasbought = false;

        }else {
            OrderExample orderExample = new OrderExample();
            orderExample.or().andUseridEqualTo(user.getUserid());

            List<Order> orderList = orderService.selectOrderByExample(orderExample);

            List<Integer> productBought = new ArrayList<>();
            for (Order selectOrder : orderList) {
                OrderItemExample orderItemExample = new OrderItemExample();
                orderItemExample.or().andOrderidEqualTo(selectOrder.getOrderid());
                List<OrderItem> orderItemList = orderItemService.selectByExample(orderItemExample);
                for (OrderItem item : orderItemList) {
                    productBought.add(item.getProductid());
                    System.out.println(item.getProductid());

                }
            }
            if (productBought.contains(productid)) {
                hasbought = true;

            }
        }
                model.addAttribute("hasBought",hasbought);
                System.out.println(hasbought);

        return "detail";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String searchProduct(@RequestParam(value = "page",defaultValue = "1") Integer pn, String keyword, Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");

        //一页显示几个数据
        PageHelper.startPage(pn, 16);

        //查询数据
        ProductExample productExample = new ProductExample();
        productExample.or().andProductnameLike("%" + keyword + "%");
        List<Product> productList = productService.selectByExample(productExample);

        //获取图片地址
        for (int i = 0; i < productList.size(); i++) {
            Product product = productList.get(i);

            List<ImagePath> imagePathList = productService.findImagePath(product.getProductid());

            product.setImagePaths(imagePathList);

            //判断是否收藏
            if (user == null) {
                product.setFav(false);
            } else {
                Collect collect = productService.selectFavByKey(new CollectKey(user.getUserid(), product.getProductid()));
                if (collect == null) {
                    product.setFav(false);
                } else {
                    product.setFav(true);
                }
            }

            productList.set(i, product);
        }


        //显示几个页号
        PageInfo page = new PageInfo(productList,5);
        model.addAttribute("pageInfo", page);
        model.addAttribute("keyword", keyword);

        return "search";
    }

    @RequestMapping("/collect")
    @ResponseBody
    public Msg collectProduct(Integer productid, HttpSession session) {
        //取登录用户信息,未登录重定向至登录页面
        User user = (User) session.getAttribute("user");
        if(user == null) {
            return Msg.fail("收藏失败，请登录");
        }

        //添加收藏
        Collect collect = new Collect();
        collect.setCollecttime(new Date());
        collect.setProductid(productid);
        collect.setUserid(user.getUserid());

//        productService.addCollect(collect);
        collectMapper.insertSelective(collect);
        return Msg.success("收藏成功");
    }

    @RequestMapping("/deleteCollect")
    @ResponseBody
    public Msg deleteFavProduct(Integer productid, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return Msg.fail("取消收藏失败");
        }

        //删除收藏
//        productService.deleteFavByKey(new CollectKey(user.getUserid(),productid));
        collectMapper.deleteByPrimaryKey(new CollectKey(user.getUserid(),productid));

        return Msg.success("取消收藏成功");
    }

    @RequestMapping("/category")
    public String getCateProduct(String cate, @RequestParam(value = "page",defaultValue = "1") Integer pn, Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");

        //一页显示几个数据
        PageHelper.startPage(pn, 16);

        //查询分类id
        CateExample cateExample = new CateExample();
        cateExample.or().andCatenameLike(cate);
        List<Cate> cateList = cateService.selectByExample(cateExample);

        //获取查出的类别id
        List<Integer> cateId = new ArrayList<>();
        for (Cate c : cateList) {
            cateId.add(c.getCateid());
        }

        //查询数据
        ProductExample productExample = new ProductExample();
        productExample.or().andDetailcateLike("%" + cate + "%");
        System.out.println(cate);
        if (!cateId.isEmpty()) {
            productExample.or().andCateIn(cateId);
        }
        List<Product> productList = productService.selectByExample(productExample);

        //获取图片地址
        for (int i = 0; i < productList.size(); i++) {
            Product product = productList.get(i);

            List<ImagePath> imagePathList = productService.findImagePath(product.getProductid());

            product.setImagePaths(imagePathList);

            //判断是否收藏
            if (user == null) {
                product.setFav(false);
            } else {
                Collect collect = productService.selectFavByKey(new CollectKey(user.getUserid(), product.getProductid()));
                if (collect == null) {
                    product.setFav(false);
                } else {
                    product.setFav(true);
                }
            }

            productList.set(i, product);
        }


        //显示几个页号
        PageInfo page = new PageInfo(productList,5);
        model.addAttribute("pageInfo", page);
        model.addAttribute("cate", cate);
        return "category";
    }



    @RequestMapping("/comment")
    @ResponseBody
    public Msg comment(Comment comment, HttpServletRequest request){
        HttpSession session=request.getSession();
        User user=(User) session.getAttribute("user");
        if (user == null) {
            return Msg.fail("评论失败");
        }
        comment.setUserid(user.getUserid());
        Date date=new Date();
        comment.setCommenttime(date);
        commentService.insertSelective(comment);
        return Msg.success("评论成功");
    }
}
