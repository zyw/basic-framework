package cn.v5cn.basicframework.action;

import cn.v5cn.basicframework.entity.SystemRole;
import cn.v5cn.basicframework.service.SystemRoleService;
import cn.v5cn.basicframework.util.HttpUtils;
import cn.v5cn.basicframework.util.Pagination;
import cn.v5cn.basicframework.util.SystemUtils;
import com.google.common.collect.ImmutableMap;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import static cn.v5cn.basicframework.util.MessageSourceHelper.getMessage;

/**
 * Created by ZYW on 2014/10/16.
 */
@Controller
@RequestMapping("/role")
public class RoleAction {

    @Autowired
    private SystemRoleService systemRoleService;

    @RequestMapping(value = "/list/{p}",method = {RequestMethod.GET,RequestMethod.POST})
    public String roleList(SystemRole role,@PathVariable Integer p,HttpSession session,HttpServletRequest request,ModelMap modelMap){
        if(role != null && !StringUtils.isBlank(role.getName())){
            session.setAttribute("roleSearch",role);
            modelMap.addAttribute("searchTxt",role.getName());
        }else{
            session.setAttribute("roleSearch",null);
        }
        Object searchObj = session.getAttribute("roleSearch");
        Pagination<SystemRole> result = null;
        if(searchObj != null){
            result = systemRoleService.listRoleByName(((SystemRole)searchObj),p);
        }else{
            result = systemRoleService.listRoleByName(new SystemRole(),p);
        }
        modelMap.addAttribute("pagination", SystemUtils.pagination(result, HttpUtils.getContextPath(request)+"/role/list"));
        modelMap.addAttribute("roles",result.getData());
        return "system/role_list";
    }

    @RequestMapping(value = "/edit",method = RequestMethod.GET)
    public String roleEdit(ModelMap modelMap){
        modelMap.addAttribute("role",new SystemRole());
        return "system/role_edit";
    }

    @ResponseBody
    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    public ImmutableMap<String,String> roleEdit(SystemRole systemRole,String resIds){
        int result = systemRoleService.addSystemRoleAndRRS(systemRole, resIds);
        if(result != 0)
            return ImmutableMap.of("status","1","message",getMessage("role.addsuccess.message"));

        return ImmutableMap.of("status","0","message",getMessage("role.addfailed.message"));
    }
}