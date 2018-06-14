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


}