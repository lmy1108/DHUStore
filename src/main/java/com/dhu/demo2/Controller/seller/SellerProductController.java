package com.dhu.demo2.Controller.seller;


import com.dhu.demo2.pojo.Product;
import com.dhu.demo2.pojo.ProductExample;
import com.dhu.demo2.pojo.Seller;
import com.dhu.demo2.pojo.SellerExample;
import com.dhu.demo2.service.ImagePathService;
import com.dhu.demo2.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

import static java.lang.Integer.parseInt;

@Controller
public class SellerProductController {
    @Autowired
    private ProductService productService;




    //对应卖家商品添加菜单
    @RequestMapping("sellerProductLaunch")
    public String sellerProductLaunch(){

        return "sellerProductLaunch";
    }

    //对应卖家上传商品图片
//    @RequestMapping("sellerUploadPic")
//    @ResponseBody
//    public Map<String, Object> sellerUploadPic() {
//
//        Map<String, Object> map = new HashMap<>();
//        map.put("code",0);
//        return map;
//
//    }



    @RequestMapping("sellerAddProduct")
    public String sellerAdd(HttpSession session, Model model){
        Seller seller = (Seller) session.getAttribute("seller");
        if(seller==null){
            return "redirect:/sellerLogin";
        }
        return"sellerAddProduct";
    }
    @RequestMapping("sellerUploadPic")
    @ResponseBody
    public Map<String, Object> fileupload(HttpServletRequest request, HttpServletResponse response, String loginName, Model model) throws Exception {
        //获取服务器中保存文件的路径
        String localPath;
        String path = request.getSession().getServletContext().getRealPath("") + "upload/";
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





    @RequestMapping("sellerUploadPicLay")
    @ResponseBody
    public Map<String, Object> layPicUpload(HttpServletRequest request, HttpServletResponse response, String loginName, Model model) throws Exception {
        //获取服务器中保存文件的路径
        Map<String, Object> subMap = new HashMap<>();

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
                subMap.put("src","/upload/"+fileName);
                subMap.put("title","pic");

                //创建一个新的文件对象，创建时需要一个参数，参数是文件所需要保存的位置
                File newFile = new File(localPath);

                //上传的文件写入到指定的文件中
                file.transferTo(newFile);
            }
        }

        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","上传成功");
        map.put("data",subMap);
        return map;
    }





    @RequestMapping("confirmAddProduct")
    @ResponseBody
    public Map<String, Object> confirmAddProduct(HttpSession session, String productname, String num,String cate,String price, String discountid,String seller,String detailDes,String imageName){

        System.out.println("recieve");



        Seller sellerObject = (Seller)session.getAttribute("seller");
        String sellerName = sellerObject.getSellername();

        System.out.println(seller+" "+productname);

        Product product = new Product();
        product.setProductname(productname);
        product.setNum(parseInt(num));
        product.setCate(parseInt(cate));
        product.setPrice(parseInt(price));
        product.setDiscountid(parseInt(discountid));
        product.setSellerid(parseInt(seller));
        product.setSellername(sellerName);
        product.setDetaildescribe(detailDes);
        product.setImagepath(imageName);
        product.setLaunch(1);
        product.setUptime(new Date());
        ProductExample productExample = new ProductExample();
        productService.insert(product);





        Map<String,Object> map = new HashMap<>();
        map.put("code",0);
        return map;
    }

    @RequestMapping("sellerProductManage")
    public String sellerProductManage(HttpSession session){
        Seller seller = (Seller) session.getAttribute("seller");
        if(seller==null){
            return "redirect:/sellerLogin";
        }
        return "sellerProductManage";
    }

    @RequestMapping("/sellerProductjson")
    @ResponseBody
    public Map<String,Object> sellerProductjson(HttpSession session,String itemName,Integer priceMin,Integer priceMax,Integer itemId, Integer itemCate,String itemDes,Integer done){
        Seller seller = (Seller)session.getAttribute("seller");

       Integer sellerId = seller.getSellerid();
        System.out.println(itemName+" "+priceMin+" "+priceMax );

        ProductExample productExample = new ProductExample();
        ProductExample.Criteria criteria = productExample.createCriteria();

        criteria.andSelleridEqualTo(sellerId);
//        if(itemName!=null) {
//            criteria.andProductnameLike("%" + itemName + "%");
//        }
//        if(priceMax!=null){
//            criteria.andPriceBetween(priceMin, priceMax);
//        }
//        if(itemCate!=null) {
//            criteria.andCateEqualTo(itemCate);
//        }
//        if(itemId!=null){
//            criteria.andProductidEqualTo(itemId);
//        }
//        if(itemDes!=null){
//            criteria.andDescriptionLike("%" + itemDes + "%");
//        }
        List<Product> productList = productService.selectByExampleWithBLOBs(productExample);
        Map<String,Object> map = new HashMap<>();
        map.put("data",productList);
        map.put("count",productList.size());
        map.put("msg","hello");
        map.put("code","0");
        return map;

    }

    @RequestMapping("sellerDeleteProduct")
    @ResponseBody
    public Map<String,Object> sellerDeleteProduct(String productname){

        ProductExample productExample = new ProductExample();
        productExample.or().andProductnameEqualTo(productname);
        productService.deleteByExample(productExample);
        Map<String,Object> map = new HashMap<>();

        map.put("code",0);
        return map;

    }

}
