package com.youyu.service;

import com.youyu.dao.OptionsMapper;
import com.youyu.dao.QuestionMapper;
import com.youyu.dao.TemplateMapper;
import com.youyu.dao.TemplateoptMapper;
import com.youyu.pojo.*;
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
    @Autowired
    private TemplateMapper templateMapper;

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

    @Override
    public List<templateX> getAlltemplate() {
        List<templateX> tlist=new ArrayList<>();
        List<String> typelist=templateMapper.getAllType();
        for(int i=0;i<typelist.size();i++){
            List<Template> t=templateMapper.getTbyType(typelist.get(i));
            templateX tx=new templateX();
            tx.setType(typelist.get(i));
            tx.setTemplates(t);
            tlist.add(tx);
        }
        return tlist;
    }

    @Autowired
    TemplateoptMapper templateoptMapper;

    @Override
    public Questionexm getQuestionByshowname(String showname) {
        Template t=templateMapper.getTbyshowname(showname);
        Question q=new Question();
        q.setType(t.getTypee());
        q.setContent(t.getContent());
        List<Templateopt> topts=templateoptMapper.gettoptsByTid(t.getId());
        List<Options> o=new ArrayList<>();
        for(int i=0;i<topts.size();i++){
            Options oi=new Options();
            oi.setContent(topts.get(i).getContent());
            o.add(oi);
        }
        Questionexm qexm=new Questionexm();
        qexm.setO(o);
        qexm.setQ(q);
        return qexm;
    }

    @Override
    public int getnewNumbering(int QNid) {
        return questionMapper.getqnum(QNid)+1;
    }

    @Override
    public int isEditQ(Question q) {
        System.out.println(q.getNumbering()+"   "+q.getContent());
        if(questionMapper.isEdit(q.getNumbering(),q.getContent())!=null){
            System.out.println("yeah");
            return 1;
        }
        else{
            System.out.println("nope");
            return 0;
        }
    }

    @Override
    public void delQuestionByNumbering(int numbering) {
        int id=questionMapper.findidbyNumbering(numbering);
        optionsMapper.delOptions(id);
        questionMapper.delQuestion(id);
    }

    @Override
    public void order(int QNid, String way, int numbering) {
        int qnum=questionMapper.getqnum(QNid);
        if (way.equals("add")){
            for(int i=qnum;i>=numbering;i--){
                questionMapper.changenum(QNid,i,i+1);
            }
        }else{
            for(int i=numbering+1;i<=qnum+1;i++){
                questionMapper.changenum(QNid,i,i-1);
            }
        }
    }
}
