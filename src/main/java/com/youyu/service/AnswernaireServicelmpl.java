package com.youyu.service;

import com.youyu.dao.AnswernaireMapper;
import com.youyu.pojo.Answer;
import com.youyu.pojo.Answernaire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import java.util.List;

@Service("answernaireService")
public class AnswernaireServicelmpl implements AnswernaireService{
    @Autowired
    private AnswernaireMapper answernaireMapper;


    @Override
    public Integer getALLA(Integer belongsto) {
        return  answernaireMapper.findALLA(belongsto);
    }

    @Override
    public List<Answer> getAns(Integer answerto) {
        return answernaireMapper.findAns(answerto);
    }
    @Override
    public Integer getNumbe(Integer belongsto){
        return answernaireMapper.findNumbe(belongsto);
    }
}

