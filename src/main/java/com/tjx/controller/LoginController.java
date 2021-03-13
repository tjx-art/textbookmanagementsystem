package com.tjx.controller;

import com.tjx.entity.User;
import com.tjx.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class LoginController {
    @Autowired
    private UserService userSeriver;

    @RequestMapping(value = "/login",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String login(User user, HttpServletRequest request,String cod){
        String code = request.getSession().getAttribute("code")+"";
        String replace = code.replace(" ", "");
        System.out.println(replace+""+cod);
        if (!cod.equalsIgnoreCase(replace)){
            System.out.println("验证码错误");
            return "<script>alert('验证码错误');" +
                    "location.href='loginone';</script>";
        }
        System.out.println(user);
        List<User> users = userSeriver.userByNameAndPwd(user);
        if (users.isEmpty()){
            System.out.println("账号或密码错误");
            return "<script>alert('账号或密码错误');" +
                    "location.href='loginone'</script>";
        }
        request.getSession().setAttribute("user",users);
        return "<script>location.href='index'</script>";
    }

    @RequestMapping("/index")
    public String index(){
        return "index";
    }

    @RequestMapping("/loginone")
    public String loginone(){
        return "login";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        request.getSession().invalidate();
        return "login";
    }

}
