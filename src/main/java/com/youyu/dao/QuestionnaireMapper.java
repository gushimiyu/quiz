package com.youyu.dao;

import com.youyu.pojo.Question;
import com.youyu.pojo.Questionnaire;

import java.util.Date;
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

public interface QuestionnaireMapper {
    @Select("SELECT * FROM QUESTIONNAIRE")
    List<Questionnaire> findAll();


    @Select("Select * from questionnaire where id=#{id}")
    Questionnaire findWithid(@Param("id")Integer id);

    @Select("Select * from questionnaire where ownner=#{ownner}")
    Questionnaire findallWithid(@Param("ownner")Integer ownner);

    @Select("Select * from questionnaire where ownner=#{ownner}")
    List<Questionnaire> findallWithi(@Param("ownner")Integer ownner);


    @Update("update questionnaire Set brv=#{brv} where id=#{id}")
     void findbrowWithid(@Param("brv")Integer brv, @Param("id")Integer id);

    @Select("select count(1) from questionnaire where  ownner=#{ownner}")
    Integer finduu(@Param("ownner") Integer ownner );

    @Update("insert into questionnaire(title,description,ownner,status,cretime,brv) value(#{title},#{description},#{owner},#{status},#{cretime},#{brv})")
    void insertintoqun(@Param("title")String title, @Param("description")String description, @Param("owner")Integer owner, @Param("status")String status, @Param("cretime")String cretime,@Param("brv")Integer brv);

}