package com.youyu.service;

import com.youyu.dao.QuestionMapper;
import com.youyu.pojo.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("questionService")
public class QuestionServicelmpl implements  QuestionService {
    @Autowired
    private QuestionMapper questionMapper;

    @Override
    public List<Question> getAllQ(Integer belongsto) {
        return questionMapper.findAllQ(belongsto);
    }

}



