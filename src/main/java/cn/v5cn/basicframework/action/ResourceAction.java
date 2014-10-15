package cn.v5cn.basicframework.action;

import cn.v5cn.basicframework.entity.SystemRes;
import cn.v5cn.basicframework.service.SystemResService;
import com.google.common.collect.ImmutableMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

import static cn.v5cn.basicframework.util.MessageSourceHelper.getMessage;

/**
 * Created by ZYW on 2014/10/13.
 */
@Controller
@RequestMapping("/res")
public class ResourceAction {

    @Autowired
    private SystemResService systemResService;

    @RequestMapping(value="/list",method = RequestMethod.GET)
    public String resList(ModelMap modelMap){
        List<SystemRes> reses = systemResService.findAll();
        modelMap.addAttribute("reses",reses);
        return "system/res_list";
    }

    @RequestMapping(value="/edit/{resId}",method = RequestMethod.GET)
    public String resEdit(@PathVariable Long resId,ModelMap modelMap){
        SystemRes systemRes = new SystemRes();
        if(resId == Long.valueOf(0)){
            systemRes.setPid(Long.valueOf(0));
            systemRes.setName(getMessage("resource.firstres"));
        }else{
            SystemRes res = systemResService.findById(resId);
            systemRes.setPid(res.getId());
            systemRes.setName(res.getName());
        }

        modelMap.addAttribute("res",systemRes);
        return "system/res_edit";
    }

    @ResponseBody
    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    public ImmutableMap<String,String> resEdit(SystemRes systemRes){
        System.out.println(systemRes);
        Long result = systemResService.addSystemRes(systemRes);
        if(result < 1){
            return ImmutableMap.of("status","0","message",getMessage("resource.addfailed.messag"));
        }
        return ImmutableMap.of("status","1","message",getMessage("resource.addsuccess.message"));
    }
}
