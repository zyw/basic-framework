package cn.v5cn.basicframework.action;

import cn.v5cn.basicframework.entity.SystemRes;
import com.google.common.collect.ImmutableMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by ZYW on 2014/10/13.
 */
@Controller
@RequestMapping("/res")
public class ResourceAction {

    @RequestMapping(value="/list",method = RequestMethod.GET)
    public String resList(){
        return "system/res_list";
    }

    @RequestMapping(value="/edit/{resId}",method = RequestMethod.GET)
    public String resEdit(@PathVariable Long resId,ModelMap modelMap){
        SystemRes systemRes = new SystemRes();
        if(resId == Long.valueOf(0)){
            systemRes.setPid(Long.valueOf(0));
            modelMap.addAttribute("pname","一级资源");
        }
        modelMap.addAttribute("res",systemRes);
        return "system/res_edit";
    }

    @ResponseBody
    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    public ImmutableMap<String,String> resEdit(SystemRes systemRes){
        System.out.println(systemRes);
        return ImmutableMap.of("status","1","message","编辑资源成功！");
    }
}
