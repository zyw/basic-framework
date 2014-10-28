package cn.v5cn.basicframework.action;

import cn.v5cn.basicframework.service.SystemUserService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Set;

/**
 * Created by ZYW on 2014/10/11.
 */
@Controller
public class IndexAction {

    @Autowired
    private SystemUserService systemUserService;

    @RequestMapping(value = {"/","/index"},method = RequestMethod.GET)
    public String index(){
        String userName = (String)SecurityUtils.getSubject().getPrincipal();
        Set<String> permissions = systemUserService.findPermissions(userName);
        return "index";
    }
}

