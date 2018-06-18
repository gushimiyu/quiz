package com.youyu.service;

import com.youyu.pojo.*;

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

    //通过题目id返回它所属的问卷
    int getQuestionnaireById(int id);

    //返回模板列表
    List<templateX> getAlltemplate();

    //通过模板显示名返回题目
    Questionexm getQuestionByshowname(String showname);

    //找到下一道应该生成的题号
    int getnewNumbering(int QNid);

    //判断是否为编辑
    int isEditQ(Question q);

    //通过编号删除题目
    void delQuestionByNumbering(int numbering);

    //为QNid号问卷排序
    void order(int QNid,String way,int numbering);
}
