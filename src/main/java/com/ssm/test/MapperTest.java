package com.ssm.test;

import com.ssm.Dao.DepartmentMapper;
import com.ssm.Dao.EmployeeMapper;
import com.ssm.bean.Department;
import com.ssm.bean.Employee;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/*
* Spring的项目使用Spring的单元测试
* 步骤：
* 1.导入test模块（Maven）
*       <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-test</artifactId>
            <version>4.3.7.RELEASE</version>
        </dependency>
* 2.@ContextConfiguration指定spring配置文件的位置
*       使用其中的locations的元素（是一个数组）完成指定
*   @RunWith(): 由spring自己提供的运行单元模块，所以在这个java文件中的Test都由这个annotation开始运行
* 3.直接autowired()要使用的组件即可
* */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    SqlSession sqlSession;

    @Test
    public void testCURD(){
//        //1.创建spring容器
//        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
//        //2.从容器中获取mapper
//        DepartmentMapper bean =  applicationContext.getBean(DepartmentMapper.class);

        System.out.println(departmentMapper);
        System.out.println(employeeMapper);

//        departmentMapper.insertSelective(new Department(null,"invent"));
//        departmentMapper.insertSelective(new Department(null,"test"));
//        departmentMapper.insertSelective(new Department(null,"嗨部"));

//        employeeMapper.insertSelective(new Employee(null,"cent","male","111@111",1));
//        employeeMapper.insertSelective(new Employee(null,"Andy","male","121@111",1));
        employeeMapper = sqlSession.getMapper(EmployeeMapper.class);
        for(int i=0;i<30;i++){
            String uid = UUID.randomUUID().toString().substring(0,5);
            int ii = (int) (Math.random()*3+1);//[1,3)
            employeeMapper.insertSelective(new Employee(null,uid,"female",uid+"@111.com",ii));
        }

    }
}
