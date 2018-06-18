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
    @Select("SELECT * FROM question WHERE belongsto = #{QNid} ORDER BY numbering ASC")
    List<Question> getQuestionsFromQNid(int QNid);

    //查找id找到题目
    @Select("SELECT * FROM question WHERE id = #{Qid}")
    Question getQuestionFromQid(int Qid);

    //通过id找到问卷id
    @Select("SELECT belongsto FROM question WHERE id = #{Qid}")
    int getQNidByqid(int Qid);

    //计算问卷中的题目数量
    @Select("SELECT COUNT(*) FROM question WHERE belongsto = #{QNid}")
    int getqnum(int QNid);

    //判断是否为编辑
    @Select("SELECT * FROM question WHERE numbering = #{num} AND content = #{con}")
    Question isEdit(@Param("num") int num,@Param("con") String con);

    //通过numbering找到题目id
    @Select("SELECT id FROM question WHERE numbering = #{num}")
    int findidbyNumbering(int num);

    //将题目i的numbering替换
    @Select("UPDATE question SET numbering = #{nnum} WHERE belongsto = #{QNid} AND numbering = #{onum}")
    void changenum(@Param("QNid")int QNid,@Param("onum")int onum,@Param("nnum")int nnum);
}