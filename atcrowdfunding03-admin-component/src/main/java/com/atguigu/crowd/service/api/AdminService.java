package com.atguigu.crowd.service.api;

import com.atguigu.crowd.entity.Admin;

import java.util.List;

/**
 * @Author: lipine
 * @Date: 2021/3/4 11:20
 * @Description: 用户接口
 * @Version 1.0
 */
public interface AdminService {

    void saveAdmin(Admin admin);

    List<Admin> getAll();
}