package com.atguigu.crowd.mvc.handler;

import com.atguigu.crowd.service.api.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

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
}
