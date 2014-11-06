package cn.v5cn.basicframework.interceptor;

import cn.v5cn.basicframework.entity.SystemRes;
import cn.v5cn.basicframework.service.SystemUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by ZYW on 2014/10/30.
 *
 * 也可以实现检测用户是否登录
 * 但在在这里推荐使用Apache Shiro的PathMatchingFilter过滤器
 *
 */
public class MenuInterceptor implements HandlerInterceptor {

    @Autowired
    private SystemUserService systemUserService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse httpServletResponse, Object o) throws Exception {
        String uri = request.getRequestURI();
        if(StringUtils.contains(uri,"/login")){
            return true;
        }
        HttpSession session = request.getSession();
        Object menus = session.getAttribute("menus");
        if(menus == null) {
            List<SystemRes> systemReses = systemUserService.findMenuByUserName();
            session.setAttribute("menus",systemReses);
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
