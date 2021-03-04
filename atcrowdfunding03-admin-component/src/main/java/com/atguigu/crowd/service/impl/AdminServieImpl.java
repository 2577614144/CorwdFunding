package com.atguigu.crowd.service.impl;

import com.atguigu.crowd.entity.Admin;
import com.atguigu.crowd.mapper.AdminMapper;
import com.atguigu.crowd.service.api.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: lipine
 * @Date: 2021/3/4 11:20
 * @Description: 用户接口的实现类
 * @Version 1.0
 */
@Service
public class AdminServieImpl implements AdminService {
    @Autowired
    AdminMapper adminMapper;

    @Override
    public void saveAdmin(Admin admin) {
        adminMapper.insert(admin);
        //为了测试声明式事务是否可以正常回滚
        //throw  new RuntimeException();
    }
}
