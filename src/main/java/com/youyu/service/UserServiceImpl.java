package com.youyu.service;

import com.youyu.dao.UserMapper;
import com.youyu.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService{
    @Autowired
    private UserMapper userMapper;
    @Override
    public User login(String acc,String passwd){
        return userMapper.findWithLoginnameAndPassword(acc,passwd);
    }
}
