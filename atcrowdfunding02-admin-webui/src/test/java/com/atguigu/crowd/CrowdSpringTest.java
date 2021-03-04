package com.atguigu.crowd;

import com.atguigu.crowd.entity.Admin;
import com.atguigu.crowd.mapper.AdminMapper;
import com.atguigu.crowd.service.api.AdminService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.UUID;

/**
 * @Author: lipine
 * @Date: 2021/3/3 14:41
 * @Description: 创建 Spring 的 Junit 测试类
 * @Version 1.0
 */

// 指定 Spring 给 Junit 提供的运行器类
@RunWith(SpringJUnit4ClassRunner.class)
// 加载 Spring 配置文件的注解
@ContextConfiguration(locations = {"classpath:spring-persist-mybatis.xml","classpath:spring-persist-tx.xml"})
public class CrowdSpringTest {

    Logger logger = LoggerFactory.getLogger(CrowdSpringTest.class);

    @Autowired
    private DataSource dataSource;
    @Test
    public void testDataSource() throws SQLException {
    // 1.通过数据源对象获取数据源连接
        Connection connection = dataSource.getConnection();
        // 2.打印数据库连接
        System.out.println(connection);

    }

    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private AdminService adminService;
    @Test
    public void testAdminMapperAutowired() {
        Admin admin = adminMapper.selectByPrimaryKey(1);
//        System.out.println(admin);
        // 按照 Debug 级别打印日志
        logger.error(admin.toString());
        logger.error("============error=============");
        logger.warn("============warn=============");
        logger.info("============info=============");
        logger.debug("============debug=============");
    }

    @Test
    public void testTx() {
        Admin admin  = new Admin(null, UUID.randomUUID().toString(),"123456","李四","lisi@163.com",null);
        adminService.saveAdmin(admin);
//
    }
}
