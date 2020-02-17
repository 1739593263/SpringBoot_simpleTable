package com.ssm.test;

import com.github.pagehelper.PageInfo;
import com.ssm.bean.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
//@WebAppConfiguration 用于获取ioc容器本身
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:springMVC.xml"})
public class MvcTest {
    //传入springmvc的ioc
    //此处的Autowired用于获取ioc容器里面的东西
    @Autowired
    WebApplicationContext context;
    //模拟虚拟MVC
    MockMvc mockMvc;

    @Before
    public void initMockmvc(){
        mockMvc=MockMvcBuilders.webAppContextSetup(context).build();
    }

//    模拟发送mvc请求 测试分页
    @Test
    public void testPage() throws Exception {
        //perform-> 模拟发送信息
        //MockMvcRequestBuilders-> 模拟的ServletRequest 类用于发送各种请求
        //param-> request.getParameter(name,value);
        //andReturn() 获取模拟发送信息后的返回值
        //模拟请求获取返回值
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/employee/findAll").param("PN","1")).andReturn();

        MockHttpServletRequest request =result.getRequest();

        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("pageNow= "+pageInfo.getPageNum());
        System.out.println("pageCount= "+pageInfo.getPages());
        System.out.println("rowCount= "+pageInfo.getTotal());
        System.out.println("pageCount= "+pageInfo.getNavigatePages());

        //获取本页员工数据
        List<Employee> list = pageInfo.getList();
        for(Employee e:list){
            System.out.println(e.toString());
            System.out.println();
        }

 }
}
