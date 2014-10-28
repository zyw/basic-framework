package cn.v5cn.basicframework.action;

import cn.v5cn.basicframework.entity.SystemUser;
import cn.v5cn.basicframework.service.SystemUserService;
import cn.v5cn.basicframework.util.HttpUtils;
import cn.v5cn.basicframework.util.Pagination;
import cn.v5cn.basicframework.util.PropertyUtils;
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
import java.util.List;

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
        if(file != null && !file.isEmpty()){
            String realPath = HttpUtils.getRealPath(request, SystemUtils.AVATAR_PATH);
            SystemUtils.isNotExistCreate(realPath);
            String fileNameExt = SystemUtils.getFileNameExt(file.getOriginalFilename());

            if(!SystemUtils.IMG_EXT_NAMES.contains(fileNameExt.toLowerCase())){
                return ImmutableMap.of("status","-1","message",getMessage("user.uploadtypenonsupport.message"));
            }
            String timeFileName = SystemUtils.timeFileName(file.getOriginalFilename());
            try {
                file.transferTo(new File(realPath+"/"+timeFileName));
                user.setOriginalPic(timeFileName);
            } catch (IOException e) {
                e.printStackTrace();
                return ImmutableMap.of("status","0","message",getMessage("user.uploadfailed.message") + e.getMessage());
            }
        }
        //修改
        if(user.getId() != null && user.getId() != 0){
            SystemUser userById = systemUserService.findUserById(user.getId());
            if(file != null && !file.isEmpty()){
                deleteAvatar(userById.getOriginalPic(),request);
            }
            if(user.getOriginalPic() == null){
                user.setOriginalPic(userById.getOriginalPic());
            }
            int result = systemUserService.updateSystemUserAndURS(user,roleIds);
            if(result == 1){
                return ImmutableMap.of("status","1","message",getMessage("user.updatesuccess.message"));
            }
            return ImmutableMap.of("status","0","message",getMessage("user.updatefailed.message"));
        }
        //新增
        if(user.getOriginalPic() == null){
            if(user.getSex()==1){
                user.setOriginalPic(PropertyUtils.getValue("default.avatar.man").or("avatar1.jpg"));
            }else {
                user.setOriginalPic(PropertyUtils.getValue("default.avatar.woman").or("avatar0.jpg"));
            }
        }
        int result = systemUserService.addSystemUserAndURS(user,roleIds);
        if(result == 1){
            return ImmutableMap.of("status","1","message",getMessage("user.addsuccess.message"));
        }
        return ImmutableMap.of("status","0","message",getMessage("user.addfailed.message"));
    }

    @ResponseBody
    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public ImmutableMap<String,String> userDelete(Long[] userIds,HttpServletRequest request){
        if(userIds == null || userIds.length < 1)
            return ImmutableMap.of("status","-1","message",getMessage("user.deletenodata.message"));

        List<SystemUser> users = systemUserService.findByUserIds(userIds);
        for(SystemUser user : users){
            deleteAvatar(user.getOriginalPic(),request);
        }
        int result = systemUserService.batchDeleteSystemUser(userIds);
        if(result == 1){
            return ImmutableMap.of("status","1","message",getMessage("user.deletesuccess.message"));
        }
        return ImmutableMap.of("status","0","message",getMessage("user.deletefailed.message"));
    }

    @ResponseBody
    @RequestMapping(value = "/update/pwd",method = RequestMethod.POST)
    public ImmutableMap<String,String> updatePwd(Long userId,String password){
        int result = systemUserService.updatePwd(userId,password);
        if(result > 0){
            return ImmutableMap.of("status","1","message",getMessage("user.updatepwdsuccess.message"));
        }
        return ImmutableMap.of("status","0","message",getMessage("user.updatepwdfailed.message"));
    }

    private boolean deleteAvatar(String originalPic,HttpServletRequest request){
        String avatarMan = PropertyUtils.getValue("default.avatar.man").or("avatar1.jpg");
        String avatarWoman = PropertyUtils.getValue("default.avatar.woman").or("avatar0.jpg");
        if(originalPic != null
                && !avatarMan.equals(originalPic)
                && !avatarWoman.equals(originalPic)) {
            String realPath = HttpUtils.getRealPath(request, SystemUtils.AVATAR_PATH);
            File filel = new File(realPath + "/" + originalPic);
            return filel.delete();
        }
        return false;
    }
}
