package com.youyu.controller;

import com.youyu.pojo.Question;
import com.youyu.pojo.Questionnaire;
import com.youyu.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@SessionAttributes("questionnaire")
public class QuestionController {
    @Autowired
    @Qualifier("questionService")
    private  QuestionService questionService;
    @RequestMapping(value="/st")
    public String main(Integer id,Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response){
        session.getAttribute("questionnaire");
        List<Question> question_list = questionService.getAllQ(id);
        model.addAttribute("question_list",question_list);


        return "sta";
    }
}
