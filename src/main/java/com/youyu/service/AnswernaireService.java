package com.youyu.service;

import com.youyu.pojo.Answer;
import com.youyu.pojo.Answernaire;

import java.util.List;

public interface AnswernaireService {
    Integer getALLA(Integer belongsto);
    List<Answer> getAns(Integer answerto );
    Integer getNumbe(Integer belongsto);
}
