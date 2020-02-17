package com.ssm.service;

import com.ssm.bean.Users;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface userService {
    //  根据主键查询
    Users selectByPrimaryKey(Integer id);

    //  全局查询
    List<Users> findAll();

    //  删除
    void deleteByPrimaryKey(Integer id);
}
