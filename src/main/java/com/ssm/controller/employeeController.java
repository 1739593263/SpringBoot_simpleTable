package com.ssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.bean.Department;
import com.ssm.bean.Employee;
import com.ssm.bean.Message;
import com.ssm.service.departService;
import com.ssm.service.employeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/employee")
public class employeeController {

    @Autowired
    @Qualifier("theEmployee")
    employeeService employeeService;

    @Autowired
    departService departService;

//    @ResponseBody 可以自动将返回的对象转换为json字符串，所以PageInfo可以直接返回
    @ResponseBody
    @RequestMapping("/findAll")
    public Message getEmpWithJason(@RequestParam(value = "PN", defaultValue = "1")Integer PN){
        PageHelper.startPage(PN,8);
        List<Employee> list = employeeService.findAll();
        Message message = new Message();
        PageInfo pageInfo = new PageInfo(list,5);
        return message.success().add("pageInfo",pageInfo);
    }

    @ResponseBody
    @RequestMapping("/testInVue")
    public Message heheTest(){
        return new Message().success();
    }

    @ResponseBody
    @RequestMapping(value = "/save_table",method = RequestMethod.POST)
    public Message save_Employee_table(@Valid Employee employee, BindingResult result, ServletRequest request){
        Message message = new Message();
        if(result.hasErrors()){
            // check form behind.
            List<FieldError> errors = result.getFieldErrors();
            Map<String,Object> errorMap = new HashMap<String,Object>();
            for(FieldError error:errors){
                System.out.println("error_name: "+error.getField());
                System.out.println("error_Message: "+error.getDefaultMessage());
                errorMap.put(error.getField(),error.getDefaultMessage());
            }
            return message.fail().add("errorMap",errorMap);
        }else{
            System.out.println("name="+request.getParameter("depName"));
            int dep_id = departService.find_id(request.getParameter("depName"));
            employee.setDepId(dep_id);
            System.out.println("employee="+employee);
            employeeService.save_Employee(employee);
            return message.success();
        }
    }

    @ResponseBody
    @RequestMapping("/checkuser")
    public Message check_user(@RequestParam("name")String name){
        boolean if_exist = employeeService.checkByExample(name);
        Message message = new Message();
        if(if_exist){
            return message.success();
        }else{
            return message.fail();
        }
    }

    @ResponseBody
    @RequestMapping(value="/getEmp/{id}", method=RequestMethod.GET)
    public Message get_Emp(@PathVariable Integer id){
        Employee employee = employeeService.getEmp(id);
        Department department = departService.find_depName(employee.getDepId());
        employee.setDepartment(department);
        System.out.println("asd="+employee.getName()+" department="+department.getDepName());
        return new Message().success().add("empWithDep",employee);
    }

    @ResponseBody
    @RequestMapping(value="/save_updEmp/{id}", method=RequestMethod.PUT)
    public Message save_updEmp(Employee employee,ServletRequest request){
        Integer depId = departService.find_id(request.getParameter("depName"));
        employee.setDepId(depId);
        employeeService.save_Upd(employee);
        return new Message().success();
    }

    @ResponseBody
    @RequestMapping(value = "/deleteEmp/{id}", method = RequestMethod.DELETE)
    public Message delete_Emp(@PathVariable("id")Integer id){
        employeeService.deleteEmp(id);
        return new Message().success();
    }

    @ResponseBody
    @RequestMapping(value = "/deleteEmps/{ids}",method = RequestMethod.DELETE)
    public Message delete_Emps(@PathVariable("ids")String ids){
        if(!ids.contains(",")){
            employeeService.deleteEmp(Integer.parseInt(ids));
        }else{
            String[] IDs = ids.split(",");
            List<Integer> list = new ArrayList<Integer>();
            for(String id : IDs){
//                employeeService.deleteEmp(Integer.parseInt(id));
                list.add(Integer.parseInt(id));
            }
            employeeService.deleteBatch(list);
        }
        //System.out.println("ids="+ids);
        return new Message().success();
    }

//    @RequestMapping("/findAll")
//    public String findAll(@RequestParam(value = "PN",defaultValue = "1")Integer PN, Model model){
////        PageHelper.startPage(pageNumber,pageSize);
//        PageHelper.startPage(PN,8);
//        List<Employee> list = employeeService.findAll();
////        PageHelper中的PageInfo包装
////        PageInfo pageInfo = new PageInfo(List);
////        PageInfo pageInfo = new PageInfo(List,navigatePages);
//
//        for(Employee e:list){
//            System.out.println(e.getId()+" "+e.getName());
//            System.out.println();
//        }
//
//        PageInfo pageInfo = new PageInfo(list,5);
//        model.addAttribute("pageInfo",pageInfo);
//
//        return "open";
//    }

}
