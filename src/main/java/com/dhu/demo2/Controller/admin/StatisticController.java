package com.dhu.demo2.Controller.admin;


import com.dhu.demo2.dao.CollectMapper;
import com.dhu.demo2.dao.CommentMapper;
import com.dhu.demo2.dao.DiscountMapper;
import com.dhu.demo2.pojo.*;
import com.dhu.demo2.service.*;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.collections.list.SynchronizedList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class StatisticController {

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


    @RequestMapping("adminPie")
    public String adminPie(){
        return "statistic/adminPie";
    }
    @RequestMapping("adminColumn")
    public String adminColumn(){
        return "statistic/adminColumn";
    }



    @RequestMapping("/xiaoshoue")
    public String selleralalalalal(Model model, HttpSession session ){
        List<Double> sellsList = new ArrayList<>();
        List<Float> xiaoshoue ;
        double[] xiaoshoue_ =new double[6];
        for(int i=0;i<6;i++)
        {
            OrderItemExample orderItemExample = new OrderItemExample();
            List<OrderItem> orderItems= orderItemService.selectByExample(orderItemExample);
            for(OrderItem item : orderItems)
            {
                Product product= productService.selectByPrimaryKey(item.getProductid());
                if(i==(product.getCate()-1))
                    xiaoshoue_[i]= xiaoshoue_[i]+(product.getPrice()*item.getNum());
//                xiaoshoue_[i]= xiaoshoue_[i]+(product.getPrice()*item.getNum()*(1-product.getDiscountid()*0.1));
                //折扣*原价*数量
            }
            System.out.println(i);
            System.out.println(xiaoshoue_[i]);
            sellsList.add(xiaoshoue_[i]);
        }
        model.addAttribute("sellList",sellsList);
        session.setAttribute("sellsList",sellsList);
        return "statistic/adminColumn";
    }


    //按每个类别的销售数量统计
    @RequestMapping("/salesrate")
    public String salesrate(Model model ,HttpSession session){
        float[] sales =new float[6];
        float[] total=new float[7];
        float[] totalPrice=new float[7];
        float[] price = new float[7];
        total[6]=0;
        totalPrice[6]=0;
        for(int i=0;i<6;i++)
        {
            sales[i]=0;total[i]=0;price[i]=0;totalPrice[i]=0;
            OrderItemExample orderItemExample = new OrderItemExample();
            List<OrderItem> orderItems= orderItemService.selectByExample(orderItemExample);
            for(OrderItem item : orderItems)
            {
                Product product= productService.selectByPrimaryKey(item.getProductid());
                if(i==(product.getCate()-1)) {
                    sales[i] = sales[i] + item.getNum();
                    price[i] = price[i] + item.getNum() * product.getPrice();
                }
            }
            total[6]=total[6]+sales[i];
            totalPrice[6]=totalPrice[6]+price[i];
        }
        for(int i=0;i<5;i++)
        {
            total[i]=(sales[i]/total[6])*100;
            totalPrice[i]=(price[i]/totalPrice[6])*100;

        }
        totalPrice[5]=100-totalPrice[4]-totalPrice[3]-totalPrice[2]-totalPrice[1]-totalPrice[0];

        total[5]=100-total[4]-total[3]-total[2]-total[1]-total[0];
        System.out.println("销售比例");
        for(int i=0;i<7;i++)
            System.out.println(total[i]);
        session.setAttribute("bookNum",String.valueOf(sales[0]));
        session.setAttribute("digitalNum",String.valueOf(sales[1]));
        session.setAttribute("lifeNum",String.valueOf(sales[2]));
        session.setAttribute("makeupNum",String.valueOf(sales[3]));
        session.setAttribute("snackNum",String.valueOf(sales[4]));
        session.setAttribute("clothNum",String.valueOf(sales[5]));

        session.setAttribute("book",total[0]);
        session.setAttribute("digital",total[1]);
        session.setAttribute("life",total[2]);
        session.setAttribute("makeup",total[3]);
        session.setAttribute("snack",total[4]);
        session.setAttribute("cloth",total[5]);
//        session.setAttribute("study",total[6]);
        session.setAttribute("bookPrice",String.valueOf(price[0]));
        session.setAttribute("digitalPrice",String.valueOf(price[1]));
        session.setAttribute("lifePrice",String.valueOf(price[2]));
        session.setAttribute("makeupPrice",String.valueOf(price[3]));
        session.setAttribute("snackPrice",String.valueOf(price[4]));
        session.setAttribute("clothPrice",String.valueOf(price[5]));

        session.setAttribute("book2",totalPrice[0]);
        session.setAttribute("digital2",totalPrice[1]);
        session.setAttribute("life2",totalPrice[2]);
        session.setAttribute("makeup2",totalPrice[3]);
        session.setAttribute("snack2",totalPrice[4]);
        session.setAttribute("cloth2",totalPrice[5]);

        return "statistic/adminSimplePie";
    }





    @RequestMapping("sellsPerMonth")
    public String sellsMonth(){
        OrderExample orderExample = new OrderExample();

        return "sellsPerMonth";
    }

    @RequestMapping("/salesmonth")
    public String salesmonth(Model model, HttpSession session){
        double[][] sales =new double[7][12];
        for(int i=0;i<6;i++)
        {

            OrderItemExample orderItemExample = new OrderItemExample();
            List<OrderItem> orderItems= orderItemService.selectByExample(orderItemExample);
            for(OrderItem item : orderItems)
            {
                Order order=new Order();
                order= orderService.selectByPrimaryKey(item.getOrderid());
                Product product= productService.selectByPrimaryKey(item.getProductid());
                if(i==(product.getCate()-1))
                    sales[i][order.getOrdertime().getMonth()]=sales[i][order.getOrdertime().getMonth()]+
                            (product.getPrice()*item.getNum()*(1-product.getDiscountid()*0.1));
            }
        }
        for(int i=0;i<12;i++)
            sales[6][i]=sales[0][i]+sales[1][i]+sales[2][i]+sales[3][i]+sales[4][i]+sales[5][i];

        List<Double> booklist = new ArrayList<>();
        List<Double> digitallist = new ArrayList<>();
        List<Double> lifelist = new ArrayList<>();
        List<Double> makeuplist = new ArrayList<>();
        List<Double> snacklist = new ArrayList<>();
        List<Double> clothlist = new ArrayList<>();
        List<Double> totallist = new ArrayList<>();

            for(int j = 0; j < 12 ;j++){
                booklist.add(sales[0][j]);
            }for(int j = 0; j < 12 ;j++){
            digitallist.add(sales[1][j]);
            }for(int j = 0; j < 12 ;j++){
                lifelist.add(sales[2][j]);
            }for(int j = 0; j < 12 ;j++){
                makeuplist.add(sales[3][j]);
            }for(int j = 0; j < 12 ;j++){
                snacklist.add(sales[4][j]);
            }for(int j = 0; j < 12 ;j++){
                clothlist.add(sales[5][j]);
            }for(int j = 0; j < 12 ;j++){
                totallist.add(sales[6][j]);
            }
            System.out.println();

        session.setAttribute("book",booklist);
        session.setAttribute("digital",digitallist);
        session.setAttribute("life",lifelist);
        session.setAttribute("makeup",makeuplist);
        session.setAttribute("snack",snacklist);
        session.setAttribute("cloth",clothlist);
        session.setAttribute("total",totallist);

        return "statistic/adminPriceMonth";
    }

    @RequestMapping("/salesseller")
    public String salesseller(Model model){
        List<Double> sellersales=new ArrayList<Double>();

        SellerExample sellerExample=new SellerExample();
        List<Seller> sellerList = sellerService.selectByExample(sellerExample);
        for(Seller seller:sellerList)
        {
            Double sales = 0.0;
            OrderItemExample orderItemExample = new OrderItemExample();
            List<OrderItem> orderItems= orderItemService.selectByExample(orderItemExample);

            for(OrderItem item : orderItems)
            {
                Product product= productService.selectByPrimaryKey(item.getProductid());
                if(seller.getSellerid().equals(product.getSellerid())) {
                    sales = sales + (product.getPrice() * item.getNum() * (1 - product.getDiscountid() * 0.1));
                }
            }
            sellersales.add(sales);
            System.out.println(sales);
        }
        return "success";
    }





    public class User implements Comparable<User>{

        private double sum;

        private String name;

        public User(double sum, String name){
            super();
            this.sum = sum;
            this.name = name;
        }

        public double getSum() {
            return sum;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getName() {
            return name;
        }

        public void setSum(double sum) {
            this.sum = sum;
        }

        @Override
        public int compareTo(User o) {
            double i = this.getSum() - o.getSum();
            if(i == 0){
                return 1;
            }
            return (int)i;
        }

    }


    @RequestMapping("salespp")
    public String salespp(){

            return "statistic/adminPie";
    }

    @RequestMapping("/salesppImpl")
    @ResponseBody
    public Map<String,Object> salesppImpl(Model model, HttpSession session){
        List<String> category = new ArrayList<>();
        List<Double> percent1 = new ArrayList<>();

        List<List<String>> productList = new ArrayList<>();
        List<List<Double>> percent2 = new ArrayList<>();



        List<Double> sellersales=new ArrayList<Double>();
        SellerExample sellerExample=new SellerExample();
        List<Seller> sellerList = sellerService.selectByExample(sellerExample);
        double sales_total =0.0;

        for(Seller seller:sellerList)
        {
            Double sales = 0.0;
            OrderItemExample orderItemExample = new OrderItemExample();
            List<OrderItem> orderItems= orderItemService.selectByExample(orderItemExample);
            for(OrderItem item : orderItems)
            {
                Product product= productService.selectByPrimaryKey(item.getProductid());
                if(seller.getSellerid().equals(product.getSellerid())) {
                    sales = sales + (product.getPrice() * item.getNum() * (1 - product.getDiscountid() * 0.1));
                }
            }
            sales_total+=sales;
            sellersales.add(sales);
        }
        int temp = 0;
        for(Seller seller:sellerList)
        {
            sellersales.set(temp,sellersales.get(temp)/sales_total);
            temp++;
        }
        List<User> SaleList=new ArrayList<>();
        int q=0;
        for(Seller seller:sellerList)
        {
            SaleList.add(new User(sellersales.get(q),seller.getSellername()));
            q++;
        }
        Collections.sort(SaleList,Collections.reverseOrder());
        double t=0.0;
        if(sellerList.size()>8) {
            for(int x=0;x<8;x++)
                t=t+SaleList.get(x).getSum();
            t=sales_total-t;
            SaleList.set(8, new User(t, "其他"));
        }
        for(User a:SaleList)
        {
            System.out.println(a.getName());
            System.out.println((a.getSum()));
        }
        OrderItemExample orderItemExample = new OrderItemExample();
        List<OrderItem> orderItems= orderItemService.selectByExample(orderItemExample);
        Double[] sale_list=new Double[10000];
        for(int i=0;i<10000;i++)
            sale_list[i]=0.0;
        Map<String,List<User>> map=new HashMap<>();
        int max=0;
        for(OrderItem item:orderItems)
        {
            if(item.getProductid()>max)
                max=item.getProductid();
            Product product= productService.selectByPrimaryKey(item.getProductid());
            sale_list[item.getProductid()]=sale_list[item.getProductid()]
                    +(product.getPrice() * item.getNum() * (1 - product.getDiscountid() * 0.1));
        }
        int index = 0;
        for(Seller seller:sellerList) {

            System.out.println(sellersales.get(index)*100);
            percent1.add(sellersales.get(index)*100);
            List<User> double_list=new ArrayList<>();
            for (int i = 0; i <= max; i++) {
                Product product = productService.selectByPrimaryKey(i);
                if(product==null)
                    continue;
                if(product.getSellerid().equals(seller.getSellerid())) {
                    double_list.add(new User(sale_list[i]/sales_total*100, product.getProductname()));
                }
            }
            Collections.sort(double_list,Collections.reverseOrder());

            System.out.println(seller.getSellername());

            category.add(seller.getSellername());

            List<String> tempname = new ArrayList<>();
            List<Double> tempcount = new ArrayList<>();

            for(User s:double_list)
            {
                System.out.println(s.getName());
                tempname.add(s.getName());
                tempcount.add(s.getSum());
                System.out.println(s.getSum());
            }
            productList.add(tempname);
            percent2.add(tempcount);

            map.put(seller.getSellername(),double_list);
            index++;
        }

        Map<String,Object> jsonMap = new HashMap<>();
        jsonMap.put("sellerList",category);
        jsonMap.put("sellerRate",percent1);
        jsonMap.put("productList",productList);
        jsonMap.put("productRate",percent2);

        return jsonMap;
    }
    }


