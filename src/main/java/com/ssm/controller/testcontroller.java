package com.ssm.controller;

import com.ssm.bean.Users;
import com.ssm.service.userService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/start")
public class testcontroller {
    @Autowired
    @Qualifier("theUser")
    userService userSer;

    @RequestMapping("/transfer")
    public String test(ServletRequest request, ServletResponse response, Model model){
        String i = request.getParameter("id");
        Users users = userSer.selectByPrimaryKey(Integer.parseInt(i));
        System.out.println(users.toString());
        model.addAttribute("user",users);

        return "success";
    }

    @RequestMapping("/findAll")
    public String findAll(Model model){
        List<Users> list = userSer.findAll();
        model.addAttribute("userlist",list);
        return "show";
    }

    @RequestMapping("/delete")
    public void deleteByPrimaryKey(ServletRequest request, ServletResponse response) throws ServletException, IOException {
        Integer id = (Integer) request.getAttribute("id");
        userSer.deleteByPrimaryKey(id);
        request.getRequestDispatcher("../start/findAll").forward(request,response);
    }
}
