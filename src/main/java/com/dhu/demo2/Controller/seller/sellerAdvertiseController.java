package com.dhu.demo2.Controller.seller;

import com.dhu.demo2.dao.AdvertiseMapper;
import com.dhu.demo2.pojo.*;
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

import static java.lang.Integer.parseInt;

@Controller
public class sellerAdvertiseController {

    @Autowired
    private AdvertiseMapper advertiseMapper;

    public static Date getSomeDay(Date date, int day){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DATE, day);
        return calendar.getTime();
    }


    @RequestMapping("sellerAdvertise")
    public String sellerAdvertise(HttpSession session){
        Seller seller = (Seller)session.getAttribute("seller");
        if(seller==null){
            return "sellerLogin";
        }
        return "sellerAdvertise";
    }

    @RequestMapping("sellerUploadPicAd")
    @ResponseBody
    public Map<String, Object> AdPicUpload(HttpServletRequest request, HttpServletResponse response, String loginName, Model model) throws Exception {
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

    @RequestMapping("confirmAddAd")
    @ResponseBody
    public Map<String, Object> confirmAddAd(HttpSession session, String advertiseName, String timePersist, Integer seller, String detailDes, String imageName){

        System.out.println("recieveAd");



        Seller sellerObject = (Seller)session.getAttribute("seller");
        String sellerName = sellerObject.getSellername();

        System.out.println(seller+" "+advertiseName);

        Integer time = parseInt(timePersist);
        Date deadLine = new Date();
        deadLine = getSomeDay(deadLine,time);
        System.out.println(time);
        Advertise advertise = new Advertise();

        advertise.setAdvertisename(advertiseName);
        advertise.setSellerid(seller);
        advertise.setSellername(sellerObject.getSellername());
        advertise.setAddetail(detailDes);
        advertise.setUptime(new Date());
        advertise.setImagepath(imageName);
        advertise.setDowntime(deadLine);
        advertiseMapper.insert(advertise);





        Map<String,Object> map = new HashMap<>();
        map.put("code",0);
        return map;
    }
}
