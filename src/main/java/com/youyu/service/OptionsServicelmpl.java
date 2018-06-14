package com.youyu.service;

import com.youyu.dao.OptionsMapper;
import com.youyu.pojo.Options;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.swing.text.html.Option;
import java.util.List;

@Service("optionsService")
public class OptionsServicelmpl implements  OptionsService {
    @Autowired
    private OptionsMapper optionsMapper;

    @Override
    public List<Options> getAllO(Integer belongsto) {
        return optionsMapper.findAllO(belongsto);
    }
    @Override
    public Integer getNum(Integer id){
        return optionsMapper.findNum(id);
    }
}