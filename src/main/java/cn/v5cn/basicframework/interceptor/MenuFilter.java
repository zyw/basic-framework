package cn.v5cn.basicframework.interceptor;

import cn.v5cn.basicframework.entity.SystemRes;
import cn.v5cn.basicframework.service.SystemResService;
import cn.v5cn.basicframework.service.SystemUserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.web.filter.PathMatchingFilter;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Set;

/**
 * Created by ZYW on 2014/10/30.
 */
public class MenuFilter extends PathMatchingFilter {
    @Autowired
    private SystemUserService systemUserService;

    @Autowired
    private SystemResService systemResService;

    @Override
    protected boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
        HttpSession session = ((HttpServletRequest)request).getSession();
        Object menus = session.getAttribute("menus");
        if(menus == null) {
            String userName = (String) SecurityUtils.getSubject().getPrincipal();
            Set<String> permissions = systemUserService.findPermissions(userName);
            if(permissions == null || permissions.size() < 1){
                SecurityUtils.getSubject().logout();
                throw new UnauthorizedException();
            }
            List<SystemRes> systemReses = systemResService.findByPermissionsAndType(permissions, 1);
            session.setAttribute("menus",systemReses);
        }
        return super.onPreHandle(request, response, mappedValue);
    }
}
