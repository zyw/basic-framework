package cn.v5cn.basicframework.action;

import cn.v5cn.basicframework.entity.SystemUser;
import cn.v5cn.basicframework.service.SystemUserService;
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
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

import static cn.v5cn.basicframework.util.MessageSourceHelper.getMessage;

/**
 * Created by ZYW on 2014/10/23.
 */
@Controller
@RequestMapping("/user")
public class UserAction {

    @Autowired
    private SystemUserService systemUserService;

    @RequestMapping(value = "/list/{p}",method = {RequestMethod.POST,RequestMethod.GET})
    public String userList(SystemUser user,@PathVariable Integer p,HttpSession session,HttpServletRequest request,ModelMap modelMap){
        if(user != null && !StringUtils.isBlank(user.getName())){
            session.setAttribute("userSearch",user);
            modelMap.addAttribute("searchTxt",user.getName());
        }else{
            session.setAttribute("userSearch",null);
        }
        Object searchObj = session.getAttribute("userSearch");
        Pagination<SystemUser> result = null;
        if(searchObj != null){
            result = systemUserService.listUserByName(((SystemUser) searchObj), p);
        }else{
            result = systemUserService.listUserByName(new SystemUser(), p);
        }
        modelMap.addAttribute("pagination", SystemUtils.pagination(result, HttpUtils.getContextPath(request)+"/user/list"));
        modelMap.addAttribute("users",result.getData());
        return "system/user_list";
    }

    @RequestMapping(value = "/edit/{userId}",method = RequestMethod.GET)
    public String userEdit(@PathVariable Long userId,ModelMap modelMap){
        if(userId == null || userId == 0){
            modelMap.addAttribute("user",new SystemUser());
            modelMap.addAttribute("roles",systemUserService.findAllRolesAndIsSelected(null));
        }else{
            SystemUser result = systemUserService.findUserById(userId);
            modelMap.addAttribute("user",result);
            modelMap.addAttribute("roles",systemUserService.findAllRolesAndIsSelected(userId));
        }
        return "system/user_edit";
    }

    @ResponseBody
    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    public ImmutableMap<String,String> userEdit(SystemUser user,Long[] roleIds,MultipartFile file,HttpServletRequest request){
        if(!file.isEmpty()){
            String realPath = HttpUtils.getRealPath(request, SystemUtils.AVATAR_PATH);
            SystemUtils.isNotExistCreate(realPath);
            String fileNameExt = SystemUtils.getFileNameExt(file.getOriginalFilename());

            if(!SystemUtils.IMG_EXT_NAMES.contains(fileNameExt.toLowerCase())){
                return ImmutableMap.of("status","-1","message",getMessage("user.uploadtypenonsupport.message"));
            }
            String timeFileName = SystemUtils.timeFileName(file.getOriginalFilename());
            System.out.println(realPath + "++++" +timeFileName);
            try {
                file.transferTo(new File(realPath+"/"+timeFileName));
                user.setOriginalPic(timeFileName);
            } catch (IOException e) {
                e.printStackTrace();
                return ImmutableMap.of("status","0","message",getMessage("user.uploadfailed.message") + e.getMessage());
            }
        }else{
            if(user.getSex()==1){
                user.setOriginalPic("avatar1.jpg");
            }else {
                user.setOriginalPic("avatar0.jpg");
            }
        }
        System.out.println(roleIds.length + "===================");
        System.out.println(roleIds[0] + "===================");
        System.out.println(user+"+++++++++++++++++++");
        System.out.println(user.getName()+"+++++++++++++++++++");
        int result = systemUserService.addSystemUserAndURS(user,roleIds);
        if(result == 1){
            return ImmutableMap.of("status","1","message",getMessage("user.addsuccess.message"));
        }
        return ImmutableMap.of("status","0","message",getMessage("user.addfailed.message"));
    }
}
