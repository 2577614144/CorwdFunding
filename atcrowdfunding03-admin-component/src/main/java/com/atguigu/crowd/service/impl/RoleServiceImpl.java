package com.atguigu.crowd.service.impl;

import com.atguigu.crowd.entity.Role;
import com.atguigu.crowd.entity.RoleExample;
import com.atguigu.crowd.mapper.RoleMapper;
import com.atguigu.crowd.service.api.RoleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: lipine
 * @Date: 2021/3/19 17:18
 * @Description: 角色服务实现类
 * @Version 1.0
 */
@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public PageInfo<Role> getPageInfo(String keyword, Integer pageNum, Integer pageSize) {
        //1. 开启分页功能
        PageHelper.startPage(pageNum, pageSize);
        //2. 执行查询
        List<Role> roleList = roleMapper.selectRoleByKeyword(keyword);
        //3.封装到PageInfo对象中返回
        return new PageInfo<>(roleList);
    }

    @Override
    public void saveRole(Role role) {
        roleMapper.insert(role);
    }

    @Override
    public void updateRole(Role role) {
        roleMapper.updateByPrimaryKey(role);
    }

    @Override
    public void removeRole(List<Integer> roleList) {
        RoleExample roleExample = new RoleExample();
        RoleExample.Criteria criteria = roleExample.createCriteria();
        // where id in(5,8,9)
        criteria.andIdIn(roleList);
        roleMapper.deleteByExample(roleExample);
    }
}
