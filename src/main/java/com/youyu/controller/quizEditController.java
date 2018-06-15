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
    public List<Questionexm> AddQuestion(HttpServletRequest request){

        //创建问题
        Question question=new Question();
        int belongsto=Integer.parseInt(request.getParameter("belongsto"));
        question.setBelongsto(belongsto);
        int numbering=0;
        if(request.getParameter("numbering")!=null) {
            numbering = Integer.parseInt(request.getParameter("numbering"));
            question.setNumbering(numbering);
        }else{
            numbering =0;
            //xuhaoweikong
        }
        question.setType(request.getParameter("qtype"));
        question.setContent(request.getParameter("content"));
        int qid = quizEditService.addQuestion(question);
        System.out.println("qid:"+qid+"  belongsto:"+belongsto+"  numbering:"+numbering+" qtype:"+request.getParameter("qtype")+" content:" +request.getParameter("content"));

        //排序

        //如果问题有选项 则添加选项
        if(question.getType().equals("radio")||question.getType().equals("checkbox")) {
            int optnum = Integer.parseInt(request.getParameter("optnum"));
            System.out.println(optnum);
            for (int i = 0; i < optnum; i++) {
                Options tempopt=new Options();
                tempopt.setContent(request.getParameter("option"+i));
                tempopt.setBelongsto(qid);
                System.out.println("add option"+i+":  "+request.getParameter("option"+i));
                quizEditService.addOption(tempopt);
                System.out.println("111");
            }
        }
        return quizEditService.getAll(belongsto);
    }

    @RequestMapping(value = "/json.delq",produces = { "application/json;charset=UTF-8" })
    @ResponseBody
    public List<Questionexm> DelQusetion(HttpServletRequest request){
        System.out.println("want to del question:"+request.getParameter("id"));
        int delid=Integer.parseInt(request.getParameter("id"));
        int QNid=Integer.parseInt(request.getParameter("belongsto"));
        quizEditService.delQuestion(delid);
        System.out.println("question:"+request.getParameter("id")+" was deleted");
        //排序
        return quizEditService.getAll(QNid);
    }

    @RequestMapping(value = "/quizEditForm")
    public String quizEditForm(Model model){
        List<Questionexm> qlist=quizEditService.getAll(1);
        model.addAttribute("questionlist",qlist);
        model.addAttribute("hehe","baobao");
        return "quizEditForm";
    }

}
