package com.youyu.dao;

import com.youyu.pojo.Templateopt;
import java.util.List;

import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;

public interface TemplateoptMapper {
    //通过模板id找到模板题的选项
    @Select("SELECT * FROM templateopt WHERE belongsto = #{Tid}")
    List<Templateopt> gettoptsByTid(int Tid);
}