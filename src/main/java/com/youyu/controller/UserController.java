package com.youyu.controller;

import com.youyu.pojo.User;
import com.youyu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    @Autowired
    @Qualifier("userService")
    private UserService userService;

    @RequestMapping(value = "/login")
    public ModelAndView login(
            String acc,String passwd,
            ModelAndView mv1,
            HttpSession session){
        User user=userService.login(acc,passwd);
        if(user!=null){
            session.setAttribute("user",user);
            session.setAttribute("user2",user);
            mv1.setView(new RedirectView("loginform2"));
        }else {
            mv1.addObject("message1","用户名或者密码错误");
            mv1.setViewName("loginform2");
        }
        return mv1;
    }

    @RequestMapping(value = "/register")
    public ModelAndView register(
            String acc,String passwd,
            ModelAndView mv2,
            HttpSession session){
        User user2=userService.findaaaaa(acc);
        if (user2!=null){
            mv2.addObject("message1","账户已经存在");
            mv2.setViewName("loginform2");
        }
        else {
            userService.insertaa(acc,passwd);
            User user3=userService.login(acc,passwd);
            session.setAttribute("user",user3);
            session.setAttribute("user2",user3);
            mv2.setView(new RedirectView("loginform2"));
        }
        return mv2;
    }

    @RequestMapping(value = "/logout")
    public ModelAndView logout( HttpSession session,
    ModelAndView mv3){
        session.setAttribute("user",null);
        session.setAttribute("user2",null);
        session.setAttribute("newFlag",null);
        mv3.setView(new RedirectView("loginform2"));

        return mv3;
    }
}
