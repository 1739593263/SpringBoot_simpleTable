package com.ssm.controller;

import com.ssm.bean.Department;
import com.ssm.bean.Message;
import com.ssm.service.departService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartmentController {
    @Autowired
    departService departService;

    @ResponseBody
    @RequestMapping("/depts")
    public Message find_Depts(){
        Message message = new Message();
        List<Department> list = departService.find_depts();
        return message.success().add("Dept_Info",list);
    }
}
