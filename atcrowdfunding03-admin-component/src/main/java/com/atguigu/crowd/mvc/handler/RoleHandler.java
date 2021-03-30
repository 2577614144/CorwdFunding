package com.atguigu.crowd.mvc.handler;

import com.atguigu.crowd.entity.Role;
import com.atguigu.crowd.service.api.RoleService;
import com.atguigu.crowd.util.ResultEntity;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Author: lipine
 * @Date: 2021/3/19 17:20
 * @Description: 角色处理的控制器
 * @Version 1.0
 */
@Controller
public class RoleHandler {
    @Autowired
    private  RoleService roleService;

    @ResponseBody
    @RequestMapping("/role/get/page/info.json")
    public ResultEntity<PageInfo<Role>> getPageInfo(
            @RequestParam(value="keyword", defaultValue="") String keyword,

            // pageNum默认值使用1
            @RequestParam(value="pageNum", defaultValue="1") Integer pageNum,

            // pageSize默认值使用5
            @RequestParam(value="pageSize", defaultValue="5") Integer pageSize

    ){
        // 调用 Service 方法获取分页数据
        PageInfo<Role> pageInfo = roleService.getPageInfo(keyword,pageNum,pageSize);
        // 封装到 ResultEntity 对象中返回（如果上面的操作抛出异常，交给异常映射机制处理）
        return ResultEntity.successWithData(pageInfo);
    }

    @ResponseBody
    @RequestMapping("/role/save.json")
    public ResultEntity<String> saveRole(Role role) {

        roleService.saveRole(role);

        return ResultEntity.successWithoutData();
    }
}
