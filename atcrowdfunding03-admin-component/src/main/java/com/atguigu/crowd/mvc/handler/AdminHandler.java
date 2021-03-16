package com.atguigu.crowd.mvc.handler;

import com.atguigu.crowd.constant.CrowdConstant;
import com.atguigu.crowd.entity.Admin;
import com.atguigu.crowd.service.api.AdminService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

/**
 * @Author: lipine
 * @Date: 2021/3/10 16:45
 * @Description: 管理员处理类
 * @Version 1.0
 */
@Controller
public class AdminHandler {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/admin/save.html")
    public String  save(Admin admin){
        adminService.saveAdmin(admin);
        /**
         * 添加?pageNum="+Integer.MAX_VALUE 为了默认定位到最后一页
         * 也可以修改sql为desc排序 return “redirect:/admin/get/page.html”
         */
        return "redirect:/admin/get/page.html?pageNum="+Integer.MAX_VALUE;
    }


    @RequestMapping("/admin/remove/{adminId}/{pageNum}/{keyword}.html")
    public String remove(
            @PathVariable("adminId") Integer adminId,
            @PathVariable("pageNum") Integer pageNum,
            @PathVariable("keyword") String keyword
    ) {

        // 执行删除
        adminService.remove(adminId);

        // 页面跳转：回到分页页面

        // 尝试方案1：直接转发到admin-page.jsp会无法显示分页数据
        // return "admin-page";

        // 尝试方案2：转发到/admin/get/page.html地址，一旦刷新页面会重复执行删除浪费性能
        // return "forward:/admin/get/page.html";

        // 尝试方案3：重定向到/admin/get/page.html地址
        // 同时为了保持原本所在的页面和查询关键词再附加pageNum和keyword两个请求参数
        return "redirect:/admin/get/page.html?pageNum="+pageNum+"&keyword="+keyword;
    }

    @RequestMapping("/admin/get/page.html")
    public String getPageInfo(
            // 使用@RequestParam注解的defaultValue属性，指定默认值，在请求中没有携带对应参数时使用默认值
            // keyword默认值使用空字符串，和SQL语句配合实现两种情况适配
            @RequestParam(value="keyword", defaultValue="") String keyword,

            // pageNum默认值使用1
            @RequestParam(value="pageNum", defaultValue="1") Integer pageNum,

            // pageSize默认值使用5
            @RequestParam(value="pageSize", defaultValue="5") Integer pageSize,

            ModelMap modelMap

    ) {

        // 调用Service方法获取PageInfo对象
        PageInfo<Admin> pageInfo = adminService.getPageInfo(keyword, pageNum, pageSize);

        // 将PageInfo对象存入模型
        modelMap.addAttribute(CrowdConstant.ATTR_NAME_PAGE_INFO, pageInfo);

        return "admin-page";
    }


    @RequestMapping("/admin/do/logout.html")
    public String doLogin(HttpSession httpSession){
        // 强制 Session 失效
        httpSession.invalidate();
        return "redirect:/admin/to/login/page.html";
    }

    @RequestMapping("/admin/do/login.html")
    public String doLogin(
            @RequestParam("loginAcct") String loginAcct,
            @RequestParam("userPswd") String userPswd,
            HttpSession httpSession
    ){
        // 调用Service方法执行登录检查
        // 这个方法如果能够返回admin对象说明登录成功，如果账号、密码不正确则会抛出异常
        Admin admin = adminService.getAdminByLoginAcct(loginAcct, userPswd);
        // 将登录成功返回的admin对象存入Session域
        httpSession.setAttribute(CrowdConstant.ATTR_NAME_LOGIN_ADMIN, admin);

        return "redirect:/admin/to/main/page.html";
    }

}
