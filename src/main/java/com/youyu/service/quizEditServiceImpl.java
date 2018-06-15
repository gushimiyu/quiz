package com.youyu.service;

import com.youyu.dao.OptionsMapper;
import com.youyu.dao.QuestionMapper;
import com.youyu.pojo.Options;
import com.youyu.pojo.Question;
import com.youyu.pojo.Questionexm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.util.ArrayList;
import java.util.List;

@Service("quizEditService")
public class quizEditServiceImpl implements quizEditService{
    @Autowired
    private QuestionMapper questionMapper;
    @Autowired
    private OptionsMapper optionsMapper;

    @Override
    //添加问题
    public int addQuestion(Question question){
        questionMapper.addQuestion(question);
        return  question.getId();
    }

    @Override
    //添加选项
    public int addOption(Options options){
        System.out.println("222");
        optionsMapper.addOption(options);
        System.out.println("333");
        return options.getId();
    }

    @Override
    //删除问题 1问题id 错误返回0
    public void delQuestion(int id){
        optionsMapper.delOptions(id);
        questionMapper.delQuestion(id);
    }

    //形成一份问卷的qexm
    @Override
    public List<Questionexm> getAll(int QNid) {
        List<Questionexm> relist= new ArrayList<Questionexm>();
        List<Question> qlist=questionMapper.getQuestionsFromQNid(QNid);
        for(int i=0;i<qlist.size();i++){
            int qid=qlist.get(i).getId();
            List<Options> olist=optionsMapper.getOptions(qid);
            Questionexm qtemp=new Questionexm();
            qtemp.setQ(qlist.get(i));
            qtemp.setO(olist);
            relist.add(qtemp);
        }
        return relist;
    }

    //通过id生成一道qexm
    @Override
    public Questionexm getQexmById(int qid) {
        Questionexm reQexm=new Questionexm();
        reQexm.setQ(questionMapper.getQuestionFromQid(qid));
        reQexm.setO(optionsMapper.getOptions(qid));
        return reQexm;
    }

    @Override
    public int getQuestionnaireById(int id) {
        return questionMapper.getQNidByqid(id);
    }
}
