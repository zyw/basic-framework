package cn.v5cn.basicframework.action;

import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by ZYW on 2014/10/11.
 */
@Controller
public class LoginAction {

    @RequestMapping(value={"/login"})
    public String loginPage(HttpServletRequest request,ModelMap modelMap){
        String exceptionClassName = (String)request.getAttribute("shiroLoginFailure");
        String error = null;
        if(UnknownAccountException.class.getName().equals(exceptionClassName)){
            error = "用户名/密码错误";
        }else if(IncorrectCredentialsException.class.getName().equals(exceptionClassName)){
            error = "用户名/密码错误";
        }else if(exceptionClassName != null){
            error = "其他错误：" + exceptionClassName;
        }
        modelMap.addAttribute("error",error);
        return "login";
    }

    @RequestMapping(value = "/unauthorized")
    public String unauthorized(){
        return "unauthorized";
    }
}
