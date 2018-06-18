package com.youyu.dao;

import com.youyu.pojo.User;
import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.DeleteProvider;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.type.JdbcType;

public interface UserMapper {
    @Select("Select * from user where acc=#{acc} and passwd=#{passwd}")
    User findWithLoginnameAndPassword(@Param("acc")String acc,@Param("passwd")String passwd);

    @Select("Select * from user where acc=#{acc} ")
    User findWithLoginname(@Param("acc")String acc);

    @Select("Select * from user")
    List<User> findUsers();

    @Update("insert into user(acc,passwd) value(#{acc},#{passwd})")
    void insertUser(@Param("acc")String acc, @Param("passwd")String passwd);
}