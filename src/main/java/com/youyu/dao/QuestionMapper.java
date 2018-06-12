package com.youyu.dao;

import com.youyu.pojo.Question;
import java.util.List;

import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;

public interface QuestionMapper {
    //添加问题
    @Insert("INSERT INTO question(belongsto,type,numbering,content) VALUES (#{belongsto},#{type},#{numbering},#{content})")
    @Options(useGeneratedKeys = true,keyProperty = "id")
    int addQuestion(Question question);

    //删除题目
    @Delete("DELETE FROM question WHERE id = #{Qid}")
    void delQuestion(int Qid);

    //通过问卷id找到其包含的所有题目
    @Select("SELECT * FROM question WHERE belongsto = #{QNid}")
    List<Question> getQuestionsFromQNid(int QNid);

    //查找id找到题目
    @Select("SELECT * FROM question WHERE id = #{Qid}")
    Question getQuestionFromQid(int Qid);
}