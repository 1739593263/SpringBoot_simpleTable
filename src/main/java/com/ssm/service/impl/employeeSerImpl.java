package com.ssm.service.impl;

import com.ssm.Dao.EmployeeMapper;
import com.ssm.bean.Employee;
import com.ssm.bean.EmployeeExample;
import com.ssm.service.employeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("theEmployee")
public class employeeSerImpl implements employeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    @Override
    public List<Employee> findAll() {
//        List<Employee> list = employeeMapper.selectByExample(null);
        List<Employee> list = employeeMapper.selectByExampleWithDept(null);
         return list;
    }

    @Override
    public void save_Employee(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    @Override
    public boolean checkByExample(String name) {
        //set a EmployeeExample for countByExample
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andNameEqualTo(name);
        //count how may item appropriate example and return a long variate
        long count_reult = employeeMapper.countByExample(example);
        //if count_reult == 0, it's prove that no duplicate name in the database, so return true. If not, return false.
        return count_reult == 0;
    }

    @Override
    public Employee getEmp(Integer id) {
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        return employee;
    }

    @Override
    public void save_Upd(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    @Override
    public void deleteEmp(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void deleteBatch(List<Integer> IDs) {
        EmployeeExample example =  new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        // delete from xxx where id in(1,2,3,4,...)
        criteria.andIdIn(IDs);
        employeeMapper.deleteByExample(example);
    }
}
