package cn.v5cn.basicframework.action;

import cn.v5cn.basicframework.service.SystemResService;
import cn.v5cn.basicframework.service.SystemUserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

/**
 * Created by ZYW on 2014/10/11.
 */
@Controller
public class IndexAction {

    @Autowired
    private SystemUserService systemUserService;

    @Autowired
    private SystemResService systemResService;

    @RequiresPermissions("index:view")
    @RequestMapping(value = {"/","/index"},method = RequestMethod.GET)
    public String index(HttpSession session){
        return "index";
    }
}

