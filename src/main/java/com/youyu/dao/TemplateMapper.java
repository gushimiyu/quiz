package com.youyu.dao;

import com.youyu.pojo.Template;
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

public interface TemplateMapper {
    //搜索所有的题目种类
    @Select("SELECT DISTINCT qtype FROM template ")
    List<String> getAllType();

    //通过种类找到所有模板题目
    @Select("SELECT * FROM template WHERE qtype = #{type}")
    List<Template> getTbyType(String type);

    //通过showname找到题目
    @Select("SELECT * FROM template WHERE showname = #{showname}")
    Template getTbyshowname(String showname);

}