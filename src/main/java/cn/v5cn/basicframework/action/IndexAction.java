package cn.v5cn.basicframework.action;

import cn.v5cn.basicframework.entity.SystemRes;
import cn.v5cn.basicframework.service.SystemResService;
import cn.v5cn.basicframework.service.SystemUserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Set;

/**
 * Created by ZYW on 2014/10/11.
 */
@Controller
public class IndexAction {

    @Autowired
    private SystemUserService systemUserService;

    @Autowired
    private SystemResService systemResService;

    @RequestMapping(value = {"/","/index"},method = RequestMethod.GET)
    public String index(HttpSession session){
        String userName = (String)SecurityUtils.getSubject().getPrincipal();
        Set<String> permissions = systemUserService.findPermissions(userName);
        if(permissions == null || permissions.size() < 1){
            SecurityUtils.getSubject().logout();
            throw new UnauthorizedException();
        }
        List<SystemRes> systemReses = systemResService.findByPermissionsAndType(permissions, 1);
        session.setAttribute("menus",systemReses);
        return "index";
    }
}

