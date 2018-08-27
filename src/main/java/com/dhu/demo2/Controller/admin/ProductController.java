package com.dhu.demo2.Controller.admin;

import com.dhu.demo2.dao.ProductMapper;
import com.dhu.demo2.pojo.Msg;
import com.dhu.demo2.pojo.Product;
import com.dhu.demo2.pojo.ProductExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ProductController {
    @Autowired
    private ProductMapper productMapper;


    @RequestMapping("/productjson")
    @ResponseBody
    public Map<String,Object> productjson(String itemName,Integer priceMin,Integer priceMax,Integer itemId, Integer itemCate,String itemDes){

        ProductExample productExample = new ProductExample();
        ProductExample.Criteria criteria = productExample.createCriteria();
        if(itemName!=null&&!itemName.equals("")) {
            criteria.andProductnameLike("%" + itemName + "%");
        }
        if(priceMax!=null){
            criteria.andPriceBetween(priceMin, priceMax);
        }
        if(itemCate!=null) {
            criteria.andCateEqualTo(itemCate);
        }
        if(itemId!=null){
            criteria.andProductidEqualTo(itemId);
        }
        if(itemDes!=null&&!itemDes.equals("")){
            criteria.andDescriptionLike("%" + itemDes + "%");
        }
        List<Product> productList = productMapper.selectByExampleWithBLOBs(productExample);
        Map<String,Object> map = new HashMap<>();
        map.put("data",productList);
        map.put("count",productList.size());
        map.put("msg","hello");
        map.put("code","0");
        return map;

    }
    /*@RequestMapping("searchProduct")
    public String searchProduct(String itemName,Integer priceMin,Integer priceMax){
        productjson(itemName,priceMin,priceMax);
        return "adminManage";
    }*/


    @RequestMapping(value = "/deleteProduct")
    @ResponseBody
    public String deleteProduct(Product product){
        productMapper.deleteByPrimaryKey(product.getProductid());
        System.out.println(product.getProductid());

        return "succeed";
    }

    @RequestMapping("selectProduct")
    public String selectProduct(Integer productid, Model model){
        System.out.println(productid);
        model.addAttribute("productid",productid);
        return "layer/editProductLayer";
    }

    @RequestMapping("updateProduct")
    @ResponseBody
    public String updateProduct(Product product){
        productMapper.updateByPrimaryKeySelective(product);
        System.out.println(product);
        return "modify success!";
    }

}
