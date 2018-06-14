package com.youyu.dao;

import com.youyu.pojo.Question;
import com.youyu.pojo.Questionnaire;
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

    @Update("update questionnaire Set brv=#{brv} where id=#{id}")
     void findbrowWithid(@Param("brv")Integer brv, @Param("id")Integer id);


}