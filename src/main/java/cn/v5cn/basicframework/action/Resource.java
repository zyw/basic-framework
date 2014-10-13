package cn.v5cn.basicframework.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by ZYW on 2014/10/13.
 */
@Controller
@RequestMapping("/res")
public class Resource {

    @RequestMapping(value="/list",method = RequestMethod.GET)
    public String resList(){
        return "system/res_list";
    }

    @RequestMapping(value="/edit",method = RequestMethod.GET)
    public String resEdit(){
        return "system/res_edit";
    }
}
