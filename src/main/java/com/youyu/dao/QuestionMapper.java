package com.youyu.dao;

import com.youyu.pojo.Question;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface QuestionMapper {
    @Select("select * from question where belongsto=#{belongsto}")
    List<Question> findAllQ(@Param("belongsto")Integer belongsto);
}