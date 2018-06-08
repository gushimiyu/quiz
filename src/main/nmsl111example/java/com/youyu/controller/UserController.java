package com.youyu.controller;

import com.youyu.pojo.User;
import com.youyu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.util.HttpSessionMutexListener;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

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

    @RequestMapping(value = "/ajax.action", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String method1(HttpServletRequest request) {
        // 获得key为username的value
        String username = request.getParameter("acc");

        // 处理获得的参数
        System.out.println(username);
        String reslut = "登录成功:" + username;

        // 返回结果
        return reslut;
    }

    @RequestMapping(value = "/ajaxList.action",  produces = { "application/json;charset=UTF-8" })
    @ResponseBody
    public List<User> returnList(HttpServletRequest request) {
        System.out.println("从前台获取的参数：" + request.getParameter("acc"));

        List<User> users =userService.findAll();
        return users;
    }
}
