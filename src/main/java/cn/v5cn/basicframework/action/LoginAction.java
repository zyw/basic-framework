package cn.v5cn.basicframework.action;

import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by ZYW on 2014/10/11.
 */
@Controller
public class LoginAction {

    @RequestMapping(value={"/login"},method = RequestMethod.GET)
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

    @RequestMapping(value = {"/login"},method = RequestMethod.POST)
    public String loginPost(){
        return "redirect:/index";
    }
}
