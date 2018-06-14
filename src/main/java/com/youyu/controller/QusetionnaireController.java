package com.youyu.controller;

import com.youyu.pojo.Questionnaire;
import com.youyu.service.QuestionnaireService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class QusetionnaireController {
    @Autowired
    @Qualifier("questionnaireService")
    private QuestionnaireService questionnaireService;
    @RequestMapping(value="/questionnairelist")
    public String main(Model model){
        List<Questionnaire> questionnaire_list = questionnaireService.getAll();
        model.addAttribute("questionnaire_list",questionnaire_list);

        System.out.println(questionnaire_list.get(0).getDescription());
        return "questionnairelist";
    }
}
