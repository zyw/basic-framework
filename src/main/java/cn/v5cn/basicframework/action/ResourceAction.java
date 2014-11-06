package cn.v5cn.basicframework.action;

import cn.v5cn.basicframework.entity.SystemRes;
import cn.v5cn.basicframework.service.SystemResService;
import cn.v5cn.basicframework.service.SystemUserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.google.common.collect.ImmutableMap;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
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

    @Autowired
    private SystemUserService systemUserService;

    @RequiresPermissions("res:view")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String resList(ModelMap modelMap) {
        List<SystemRes> reses = systemResService.findAll();
        modelMap.addAttribute("reses", reses);
        return "system/res_list";
    }

    @RequiresPermissions({"res:create","res:update"})
    @RequestMapping(value = "/edit/{resId}", method = RequestMethod.GET)
    public String resEdit(@PathVariable Long resId, ModelMap modelMap) {
        SystemRes systemRes = new SystemRes();
        if (resId == Long.valueOf(0)) {
            systemRes.setPid(Long.valueOf(0));
            systemRes.setPids("0/");
            modelMap.addAttribute("pname", getMessage("resource.firstres"));
        } else {
            SystemRes res = systemResService.findById(resId);
            systemRes.setPid(res.getId());
            systemRes.setPids(res.catPids());
            modelMap.addAttribute("pname", res.getName());
        }
        modelMap.addAttribute("res", systemRes);
        return "system/res_edit";
    }

    @RequiresPermissions("res:update")
    @RequestMapping(value = "/edit/{resId}/update", method = RequestMethod.GET)
    public String resEditUpdate(@PathVariable Long resId, ModelMap modelMap) {
        SystemRes res = systemResService.findById(resId);
        SystemRes pRes = systemResService.findById(res.getPid());
        modelMap.addAttribute("res", res);
        if (pRes == null)
            modelMap.addAttribute("pname", getMessage("resource.firstres"));
        else
            modelMap.addAttribute("pname", pRes.getName());
        return "system/res_edit";
    }

    @ResponseBody
    @RequiresPermissions("res:create")
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public ImmutableMap<String, String> resEdit(SystemRes systemRes,HttpSession session) {
        if (systemRes.getId() != null) {
            int result = systemResService.updateSystemRes(systemRes);
            if (result < 1) {
                session.setAttribute("menus",systemUserService.findMenuByUserName());
                return ImmutableMap.of("status", "0", "message", getMessage("resource.updatefailed.message"));
            }
            return ImmutableMap.of("status", "1", "message", getMessage("resource.updatesuccess.message"));
        }
        int result = systemResService.addSystemRes(systemRes);
        if (result < 1) {
            return ImmutableMap.of("status", "0", "message", getMessage("resource.addfailed.message"));
        }
        return ImmutableMap.of("status", "1", "message", getMessage("resource.addsuccess.message"));
    }

    @ResponseBody
    @RequiresPermissions("res:delete")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public ImmutableMap<String, String> resDelete(Long resId,HttpSession session) {
        int count = systemResService.findByPidCount(resId);
        if (count > 0) {
            return ImmutableMap.of("status", "-1", "message", getMessage("resource.count.message"));
        }
        int result = systemResService.deleteSystemRes(resId);
        if (result < 1) {
            return ImmutableMap.of("status", "0", "message", getMessage("resource.deletefailed.message"));
        }
        session.setAttribute("menus",systemUserService.findMenuByUserName());
        return ImmutableMap.of("status", "1", "message", getMessage("resource.deletesuccess.message"));
    }

    /*
    * 分级异步加载资源树
    * */
    @ResponseBody
    @RequestMapping(value = "/gl/tree", method = RequestMethod.POST)
    public List<SystemRes> resGradingLoadingTree(Long id) throws JsonProcessingException {
        if(id == null)
            return systemResService.findByPid(0L);
        return systemResService.findByPid(id);
    }
    /*
    * 一次加载资源树
    * */
    @ResponseBody
    @RequestMapping(value = "/ol/tree", method = RequestMethod.POST)
    public List<SystemRes> resOnceLoadingTree() {
        List<SystemRes> parentAndChild = systemResService.findAll(null);
        return parentAndChild;
    }
}