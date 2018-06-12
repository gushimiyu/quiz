package com.youyu.service;

import com.youyu.pojo.Options;
import com.youyu.pojo.Question;
import com.youyu.pojo.Questionexm;

import java.util.List;

public interface quizEditService {
    //添加问题
    int addQuestion(Question question);

    //添加选项
    int addOption(Options options);

    //删除问题
    void delQuestion(int id);

    //返回问卷id的所有问题与选项
    List<Questionexm> getAll(int QNid);

    //返回问题id为Qid的问题与选项
    Questionexm getQexmById(int qid);
}
