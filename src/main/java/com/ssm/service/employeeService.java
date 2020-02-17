package com.ssm.service;

import com.ssm.bean.Employee;
import org.springframework.stereotype.Service;

import java.util.List;

@Service()
public interface employeeService {
    List<Employee> findAll();

    void save_Employee(Employee employee);

    boolean checkByExample(String name);

    Employee getEmp(Integer id);

    void save_Upd(Employee employee);

    void deleteEmp(Integer id);

    void deleteBatch(List<Integer> IDs);
}
