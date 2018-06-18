package com.youyu.controller;

import com.youyu.pojo.Options;
import com.youyu.pojo.Question;
import com.youyu.pojo.Questionexm;
import com.youyu.pojo.templateX;
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
        int numbering;
        if(request.getParameter("numbering")!="") {
            numbering = Integer.parseInt(request.getParameter("numbering"));
            System.out.println("输入题号不为空");
            if (numbering>quizEditService.getnewNumbering(belongsto)) numbering=quizEditService.getnewNumbering(belongsto);
        }else{
            System.out.println("输入题号为空");
            numbering=quizEditService.getnewNumbering(belongsto);
        }
        System.out.println("插入题号为："+numbering);
        question.setNumbering(numbering);
        question.setType(request.getParameter("qtype"));
        question.setContent(request.getParameter("content"));
        //判断是否为编辑
        if(quizEditService.isEditQ(question)==1){
            System.out.println("编辑操作");
            quizEditService.delQuestionByNumbering(numbering);
            System.out.println("删除要编辑的题目");
        }else{
            System.out.println("添加操作");
            //排序
            quizEditService.order(belongsto,"add",numbering);
            System.out.println("添加前为题目排序");
        }

        int qid = quizEditService.addQuestion(question);
        System.out.println("qid:"+qid+"  belongsto:"+belongsto+"  numbering:"+numbering+" qtype:"+request.getParameter("qtype")+" content:" +request.getParameter("content"));

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
        Questionexm qfororder=quizEditService.getQexmById(delid);
        int numbering=qfororder.getQ().getNumbering();
        quizEditService.delQuestion(delid);
        System.out.println("question:"+request.getParameter("id")+" was deleted");
        //排序
        quizEditService.order(QNid,"del",numbering);
        return quizEditService.getAll(QNid);
    }

    @RequestMapping(value = "/json.gettemplate",produces = { "application/json;charset=UTF-8" })
    @ResponseBody
    public Questionexm gettemplate(HttpServletRequest request){
        String showname=request.getParameter("showname");
        return quizEditService.getQuestionByshowname(showname);
    }

    @RequestMapping(value = "/quizEditForm")
    public String quizEditForm(Model model){
        List<templateX> tlist=quizEditService.getAlltemplate();
        List<Questionexm> qlist=quizEditService.getAll(1);
        model.addAttribute("templatelist",tlist);
        model.addAttribute("questionlist",qlist);
        return "quizEditForm";
    }

    @RequestMapping(value = "/preview")
    public String previewForm(Model model){
        List<Questionexm> qlist=quizEditService.getAll(1);
        model.addAttribute("questionlist",qlist);
        model.addAttribute("hehe","baobao");
        return "preview";
    }

}
