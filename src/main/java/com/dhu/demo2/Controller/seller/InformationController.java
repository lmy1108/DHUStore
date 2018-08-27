package com.dhu.demo2.Controller.seller;


import com.dhu.demo2.dao.SellerImagepathMapper;
import com.dhu.demo2.dao.SellerMapper;
import com.dhu.demo2.pojo.*;
import com.dhu.demo2.service.OrderItemService;
import com.dhu.demo2.service.ProductService;
import com.dhu.demo2.service.SellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

@Controller
public class InformationController {

    @Autowired
    private SellerImagepathMapper sellerImagepathMapper;
    @Autowired
    private SellerMapper sellerMapper;
    @Autowired
    private SellerService sellerService;
    @Autowired
    private ProductService productService;
    @Autowired
    private OrderItemService orderItemService;
    @RequestMapping("getSellerInfo")
    public String showInformation(HttpSession session,Model model){
//        Seller seller1 = sellerMapper.selectByPrimaryKey(901);
//
//        session.setAttribute("seller",seller1);
        Seller seller = (Seller)session.getAttribute("seller");
        if(seller==null){
            return "sellerLogin";

        }
        SellerImagepathExample sellerImagepathExample = new SellerImagepathExample();
        sellerImagepathExample.or().andSelleridEqualTo(seller.getSellerid());

        Map<String,Object> map = new HashMap<String,Object>();

        Integer saleMount = 0;
        Double salePrice = 0.0;

        List<Product> productList =  productService.selectByExample(new ProductExample());
        List<Product> sellerproductList = new ArrayList<>();
       for(Product p : productList){

            if(p.getSellerid().equals( seller.getSellerid())){
                saleMount++;
                sellerproductList.add(p);
            }
        }

        List<OrderItem> orderItemList = orderItemService.selectByExample(new OrderItemExample() );
        for(OrderItem o : orderItemList){
            for(Product s : sellerproductList){
                if(o.getProductid()==s.getProductid()){
                    salePrice+=o.getNum()*s.getPrice();
                }
            }
        }

        map.put("sellername",seller.getSellername());
        map.put("realname",seller.getRealname());
        map.put("telephone",seller.getTelephone());
        map.put("email",seller.getEmail());
        map.put("wechat",seller.getWechat());
        map.put("regtime",seller.getRegtime());
        map.put("alipay",seller.getAlipay());
        map.put("sellerimage",seller.getImagepath());
        map.put("sellerAmount",saleMount);
        map.put("sellerPrice",salePrice);
        model.addAttribute("sellerInfo",map);




        return "sellerInformation";
    }
    @RequestMapping("sellerEditInfo")
    public String sellerEditInfo(Model model, HttpSession session){
        Seller seller = (Seller)session.getAttribute("seller");
        if(seller==null){
            return "sellerLogin";
        }
        SellerImagepathExample sellerImagepathExample = new SellerImagepathExample();
        sellerImagepathExample.or().andSelleridEqualTo(seller.getSellerid());

        Map<String,Object> map = new HashMap<String,Object>();
        map.put("sellername",seller.getSellername());
        map.put("realname",seller.getRealname());
        map.put("telephone",seller.getTelephone());
        map.put("email",seller.getEmail());
        map.put("password",seller.getPassword());
        map.put("wechat",seller.getWechat());
        map.put("regtime",seller.getRegtime());
        map.put("alipay",seller.getAlipay());
        map.put("sellerimage",seller.getImagepath());
        model.addAttribute("sellerInfo",map);

        return "sellerEditInfo";
    }

    @RequestMapping("confirmEditInfo")
    @ResponseBody
    public Map<String,Object> confirmEditInfo(HttpSession session, String sellername, String password, String alipay,String wechat,String telephone, String email, String realname,String imageName){
        Seller seller = (Seller)session.getAttribute("seller");

        Map<String,Object> map = new HashMap<>();
        if(seller==null){
            return map;
        }
        seller.setSellerid(seller.getSellerid());
        seller.setSellername(sellername);
        seller.setAlipay(alipay);
        seller.setWechat(wechat);
        seller.setEmail(email);
        seller.setPassword(password);
        seller.setRealname(realname);
        seller.setTelephone(telephone);
        seller.setImagepath(imageName);
        map.put("code",0);
    sellerService.updateByPrimaryKeySelective(seller);
    return map;
    }

    @RequestMapping("userUploadHeadPic")
    @ResponseBody
    public Map<String, Object> headUpload(HttpServletRequest request, HttpServletResponse response, String loginName, Model model) throws Exception {
        //获取服务器中保存文件的路径
        String localPath;
        String path = request.getSession().getServletContext().getRealPath("") + "upload/";
        System.out.println(path);
        model.addAttribute("path",path);
        //获取解析器
        CommonsMultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        //判断是否是文件
        if (resolver.isMultipart(request)) {
            //进行转换
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) (request);
            //获取所有文件名称
            Iterator<String> it = multiRequest.getFileNames();
            while (it.hasNext()) {
                //根据文件名称取文件
                MultipartFile file = multiRequest.getFile(it.next());
                String fileName = file.getOriginalFilename();
                localPath = path + fileName;
                //创建一个新的文件对象，创建时需要一个参数，参数是文件所需要保存的位置
                File newFile = new File(localPath);
                //上传的文件写入到指定的文件中
                file.transferTo(newFile);
            }

        }

        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        return map;
    }


}
