package com.youyu.service;

import com.youyu.dao.QuestionnaireMapper;
import com.youyu.pojo.Question;
import com.youyu.pojo.Questionnaire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("questionnaireService")
public class QuestionnaireServiecelmpl implements QuestionnaireService{
    @Autowired
    private QuestionnaireMapper questionnaireMapper;
    @Override
    public List<Questionnaire> getAll(){
        return questionnaireMapper.findAll();
    }
    @Override
    public Questionnaire getid(Integer id){
        return questionnaireMapper.findWithid(id);
    }
    @Override
    public  void  setbrow(Integer brv,Integer id){
        questionnaireMapper.findbrowWithid(brv, id);
    }
}
