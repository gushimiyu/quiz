package com.youyu.service;

import com.youyu.pojo.Question;

import java.util.List;

public interface QuestionService {
    List<Question> getAllQ(Integer belongsto);

}
