package cn.v5cn.basicframework.action;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.impl.DefaultKaptcha;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;

/**
 * Created by ZYW on 2014/10/11.
 */
@Controller
public class LoginAction {

    @Autowired
    private DefaultKaptcha captchaProducer;

    @RequestMapping(value={"/login"})
    public String loginPage(HttpServletRequest request,ModelMap modelMap){
        String exceptionClassName = (String)request.getAttribute("shiroLoginFailure");
        String error = null;
        if(UnknownAccountException.class.getName().equals(exceptionClassName)){
            error = "用户名/密码错误";
        }else if(IncorrectCredentialsException.class.getName().equals(exceptionClassName)){
            error = "用户名/密码错误";
        }else if("jCaptcha.error".equals(exceptionClassName)){
            error = "验证码输入错误";
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

    @RequestMapping(value="/captcha",method = RequestMethod.GET)
    public void captcha(HttpServletRequest request,HttpServletResponse response) throws Exception{
        response.setDateHeader("Expires", 0);
        response.setHeader("Cache-Control",
                "no-store, no-cache, must-revalidate");
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        response.setHeader("Pragma", "no-cache");
        response.setContentType("image/jpeg");
        String capText = captchaProducer.createText();
        request.getSession().setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);
        BufferedImage bi = captchaProducer.createImage(capText);
        ServletOutputStream out = response.getOutputStream();
        ImageIO.write(bi, "jpg", out);
        try {
            out.flush();
        } finally {
            out.close();
        }
    }
}
