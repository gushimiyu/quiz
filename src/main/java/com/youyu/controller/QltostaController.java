package com.youyu.controller;

import com.youyu.pojo.*;
import com.youyu.service.AnswernaireService;
import com.youyu.service.OptionsService;
import com.youyu.service.QuestionService;
import com.youyu.service.QuestionnaireService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class QltostaController {
    @Autowired
    @Qualifier("questionnaireService")
    private QuestionnaireService questionnaireService;
    @Autowired
    @Qualifier("questionService")
    private QuestionService questionService;
    @Autowired
    @Qualifier("optionsService")
    private OptionsService optionsService;
    @Autowired
    @Qualifier("answernaireService")
    private AnswernaireService answernaireService;
    @RequestMapping("/count") //定义方法名
    public ModelAndView sta(
            ModelAndView retMap,
            Model model,
            HttpSession session,
            Integer id
    ){
        Questionnaire questionnaire=questionnaireService.getid(id);
        int a =questionnaire.getBrv();
        System.out.println(a);
        a=a+1;
        Integer num=answernaireService.getNumbe(id);
        if (num==0){session.setAttribute("num",'0');}
        else{session.setAttribute("num",num);}
        questionnaireService.setbrow(a,questionnaire.getId());
        Integer s=questionnaire.getId();
        System.out.println(s);

        session.setAttribute("questionnaire",questionnaire.getId());
        List<Question> question_list = questionService.getAllQ(s);
        List<QuestionforT> a_list=new ArrayList<>();
        List<AnswernaireforT> b_list=new ArrayList<>();
        System.out.println(question_list.size());
        for(int i=0;i<question_list.size();i++)
        {   System.out.println(question_list.get(i).getType());
            if(question_list.get(i).getType().equals("radio")||question_list.get(i).getType().equals("checkbox")){
            QuestionforT teee=new QuestionforT();
            List<Options> options_list=optionsService.getAllO(question_list.get(i).getId());
            teee.setQ(question_list.get(i));

            List<OptforT> ts=new ArrayList<>();
            Integer x=0;
            for(int k=0;k<options_list.size();k++){
                x+=optionsService.getNum(options_list.get(k).getId());
            }
            if(x==0) {
                for (int j = 0; j < options_list.size(); j++) {
                    OptforT tempoft = new OptforT();
                    tempoft.setN(optionsService.getNum(options_list.get(j).getId()));
                    tempoft.setOpt(options_list.get(j));
                    tempoft.setX(0);
                    System.out.println(optionsService.getNum(options_list.get(j).getId()));
                    ts.add(tempoft);
                }
            }
            else{

                for (int j = 0; j < options_list.size(); j++) {
                    OptforT tempoft = new OptforT();
                    tempoft.setN(optionsService.getNum(options_list.get(j).getId()));
                    tempoft.setOpt(options_list.get(j));
                    tempoft.setX(optionsService.getNum(options_list.get(j).getId())/x);
                    System.out.println(optionsService.getNum(options_list.get(j).getId()));
                    ts.add(tempoft);
                }
            }


            teee.setOption(ts);
            a_list.add(teee);
            System.out.println("nimasile");


        }
        else {
            AnswernaireforT tbbb=new AnswernaireforT();
            tbbb.setFile(question_list.get(i));
            List<AnswerforT> tc=new ArrayList<>();
            List <Answer> answers_list= answernaireService.getAns(question_list.get(i).getId());
            System.out.println(11111);
            System.out.println(answers_list.size());
            for(int c=0;c<answers_list.size();c++){
                AnswerforT tempoo=new AnswerforT();
                tempoo.setI(answers_list.get(c));
                System.out.println(answers_list.get(c).getBelongsto());
                tempoo.setJ(answers_list.get(c).getBelongsto());
                System.out.println(222222);
                tc.add(tempoo);
            }
            tbbb.setBibli(tc);
            b_list.add(tbbb);
        }
        }
        model.addAttribute("a_list",a_list);
        model.addAttribute("b_list",b_list);
        System.out.println(id);
        System.out.println(question_list.size());
        System.out.println("cao");
        retMap.setViewName("count");
        return retMap;
    }
}
