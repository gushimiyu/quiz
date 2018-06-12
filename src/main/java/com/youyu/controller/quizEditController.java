package com.youyu.controller;

import com.youyu.pojo.Options;
import com.youyu.pojo.Question;
import com.youyu.pojo.Questionexm;
import com.youyu.service.quizEditService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class quizEditController {
    @Autowired
    @Qualifier("quizEditService")
    private quizEditService quizEditService;

    @RequestMapping(value = "/json.addq",  produces = { "application/json;charset=UTF-8" })
    @ResponseBody
    public Questionexm AddQuestion(HttpServletRequest request){

        //创建问题
        Question question=new Question();
        int belongsto=Integer.parseInt(request.getParameter("belongsto"));
        question.setBelongsto(belongsto);
        int numbering=Integer.parseInt(request.getParameter("numbering"));
        question.setNumbering(numbering);
        question.setType(request.getParameter("qtype"));
        question.setContent(request.getParameter("content"));
        int qid = quizEditService.addQuestion(question);

        //如果问题有选项 则添加选项
        if(question.getType().equals("radio")||question.getType().equals("checkbox")) {
            int optnum = Integer.parseInt(request.getParameter("optnum"));
            for (int i = 0; i < optnum; i++) {
                Options tempopt=new Options();
                tempopt.setContent(request.getParameter("option"+i));
                tempopt.setBelongsto(qid);
                quizEditService.addOption(tempopt);
            }
        }
        return quizEditService.getQexmById(qid);
    }

    @RequestMapping(value = "/json.delq",produces = { "application/json;charset=UTF-8" })
    @ResponseBody
    public void DelQusetion(HttpServletRequest request){
        String sdelid=request.getParameter("id");
        int delid=Integer.parseInt(sdelid);
        quizEditService.delQuestion(delid);
    }

    @RequestMapping(value = "/quizEditForm")
    public String quizEditForm(Model model){
        List<Questionexm> qlist=quizEditService.getAll(1);
        model.addAttribute("questionlist",qlist);
        model.addAttribute("hehe","baobao");
        return "quizEditForm";
    }

}
