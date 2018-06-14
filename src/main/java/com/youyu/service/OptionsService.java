package com.youyu.service;

import com.youyu.pojo.Options;

import java.util.List;

public interface OptionsService {
    List<Options> getAllO(Integer belongsto);
    Integer getNum(Integer id);
}
