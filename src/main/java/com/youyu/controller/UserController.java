package com.youyu.controller;

import com.youyu.pojo.User;
import com.youyu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.util.HttpSessionMutexListener;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    @Autowired
    @Qualifier("userService")
    private UserService userService;
    @RequestMapping(value = "/login")
    public ModelAndView login(
            String acc,String passwd,
            ModelAndView mv,
            HttpSession session){
        User user=userService.login(acc,passwd);
        if(user!=null){
            session.setAttribute("user",user);
            mv.setView(new RedirectView("main"));
        }else {
            mv.addObject("message","error");
            mv.setViewName("loginForm");
        }
        return mv;
    }

}
