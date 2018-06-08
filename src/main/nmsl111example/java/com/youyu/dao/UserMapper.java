package com.youyu.dao;

import com.youyu.pojo.User;

import java.util.List;

import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;
import org.springframework.stereotype.Repository;


public interface UserMapper {
    @Select("Select * from user where acc=#{acc} and passwd=#{passwd}")
    User findWithLoginnameAndPassword(@Param("acc")String acc,@Param("passwd")String passwd);

    @Select("Select * from user")
    List<User> findUsers();
}