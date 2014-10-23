package cn.v5cn.basicframework.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by ZYW on 2014/10/23.
 */
@Controller
@RequestMapping("/user")
public class UserAction {
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String userList(){
        return "system/user_list";
    }
}
