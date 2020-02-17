package com.ssm.service.impl;

import com.ssm.Dao.UsersMapper;
import com.ssm.bean.Users;
import com.ssm.service.userService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("theUser")
public class userSerImpl implements userService {
    @Autowired
    UsersMapper usersMapper;

    @Override
    public Users selectByPrimaryKey(Integer id) {
        Users users = new Users();
        users = usersMapper.selectByPrimaryKey(id);
        return users;
    }

    @Override
    public List<Users> findAll() {
        List<Users> list = new ArrayList<Users>();
        list = usersMapper.findAll();
        return list;
    }

    @Override
    public void deleteByPrimaryKey(Integer id) {
        int i = usersMapper.deleteByPrimaryKey(id);
        System.out.println(i+" delete success");
    }
}
