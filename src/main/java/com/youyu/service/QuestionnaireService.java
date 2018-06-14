package com.youyu.service;

import com.youyu.pojo.Questionnaire;

import javax.swing.*;
import java.util.List;

public interface QuestionnaireService{

    List<Questionnaire> getAll();

    Questionnaire getid(Integer id);

    void setbrow(Integer brv,Integer id);
}
