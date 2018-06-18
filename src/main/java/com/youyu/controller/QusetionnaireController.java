package com.youyu.controller;

import com.youyu.pojo.Questionnaire;
import com.youyu.pojo.User;
import com.youyu.service.QuestionnaireService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class QusetionnaireController {
    @Autowired
    @Qualifier("questionnaireService")
    private QuestionnaireService questionnaireService;

    @RequestMapping(value = "/mypaper")
    public String main(Model model,
                        HttpSession session) {
        User user=(User) session.getAttribute("user");
        Integer id=user.getId();
        System.out.println(id);
        Integer c=questionnaireService.getfuu(id);
        if(c!=0){
        List<Questionnaire> questionnaire_list = questionnaireService.getalli(id);
        model.addAttribute("questionnaire_list", questionnaire_list);
        System.out.println(questionnaire_list.get(0).getDescription());
        session.setAttribute("newFlag",c);
        return "mypaper";}
        else{
            return "mypaper";
        }
    }



    @RequestMapping(value = "/createquestionnaire")
    public ModelAndView create(HttpSession session,
                               String title,String description,
                               ModelAndView mc
                               ) {
        Date now=new Date();
        SimpleDateFormat fomatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String sNow=fomatter.format(now);
        String status="edit";
        User user=(User) session.getAttribute("user");
        Integer id=user.getId();
        Integer brv=0;
        questionnaireService.settoqun(title,description,id,status,sNow,brv);
        mc.setView(new RedirectView("main"));

        return mc;

    }
}

