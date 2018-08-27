package com.dhu.demo2.Controller.admin;


import com.dhu.demo2.pojo.Admin;
import com.dhu.demo2.pojo.AdminExample;
import com.dhu.demo2.pojo.Seller;
import com.dhu.demo2.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class loginController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("adminLogin")
    public String adminLogin(){
        return "adminLogin";
    }
    @RequestMapping("adminConfirmLogin")
    public String adminConfirmLogin(Model model, HttpSession session, String adminName, String password){
        if(adminName==null||adminName.equals("")){
            model.addAttribute("errorMsg", "用户名和密码不能为空");
            return "adminLogin";
        }
        AdminExample adminExample = new AdminExample();


        Admin selectAdmin = adminService.selectByName(adminName);
        if(selectAdmin==null){
            model.addAttribute("errorMsg", "用户名或密码错误");
            return "adminLogin";


        }
        if(password==null||password.equals("")){
            model.addAttribute("errorMsg", "用户名和密码不能为空");
            return "adminLogin";

        }else {
            if (password.equals(selectAdmin.getPassword())) {

                session.setAttribute("admin", selectAdmin);
                session.setAttribute("adminId", selectAdmin.getAdminid());

                return "redirect:/adminManage";
            }
            else{
                model.addAttribute("errorMsg", "用户名或密码错误");
                return "adminLogin";

            }
        }

    }
}
