package com.youyu.service;

import com.youyu.pojo.User;

import java.util.List;

public interface UserService {
    User login(String acc, String passwd);

    List<User> findAll();

    void insertaa(String acc,String passwd);

    User findaaaaa(String acc);
}
