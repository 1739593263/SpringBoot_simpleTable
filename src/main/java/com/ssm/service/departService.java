package com.ssm.service;

import com.ssm.bean.Department;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface departService {
    List<Department> find_depts();

    int find_id(String depName);

    Department find_depName(Integer id);
}
