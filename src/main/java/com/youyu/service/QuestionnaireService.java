package com.youyu.service;

import com.youyu.pojo.Questionnaire;

import javax.swing.*;
import java.util.Date;
import java.util.List;

public interface QuestionnaireService{

    List<Questionnaire> getAll();

    Questionnaire getid(Integer id);

    Questionnaire getallid(Integer ownner);

    List<Questionnaire> getalli(Integer ownner);

    void setbrow(Integer brv,Integer id);
    Integer getfuu(Integer id);

    void settoqun(String title, String description, Integer owner, String status, String cretime, Integer brv);
}
