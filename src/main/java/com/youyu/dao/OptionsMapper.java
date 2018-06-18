package com.youyu.dao;

import com.youyu.pojo.Answernaire;
import com.youyu.pojo.Options;
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

public interface OptionsMapper {

    @Select("select * from options where belongsto=#{belongsto}")
    List<Options> findAllO(@Param("belongsto")Integer belongsto);

    @Select("select count(1) from answer where  optionto=#{optionto}")
    Integer findNum(@Param("optionto") Integer optionto );


    //添加选项
    @Insert("INSERT INTO options(content,belongsto,nextquestion) VALUES (#{content},#{belongsto},0)")
    @org.apache.ibatis.annotations.Options(useGeneratedKeys = true,keyProperty = "id")
    void addOption(Options opt);


    //删除id题的所有选项
    @Delete("DELETE FROM options WHERE belongsto = #{Qid}")
    void delOptions(int Qid);

    //找到id题的所有选型
    @Select("SELECT * FROM options WHERE belongsto = #{Qid}")
    List<Options> getOptions(int Qid);
}