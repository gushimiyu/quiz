package com.youyu.dao;

import com.youyu.pojo.Answer;
import com.youyu.pojo.Answernaire;
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

public interface AnswernaireMapper {
    @Select("select belongsto from answernaire where belongsto=#{belongsto}")
    Integer findALLA(@Param("belongsto")Integer belongsto);

    @Select("select * from answer where  answerto=#{answerto}")
    List <Answer>findAns(@Param("answerto") Integer answerto );

    @Select("select count(1) from answernaire where  belongsto=#{belongsto}")
    Integer findNumbe(@Param("belongsto") Integer belongsto );
}