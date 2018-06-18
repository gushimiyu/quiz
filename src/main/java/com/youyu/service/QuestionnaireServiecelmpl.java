package com.youyu.service;

import com.youyu.dao.QuestionnaireMapper;
import com.youyu.pojo.Question;
import com.youyu.pojo.Questionnaire;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.w3c.dom.ls.LSException;

import java.util.Date;
import java.util.List;

@Service("questionnaireService")
public class QuestionnaireServiecelmpl implements QuestionnaireService {
    @Autowired
    private QuestionnaireMapper questionnaireMapper;

    @Override
    public List<Questionnaire> getAll() {
        return questionnaireMapper.findAll();
    }

    @Override
    public Questionnaire getid(Integer id) {
        return questionnaireMapper.findWithid(id);
    }
    @Override
    public Questionnaire getallid(Integer ownner) {
        return questionnaireMapper.findallWithid(ownner);
    }

    @Override
    public List<Questionnaire> getalli(Integer ownner) {
        return questionnaireMapper.findallWithi(ownner);
    }
    @Override
    public Integer getfuu(Integer ownner){
        return questionnaireMapper.finduu(ownner);
    }

    @Override
    public void setbrow(Integer brv, Integer id) {
        questionnaireMapper.findbrowWithid(brv, id);
    }

    @Override
    public  void settoqun(String title,String description,Integer owner,String status,String cretime,Integer brv) {
        questionnaireMapper.insertintoqun(title, description, owner, status, cretime, brv);
    }

}