package com.ssm.service.impl;

import com.ssm.Dao.DepartmentMapper;
import com.ssm.bean.Department;
import com.ssm.service.departService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class departmentSerImpl implements departService {
    @Autowired
    DepartmentMapper departmentMapper;

    @Override
    public List<Department> find_depts() {
        List<Department> list = departmentMapper.selectByExample(null);
        return list;
    }

    @Override
    public int find_id(String depName) {
        int id = departmentMapper.select_id_byName(depName);
        return id;
    }

    @Override
    public Department find_depName(Integer id) {
        Department department = new Department();
        department = departmentMapper.selectByPrimaryKey(id);
        return department;
    }


}
