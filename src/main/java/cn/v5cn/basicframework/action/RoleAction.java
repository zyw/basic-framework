package cn.v5cn.basicframework.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by ZYW on 2014/10/16.
 */
@Controller
@RequestMapping("/role")
public class RoleAction {

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String roleList(){
        return "system/role_list";
    }

    @RequestMapping(value = "/edit",method = RequestMethod.GET)
    public String roleEdit(){
        return "system/role_edit";
    }
}
